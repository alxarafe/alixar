package es.alxarafe.alixar.audit.api;

import es.alxarafe.alixar.audit.AuditModeTestSupport;
import es.alxarafe.alixar.audit.InMemoryAuditEventRepository;
import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditConfigurationRepository;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditReadLevel;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditEvent;
import es.alxarafe.alixar.audit.domain.AuditResult;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.api.AuthenticationEndpoints;
import es.alxarafe.alixar.authentication.application.AuthorizationRepository;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.PermissionCodes;
import es.alxarafe.alixar.authentication.application.RoleDefinition;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.domain.User;
import com.jayway.jsonpath.JsonPath;
import jakarta.servlet.http.Cookie;
import java.time.Instant;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Import(AuthenticationTestConfig.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class AdminAuditReadPolicyControllerTest {

    private static final UUID ALICE_ID = UUID.fromString("8f796219-e501-44e8-a4ab-4c014821ba58");
    private static final UUID BOB_ID = UUID.fromString("3c15acbf-6e74-4af1-8cfe-1452a2935870");
    private static final String PASSWORD = "correct-test-password";
    private static final String CSRF_COOKIE = "XSRF-TOKEN";
    private static final String CSRF_HEADER = "X-XSRF-TOKEN";

    @Autowired
    private WebApplicationContext context;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AuthorizationRepository authorizationRepository;

    @Autowired
    private PasswordHasher passwordHasher;

    @Autowired
    private InMemoryAuditEventRepository auditEventRepository;

    @Autowired
    private AuditModeTestSupport auditMode;

    @Autowired
    private AuditConfigurationRepository configurationRepository;

    private MockMvc mockMvc;

    @BeforeEach
    void setup() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).apply(springSecurity()).build();
        SecurityContextHolder.clearContext();
        auditMode.reset();
        auditEventRepository.seedChain(AuditChain.DEFAULT_CHAIN_ID);
        Instant now = Instant.parse("2026-10-22T10:00:00Z");
        ((AuthenticationTestConfig.TestUserRepository) userRepository).replaceWith(
            user(ALICE_ID, "alice", "alice@example.test", now),
            user(BOB_ID, "bob", "bob@example.test", now)
        );
        ((AuthenticationTestConfig.TestAuthorizationRepository) authorizationRepository).reset();
    }

    @Test
    void anonymousGetReturnsUnauthorized() throws Exception {
        mockMvc.perform(get(AuditEndpoints.READ_POLICY_PATH))
            .andExpect(status().isUnauthorized());
    }

    @Test
    void auditReadCanGetEmptyPolicy() throws Exception {
        grant(BOB_ID, PermissionCodes.AUDIT_READ);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);

        mockMvc.perform(get(AuditEndpoints.READ_POLICY_PATH).session(auth.session()))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.configurationId").value(configurationId().toString()))
            .andExpect(jsonPath("$.rules").isEmpty());
    }

    @Test
    void auditConfigureCanGetPolicy() throws Exception {
        grant(BOB_ID, PermissionCodes.AUDIT_CONFIGURE);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);

        mockMvc.perform(get(AuditEndpoints.READ_POLICY_PATH).session(auth.session()))
            .andExpect(status().isOk());
    }

    @Test
    void authenticatedWithoutPermissionCannotGetPolicy() throws Exception {
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);

        mockMvc.perform(get(AuditEndpoints.READ_POLICY_PATH).session(auth.session()))
            .andExpect(status().isForbidden());
    }

    @Test
    void auditReadCannotUpdatePolicy() throws Exception {
        grant(BOB_ID, PermissionCodes.AUDIT_READ);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);

        mockMvc.perform(put(AuditEndpoints.READ_POLICY_PATH)
                .session(auth.session())
                .cookie(auth.csrfCookie())
                .header(CSRF_HEADER, auth.csrfCookie().getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content(policyBody("USER", "QUERY_ONLY")))
            .andExpect(status().isForbidden());
    }

    @Test
    void updateRequiresCsrfForSessionAuthentication() throws Exception {
        grant(BOB_ID, PermissionCodes.AUDIT_CONFIGURE);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);

        mockMvc.perform(put(AuditEndpoints.READ_POLICY_PATH)
                .session(auth.session())
                .contentType(MediaType.APPLICATION_JSON)
                .content(policyBody("USER", "QUERY_ONLY")))
            .andExpect(status().isForbidden());
    }

    @Test
    void updateReplacesRulesAndAppendsOneMandatoryEventPerChange() throws Exception {
        grant(BOB_ID, PermissionCodes.AUDIT_CONFIGURE);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);

        mockMvc.perform(put(AuditEndpoints.READ_POLICY_PATH)
                .session(auth.session())
                .cookie(auth.csrfCookie())
                .header(CSRF_HEADER, auth.csrfCookie().getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content(policyBody(
                    "USER", "QUERY_ONLY",
                    "ROLE", "QUERY_AND_OBJECT"
                )))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.configurationId").value(configurationId().toString()))
            .andExpect(jsonPath("$.rules.length()").value(2))
            .andExpect(jsonPath("$.rules[0].resourceType").value("ROLE"))
            .andExpect(jsonPath("$.rules[0].readLevel").value("QUERY_AND_OBJECT"))
            .andExpect(jsonPath("$.rules[1].resourceType").value("USER"))
            .andExpect(jsonPath("$.rules[1].readLevel").value("QUERY_ONLY"));

        List<AuditEvent> events = auditEventRepository.events(AuditChain.DEFAULT_CHAIN_ID);
        assertThat(events).hasSize(2);
        assertThat(events).extracting(AuditEvent::action).containsExactly(
            AuditAction.AUDIT_READ_POLICY_RULE_CHANGED_TO_QUERY_AND_OBJECT.name(),
            AuditAction.AUDIT_READ_POLICY_RULE_CHANGED_TO_QUERY_ONLY.name()
        );
        assertThat(events).allSatisfy(event -> {
            assertThat(event.resourceType())
                .isEqualTo(AuditResourceType.AUDIT_READ_POLICY.name());
            assertThat(event.result()).isEqualTo(AuditResult.SUCCESS);
            assertThat(event.actorUserId()).isEqualTo(BOB_ID);
        });
        assertThat(events).extracting(AuditEvent::resourceId).containsExactly("ROLE", "USER");
    }

    @Test
    void updateCanRemoveRuleWithNone() throws Exception {
        auditMode.setReadRules(Map.of(
            AuditResourceType.USER,
            AuditReadLevel.QUERY_ONLY
        ));
        grant(BOB_ID, PermissionCodes.AUDIT_CONFIGURE);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);
        auditEventRepository.seedChain(AuditChain.DEFAULT_CHAIN_ID);

        mockMvc.perform(put(AuditEndpoints.READ_POLICY_PATH)
                .session(auth.session())
                .cookie(auth.csrfCookie())
                .header(CSRF_HEADER, auth.csrfCookie().getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content(policyBody("USER", "NONE")))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.rules").isEmpty());

        List<AuditEvent> events = auditEventRepository.events(AuditChain.DEFAULT_CHAIN_ID);
        assertThat(events).hasSize(1);
        assertThat(events.getFirst().action())
            .isEqualTo(AuditAction.AUDIT_READ_POLICY_RULE_CHANGED_TO_NONE.name());
        assertThat(events.getFirst().resourceId()).isEqualTo("USER");
    }

    @Test
    void samePolicyIsNoOp() throws Exception {
        auditMode.setReadRules(Map.of(
            AuditResourceType.USER,
            AuditReadLevel.QUERY_ONLY
        ));
        grant(BOB_ID, PermissionCodes.AUDIT_CONFIGURE);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);
        auditEventRepository.seedChain(AuditChain.DEFAULT_CHAIN_ID);

        mockMvc.perform(put(AuditEndpoints.READ_POLICY_PATH)
                .session(auth.session())
                .cookie(auth.csrfCookie())
                .header(CSRF_HEADER, auth.csrfCookie().getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content(policyBody("USER", "QUERY_ONLY")))
            .andExpect(status().isOk());

        assertThat(auditEventRepository.events(AuditChain.DEFAULT_CHAIN_ID)).isEmpty();
    }

    @Test
    void nonConfigurableResourceTypeReturnsInvalidPolicy() throws Exception {
        grant(BOB_ID, PermissionCodes.AUDIT_CONFIGURE);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);

        assertInvalidPolicy(auth, policyBody("API_TOKEN", "QUERY_ONLY"), "resourceType");
    }

    @Test
    void unsupportedReadLevelReturnsInvalidPolicy() throws Exception {
        grant(BOB_ID, PermissionCodes.AUDIT_CONFIGURE);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);

        assertInvalidPolicy(
            auth,
            policyBody("USER", "EACH_RETURNED_OBJECT"),
            "readLevel"
        );
    }

    @Test
    void duplicateResourceTypeReturnsInvalidPolicy() throws Exception {
        grant(BOB_ID, PermissionCodes.AUDIT_CONFIGURE);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);

        assertInvalidPolicy(
            auth,
            policyBody("USER", "QUERY_ONLY", "USER", "QUERY_AND_OBJECT"),
            "resourceType"
        );
    }

    @Test
    void duplicateRemovedResourceTypeReturnsInvalidPolicy() throws Exception {
        grant(BOB_ID, PermissionCodes.AUDIT_CONFIGURE);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);

        assertInvalidPolicy(
            auth,
            policyBody("USER", "NONE", "USER", "QUERY_ONLY"),
            "resourceType"
        );
    }

    @Test
    void missingRulesReturnsValidationRequired() throws Exception {
        grant(BOB_ID, PermissionCodes.AUDIT_CONFIGURE);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);

        mockMvc.perform(put(AuditEndpoints.READ_POLICY_PATH)
                .session(auth.session())
                .cookie(auth.csrfCookie())
                .header(CSRF_HEADER, auth.csrfCookie().getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{}"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("rules"));
    }

    @Test
    void malformedBodyReturnsInvalidReadPolicy() throws Exception {
        grant(BOB_ID, PermissionCodes.AUDIT_CONFIGURE);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);

        mockMvc.perform(put(AuditEndpoints.READ_POLICY_PATH)
                .session(auth.session())
                .cookie(auth.csrfCookie())
                .header(CSRF_HEADER, auth.csrfCookie().getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("AUDIT_INVALID_READ_POLICY"))
            .andExpect(jsonPath("$.type")
                .value("urn:alixar:error:audit-invalid-read-policy"))
            .andExpect(jsonPath("$.field").value("rules"));
    }

    private void assertInvalidPolicy(
        AuthenticatedSession auth,
        String body,
        String field
    ) throws Exception {
        mockMvc.perform(put(AuditEndpoints.READ_POLICY_PATH)
                .session(auth.session())
                .cookie(auth.csrfCookie())
                .header(CSRF_HEADER, auth.csrfCookie().getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content(body))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("AUDIT_INVALID_READ_POLICY"))
            .andExpect(jsonPath("$.type")
                .value("urn:alixar:error:audit-invalid-read-policy"))
            .andExpect(jsonPath("$.field").value(field));
    }

    private String policyBody(String... pairs) {
        StringBuilder rules = new StringBuilder();
        for (int index = 0; index < pairs.length; index += 2) {
            if (!rules.isEmpty()) {
                rules.append(',');
            }
            rules.append("{\"resourceType\":\"")
                .append(pairs[index])
                .append("\",\"readLevel\":\"")
                .append(pairs[index + 1])
                .append("\"}");
        }
        return "{\"rules\":[" + rules + "]}";
    }

    private UUID configurationId() {
        return configurationRepository.find().orElseThrow().id();
    }

    private void grant(UUID userId, String... permissionCodes) {
        String roleCode = "audit-read-policy-" + userId;
        authorizationRepository.createRole(new RoleDefinition(
            UUID.randomUUID(),
            roleCode,
            "Audit read policy test role",
            false,
            List.of(permissionCodes)
        ));
        authorizationRepository.assignRoleToUser(userId, roleCode);
    }

    private User user(UUID id, String username, String email, Instant now) {
        return new User(
            id,
            username,
            email,
            passwordHasher.hash(PASSWORD),
            true,
            0,
            now,
            now
        );
    }

    private AuthenticatedSession authenticatedSession(String identifier, String password)
        throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        assertThat(csrfCookie).isNotNull();
        MvcResult result = mockMvc.perform(post(AuthenticationEndpoints.LOGIN_PATH)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"identifier\":\"" + identifier + "\",\"password\":\"" + password + "\"}"))
            .andExpect(status().isOk())
            .andReturn();
        MockHttpSession session = (MockHttpSession) result.getRequest().getSession(false);
        Cookie postLoginCsrfCookie = csrfCookieFromSafeRequest();
        assertThat(postLoginCsrfCookie).isNotNull();
        return new AuthenticatedSession(session, postLoginCsrfCookie);
    }

    private Cookie csrfCookieFromSafeRequest() throws Exception {
        MvcResult result = mockMvc.perform(get("/health"))
            .andExpect(status().isOk())
            .andReturn();
        return result.getResponse().getCookie(CSRF_COOKIE);
    }

    private record AuthenticatedSession(MockHttpSession session, Cookie csrfCookie) {
    }
}
