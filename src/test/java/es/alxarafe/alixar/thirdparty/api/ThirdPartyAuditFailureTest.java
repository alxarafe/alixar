package es.alxarafe.alixar.thirdparty.api;

import es.alxarafe.alixar.audit.AuditModeTestSupport;
import es.alxarafe.alixar.audit.InMemoryAuditEventRepository;
import es.alxarafe.alixar.audit.application.AuditErrorCode;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.infrastructure.TransactionalAuditService;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig.TestUserRepository;
import es.alxarafe.alixar.authentication.api.AuthenticationEndpoints;
import es.alxarafe.alixar.authentication.application.AuthorizationRepository;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.RoleCodes;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.domain.User;
import es.alxarafe.alixar.thirdparty.ThirdPartyTestConfig.InMemoryThirdPartyRepository;
import es.alxarafe.alixar.thirdparty.application.ThirdPartyRepository;
import es.alxarafe.alixar.thirdparty.domain.NewThirdParty;
import jakarta.servlet.http.Cookie;
import java.time.Instant;
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
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.patch;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Import({
    AuthenticationTestConfig.class,
    ThirdPartyAuditFailureTest.FailingAuditConfiguration.class
})
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class ThirdPartyAuditFailureTest {

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
    private AuthorizationRepository authorizationRepository;

    @Autowired
    private PasswordHasher passwordHasher;

    @Autowired
    private AuditModeTestSupport auditMode;

    @Autowired
    private InMemoryAuditEventRepository auditEventRepository;

    @Autowired
    private ThirdPartyRepository thirdPartyRepository;

    private MockMvc mockMvc;

    @BeforeEach
    void setup() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).apply(springSecurity()).build();
        auditMode.reset();
        auditEventRepository.seedChain(AuditChain.DEFAULT_CHAIN_ID);
        ((InMemoryThirdPartyRepository) thirdPartyRepository).reset();
        Instant now = Instant.parse("2026-10-28T10:00:00Z");
        ((TestUserRepository) userRepository).replaceWith(new User(
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
    void create_auditFailure_returnsAuditUnavailableWithoutBusinessData() throws Exception {
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        auditMode.setMode(AuditMode.BASIC);
        try {
            mockMvc.perform(post(ThirdPartyEndpoints.BASE_PATH)
                    .session(session)
                    .cookie(csrfCookie)
                    .header(CSRF_HEADER, csrfCookie.getValue())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content("{\"name\":\"Acme\",\"taxIdentifier\":\"B12345678\"}"))
                .andExpect(status().isServiceUnavailable())
                .andExpect(jsonPath("$.code").value(AuditErrorCode.AUDIT_UNAVAILABLE.name()))
                .andExpect(jsonPath("$.name").doesNotExist())
                .andExpect(jsonPath("$.taxIdentifier").doesNotExist());

            assertThat(auditEventRepository.events(AuditChain.DEFAULT_CHAIN_ID)).isEmpty();
        } finally {
            auditMode.reset();
        }
    }

    @Test
    void update_auditFailure_returnsAuditUnavailableWithoutBusinessData() throws Exception {
        long id = thirdPartyRepository.create(new NewThirdParty(
            "Acme Ibérica, S.L.",
            true,
            false,
            true,
            true,
            "B12345678",
            "ESB12345678",
            "Calle Mayor 1",
            "28001",
            "Madrid",
            "ES",
            "info@example.test",
            "+34 900 000 000",
            "https://example.test"
        ));
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        auditMode.setMode(AuditMode.BASIC);
        try {
            mockMvc.perform(patch(ThirdPartyEndpoints.BASE_PATH + "/" + id)
                    .session(session)
                    .cookie(csrfCookie)
                    .header(CSRF_HEADER, csrfCookie.getValue())
                    .contentType(ThirdPartyEndpoints.MERGE_PATCH_MEDIA_TYPE)
                    .content("{\"name\":\"Updated\"}"))
                .andExpect(status().isServiceUnavailable())
                .andExpect(jsonPath("$.code").value(AuditErrorCode.AUDIT_UNAVAILABLE.name()))
                .andExpect(jsonPath("$.name").doesNotExist())
                .andExpect(jsonPath("$.taxIdentifier").doesNotExist());

            assertThat(auditEventRepository.events(AuditChain.DEFAULT_CHAIN_ID)).isEmpty();
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

    @TestConfiguration(proxyBeanMethods = false)
    static class FailingAuditConfiguration {

        @Bean
        @Primary
        TransactionalAuditService failingTransactionalAuditService() {
            TransactionalAuditService service = mock(TransactionalAuditService.class);
            when(service.append(any()))
                .thenThrow(new IllegalStateException("audit persistence unavailable"));
            return service;
        }
    }
}
