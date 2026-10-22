package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.audit.AuditModeTestSupport;
import es.alxarafe.alixar.audit.InMemoryAuditEventRepository;
import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditEvent;
import es.alxarafe.alixar.audit.domain.AuditResult;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.application.ApiTokenRepository;
import es.alxarafe.alixar.authentication.application.AuthorizationRepository;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.TokenHasher;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.domain.ApiToken;
import es.alxarafe.alixar.authentication.domain.User;
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
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.patch;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Import({AuthenticationTestConfig.class, TestAuthorizationConfiguration.class})
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class AccessDeniedAuditTest {

    private static final UUID ALICE_ID = UUID.fromString("8f796219-e501-44e8-a4ab-4c014821ba58");
    private static final String PASSWORD = "correct-test-password";
    private static final String PROBE_PATH = AdminUserEndpoints.BASE_PATH + "/probe";
    private static final String CSRF_COOKIE = "XSRF-TOKEN";
    private static final String CSRF_HEADER = "X-XSRF-TOKEN";

    @Autowired
    private WebApplicationContext context;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AuthorizationRepository authorizationRepository;

    @Autowired
    private ApiTokenRepository apiTokenRepository;

    @Autowired
    private PasswordHasher passwordHasher;

    @Autowired
    private TokenHasher tokenHasher;

    @Autowired
    private AuditModeTestSupport auditMode;

    @Autowired
    private InMemoryAuditEventRepository auditEventRepository;

    private MockMvc mockMvc;

    @BeforeEach
    void setup() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).apply(springSecurity()).build();
        SecurityContextHolder.clearContext();
        Instant now = Instant.parse("2026-10-17T10:00:00Z");
        ((AuthenticationTestConfig.TestUserRepository) userRepository).replaceWith(
            new User(
                ALICE_ID,
                "alice",
                "alice@example.test",
                passwordHasher.hash(PASSWORD),
                true,
                0,
                now,
                now
            )
        );
        ((AuthenticationTestConfig.TestApiTokenRepository) apiTokenRepository).replaceWith();
        ((AuthenticationTestConfig.TestAuthorizationRepository) authorizationRepository).reset();
        auditMode.reset();
        auditEventRepository.seedChain(AuditChain.DEFAULT_CHAIN_ID);
    }

    @Test
    void basicMode_sessionWithoutPermission_appendsAccessDenied() throws Exception {
        auditMode.setMode(AuditMode.BASIC);
        try {
            MockHttpSession session = authenticatedSession();

            mockMvc.perform(get(PROBE_PATH).session(session))
                .andExpect(status().isForbidden());

            assertThat(accessDeniedEvents()).singleElement().satisfies(event -> {
                assertThat(event.action()).isEqualTo(AuditAction.ACCESS_DENIED.name());
                assertThat(event.result()).isEqualTo(AuditResult.DENIED);
                assertThat(event.actorUserId()).isEqualTo(ALICE_ID);
                assertThat(event.actorUsername()).isEqualTo("alice");
                assertThat(event.authenticationType()).isEqualTo(AuditAuthenticationType.SESSION);
                assertThat(event.resourceType()).isEqualTo(AuditResourceType.HTTP_REQUEST.name());
                assertThat(event.resourceId()).isEqualTo("GET /api/admin/users");
                assertThat(event.requestId()).isNull();
            });
        } finally {
            auditMode.reset();
        }
    }

    @Test
    void basicMode_patWithoutPermission_appendsAccessDenied() throws Exception {
        auditMode.setMode(AuditMode.BASIC);
        try {
            String rawToken = personalAccessToken(ALICE_ID);

            mockMvc.perform(get(PROBE_PATH)
                    .header("Authorization", "Bearer " + rawToken))
                .andExpect(status().isForbidden());

            assertThat(accessDeniedEvents()).singleElement().satisfies(event -> {
                assertThat(event.action()).isEqualTo(AuditAction.ACCESS_DENIED.name());
                assertThat(event.result()).isEqualTo(AuditResult.DENIED);
                assertThat(event.actorUserId()).isEqualTo(ALICE_ID);
                assertThat(event.actorUsername()).isEqualTo("alice");
                assertThat(event.authenticationType()).isEqualTo(AuditAuthenticationType.PAT);
                assertThat(event.resourceType()).isEqualTo(AuditResourceType.HTTP_REQUEST.name());
                assertThat(event.resourceId()).isEqualTo("GET /api/admin/users");
            });
        } finally {
            auditMode.reset();
        }
    }

    @Test
    void basicMode_pathVariablesAndQueryStringAreNotStored() throws Exception {
        auditMode.setMode(AuditMode.BASIC);
        try {
            MockHttpSession session = authenticatedSession();

            mockMvc.perform(get(AdminUserEndpoints.BASE_PATH + "/123")
                    .param("q", "sensitive-query-value")
                    .session(session))
                .andExpect(status().isForbidden());

            assertThat(accessDeniedEvents()).singleElement().satisfies(event ->
                assertThat(event.resourceId()).isEqualTo("GET /api/admin/users")
            );
        } finally {
            auditMode.reset();
        }
    }

    @Test
    void basicMode_csrfRejectionDoesNotAppendAccessDenied() throws Exception {
        auditMode.setMode(AuditMode.BASIC);
        try {
            MockHttpSession session = authenticatedSession();

            mockMvc.perform(patch(UserEndpoints.ME_PATH)
                    .session(session)
                    .contentType(MediaType.APPLICATION_JSON)
                    .content("{\"username\":\"alice-renamed\"}"))
                .andExpect(status().isForbidden());

            assertThat(accessDeniedEvents()).isEmpty();
            assertThat(auditEvents())
                .anyMatch(event -> AuditAction.LOGIN_SUCCEEDED.name().equals(event.action()));
        } finally {
            auditMode.reset();
        }
    }

    @Test
    void basicMode_unknownPathDoesNotAppendAccessDenied() throws Exception {
        auditMode.setMode(AuditMode.BASIC);
        try {
            MockHttpSession session = authenticatedSession();

            mockMvc.perform(get("/foo/bar").session(session))
                .andExpect(status().isForbidden());

            assertThat(accessDeniedEvents()).isEmpty();
        } finally {
            auditMode.reset();
        }
    }

    @Test
    void basicMode_anonymousRequestDoesNotAppendAccessDenied() throws Exception {
        auditMode.setMode(AuditMode.BASIC);
        try {
            mockMvc.perform(get(PROBE_PATH))
                .andExpect(status().isUnauthorized());

            assertThat(accessDeniedEvents()).isEmpty();
        } finally {
            auditMode.reset();
        }
    }

    @Test
    void offMode_doesNotAppendAccessDenied() throws Exception {
        MockHttpSession session = authenticatedSession();

        mockMvc.perform(get(PROBE_PATH).session(session))
            .andExpect(status().isForbidden());

        assertThat(auditEvents()).isEmpty();
    }

    private List<AuditEvent> accessDeniedEvents() {
        return auditEvents().stream()
            .filter(event -> AuditAction.ACCESS_DENIED.name().equals(event.action()))
            .toList();
    }

    private List<AuditEvent> auditEvents() {
        return auditEventRepository.events(AuditChain.DEFAULT_CHAIN_ID);
    }

    private MockHttpSession authenticatedSession() throws Exception {
        return (MockHttpSession) login().andReturn().getRequest().getSession(false);
    }

    private ResultActions login() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        return mockMvc.perform(post(AuthenticationEndpoints.LOGIN_PATH)
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue())
            .contentType(MediaType.APPLICATION_JSON)
            .content("{\"identifier\":\"alice\",\"password\":\"" + PASSWORD + "\"}"));
    }

    private Cookie csrfCookieFromSafeRequest() throws Exception {
        MvcResult result = mockMvc.perform(get("/health"))
            .andExpect(status().isOk())
            .andReturn();
        return result.getResponse().getCookie(CSRF_COOKIE);
    }

    private String personalAccessToken(UUID userId) {
        Instant now = Instant.now();
        String rawToken = "alx_pat_test-" + UUID.randomUUID();
        apiTokenRepository.create(
            new ApiToken(UUID.randomUUID(), userId, "test", 0, now, now.plusSeconds(3600), null, null),
            tokenHasher.hash(rawToken)
        );
        return rawToken;
    }
}
