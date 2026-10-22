package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.audit.AuditModeTestSupport;
import es.alxarafe.alixar.audit.InMemoryAuditEventRepository;
import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditChainVerifier;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditEvent;
import es.alxarafe.alixar.audit.domain.AuditResult;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.application.AuthenticationErrorCode;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.PasswordResetTokenGenerator;
import es.alxarafe.alixar.authentication.application.PasswordResetTokenRepository;
import es.alxarafe.alixar.authentication.application.TokenHasher;
import es.alxarafe.alixar.authentication.application.UserRepository;
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
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
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
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Import(AuthenticationTestConfig.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class SelfServiceUserControllerTest {

    private static final UUID ALICE_ID = UUID.fromString("8f796219-e501-44e8-a4ab-4c014821ba58");
    private static final UUID BOB_ID = UUID.fromString("3c15acbf-6e74-4af1-8cfe-1452a2935870");
    private static final String PASSWORD = "correct-test-password";
    private static final String NEW_PASSWORD = "new-secure-password-123";
    private static final String CSRF_COOKIE = "XSRF-TOKEN";
    private static final String CSRF_HEADER = "X-XSRF-TOKEN";

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
    private AuditModeTestSupport auditMode;

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
                ALICE_ID,
                "alice",
                "alice@example.test",
                passwordHasher.hash(PASSWORD),
                true,
                0,
                now,
                now
            ),
            new User(
                BOB_ID,
                "bob",
                "bob@example.test",
                passwordHasher.hash(PASSWORD),
                true,
                0,
                now,
                now
            )
        );
        ((AuthenticationTestConfig.TestPasswordResetTokenRepository) tokenRepository).replaceWith();
        auditMode.reset();
        auditEventRepository.seedChain(AuditChain.DEFAULT_CHAIN_ID);
    }

    // Own username change

    @Test
    void updateUsername_withAuthenticatedSession_changesUsernameAndReflectsItOnMe() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        patchUsername(session, "{\"username\":\"alice-renamed\"}")
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(ALICE_ID.toString()))
            .andExpect(jsonPath("$.username").value("alice-renamed"))
            .andExpect(jsonPath("$.email").value("alice@example.test"));

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(ALICE_ID.toString()))
            .andExpect(jsonPath("$.username").value("alice-renamed"))
            .andExpect(jsonPath("$.email").value("alice@example.test"));
    }

    @Test
    void updateUsername_keepsIdAndEmailIntact() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        patchUsername(session, "{\"username\":\"alice-renamed\"}")
            .andExpect(status().isOk());

        User persisted = userRepository.findById(ALICE_ID).orElseThrow();
        assertThat(persisted.id()).isEqualTo(ALICE_ID);
        assertThat(persisted.email()).isEqualTo("alice@example.test");
        assertThat(persisted.username()).isEqualTo("alice-renamed");
    }

    @Test
    void updateUsername_withDuplicateCaseInsensitive_returnsConflict() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        patchUsername(session, "{\"username\":\"BOB\"}")
            .andExpect(status().isConflict())
            .andExpect(jsonPath("$.code").value(AuthenticationErrorCode.AUTH_USERNAME_ALREADY_EXISTS.name()));

        assertThat(userRepository.findById(ALICE_ID).orElseThrow().username()).isEqualTo("alice");
    }

    @Test
    void updateUsername_withBlankUsername_returnsBadRequest() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        patchUsername(session, "{\"username\":\"   \"}")
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("username"));

        assertThat(userRepository.findById(ALICE_ID).orElseThrow().username()).isEqualTo("alice");
    }

    @Test
    void updateUsername_withoutAuthentication_returnsUnauthorized() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        mockMvc.perform(patch(UserEndpoints.ME_PATH)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"username\":\"alice-renamed\"}"))
            .andExpect(status().isUnauthorized());
    }

    @Test
    void updateUsername_responseDoesNotExposeSecurityInternals() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        patchUsername(session, "{\"username\":\"alice-renamed\"}")
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.passwordHash").doesNotExist())
            .andExpect(jsonPath("$.enabled").doesNotExist())
            .andExpect(jsonPath("$.credentialsVersion").doesNotExist())
            .andExpect(jsonPath("$.createdAt").doesNotExist())
            .andExpect(jsonPath("$.updatedAt").doesNotExist());
    }


    @Test
    void offAuditMode_usernameChangeDoesNotRecordEvent() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        patchUsername(session, "{\"username\":\"alice-renamed\"}")
            .andExpect(status().isOk());

        assertThat(auditEvents()).isEmpty();
    }

    @Test
    void basicAuditMode_usernameChangeRecordsOldActorSnapshot() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        auditMode.setMode(AuditMode.BASIC);

        try {
            patchUsername(session, "{\"username\":\"alice-renamed\"}")
                .andExpect(status().isOk());

            assertThat(auditEvents()).singleElement().satisfies(event -> {
                assertThat(event.action()).isEqualTo(AuditAction.USER_USERNAME_CHANGED.name());
                assertThat(event.result()).isEqualTo(AuditResult.SUCCESS);
                assertThat(event.authenticationType()).isEqualTo(AuditAuthenticationType.SESSION);
                assertThat(event.actorUserId()).isEqualTo(ALICE_ID);
                assertThat(event.actorUsername()).isEqualTo("alice");
                assertThat(event.resourceType()).isEqualTo(AuditResourceType.USER.name());
                assertThat(event.resourceId()).isEqualTo(ALICE_ID.toString());
            });
            assertThat(auditChainVerifier.verify(AuditChain.DEFAULT_CHAIN_ID).valid()).isTrue();
        } finally {
            auditMode.reset();
        }
    }

    @Test
    void basicAuditMode_noOpUsernameChangeDoesNotRecordEvent() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        auditMode.setMode(AuditMode.BASIC);

        try {
            patchUsername(session, "{\"username\":\"ALICE\"}")
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.username").value("alice"));

            assertThat(auditEvents()).isEmpty();
        } finally {
            auditMode.reset();
        }
    }

    // Own password change

    @Test
    void changePassword_withCorrectCurrentPassword_changesCredentials() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        changePassword(session, PASSWORD, NEW_PASSWORD)
            .andExpect(status().isNoContent())
            .andExpect(content().string(""));

        User persisted = userRepository.findById(ALICE_ID).orElseThrow();
        assertThat(persisted.credentialsVersion()).isEqualTo(1);
        assertThat(passwordHasher.matches(NEW_PASSWORD, persisted.passwordHash())).isTrue();
        assertThat(passwordHasher.matches(PASSWORD, persisted.passwordHash())).isFalse();
    }


    @Test
    void offAuditMode_passwordChangeDoesNotRecordEvent() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        changePassword(session, PASSWORD, NEW_PASSWORD)
            .andExpect(status().isNoContent());

        assertThat(auditEvents()).isEmpty();
    }

    @Test
    void basicAuditMode_passwordChangeRecordsUserPasswordChangedWithoutSecrets() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        auditMode.setMode(AuditMode.BASIC);

        try {
            changePassword(session, PASSWORD, NEW_PASSWORD)
                .andExpect(status().isNoContent());

            assertThat(auditEvents()).singleElement().satisfies(event -> {
                assertThat(event.action()).isEqualTo(AuditAction.USER_PASSWORD_CHANGED.name());
                assertThat(event.result()).isEqualTo(AuditResult.SUCCESS);
                assertThat(event.authenticationType()).isEqualTo(AuditAuthenticationType.SESSION);
                assertThat(event.actorUserId()).isEqualTo(ALICE_ID);
                assertThat(event.actorUsername()).isEqualTo("alice");
                assertThat(event.resourceType()).isEqualTo(AuditResourceType.USER.name());
                assertThat(event.resourceId()).isEqualTo(ALICE_ID.toString());
                assertThat(event.toString()).doesNotContain(PASSWORD, NEW_PASSWORD);
            });
            assertThat(auditChainVerifier.verify(AuditChain.DEFAULT_CHAIN_ID).valid()).isTrue();
        } finally {
            auditMode.reset();
        }
    }

    @Test
    void changePassword_withNewPassword_authenticatesAndOldPasswordStopsWorking() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        changePassword(session, PASSWORD, NEW_PASSWORD).andExpect(status().isNoContent());

        login("alice", PASSWORD).andExpect(status().isUnauthorized());
        login("alice", NEW_PASSWORD)
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(ALICE_ID.toString()));
    }

    @Test
    void changePassword_withWrongCurrentPassword_returnsBadRequestAndKeepsCredentials() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        changePassword(session, "wrong-current-password", NEW_PASSWORD)
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value(AuthenticationErrorCode.AUTH_INVALID_CURRENT_PASSWORD.name()));

        User persisted = userRepository.findById(ALICE_ID).orElseThrow();
        assertThat(persisted.credentialsVersion()).isZero();
        assertThat(passwordHasher.matches(PASSWORD, persisted.passwordHash())).isTrue();
    }

    @Test
    void changePassword_withTooShortNewPassword_returnsBadRequest() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        changePassword(session, PASSWORD, "short")
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value(AuthenticationErrorCode.AUTH_INVALID_PASSWORD.name()));

        assertThat(userRepository.findById(ALICE_ID).orElseThrow().credentialsVersion()).isZero();
    }

    @Test
    void changePassword_withoutAuthentication_returnsUnauthorized() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        mockMvc.perform(post(UserEndpoints.PASSWORD_PATH)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content(passwordJson(PASSWORD, NEW_PASSWORD)))
            .andExpect(status().isUnauthorized());
    }

    @Test
    void changePassword_invalidatesPendingResetTokens() throws Exception {
        Instant now = Instant.now();
        String rawToken = PasswordResetTokenGenerator.generate();
        String tokenHash = tokenHasher.hash(rawToken);
        ((AuthenticationTestConfig.TestPasswordResetTokenRepository) tokenRepository).replaceWith(
            new PasswordResetToken(UUID.randomUUID(), ALICE_ID, tokenHash, now.plusSeconds(30 * 60), null, now)
        );

        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        changePassword(session, PASSWORD, NEW_PASSWORD).andExpect(status().isNoContent());

        assertThat(tokenRepository.findByTokenHash(tokenHash).orElseThrow().isUsed()).isTrue();
    }

    @Test
    void changePassword_keepsCurrentSessionAuthenticated() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        changePassword(session, PASSWORD, NEW_PASSWORD).andExpect(status().isNoContent());

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(ALICE_ID.toString()));
        assertThat(session.isInvalid()).isFalse();
    }

    @Test
    void changePassword_keepsCurrentSessionAndRevokesOtherSessions() throws Exception {
        MockHttpSession sessionA = authenticatedSession("alice", PASSWORD);
        MockHttpSession sessionB = authenticatedSession("alice", PASSWORD);
        assertThat(sessionA.getId()).isNotEqualTo(sessionB.getId());

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(sessionA)).andExpect(status().isOk());
        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(sessionB)).andExpect(status().isOk());

        changePassword(sessionA, PASSWORD, NEW_PASSWORD).andExpect(status().isNoContent());

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(sessionA))
            .andExpect(status().isOk());
        assertThat(sessionA.isInvalid()).isFalse();

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(sessionB))
            .andExpect(status().isUnauthorized());
        assertThat(sessionB.isInvalid()).isTrue();
    }

    private ResultActions patchUsername(MockHttpSession session, String body) throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        return mockMvc.perform(patch(UserEndpoints.ME_PATH)
            .session(session)
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue())
            .contentType(MediaType.APPLICATION_JSON)
            .content(body));
    }

    private ResultActions changePassword(MockHttpSession session, String currentPassword, String newPassword)
        throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        return mockMvc.perform(post(UserEndpoints.PASSWORD_PATH)
            .session(session)
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue())
            .contentType(MediaType.APPLICATION_JSON)
            .content(passwordJson(currentPassword, newPassword)));
    }

    private ResultActions login(String identifier, String password) throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        return mockMvc.perform(post(AuthenticationEndpoints.LOGIN_PATH)
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue())
            .contentType(MediaType.APPLICATION_JSON)
            .content("{\"identifier\":\"" + identifier + "\",\"password\":\"" + password + "\"}"));
    }

    private MockHttpSession authenticatedSession(String identifier, String password) throws Exception {
        return (MockHttpSession) login(identifier, password).andReturn().getRequest().getSession(false);
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

    private String passwordJson(String currentPassword, String newPassword) {
        return "{\"currentPassword\":\"" + currentPassword + "\",\"newPassword\":\"" + newPassword + "\"}";
    }
}
