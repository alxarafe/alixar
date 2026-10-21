package es.alxarafe.alixar.audit.api;

import es.alxarafe.alixar.audit.InMemoryAuditEventRepository;
import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditEventAppender;
import es.alxarafe.alixar.audit.application.AuditEventDraft;
import es.alxarafe.alixar.audit.application.AuditEventQuery;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditVerificationFailure;
import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditResult;
import es.alxarafe.alixar.audit.infrastructure.AuditProperties;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.application.AuthorizationRepository;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.api.AuthenticationEndpoints;
import es.alxarafe.alixar.authentication.application.PermissionCodes;
import es.alxarafe.alixar.authentication.application.RoleDefinition;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.domain.User;
import com.jayway.jsonpath.JsonPath;
import jakarta.servlet.http.Cookie;
import java.time.Instant;
import java.util.List;
import java.util.UUID;
import java.util.stream.Stream;
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
import static org.hamcrest.Matchers.nullValue;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Import(AuthenticationTestConfig.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class AdminAuditEventControllerTest {

    private static final UUID ALICE_ID = UUID.fromString("8f796219-e501-44e8-a4ab-4c014821ba58");
    private static final UUID BOB_ID = UUID.fromString("3c15acbf-6e74-4af1-8cfe-1452a2935870");
    private static final String PASSWORD = "correct-test-password";
    private static final String CSRF_COOKIE = "XSRF-TOKEN";
    private static final String CSRF_HEADER = "X-XSRF-TOKEN";
    private static final String AUDITOR_ROLE = "auditor";

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
    private AuditEventAppender auditEventAppender;

    @Autowired
    private AuditProperties auditProperties;

    private MockMvc mockMvc;

    @BeforeEach
    void setup() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).apply(springSecurity()).build();
        SecurityContextHolder.clearContext();
        auditProperties.setMode(AuditMode.OFF);
        auditEventRepository.seedChain(AuditChain.DEFAULT_CHAIN_ID);
        Instant now = Instant.parse("2026-10-21T10:00:00Z");
        ((AuthenticationTestConfig.TestUserRepository) userRepository).replaceWith(
            user(ALICE_ID, "alice", "alice@example.test", now),
            user(BOB_ID, "bob", "bob@example.test", now)
        );
        ((AuthenticationTestConfig.TestAuthorizationRepository) authorizationRepository).reset();
    }

    @Test
    void anonymous_returnsUnauthorized() throws Exception {
        mockMvc.perform(get(AuditEndpoints.BASE_PATH))
            .andExpect(status().isUnauthorized());
    }

    @Test
    void authenticatedWithoutAuditRead_returnsForbidden() throws Exception {
        MockHttpSession session = authenticatedSession("bob", PASSWORD);

        mockMvc.perform(get(AuditEndpoints.BASE_PATH).session(session))
            .andExpect(status().isForbidden());
    }

    @Test
    void anonymousVerification_returnsUnauthorized() throws Exception {
        mockMvc.perform(get(AuditEndpoints.VERIFICATION_PATH))
            .andExpect(status().isUnauthorized());
    }

    @Test
    void authenticatedWithoutAuditRead_verificationReturnsForbidden() throws Exception {
        MockHttpSession session = authenticatedSession("bob", PASSWORD);

        mockMvc.perform(get(AuditEndpoints.VERIFICATION_PATH).session(session))
            .andExpect(status().isForbidden());
    }

    @Test
    void auditRead_verifiesValidChain() throws Exception {
        seedEvents();
        grantAuditRead(BOB_ID);
        MockHttpSession session = authenticatedSession("bob", PASSWORD);

        mockMvc.perform(get(AuditEndpoints.VERIFICATION_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.chainId").value(AuditChain.DEFAULT_CHAIN_ID.toString()))
            .andExpect(jsonPath("$.valid").value(true))
            .andExpect(jsonPath("$.checkedEvents").value(5))
            .andExpect(jsonPath("$.failure").value(nullValue()))
            .andExpect(jsonPath("$.failedSequence").value(nullValue()));

        assertThat(auditEventRepository.events(AuditChain.DEFAULT_CHAIN_ID)).hasSize(5);
    }

    @Test
    void auditRead_reportsTamperingWithoutRepairingTheChain() throws Exception {
        seedEvents();
        var original = auditEventRepository.events(AuditChain.DEFAULT_CHAIN_ID).get(2);
        auditEventRepository.replaceEvent(
            AuditChain.DEFAULT_CHAIN_ID,
            original.sequence(),
            original.withEventHash("f".repeat(64))
        );
        var tamperedEvents = auditEventRepository.events(AuditChain.DEFAULT_CHAIN_ID);
        grantAuditRead(BOB_ID);
        MockHttpSession session = authenticatedSession("bob", PASSWORD);

        mockMvc.perform(get(AuditEndpoints.VERIFICATION_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.valid").value(false))
            .andExpect(jsonPath("$.checkedEvents").value(2))
            .andExpect(jsonPath("$.failure").value(AuditVerificationFailure.EVENT_HASH_MISMATCH.name()))
            .andExpect(jsonPath("$.failedSequence").value(original.sequence()));

        assertThat(auditEventRepository.events(AuditChain.DEFAULT_CHAIN_ID))
            .isEqualTo(tamperedEvents);

        mockMvc.perform(get(AuditEndpoints.VERIFICATION_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.valid").value(false))
            .andExpect(jsonPath("$.failure").value(AuditVerificationFailure.EVENT_HASH_MISMATCH.name()))
            .andExpect(jsonPath("$.failedSequence").value(original.sequence()));

        assertThat(auditEventRepository.events(AuditChain.DEFAULT_CHAIN_ID))
            .isEqualTo(tamperedEvents);
    }

    @Test
    void auditRead_returnsCanonicalEventFieldsIncludingIntegrityData() throws Exception {
        seedEvents();
        grantAuditRead(BOB_ID);
        MockHttpSession session = authenticatedSession("bob", PASSWORD);

        mockMvc.perform(get(AuditEndpoints.BASE_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.length()").value(5))
            .andExpect(jsonPath("$[0].id").isNotEmpty())
            .andExpect(jsonPath("$[0].chainId").value(AuditChain.DEFAULT_CHAIN_ID.toString()))
            .andExpect(jsonPath("$[0].sequence").value(1))
            .andExpect(jsonPath("$[0].occurredAt").isNotEmpty())
            .andExpect(jsonPath("$[0].actorUserId").value(ALICE_ID.toString()))
            .andExpect(jsonPath("$[0].actorUsername").value("alice"))
            .andExpect(jsonPath("$[0].authenticationType").value(AuditAuthenticationType.SESSION.name()))
            .andExpect(jsonPath("$[0].action").value(AuditAction.ADMIN_USER_CREATED.name()))
            .andExpect(jsonPath("$[0].resourceType").value(AuditResourceType.USER.name()))
            .andExpect(jsonPath("$[0].resourceId").value("user-1"))
            .andExpect(jsonPath("$[0].result").value(AuditResult.SUCCESS.name()))
            .andExpect(jsonPath("$[0].integrityFormatVersion").value(1))
            .andExpect(jsonPath("$[0].previousHash").isNotEmpty())
            .andExpect(jsonPath("$[0].eventHash").isNotEmpty());
    }

    @Test
    void keysetPagination_returnsEveryMatchingEventOnceInSequenceOrder() throws Exception {
        seedEvents();
        grantAuditRead(BOB_ID);
        MockHttpSession session = authenticatedSession("bob", PASSWORD);

        List<Integer> page1 = sequences(getAuditEvents(session, "0", "2", null, null, null, null, null));
        List<Integer> page2 = sequences(getAuditEvents(session, "2", "2", null, null, null, null, null));
        List<Integer> page3 = sequences(getAuditEvents(session, "4", "2", null, null, null, null, null));

        assertThat(page1).containsExactly(1, 2);
        assertThat(page2).containsExactly(3, 4);
        assertThat(page3).containsExactly(5);
        assertThat(page1).doesNotContainAnyElementsOf(page2);
        assertThat(page2).doesNotContainAnyElementsOf(page3);
        assertThat(Stream.of(page1, page2, page3)
            .flatMap(List::stream)
            .toList()).containsExactly(1, 2, 3, 4, 5);
    }

    @Test
    void filters_areCombinableAndPreserveSparseSequences() throws Exception {
        seedEvents();
        grantAuditRead(BOB_ID);
        MockHttpSession session = authenticatedSession("bob", PASSWORD);

        assertThat(sequences(getAuditEvents(
            session,
            null,
            null,
            AuditAction.ADMIN_USER_CREATED.name(),
            AuditResourceType.USER.name(),
            null,
            null,
            null
        ))).containsExactly(1, 4);
        assertThat(sequences(getAuditEvents(
            session,
            null,
            null,
            null,
            null,
            null,
            BOB_ID.toString(),
            null
        ))).containsExactly(3, 4);
        assertThat(sequences(getAuditEvents(
            session,
            null,
            null,
            null,
            null,
            null,
            null,
            AuditResult.DENIED.name()
        ))).containsExactly(4);
        assertThat(sequences(getAuditEvents(
            session,
            null,
            null,
            null,
            null,
            "token-1",
            null,
            null
        ))).containsExactly(2, 5);
        assertThat(sequences(getAuditEvents(
            session,
            "2",
            null,
            null,
            null,
            null,
            null,
            null
        ))).containsExactly(3, 4, 5);
    }

    @Test
    void invalidQueryValues_returnBadRequest() throws Exception {
        grantAuditRead(BOB_ID);
        MockHttpSession session = authenticatedSession("bob", PASSWORD);

        mockMvc.perform(get(AuditEndpoints.BASE_PATH)
                .param(AuditEventQuery.AFTER_SEQUENCE_PARAM, "-1")
                .session(session))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("AUDIT_INVALID_QUERY"))
            .andExpect(jsonPath("$.field").value(AuditEventQuery.AFTER_SEQUENCE_PARAM));

        mockMvc.perform(get(AuditEndpoints.BASE_PATH)
                .param(AuditEventQuery.LIMIT_PARAM, "0")
                .session(session))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.field").value(AuditEventQuery.LIMIT_PARAM));

        mockMvc.perform(get(AuditEndpoints.BASE_PATH)
                .param(AuditEventQuery.LIMIT_PARAM, Integer.toString(AuditEventQuery.MAX_LIMIT + 1))
                .session(session))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.field").value(AuditEventQuery.LIMIT_PARAM));

        mockMvc.perform(get(AuditEndpoints.BASE_PATH)
                .param(AuditEventQuery.ACTION_PARAM, "NOT_AN_ACTION")
                .session(session))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.field").value(AuditEventQuery.ACTION_PARAM));

        mockMvc.perform(get(AuditEndpoints.BASE_PATH)
                .param(AuditEventQuery.ACTOR_USER_ID_PARAM, "not-a-uuid")
                .session(session))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.field").value(AuditEventQuery.ACTOR_USER_ID_PARAM));
    }

    @Test
    void readWorksWhenAuditModeIsOffAndDoesNotAppendAnEvent() throws Exception {
        seedEvents();
        grantAuditRead(BOB_ID);
        MockHttpSession session = authenticatedSession("bob", PASSWORD);
        int countBefore = auditEventRepository.events(AuditChain.DEFAULT_CHAIN_ID).size();
        auditProperties.setMode(AuditMode.OFF);

        try {
            mockMvc.perform(get(AuditEndpoints.BASE_PATH).session(session))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(countBefore));

            assertThat(auditEventRepository.events(AuditChain.DEFAULT_CHAIN_ID)).hasSize(countBefore);
        } finally {
            auditProperties.setMode(AuditMode.OFF);
        }
    }

    private void seedEvents() {
        appendAuditEvent(
            AuditAction.ADMIN_USER_CREATED,
            AuditResourceType.USER,
            "user-1",
            ALICE_ID,
            "alice",
            AuditResult.SUCCESS
        );
        appendAuditEvent(
            AuditAction.API_TOKEN_CREATED,
            AuditResourceType.API_TOKEN,
            "token-1",
            ALICE_ID,
            "alice",
            AuditResult.SUCCESS
        );
        appendAuditEvent(
            AuditAction.ROLE_CREATED,
            AuditResourceType.ROLE,
            "role-1",
            BOB_ID,
            "bob",
            AuditResult.FAILURE
        );
        appendAuditEvent(
            AuditAction.ADMIN_USER_CREATED,
            AuditResourceType.USER,
            "user-2",
            BOB_ID,
            "bob",
            AuditResult.DENIED
        );
        appendAuditEvent(
            AuditAction.API_TOKEN_REVOKED,
            AuditResourceType.API_TOKEN,
            "token-1",
            ALICE_ID,
            "alice",
            AuditResult.SUCCESS
        );
    }

    private void appendAuditEvent(
        AuditAction action,
        AuditResourceType resourceType,
        String resourceId,
        UUID actorUserId,
        String actorUsername,
        AuditResult result
    ) {
        auditEventAppender.append(new AuditEventDraft(
            AuditChain.DEFAULT_CHAIN_ID,
            actorUserId,
            actorUsername,
            AuditAuthenticationType.SESSION,
            action.name(),
            resourceType.name(),
            resourceId,
            result,
            null
        ));
    }

    private void grantAuditRead(UUID userId) {
        authorizationRepository.createRole(new RoleDefinition(
            UUID.randomUUID(),
            AUDITOR_ROLE,
            "Auditor",
            false,
            List.of(PermissionCodes.AUDIT_READ)
        ));
        authorizationRepository.assignRoleToUser(userId, AUDITOR_ROLE);
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

    private String getAuditEvents(
        MockHttpSession session,
        String afterSequence,
        String limit,
        String action,
        String resourceType,
        String resourceId,
        String actorUserId,
        String result
    ) throws Exception {
        var request = get(AuditEndpoints.BASE_PATH).session(session);
        if (afterSequence != null) {
            request.param(AuditEventQuery.AFTER_SEQUENCE_PARAM, afterSequence);
        }
        if (limit != null) {
            request.param(AuditEventQuery.LIMIT_PARAM, limit);
        }
        if (action != null) {
            request.param(AuditEventQuery.ACTION_PARAM, action);
        }
        if (resourceType != null) {
            request.param(AuditEventQuery.RESOURCE_TYPE_PARAM, resourceType);
        }
        if (resourceId != null) {
            request.param(AuditEventQuery.RESOURCE_ID_PARAM, resourceId);
        }
        if (actorUserId != null) {
            request.param(AuditEventQuery.ACTOR_USER_ID_PARAM, actorUserId);
        }
        if (result != null) {
            request.param(AuditEventQuery.RESULT_PARAM, result);
        }
        MvcResult resultActions = mockMvc.perform(request)
            .andExpect(status().isOk())
            .andReturn();
        return resultActions.getResponse().getContentAsString();
    }

    private List<Integer> sequences(String responseBody) {
        List<Number> values = JsonPath.read(responseBody, "$[*].sequence");
        return values.stream()
            .map(Number::intValue)
            .toList();
    }

    private MockHttpSession authenticatedSession(String identifier, String password) throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        MvcResult result = mockMvc.perform(post(AuthenticationEndpoints.LOGIN_PATH)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"identifier\":\"" + identifier + "\",\"password\":\"" + password + "\"}"))
            .andExpect(status().isOk())
            .andReturn();
        return (MockHttpSession) result.getRequest().getSession(false);
    }

    private Cookie csrfCookieFromSafeRequest() throws Exception {
        MvcResult result = mockMvc.perform(get("/health"))
            .andExpect(status().isOk())
            .andReturn();
        return result.getResponse().getCookie(CSRF_COOKIE);
    }
}
