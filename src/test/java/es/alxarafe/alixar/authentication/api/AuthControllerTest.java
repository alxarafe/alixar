package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.audit.InMemoryAuditEventRepository;
import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditChainVerifier;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditEvent;
import es.alxarafe.alixar.audit.domain.AuditResult;
import es.alxarafe.alixar.audit.infrastructure.AuditProperties;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.application.PasswordResetTokenRepository;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.application.AuthenticationErrorCode;
import es.alxarafe.alixar.authentication.application.InvalidPasswordException;
import es.alxarafe.alixar.authentication.application.InvalidResetTokenException;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.PasswordResetTokenGenerator;
import es.alxarafe.alixar.authentication.application.TokenHasher;
import es.alxarafe.alixar.authentication.domain.PasswordResetToken;
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
    private UserRepository userRepository;

    @Autowired
    private PasswordResetTokenRepository tokenRepository;

    @Autowired
    private PasswordHasher passwordHasher;

    @Autowired
    private TokenHasher tokenHasher;

    @Autowired
    private AuditProperties auditProperties;

    @Autowired
    private InMemoryAuditEventRepository auditEventRepository;

    @Autowired
    private AuditChainVerifier auditChainVerifier;

    private MockMvc mockMvc;

    @BeforeEach
    void setup() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).apply(springSecurity()).build();
        Instant now = Instant.parse("2026-10-17T10:00:00Z");
        ((AuthenticationTestConfig.TestUserRepository) userRepository).replaceWith(
            new User(
                ENABLED_USER_ID,
                "alice",
                "alice@example.test",
                passwordHasher.hash(PASSWORD),
                true,
                0,
                now,
                now
            ),
            new User(
                DISABLED_USER_ID,
                "disabled",
                "disabled@example.test",
                passwordHasher.hash(PASSWORD),
                false,
                0,
                now,
                now
            )
        );
        ((AuthenticationTestConfig.TestPasswordResetTokenRepository) tokenRepository).replaceWith();
        auditProperties.setMode(AuditMode.OFF);
        auditEventRepository.seedChain(AuditChain.DEFAULT_CHAIN_ID);
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
            .andExpect(jsonPath("$.updatedAt").doesNotExist())
            .andExpect(jsonPath("$.credentialsVersion").doesNotExist());
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

    // Forgot Password Tests

    @Test
    void forgotPassword_withEnabledUser_returnsAcceptedAndCreatesToken() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        mockMvc.perform(post("/api/auth/password/forgot")
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue())
                .contentType("application/json")
                .content("{\"email\":\"alice@example.test\"}"))
            .andExpect(status().isAccepted());

        assertThat(tokenRepository.findByTokenHash(tokenHasher.hash("dummy"))).isEmpty();
    }

    @Test
    void forgotPassword_withUnknownEmail_returnsSameAccepted() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        mockMvc.perform(post("/api/auth/password/forgot")
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue())
                .contentType("application/json")
                .content("{\"email\":\"unknown@example.test\"}"))
            .andExpect(status().isAccepted());
    }

    @Test
    void forgotPassword_withDisabledUser_returnsSameAccepted() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        mockMvc.perform(post("/api/auth/password/forgot")
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue())
                .contentType("application/json")
                .content("{\"email\":\"disabled@example.test\"}"))
            .andExpect(status().isAccepted());
    }

    @Test
    void forgotPassword_invalidatesPreviousTokens() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        String rawToken = PasswordResetTokenGenerator.generate();
        String tokenHash = tokenHasher.hash(rawToken);
        Instant now = Instant.now();
        ((AuthenticationTestConfig.TestPasswordResetTokenRepository) tokenRepository).replaceWith(
            new PasswordResetToken(
                UUID.randomUUID(),
                ENABLED_USER_ID,
                tokenHash,
                now.plusSeconds(30 * 60),
                null,
                now
            )
        );

        mockMvc.perform(post("/api/auth/password/forgot")
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue())
                .contentType("application/json")
                .content("{\"email\":\"alice@example.test\"}"))
            .andExpect(status().isAccepted());

        assertThat(tokenRepository.findByTokenHash(tokenHash).orElseThrow().isUsed()).isTrue();
    }


    @Test
    void offAuditMode_resetPasswordDoesNotRecordEvent() throws Exception {
        resetPasswordForEnabledUser("new-secure-password-123");

        assertThat(auditEvents()).isEmpty();
    }

    @Test
    void basicAuditMode_resetPasswordRecordsRecoveryActorWithoutSecrets() throws Exception {
        String newPassword = "new-secure-password-123";
        auditProperties.setMode(AuditMode.BASIC);

        try {
            resetPasswordForEnabledUser(newPassword);

            assertThat(auditEvents()).singleElement().satisfies(event -> {
                assertThat(event.action()).isEqualTo(AuditAction.PASSWORD_RESET_COMPLETED.name());
                assertThat(event.result()).isEqualTo(AuditResult.SUCCESS);
                assertThat(event.authenticationType()).isEqualTo(AuditAuthenticationType.RECOVERY_TOKEN);
                assertThat(event.actorUserId()).isEqualTo(ENABLED_USER_ID);
                assertThat(event.actorUsername()).isEqualTo("alice");
                assertThat(event.resourceType()).isEqualTo(AuditResourceType.USER.name());
                assertThat(event.resourceId()).isEqualTo(ENABLED_USER_ID.toString());
                assertThat(event.toString()).doesNotContain(newPassword);
            });
            assertThat(auditChainVerifier.verify(AuditChain.DEFAULT_CHAIN_ID).valid()).isTrue();
        } finally {
            auditProperties.setMode(AuditMode.OFF);
        }
    }

    @Test
    void basicAuditMode_forgotPasswordDoesNotRecordEvent() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        auditProperties.setMode(AuditMode.BASIC);

        try {
            mockMvc.perform(post("/api/auth/password/forgot")
                    .cookie(csrfCookie)
                    .header("X-XSRF-TOKEN", csrfCookie.getValue())
                    .contentType("application/json")
                    .content("{\"email\":\"alice@example.test\"}"))
                .andExpect(status().isAccepted());

            assertThat(auditEvents()).isEmpty();
        } finally {
            auditProperties.setMode(AuditMode.OFF);
        }
    }

    // Reset Password Tests

    @Test
    void resetPassword_withValidToken_changesPasswordAndIncrementsCredentialsVersion() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        String rawToken = PasswordResetTokenGenerator.generate();
        String tokenHash = tokenHasher.hash(rawToken);
        Instant now = Instant.now();
        Instant expiresAt = now.plusSeconds(30 * 60);

        ((AuthenticationTestConfig.TestPasswordResetTokenRepository) tokenRepository).replaceWith(
            new PasswordResetToken(
                UUID.randomUUID(),
                ENABLED_USER_ID,
                tokenHash,
                expiresAt,
                null,
                now
            )
        );

        mockMvc.perform(post("/api/auth/password/reset")
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue())
                .contentType("application/json")
                .content("{\"token\":\"" + rawToken + "\",\"password\":\"new-secure-password-123\"}"))
            .andExpect(status().isOk());

        User user = userRepository.findById(ENABLED_USER_ID).orElseThrow();
        assertThat(user.credentialsVersion()).isEqualTo(1);
        assertThat(passwordHasher.matches("new-secure-password-123", user.passwordHash())).isTrue();
        assertThat(tokenRepository.findByTokenHash(tokenHash).orElseThrow().isUsed()).isTrue();
    }

    @Test
    void resetPassword_withInvalidToken_returnsBadRequest() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        mockMvc.perform(post("/api/auth/password/reset")
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue())
                .contentType("application/json")
                .content("{\"token\":\"invalid-token\",\"password\":\"new-secure-password-123\"}"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value(AuthenticationErrorCode.AUTH_INVALID_RESET_TOKEN.name()));
    }

    @Test
    void resetPassword_withExpiredToken_returnsBadRequest() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        String rawToken = PasswordResetTokenGenerator.generate();
        String tokenHash = tokenHasher.hash(rawToken);
        Instant now = Instant.parse("2026-10-17T10:00:00Z");

        ((AuthenticationTestConfig.TestPasswordResetTokenRepository) tokenRepository).replaceWith(
            new PasswordResetToken(
                UUID.randomUUID(),
                ENABLED_USER_ID,
                tokenHash,
                now.minusSeconds(60),
                null,
                now
            )
        );

        mockMvc.perform(post("/api/auth/password/reset")
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue())
                .contentType("application/json")
                .content("{\"token\":\"" + rawToken + "\",\"password\":\"new-secure-password-123\"}"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value(AuthenticationErrorCode.AUTH_INVALID_RESET_TOKEN.name()));
    }

    @Test
    void resetPassword_withUsedToken_returnsBadRequest() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        String rawToken = PasswordResetTokenGenerator.generate();
        String tokenHash = tokenHasher.hash(rawToken);
        Instant now = Instant.now();

        ((AuthenticationTestConfig.TestPasswordResetTokenRepository) tokenRepository).replaceWith(
            new PasswordResetToken(
                UUID.randomUUID(),
                ENABLED_USER_ID,
                tokenHash,
                now.plusSeconds(30 * 60),
                now,
                now
            )
        );

        mockMvc.perform(post("/api/auth/password/reset")
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue())
                .contentType("application/json")
                .content("{\"token\":\"" + rawToken + "\",\"password\":\"new-secure-password-123\"}"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value(AuthenticationErrorCode.AUTH_INVALID_RESET_TOKEN.name()));
    }

    @Test
    void resetPassword_withTokenInvalidatedByNewRequest_returnsBadRequest() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        String rawToken = PasswordResetTokenGenerator.generate();
        String tokenHash = tokenHasher.hash(rawToken);
        Instant now = Instant.now();

        ((AuthenticationTestConfig.TestPasswordResetTokenRepository) tokenRepository).replaceWith(
            new PasswordResetToken(
                UUID.randomUUID(),
                ENABLED_USER_ID,
                tokenHash,
                now.plusSeconds(30 * 60),
                null,
                now
            )
        );

        mockMvc.perform(post("/api/auth/password/forgot")
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue())
                .contentType("application/json")
                .content("{\"email\":\"alice@example.test\"}"))
            .andExpect(status().isAccepted());

        mockMvc.perform(post("/api/auth/password/reset")
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue())
                .contentType("application/json")
                .content("{\"token\":\"" + rawToken + "\",\"password\":\"new-secure-password-123\"}"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value(AuthenticationErrorCode.AUTH_INVALID_RESET_TOKEN.name()));
    }

    @Test
    void resetPassword_withShortPassword_returnsBadRequest() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        String rawToken = PasswordResetTokenGenerator.generate();
        String tokenHash = tokenHasher.hash(rawToken);
        Instant now = Instant.now();

        ((AuthenticationTestConfig.TestPasswordResetTokenRepository) tokenRepository).replaceWith(
            new PasswordResetToken(
                UUID.randomUUID(),
                ENABLED_USER_ID,
                tokenHash,
                now.plusSeconds(30 * 60),
                null,
                now
            )
        );

        mockMvc.perform(post("/api/auth/password/reset")
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue())
                .contentType("application/json")
                .content("{\"token\":\"" + rawToken + "\",\"password\":\"short\"}"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value(AuthenticationErrorCode.AUTH_INVALID_PASSWORD.name()));
    }

    // Credentials Version Revocation Tests

    @Test
    void session_isInvalidatedAfterPasswordReset() throws Exception {
        MockHttpSession session = authenticatedSession();

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
            .andExpect(status().isOk());

        Cookie csrfCookie = csrfCookieFromSafeRequest();
        String rawToken = PasswordResetTokenGenerator.generate();
        String tokenHash = tokenHasher.hash(rawToken);
        Instant now = Instant.now();

        ((AuthenticationTestConfig.TestPasswordResetTokenRepository) tokenRepository).replaceWith(
            new PasswordResetToken(
                UUID.randomUUID(),
                ENABLED_USER_ID,
                tokenHash,
                now.plusSeconds(30 * 60),
                null,
                now
            )
        );

        mockMvc.perform(post("/api/auth/password/reset")
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue())
                .contentType("application/json")
                .content("{\"token\":\"" + rawToken + "\",\"password\":\"new-secure-password-123\"}"))
            .andExpect(status().isOk());

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
            .andExpect(status().isUnauthorized());

        assertThat(session.isInvalid()).isTrue();
    }

    @Test
    void login_withNewPassword_afterReset_works() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        String rawToken = PasswordResetTokenGenerator.generate();
        String tokenHash = tokenHasher.hash(rawToken);
        Instant now = Instant.now();

        ((AuthenticationTestConfig.TestPasswordResetTokenRepository) tokenRepository).replaceWith(
            new PasswordResetToken(
                UUID.randomUUID(),
                ENABLED_USER_ID,
                tokenHash,
                now.plusSeconds(30 * 60),
                null,
                now
            )
        );

        mockMvc.perform(post("/api/auth/password/reset")
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue())
                .contentType("application/json")
                .content("{\"token\":\"" + rawToken + "\",\"password\":\"new-secure-password-123\"}"))
            .andExpect(status().isOk());

        csrfCookie = csrfCookieFromSafeRequest();
        login("alice", "new-secure-password-123")
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(ENABLED_USER_ID.toString()));
    }

    @Test
    void login_withOldPassword_afterReset_fails() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        String rawToken = PasswordResetTokenGenerator.generate();
        String tokenHash = tokenHasher.hash(rawToken);
        Instant now = Instant.now();

        ((AuthenticationTestConfig.TestPasswordResetTokenRepository) tokenRepository).replaceWith(
            new PasswordResetToken(
                UUID.randomUUID(),
                ENABLED_USER_ID,
                tokenHash,
                now.plusSeconds(30 * 60),
                null,
                now
            )
        );

        mockMvc.perform(post("/api/auth/password/reset")
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue())
                .contentType("application/json")
                .content("{\"token\":\"" + rawToken + "\",\"password\":\"new-secure-password-123\"}"))
            .andExpect(status().isOk());

        login("alice", PASSWORD)
            .andExpect(status().isUnauthorized())
            .andExpect(jsonPath("$.code").value(AuthenticationErrorCode.AUTH_INVALID_CREDENTIALS.name()));
    }

    // Stale session (created before a password reset) on public and protected endpoints

    @Test
    void staleSession_isInvalidatedOnMe() throws Exception {
        MockHttpSession staleSession = authenticatedSession();

        resetPasswordForEnabledUser("new-secure-password-123");

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(staleSession))
            .andExpect(status().isUnauthorized());

        assertThat(staleSession.isInvalid()).isTrue();
    }

    @Test
    void staleSession_allowsLoginWithNewPassword() throws Exception {
        MockHttpSession staleSession = authenticatedSession();

        resetPasswordForEnabledUser("new-secure-password-123");

        Cookie csrfCookie = csrfCookieFromSafeRequest();
        mockMvc.perform(post(AuthenticationEndpoints.LOGIN_PATH)
                .session(staleSession)
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue())
                .contentType("application/json")
                .content(loginJson("alice", "new-secure-password-123")))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(ENABLED_USER_ID.toString()));
    }

    @Test
    void staleSession_allowsForgotPassword() throws Exception {
        MockHttpSession staleSession = authenticatedSession();

        resetPasswordForEnabledUser("new-secure-password-123");

        Cookie csrfCookie = csrfCookieFromSafeRequest();
        mockMvc.perform(post("/api/auth/password/forgot")
                .session(staleSession)
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue())
                .contentType("application/json")
                .content("{\"email\":\"alice@example.test\"}"))
            .andExpect(status().isAccepted());
    }

    @Test
    void staleSession_allowsResetPassword() throws Exception {
        MockHttpSession staleSession = authenticatedSession();

        resetPasswordForEnabledUser("new-secure-password-123");

        Cookie csrfCookie = csrfCookieFromSafeRequest();
        String rawToken = PasswordResetTokenGenerator.generate();
        ((AuthenticationTestConfig.TestPasswordResetTokenRepository) tokenRepository).replaceWith(
            new PasswordResetToken(
                UUID.randomUUID(),
                ENABLED_USER_ID,
                tokenHasher.hash(rawToken),
                Instant.now().plusSeconds(30 * 60),
                null,
                Instant.now()
            )
        );

        mockMvc.perform(post("/api/auth/password/reset")
                .session(staleSession)
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue())
                .contentType("application/json")
                .content("{\"token\":\"" + rawToken + "\",\"password\":\"another-secure-pass-456\"}"))
            .andExpect(status().isOk());

        assertThat(passwordHasher.matches("another-secure-pass-456",
            userRepository.findById(ENABLED_USER_ID).orElseThrow().passwordHash())).isTrue();
    }

    @Test
    void staleSession_withUnknownUser_isInvalidated() throws Exception {
        MockHttpSession staleSession = authenticatedSession();

        ((AuthenticationTestConfig.TestUserRepository) userRepository).replaceWith();

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(staleSession))
            .andExpect(status().isUnauthorized());

        assertThat(staleSession.isInvalid()).isTrue();
    }

    @Test
    void staleSession_withDisabledUser_isInvalidated() throws Exception {
        MockHttpSession staleSession = authenticatedSession();

        User alice = userRepository.findById(ENABLED_USER_ID).orElseThrow();
        ((AuthenticationTestConfig.TestUserRepository) userRepository).replaceWith(
            new User(
                alice.id(),
                alice.username(),
                alice.email(),
                alice.passwordHash(),
                false,
                alice.credentialsVersion(),
                alice.createdAt(),
                alice.updatedAt()
            )
        );

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(staleSession))
            .andExpect(status().isUnauthorized());

        assertThat(staleSession.isInvalid()).isTrue();
    }

    private List<AuditEvent> auditEvents() {
        return auditEventRepository.events(AuditChain.DEFAULT_CHAIN_ID);
    }

    private void resetPasswordForEnabledUser(String newPassword) throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        String rawToken = PasswordResetTokenGenerator.generate();
        ((AuthenticationTestConfig.TestPasswordResetTokenRepository) tokenRepository).replaceWith(
            new PasswordResetToken(
                UUID.randomUUID(),
                ENABLED_USER_ID,
                tokenHasher.hash(rawToken),
                Instant.now().plusSeconds(30 * 60),
                null,
                Instant.now()
            )
        );

        mockMvc.perform(post("/api/auth/password/reset")
                .cookie(csrfCookie)
                .header("X-XSRF-TOKEN", csrfCookie.getValue())
                .contentType("application/json")
                .content("{\"token\":\"" + rawToken + "\",\"password\":\"" + newPassword + "\"}"))
            .andExpect(status().isOk());
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
