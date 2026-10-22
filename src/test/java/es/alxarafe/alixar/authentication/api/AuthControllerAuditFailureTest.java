package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.audit.application.AuditActor;
import es.alxarafe.alixar.audit.application.AuditErrorCode;
import es.alxarafe.alixar.audit.application.AuditUnavailableException;
import es.alxarafe.alixar.audit.application.SecurityAuditTrail;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.domain.User;
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
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Import({
    AuthenticationTestConfig.class,
    AuthControllerAuditFailureTest.FailingAuditConfiguration.class
})
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class AuthControllerAuditFailureTest {

    private static final UUID USER_ID = UUID.fromString("8f796219-e501-44e8-a4ab-4c014821ba58");
    private static final String PASSWORD = "correct-test-password";

    @Autowired
    private WebApplicationContext context;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordHasher passwordHasher;

    private MockMvc mockMvc;

    @BeforeEach
    void setup() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).apply(springSecurity()).build();
        Instant now = Instant.parse("2026-10-17T10:00:00Z");
        ((AuthenticationTestConfig.TestUserRepository) userRepository).replaceWith(
            new User(
                USER_ID,
                "alice",
                "alice@example.test",
                passwordHasher.hash(PASSWORD),
                true,
                0,
                now,
                now
            )
        );
    }

    @Test
    void loginSuccessAuditFailure_returns503AndLeavesNoSession() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        MvcResult result = mockMvc.perform(post(AuthenticationEndpoints.LOGIN_PATH)
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue())
                .contentType("application/json")
                .content("{\"identifier\":\"alice\",\"password\":\"" + PASSWORD + "\"}"))
            .andExpect(status().isServiceUnavailable())
            .andExpect(jsonPath("$.code").value(AuditErrorCode.AUDIT_UNAVAILABLE.name()))
            .andReturn();

        assertThat(result.getRequest().getSession(false)).isNull();
    }

    private Cookie csrfCookieFromSafeRequest() throws Exception {
        MvcResult result = mockMvc.perform(get("/health"))
            .andExpect(status().isOk())
            .andReturn();
        return result.getResponse().getCookie("XSRF-TOKEN");
    }

    @TestConfiguration(proxyBeanMethods = false)
    static class FailingAuditConfiguration {

        @Bean
        @Primary
        SecurityAuditTrail failingSecurityAuditTrail() {
            return new SecurityAuditTrail() {
                @Override
                public void loginSucceeded(AuditActor actor) {
                    throw new AuditUnavailableException();
                }

                @Override
                public void loginFailed() {
                }

                @Override
                public void logout(AuditActor actor) {
                }
            };
        }
    }
}
