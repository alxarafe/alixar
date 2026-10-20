package es.alxarafe.alixar.authentication.api;

import com.jayway.jsonpath.JsonPath;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.application.ApiTokenRepository;
import es.alxarafe.alixar.authentication.application.AuthenticationErrorCode;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.TokenHasher;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.domain.ApiToken;
import es.alxarafe.alixar.authentication.domain.User;
import jakarta.servlet.http.Cookie;
import java.time.Instant;
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
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.patch;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Import(AuthenticationTestConfig.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class ApiTokenControllerTest {

    private static final UUID ALICE_ID = UUID.fromString("8f796219-e501-44e8-a4ab-4c014821ba58");
    private static final UUID BOB_ID = UUID.fromString("3c15acbf-6e74-4af1-8cfe-1452a2935870");
    private static final UUID DISABLED_ID = UUID.fromString("4d26bdac-7f85-5bf2-9daf-2563b3946981");
    private static final String PASSWORD = "correct-test-password";
    private static final String NEW_PASSWORD = "new-secure-password-123";
    private static final String CSRF_COOKIE = "XSRF-TOKEN";
    private static final String CSRF_HEADER = "X-XSRF-TOKEN";

    @Autowired
    private WebApplicationContext context;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ApiTokenRepository apiTokenRepository;

    @Autowired
    private PasswordHasher passwordHasher;

    @Autowired
    private TokenHasher tokenHasher;

    private MockMvc mockMvc;

    @BeforeEach
    void setup() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).apply(springSecurity()).build();
        Instant now = Instant.parse("2026-10-17T10:00:00Z");
        ((AuthenticationTestConfig.TestUserRepository) userRepository).replaceWith(
            user(ALICE_ID, "alice", "alice@example.test", true, 0, now),
            user(BOB_ID, "bob", "bob@example.test", true, 0, now),
            user(DISABLED_ID, "disabled", "disabled@example.test", false, 0, now)
        );
        ((AuthenticationTestConfig.TestApiTokenRepository) apiTokenRepository).replaceWith();
    }

    // Creation

    @Test
    void create_withAuthenticatedSession_returnsTokenOnceAndPersistsOnlyHash() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        Instant expiresAt = Instant.now().plusSeconds(3600);

        MvcResult result = createToken(session, "ci-local", expiresAt)
            .andExpect(status().isCreated())
            .andExpect(jsonPath("$.id").isNotEmpty())
            .andExpect(jsonPath("$.name").value("ci-local"))
            .andExpect(jsonPath("$.createdAt").isNotEmpty())
            .andExpect(jsonPath("$.expiresAt").isNotEmpty())
            .andExpect(jsonPath("$.token").isNotEmpty())
            .andExpect(jsonPath("$.tokenHash").doesNotExist())
            .andExpect(jsonPath("$.credentialsVersion").doesNotExist())
            .andReturn();

        String rawToken = JsonPath.read(result.getResponse().getContentAsString(), "$.token");
        assertThat(rawToken).startsWith("alx_pat_");
        assertThat(apiTokenRepository.findByTokenHash(tokenHasher.hash(rawToken))).isPresent();
        assertThat(apiTokenRepository.findByTokenHash(rawToken)).isEmpty();
    }

    @Test
    void create_capturesCurrentCredentialsVersion() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        createToken(session, "ci-local", Instant.now().plusSeconds(3600))
            .andExpect(status().isCreated());

        assertThat(apiTokenRepository.findAllByUserId(ALICE_ID))
            .singleElement()
            .extracting(ApiToken::credentialsVersion)
            .isEqualTo(0L);
    }

    @Test
    void create_withBlankName_returnsBadRequest() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        createToken(session, "   ", Instant.now().plusSeconds(3600))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("name"));

        assertThat(apiTokenRepository.findAllByUserId(ALICE_ID)).isEmpty();
    }

    @Test
    void create_withoutExpiration_returnsBadRequest() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        mockMvc.perform(post(UserEndpoints.API_TOKENS_PATH)
                .session(session)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"name\":\"ci-local\"}"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("expiresAt"));

        assertThat(apiTokenRepository.findAllByUserId(ALICE_ID)).isEmpty();
    }

    @Test
    void create_withPastExpiration_returnsBadRequest() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        createToken(session, "ci-local", Instant.now().minusSeconds(60))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code")
                .value(AuthenticationErrorCode.AUTH_INVALID_API_TOKEN_EXPIRATION.name()));

        assertThat(apiTokenRepository.findAllByUserId(ALICE_ID)).isEmpty();
    }

    @Test
    void create_withExpirationBeyondMaximumLifetime_returnsBadRequest() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        createToken(session, "ci-local", Instant.now().plusSeconds(366L * 24 * 60 * 60))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code")
                .value(AuthenticationErrorCode.AUTH_INVALID_API_TOKEN_EXPIRATION.name()));
    }

    @Test
    void create_withoutAuthentication_returnsUnauthorized() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        mockMvc.perform(post(UserEndpoints.API_TOKENS_PATH)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"name\":\"ci-local\",\"expiresAt\":\"" + Instant.now().plusSeconds(3600) + "\"}"))
            .andExpect(status().isUnauthorized());
    }

    // Listing

    @Test
    void list_returnsOnlyOwnTokensAndNeverSecrets() throws Exception {
        MockHttpSession aliceSession = authenticatedSession("alice", PASSWORD);
        String aliceToken = createToken(aliceSession, "alice-token", Instant.now().plusSeconds(3600))
            .andReturn()
            .getResponse()
            .getContentAsString();
        String aliceRawToken = JsonPath.read(aliceToken, "$.token");

        MockHttpSession bobSession = authenticatedSession("bob", PASSWORD);
        createToken(bobSession, "bob-token", Instant.now().plusSeconds(3600));

        MvcResult aliceList = mockMvc.perform(get(UserEndpoints.API_TOKENS_PATH).session(aliceSession))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.length()").value(1))
            .andExpect(jsonPath("$[0].name").value("alice-token"))
            .andExpect(jsonPath("$[0].id").isNotEmpty())
            .andExpect(jsonPath("$[0].createdAt").isNotEmpty())
            .andExpect(jsonPath("$[0].expiresAt").isNotEmpty())
            .andExpect(jsonPath("$[0].lastUsedAt").doesNotExist())
            .andExpect(jsonPath("$[0].revokedAt").doesNotExist())
            .andExpect(jsonPath("$[0].token").doesNotExist())
            .andExpect(jsonPath("$[0].tokenHash").doesNotExist())
            .andExpect(jsonPath("$[0].credentialsVersion").doesNotExist())
            .andReturn();

        assertThat(aliceList.getResponse().getContentAsString()).doesNotContain(aliceRawToken);

        mockMvc.perform(get(UserEndpoints.API_TOKENS_PATH).session(bobSession))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.length()").value(1))
            .andExpect(jsonPath("$[0].name").value("bob-token"));
    }

    @Test
    void list_withoutAuthentication_returnsUnauthorized() throws Exception {
        mockMvc.perform(get(UserEndpoints.API_TOKENS_PATH))
            .andExpect(status().isUnauthorized());
    }

    // Revocation

    @Test
    void revoke_ownToken_setsRevokedAtAndStopsAuthenticationImmediately() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        MvcResult created = createToken(session, "ci-local", Instant.now().plusSeconds(3600))
            .andExpect(status().isCreated())
            .andReturn();
        String rawToken = JsonPath.read(created.getResponse().getContentAsString(), "$.token");
        String tokenId = JsonPath.read(created.getResponse().getContentAsString(), "$.id");

        bearerGetMe(rawToken).andExpect(status().isOk());

        Cookie csrfCookie = csrfCookieFromSafeRequest();
        mockMvc.perform(delete(UserEndpoints.API_TOKENS_PATH + "/" + tokenId)
                .session(session)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue()))
            .andExpect(status().isNoContent());

        bearerGetMe(rawToken).andExpect(status().isUnauthorized());

        mockMvc.perform(get(UserEndpoints.API_TOKENS_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$[0].revokedAt").isNotEmpty());
    }

    @Test
    void revoke_isIdempotent() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        String tokenId = JsonPath.read(
            createToken(session, "ci-local", Instant.now().plusSeconds(3600))
                .andReturn().getResponse().getContentAsString(),
            "$.id"
        );

        revoke(session, tokenId).andExpect(status().isNoContent());
        revoke(session, tokenId).andExpect(status().isNoContent());
    }

    @Test
    void revoke_anotherUsersToken_isNotPossible() throws Exception {
        MockHttpSession aliceSession = authenticatedSession("alice", PASSWORD);
        MvcResult created = createToken(aliceSession, "alice-token", Instant.now().plusSeconds(3600))
            .andExpect(status().isCreated())
            .andReturn();
        String aliceTokenId = JsonPath.read(created.getResponse().getContentAsString(), "$.id");
        String aliceRawToken = JsonPath.read(created.getResponse().getContentAsString(), "$.token");

        MockHttpSession bobSession = authenticatedSession("bob", PASSWORD);
        revoke(bobSession, aliceTokenId)
            .andExpect(status().isNotFound())
            .andExpect(jsonPath("$.code").value(AuthenticationErrorCode.AUTH_API_TOKEN_NOT_FOUND.name()));

        bearerGetMe(aliceRawToken).andExpect(status().isOk());
    }

    // Bearer authentication

    @Test
    void bearer_withValidToken_authenticatesMe() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        String rawToken = createRawToken(session, "ci-local", Instant.now().plusSeconds(3600));

        bearerGetMe(rawToken)
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(ALICE_ID.toString()))
            .andExpect(jsonPath("$.username").value("alice"))
            .andExpect(jsonPath("$.email").value("alice@example.test"))
            .andExpect(jsonPath("$.credentialsVersion").doesNotExist());
    }

    @Test
    void bearer_withUnknownToken_returnsUnauthorized() throws Exception {
        bearerGetMe("alx_pat_unknown-token").andExpect(status().isUnauthorized());
    }

    @Test
    void bearer_withMalformedToken_returnsUnauthorized() throws Exception {
        bearerGetMe("not-a-valid-token").andExpect(status().isUnauthorized());
    }

    @Test
    void basicAuthorization_isNotAccepted() throws Exception {
        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH)
                .header("Authorization", "Basic dXNlcjpwYXNzd29yZA=="))
            .andExpect(status().isUnauthorized());
    }

    @Test
    void bearer_withExpiredToken_returnsUnauthorized() throws Exception {
        String rawToken = "alx_pat_expired-token";
        insertToken(ALICE_ID, "expired", rawToken, Instant.now().minusSeconds(60), null);

        bearerGetMe(rawToken).andExpect(status().isUnauthorized());
    }

    @Test
    void bearer_withRevokedToken_returnsUnauthorized() throws Exception {
        String rawToken = "alx_pat_revoked-token";
        insertToken(ALICE_ID, "revoked", rawToken, Instant.now().plusSeconds(3600), Instant.now());

        bearerGetMe(rawToken).andExpect(status().isUnauthorized());
    }

    @Test
    void bearer_withUnknownUser_returnsUnauthorized() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        String rawToken = createRawToken(session, "ci-local", Instant.now().plusSeconds(3600));
        ((AuthenticationTestConfig.TestUserRepository) userRepository).replaceWith();

        bearerGetMe(rawToken).andExpect(status().isUnauthorized());
    }

    @Test
    void bearer_withDisabledUser_returnsUnauthorized() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        String rawToken = createRawToken(session, "ci-local", Instant.now().plusSeconds(3600));
        replaceUser(ALICE_ID, false, 0);

        bearerGetMe(rawToken).andExpect(status().isUnauthorized());
    }

    @Test
    void bearer_withStaleCredentialsVersion_returnsUnauthorized() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        String rawToken = createRawToken(session, "ci-local", Instant.now().plusSeconds(3600));
        replaceUser(ALICE_ID, true, 1);

        bearerGetMe(rawToken).andExpect(status().isUnauthorized());
    }

    // credentials_version revocation

    @Test
    void bearer_stopsAuthenticatingAfterPasswordChange() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        String rawToken = createRawToken(session, "ci-local", Instant.now().plusSeconds(3600));

        bearerGetMe(rawToken).andExpect(status().isOk());

        Cookie csrfCookie = csrfCookieFromSafeRequest();
        mockMvc.perform(post(UserEndpoints.PASSWORD_PATH)
                .session(session)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"currentPassword\":\"" + PASSWORD + "\",\"newPassword\":\"" + NEW_PASSWORD + "\"}"))
            .andExpect(status().isNoContent());

        bearerGetMe(rawToken).andExpect(status().isUnauthorized());
    }

    // Session and Bearer coexistence

    @Test
    void sessionAuthentication_keepsWorkingAlongsideBearer() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        String rawToken = createRawToken(session, "ci-local", Instant.now().plusSeconds(3600));

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(ALICE_ID.toString()));

        bearerGetMe(rawToken)
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(ALICE_ID.toString()));
    }

    @Test
    void sessionRequest_withoutCsrf_isStillRejected() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        mockMvc.perform(post(UserEndpoints.API_TOKENS_PATH)
                .session(session)
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"name\":\"ci-local\",\"expiresAt\":\"" + Instant.now().plusSeconds(3600) + "\"}"))
            .andExpect(status().isForbidden());
    }

    @Test
    void bearerRequest_doesNotRequireCsrf() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        String rawToken = createRawToken(session, "csrf-bootstrap", Instant.now().plusSeconds(3600));

        mockMvc.perform(post(UserEndpoints.API_TOKENS_PATH)
                .header("Authorization", "Bearer " + rawToken)
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"name\":\"ci-local\",\"expiresAt\":\"" + Instant.now().plusSeconds(3600) + "\"}"))
            .andExpect(status().isCreated());
    }

    @Test
    void bearerRequest_doesNotCreateHttpSession() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        String rawToken = createRawToken(session, "ci-local", Instant.now().plusSeconds(3600));

        MvcResult result = bearerGetMe(rawToken)
            .andExpect(status().isOk())
            .andReturn();

        assertThat(result.getRequest().getSession(false)).isNull();
    }

    // last_used_at

    @Test
    void lastUsedAt_isUpdatedAfterSuccessfulAuthentication() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        String rawToken = createRawToken(session, "ci-local", Instant.now().plusSeconds(3600));
        ApiToken initial = apiTokenRepository.findByTokenHash(tokenHasher.hash(rawToken)).orElseThrow();
        assertThat(initial.lastUsedAt()).isNull();

        bearerGetMe(rawToken).andExpect(status().isOk());

        ApiToken used = apiTokenRepository.findByTokenHash(tokenHasher.hash(rawToken)).orElseThrow();
        assertThat(used.lastUsedAt()).isNotNull();
    }

    @Test
    void lastUsedAt_isNotUpdatedByInvalidAuthentication() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        String rawToken = createRawToken(session, "ci-local", Instant.now().plusSeconds(3600));

        bearerGetMe("alx_pat_invalid").andExpect(status().isUnauthorized());

        ApiToken token = apiTokenRepository.findByTokenHash(tokenHasher.hash(rawToken)).orElseThrow();
        assertThat(token.lastUsedAt()).isNull();
    }

    // Helpers

    private ResultActions createToken(MockHttpSession session, String name, Instant expiresAt) throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        return mockMvc.perform(post(UserEndpoints.API_TOKENS_PATH)
            .session(session)
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue())
            .contentType(MediaType.APPLICATION_JSON)
            .content("{\"name\":\"" + name + "\",\"expiresAt\":\"" + expiresAt + "\"}"));
    }

    private String createRawToken(MockHttpSession session, String name, Instant expiresAt) throws Exception {
        MvcResult result = createToken(session, name, expiresAt)
            .andExpect(status().isCreated())
            .andReturn();
        return JsonPath.read(result.getResponse().getContentAsString(), "$.token");
    }

    private ResultActions revoke(MockHttpSession session, String tokenId) throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        return mockMvc.perform(delete(UserEndpoints.API_TOKENS_PATH + "/" + tokenId)
            .session(session)
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue()));
    }

    private ResultActions bearerGetMe(String rawToken) throws Exception {
        return mockMvc.perform(get(AuthenticationEndpoints.ME_PATH)
            .header("Authorization", "Bearer " + rawToken));
    }

    private void insertToken(UUID userId, String name, String rawToken, Instant expiresAt, Instant revokedAt) {
        Instant createdAt = Instant.now().minusSeconds(3600);
        apiTokenRepository.create(
            new ApiToken(UUID.randomUUID(), userId, name, 0, createdAt, expiresAt, null, revokedAt),
            tokenHasher.hash(rawToken)
        );
    }

    private void replaceUser(UUID id, boolean enabled, long credentialsVersion) {
        User current = userRepository.findById(id).orElseThrow();
        ((AuthenticationTestConfig.TestUserRepository) userRepository).replaceWith(
            new User(
                current.id(),
                current.username(),
                current.email(),
                current.passwordHash(),
                enabled,
                credentialsVersion,
                current.createdAt(),
                Instant.now()
            )
        );
    }

    private User user(UUID id, String username, String email, boolean enabled, long credentialsVersion, Instant now) {
        return new User(
            id,
            username,
            email,
            passwordHasher.hash(PASSWORD),
            enabled,
            credentialsVersion,
            now,
            now
        );
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
}
