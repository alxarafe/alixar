package es.alxarafe.alixar.audit.api;

import es.alxarafe.alixar.audit.AuditModeTestSupport;
import es.alxarafe.alixar.audit.InMemoryAuditEventRepository;
import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditConfigurationRepository;
import es.alxarafe.alixar.audit.application.AuditMode;
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
class AdminAuditConfigurationControllerTest {

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
        mockMvc.perform(get(AuditEndpoints.CONFIGURATION_PATH))
            .andExpect(status().isUnauthorized());
    }

    @Test
    void auditReadCanGetConfiguration() throws Exception {
        grant(BOB_ID, PermissionCodes.AUDIT_READ);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);

        mockMvc.perform(get(AuditEndpoints.CONFIGURATION_PATH).session(auth.session()))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(configurationId().toString()))
            .andExpect(jsonPath("$.mode").value(AuditMode.OFF.name()))
            .andExpect(jsonPath("$.updatedAt").isNotEmpty());
    }

    @Test
    void auditConfigureCanGetConfiguration() throws Exception {
        grant(BOB_ID, PermissionCodes.AUDIT_CONFIGURE);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);

        mockMvc.perform(get(AuditEndpoints.CONFIGURATION_PATH).session(auth.session()))
            .andExpect(status().isOk());
    }

    @Test
    void authenticatedWithoutPermissionCannotGetConfiguration() throws Exception {
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);

        mockMvc.perform(get(AuditEndpoints.CONFIGURATION_PATH).session(auth.session()))
            .andExpect(status().isForbidden());
    }

    @Test
    void auditReadCannotUpdateConfiguration() throws Exception {
        grant(BOB_ID, PermissionCodes.AUDIT_READ);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);

        mockMvc.perform(put(AuditEndpoints.CONFIGURATION_PATH)
                .session(auth.session())
                .cookie(auth.csrfCookie())
                .header(CSRF_HEADER, auth.csrfCookie().getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"mode\":\"BASIC\"}"))
            .andExpect(status().isForbidden());
    }

    @Test
    void updateRequiresCsrfForSessionAuthentication() throws Exception {
        grant(BOB_ID, PermissionCodes.AUDIT_CONFIGURE);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);

        mockMvc.perform(put(AuditEndpoints.CONFIGURATION_PATH)
                .session(auth.session())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"mode\":\"BASIC\"}"))
            .andExpect(status().isForbidden());
    }

    @Test
    void offToBasicUpdatesConfigurationAndAppendsOneMandatoryEvent() throws Exception {
        grant(BOB_ID, PermissionCodes.AUDIT_CONFIGURE);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);

        mockMvc.perform(put(AuditEndpoints.CONFIGURATION_PATH)
                .session(auth.session())
                .cookie(auth.csrfCookie())
                .header(CSRF_HEADER, auth.csrfCookie().getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"mode\":\"BASIC\"}"))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(configurationId().toString()))
            .andExpect(jsonPath("$.mode").value(AuditMode.BASIC.name()))
            .andExpect(jsonPath("$.updatedAt").isNotEmpty());

        assertThat(configurationRepository.find().orElseThrow().mode()).isEqualTo(AuditMode.BASIC);
        List<AuditEvent> events = auditEventRepository.events(AuditChain.DEFAULT_CHAIN_ID);
        assertThat(events).hasSize(1);
        AuditEvent event = events.getFirst();
        assertThat(event.action()).isEqualTo(AuditAction.AUDIT_MODE_CHANGED_TO_BASIC.name());
        assertThat(event.resourceType()).isEqualTo(AuditResourceType.AUDIT_CONFIGURATION.name());
        assertThat(event.resourceId()).isEqualTo(configurationId().toString());
        assertThat(event.result()).isEqualTo(AuditResult.SUCCESS);
        assertThat(event.actorUserId()).isEqualTo(BOB_ID);
        assertThat(event.authenticationType().name()).isEqualTo("SESSION");
    }

    @Test
    void sameModeIsNoOpAndDoesNotChangeUpdatedAt() throws Exception {
        grant(BOB_ID, PermissionCodes.AUDIT_CONFIGURE);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);
        String before = getConfiguration(auth.session());

        mockMvc.perform(put(AuditEndpoints.CONFIGURATION_PATH)
                .session(auth.session())
                .cookie(auth.csrfCookie())
                .header(CSRF_HEADER, auth.csrfCookie().getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"mode\":\"OFF\"}"))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.mode").value(AuditMode.OFF.name()));

        String after = getConfiguration(auth.session());
        assertThat(JsonPath.<String>read(after, "$.updatedAt"))
            .isEqualTo(JsonPath.<String>read(before, "$.updatedAt"));
        assertThat(auditEventRepository.events(AuditChain.DEFAULT_CHAIN_ID)).isEmpty();
    }

    @Test
    void basicToOffUpdatesConfigurationAndAppendsOneMandatoryEvent() throws Exception {
        auditMode.setMode(AuditMode.BASIC);
        grant(BOB_ID, PermissionCodes.AUDIT_CONFIGURE);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);
        auditEventRepository.seedChain(AuditChain.DEFAULT_CHAIN_ID);

        mockMvc.perform(put(AuditEndpoints.CONFIGURATION_PATH)
                .session(auth.session())
                .cookie(auth.csrfCookie())
                .header(CSRF_HEADER, auth.csrfCookie().getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"mode\":\"OFF\"}"))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.mode").value(AuditMode.OFF.name()));

        List<AuditEvent> events = auditEventRepository.events(AuditChain.DEFAULT_CHAIN_ID);
        assertThat(events).hasSize(1);
        assertThat(events.getFirst().action())
            .isEqualTo(AuditAction.AUDIT_MODE_CHANGED_TO_OFF.name());
    }

    @Test
    void unsupportedModeReturnsInvalidMode() throws Exception {
        grant(BOB_ID, PermissionCodes.AUDIT_CONFIGURE);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);

        assertInvalidMode(auth, "{\"mode\":\"FULL\"}");
        assertInvalidMode(auth, "{\"mode\":\"basic\"}");
    }

    @Test
    void emptyModeReturnsValidationRequired() throws Exception {
        grant(BOB_ID, PermissionCodes.AUDIT_CONFIGURE);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);

        assertValidationRequired(auth, "{\"mode\":\"\"}");
    }

    @Test
    void nullOrMissingModeReturnsValidationRequired() throws Exception {
        grant(BOB_ID, PermissionCodes.AUDIT_CONFIGURE);
        AuthenticatedSession auth = authenticatedSession("bob", PASSWORD);

        assertValidationRequired(auth, "{\"mode\":null}");
        assertValidationRequired(auth, "{}");
    }

    private void assertInvalidMode(AuthenticatedSession auth, String body) throws Exception {
        mockMvc.perform(put(AuditEndpoints.CONFIGURATION_PATH)
                .session(auth.session())
                .cookie(auth.csrfCookie())
                .header(CSRF_HEADER, auth.csrfCookie().getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content(body))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("AUDIT_INVALID_MODE"))
            .andExpect(jsonPath("$.type").value("urn:alixar:error:audit-invalid-mode"));
    }

    private void assertValidationRequired(AuthenticatedSession auth, String body) throws Exception {
        mockMvc.perform(put(AuditEndpoints.CONFIGURATION_PATH)
                .session(auth.session())
                .cookie(auth.csrfCookie())
                .header(CSRF_HEADER, auth.csrfCookie().getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content(body))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("mode"));
    }

    private String getConfiguration(MockHttpSession session) throws Exception {
        return mockMvc.perform(get(AuditEndpoints.CONFIGURATION_PATH).session(session))
            .andExpect(status().isOk())
            .andReturn()
            .getResponse()
            .getContentAsString();
    }

    private UUID configurationId() {
        return configurationRepository.find().orElseThrow().id();
    }

    private void grant(UUID userId, String... permissionCodes) {
        String roleCode = "audit-config-" + userId;
        authorizationRepository.createRole(new RoleDefinition(
            UUID.randomUUID(),
            roleCode,
            "Audit configuration test role",
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

    private AuthenticatedSession authenticatedSession(String identifier, String password) throws Exception {
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
