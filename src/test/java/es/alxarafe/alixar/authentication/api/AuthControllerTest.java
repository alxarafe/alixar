package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig.TestUserRepository;
import es.alxarafe.alixar.authentication.application.AuthenticationErrorCode;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.domain.User;
import jakarta.servlet.http.Cookie;
import java.time.Instant;
import java.util.UUID;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Import(AuthenticationTestConfig.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class AuthControllerTest {

    private static final UUID ENABLED_USER_ID = UUID.fromString("8f796219-e501-44e8-a4ab-4c014821ba58");
    private static final UUID DISABLED_USER_ID = UUID.fromString("3c15acbf-6e74-4af1-8cfe-1452a2935870");
    private static final String PASSWORD = "correct-test-password";

    @Autowired
    private WebApplicationContext context;

    @Autowired
    private TestUserRepository userRepository;

    @Autowired
    private PasswordHasher passwordHasher;

    private MockMvc mockMvc;

    @BeforeEach
    void setup() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).apply(springSecurity()).build();
        Instant now = Instant.parse("2026-10-17T10:00:00Z");
        userRepository.replaceWith(
            new User(
                ENABLED_USER_ID,
                "alice",
                "alice@example.test",
                passwordHasher.hash(PASSWORD),
                true,
                now,
                now
            ),
            new User(
                DISABLED_USER_ID,
                "disabled",
                "disabled@example.test",
                passwordHasher.hash(PASSWORD),
                false,
                now,
                now
            )
        );
    }

    @Test
    void login_withUsername_createsAuthenticatedSession() throws Exception {
        MvcResult result = login("alice", PASSWORD)
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(ENABLED_USER_ID.toString()))
            .andExpect(jsonPath("$.username").value("alice"))
            .andExpect(jsonPath("$.email").value("alice@example.test"))
            .andReturn();

        assertThat(result.getRequest().getSession(false)).isNotNull();
    }

    @Test
    void login_withEmail_createsAuthenticatedSession() throws Exception {
        login("ALICE@EXAMPLE.TEST", PASSWORD)
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(ENABLED_USER_ID.toString()));
    }

    @Test
    void login_withAngularCsrfCookieAndHeader_createsAuthenticatedSession() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        MvcResult result = mockMvc.perform(post(AuthenticationEndpoints.LOGIN_PATH)
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue())
                .contentType("application/json")
                .content(loginJson("alice", PASSWORD)))
            .andExpect(status().isOk())
            .andReturn();

        assertThat(result.getRequest().getSession(false)).isNotNull();
    }

    @Test
    void login_changesExistingAnonymousSessionId() throws Exception {
        MockHttpSession anonymousSession = new MockHttpSession(context.getServletContext());
        String anonymousSessionId = anonymousSession.getId();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        MvcResult result = mockMvc.perform(post(AuthenticationEndpoints.LOGIN_PATH)
                .session(anonymousSession)
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue())
                .contentType("application/json")
                .content(loginJson("alice", PASSWORD)))
            .andExpect(status().isOk())
            .andReturn();

        assertThat(result.getRequest().getSession(false).getId()).isNotEqualTo(anonymousSessionId);
    }

    @Test
    void login_withWrongPassword_returnsGenericUnauthorized() throws Exception {
        login("alice", "wrong-password")
            .andExpect(status().isUnauthorized())
            .andExpect(jsonPath("$.code").value(AuthenticationErrorCode.AUTH_INVALID_CREDENTIALS.name()));
    }

    @Test
    void login_withUnknownUser_returnsSameGenericUnauthorized() throws Exception {
        login("unknown", "wrong-password")
            .andExpect(status().isUnauthorized())
            .andExpect(jsonPath("$.code").value(AuthenticationErrorCode.AUTH_INVALID_CREDENTIALS.name()));
    }

    @Test
    void login_withDisabledUser_returnsSameGenericUnauthorized() throws Exception {
        login("disabled", PASSWORD)
            .andExpect(status().isUnauthorized())
            .andExpect(jsonPath("$.code").value(AuthenticationErrorCode.AUTH_INVALID_CREDENTIALS.name()));
    }

    @Test
    void me_withAuthenticatedSession_returnsIdentity() throws Exception {
        MockHttpSession session = authenticatedSession();

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(ENABLED_USER_ID.toString()))
            .andExpect(jsonPath("$.username").value("alice"))
            .andExpect(jsonPath("$.email").value("alice@example.test"));
    }

    @Test
    void me_withoutAuthentication_returnsUnauthorized() throws Exception {
        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH))
            .andExpect(status().isUnauthorized());
    }

    @Test
    void logout_invalidatesSessionAndPreventsReuse() throws Exception {
        MockHttpSession session = authenticatedSession();
        MvcResult meResult = mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
            .andExpect(status().isOk())
            .andReturn();
        Cookie csrfCookie = meResult.getResponse().getCookie("XSRF-TOKEN");

        assertThat(csrfCookie).isNotNull();
        mockMvc.perform(post(AuthenticationEndpoints.LOGOUT_PATH)
                .session(session)
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue()))
            .andExpect(status().isNoContent())
            .andExpect(content().string(""));

        assertThat(session.isInvalid()).isTrue();
        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH))
            .andExpect(status().isUnauthorized());
    }

    @Test
    void authenticationResponses_neverContainPasswordHashOrSecurityInternals() throws Exception {
        login("alice", PASSWORD)
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.passwordHash").doesNotExist())
            .andExpect(jsonPath("$.password_hash").doesNotExist())
            .andExpect(jsonPath("$.enabled").doesNotExist())
            .andExpect(jsonPath("$.createdAt").doesNotExist())
            .andExpect(jsonPath("$.updatedAt").doesNotExist());
    }

    @Test
    void login_withoutCsrfToken_isRejected() throws Exception {
        mockMvc.perform(post(AuthenticationEndpoints.LOGIN_PATH)
                .contentType("application/json")
                .content(loginJson("alice", PASSWORD)))
            .andExpect(status().isForbidden());
    }

    @Test
    void safePublicRequest_issuesAngularCompatibleCsrfCookie() throws Exception {
        assertThat(csrfCookieFromSafeRequest()).isNotNull();
    }

    private org.springframework.test.web.servlet.ResultActions login(String identifier, String password)
        throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        return mockMvc.perform(post(AuthenticationEndpoints.LOGIN_PATH)
            .cookie(csrfCookie)
            .header("X-XSRF-TOKEN", csrfCookie.getValue())
            .contentType("application/json")
            .content(loginJson(identifier, password)));
    }

    private MockHttpSession authenticatedSession() throws Exception {
        return (MockHttpSession) login("alice", PASSWORD).andReturn().getRequest().getSession(false);
    }

    private Cookie csrfCookieFromSafeRequest() throws Exception {
        MvcResult result = mockMvc.perform(get("/health"))
            .andExpect(status().isOk())
            .andReturn();
        return result.getResponse().getCookie("XSRF-TOKEN");
    }

    private String loginJson(String identifier, String password) {
        return "{\"identifier\":\"" + identifier + "\",\"password\":\"" + password + "\"}";
    }
}
