package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.audit.AuditModeTestSupport;
import es.alxarafe.alixar.audit.InMemoryAuditEventRepository;
import es.alxarafe.alixar.audit.application.AuditErrorCode;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditReadLevel;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditEvent;
import es.alxarafe.alixar.audit.infrastructure.TransactionalAuditService;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.application.AuthorizationRepository;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.RoleCodes;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.domain.User;
import jakarta.servlet.http.Cookie;
import java.time.Instant;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Primary;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Import({
    AuthenticationTestConfig.class,
    AdminReadAuditFailureTest.FailingAuditConfiguration.class
})
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class AdminReadAuditFailureTest {

    private static final UUID ALICE_ID = UUID.fromString("8f796219-e501-44e8-a4ab-4c014821ba58");
    private static final String USERNAME = "alice";
    private static final String PASSWORD = "correct-test-password";
    private static final String CSRF_COOKIE = "XSRF-TOKEN";
    private static final String CSRF_HEADER = "X-XSRF-TOKEN";

    @Autowired
    private WebApplicationContext context;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordHasher passwordHasher;

    @Autowired
    private AuthorizationRepository authorizationRepository;

    @Autowired
    private AuditModeTestSupport auditMode;

    @Autowired
    private InMemoryAuditEventRepository auditEventRepository;

    private MockMvc mockMvc;

    @BeforeEach
    void setup() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).apply(springSecurity()).build();
        auditMode.reset();
        auditEventRepository.seedChain(AuditChain.DEFAULT_CHAIN_ID);
        Instant now = Instant.parse("2026-10-23T10:00:00Z");
        ((AuthenticationTestConfig.TestUserRepository) userRepository).replaceWith(new User(
            ALICE_ID,
            USERNAME,
            "alice@example.test",
            passwordHasher.hash(PASSWORD),
            true,
            0,
            now,
            now
        ));
        ((AuthenticationTestConfig.TestAuthorizationRepository) authorizationRepository).reset();
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
    }

    @Test
    void appendFailure_returnsAuditUnavailableWithoutUserData() throws Exception {
        MockHttpSession session = authenticatedSession();
        auditMode.setMode(AuditMode.SELECTIVE);
        auditMode.setReadRules(Map.of(
            AuditResourceType.USER,
            AuditReadLevel.QUERY_AND_OBJECT
        ));

        try {
            mockMvc.perform(get(AdminUserEndpoints.BASE_PATH + "/" + ALICE_ID).session(session))
                .andExpect(status().isServiceUnavailable())
                .andExpect(jsonPath("$.code").value(AuditErrorCode.AUDIT_UNAVAILABLE.name()))
                .andExpect(jsonPath("$.username").doesNotExist())
                .andExpect(jsonPath("$.email").doesNotExist());

            assertThat(auditEvents()).isEmpty();
        } finally {
            auditMode.reset();
        }
    }

    private MockHttpSession authenticatedSession() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        MvcResult result = mockMvc.perform(post(AuthenticationEndpoints.LOGIN_PATH)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"identifier\":\"" + USERNAME + "\",\"password\":\"" + PASSWORD + "\"}"))
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

    private List<AuditEvent> auditEvents() {
        return auditEventRepository.events(AuditChain.DEFAULT_CHAIN_ID);
    }

    @TestConfiguration(proxyBeanMethods = false)
    static class FailingAuditConfiguration {

        @Bean
        @Primary
        TransactionalAuditService failingTransactionalAuditService() {
            TransactionalAuditService service = mock(TransactionalAuditService.class);
            when(service.appendIsolated(any()))
                .thenThrow(new IllegalStateException("audit persistence unavailable"));
            return service;
        }
    }
}
