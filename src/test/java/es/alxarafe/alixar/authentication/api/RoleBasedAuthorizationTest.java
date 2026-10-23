package es.alxarafe.alixar.authentication.api;

import com.jayway.jsonpath.JsonPath;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig.TestApiTokenRepository;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig.TestAuthorizationRepository;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig.TestUserRepository;
import es.alxarafe.alixar.authentication.application.AuthorizationRepository;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.PermissionCodes;
import es.alxarafe.alixar.authentication.application.RoleCodes;
import es.alxarafe.alixar.authentication.application.RoleDefinition;
import es.alxarafe.alixar.authentication.application.TokenHasher;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.domain.ApiToken;
import es.alxarafe.alixar.authentication.domain.User;
import es.alxarafe.alixar.authentication.infrastructure.security.AuthenticatedUserPrincipal;
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
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.patch;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Import({AuthenticationTestConfig.class, TestAuthorizationConfiguration.class})
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class RoleBasedAuthorizationTest {

    private static final UUID ALICE_ID = UUID.fromString("8f796219-e501-44e8-a4ab-4c014821ba58");
    private static final UUID BOB_ID = UUID.fromString("3c15acbf-6e74-4af1-8cfe-1452a2935870");
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
    private es.alxarafe.alixar.authentication.application.ApiTokenRepository apiTokenRepository;

    @Autowired
    private PasswordHasher passwordHasher;

    @Autowired
    private TokenHasher tokenHasher;

    @Autowired
    private TestAuthorizationConfiguration.TestProtectedOperation protectedOperation;

    private MockMvc mockMvc;

    @BeforeEach
    void setup() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).apply(springSecurity()).build();
        SecurityContextHolder.clearContext();
        Instant now = Instant.parse("2026-10-17T10:00:00Z");
        ((TestUserRepository) userRepository).replaceWith(
            user(ALICE_ID, "alice", "alice@example.test", now),
            user(BOB_ID, "bob", "bob@example.test", now)
        );
        ((TestApiTokenRepository) apiTokenRepository).replaceWith();
        ((TestAuthorizationRepository) authorizationRepository).reset();
    }

    // 401 / 403 / 200

    @Test
    void anonymous_privilegedEndpoint_returnsUnauthorized() throws Exception {
        mockMvc.perform(get(PROBE_PATH))
            .andExpect(status().isUnauthorized());
    }

    @Test
    void sessionWithoutPermission_returnsForbidden() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        mockMvc.perform(get(PROBE_PATH).session(session))
            .andExpect(status().isForbidden());
    }

    @Test
    void sessionWithPermission_returnsOk() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        mockMvc.perform(get(PROBE_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(content().string("ok"));
    }

    @Test
    void bearerWithoutPermission_returnsForbidden() throws Exception {
        String rawToken = personalAccessToken(ALICE_ID);

        mockMvc.perform(get(PROBE_PATH).header("Authorization", "Bearer " + rawToken))
            .andExpect(status().isForbidden());
    }

    @Test
    void bearerWithPermission_returnsOk() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        String rawToken = personalAccessToken(ALICE_ID);

        mockMvc.perform(get(PROBE_PATH).header("Authorization", "Bearer " + rawToken))
            .andExpect(status().isOk())
            .andExpect(content().string("ok"));
    }

    // Immediate role changes

    @Test
    void rolePermissionChanges_affectNextRequestWithSameSessionAndToken() throws Exception {
        authorizationRepository.createRole(new RoleDefinition(UUID.randomUUID(), "probe-role", "Probe role", false, List.of()));
        authorizationRepository.assignRoleToUser(BOB_ID, "probe-role");
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);

        MockHttpSession bobSession = authenticatedSession("bob", PASSWORD);
        String bobToken = personalAccessToken(BOB_ID);
        assertProbe(bobSession, false);
        assertBearerProbe(bobToken, false);

        MockHttpSession aliceSession = authenticatedSession("alice", PASSWORD);
        String probePermissionsPath = AdminUserEndpoints.ROLES_BASE_PATH + "/probe-role/permissions";

        adminPut(aliceSession, probePermissionsPath, "{\"permissionCodes\":[\"users.manage\"]}")
            .andExpect(status().isOk());

        assertProbe(bobSession, true);
        assertBearerProbe(bobToken, true);

        adminPut(aliceSession, probePermissionsPath, "{\"permissionCodes\":[]}")
            .andExpect(status().isOk());

        assertProbe(bobSession, false);
        assertBearerProbe(bobToken, false);
        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(bobSession))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(BOB_ID.toString()));
        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH)
                .header("Authorization", "Bearer " + bobToken))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(BOB_ID.toString()));
        assertThat(userRepository.findById(BOB_ID).orElseThrow().credentialsVersion()).isZero();
    }

    @Test
    void selfRevocation_appliesAfterCurrentRequestWithoutLogout() throws Exception {
        authorizationRepository.createRole(new RoleDefinition(
            UUID.randomUUID(),
            "role-admin",
            "Role administrator",
            false,
            List.of(PermissionCodes.ROLES_MANAGE)
        ));
        authorizationRepository.assignRoleToUser(ALICE_ID, "role-admin");
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        mockMvc.perform(get(AdminUserEndpoints.ROLES_BASE_PATH).session(session))
            .andExpect(status().isOk());

        adminPut(
            session,
            AdminUserEndpoints.ROLES_BASE_PATH + "/role-admin/permissions",
            "{\"permissionCodes\":[]}"
        ).andExpect(status().isOk());

        mockMvc.perform(get(AdminUserEndpoints.ROLES_BASE_PATH).session(session))
            .andExpect(status().isForbidden());
        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(ALICE_ID.toString()));
        assertThat(authorizationRepository.findEffectivePermissionCodes(ALICE_ID)).isEmpty();
        assertThat(userRepository.findById(ALICE_ID).orElseThrow().credentialsVersion()).isZero();
    }

    @Test
    void grantingRole_affectsNextRequestWithTheSameSession() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        assertProbe(session, false);

        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);

        assertProbe(session, true);
        assertThat(userRepository.findById(ALICE_ID).orElseThrow().credentialsVersion()).isZero();
    }

    @Test
    void removingRole_affectsNextRequestWithTheSameSessionWithoutLogout() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        assertProbe(session, true);

        authorizationRepository.removeRoleFromUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);

        assertProbe(session, false);
        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(ALICE_ID.toString()));
        assertThat(userRepository.findById(ALICE_ID).orElseThrow().credentialsVersion()).isZero();
    }

    @Test
    void grantingRole_affectsNextRequestWithTheSameToken() throws Exception {
        String rawToken = personalAccessToken(ALICE_ID);
        assertBearerProbe(rawToken, false);

        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);

        assertBearerProbe(rawToken, true);
        assertThat(userRepository.findById(ALICE_ID).orElseThrow().credentialsVersion()).isZero();
    }

    @Test
    void removingRole_affectsNextRequestWithTheSameTokenWithoutInvalidatingIt() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        String rawToken = personalAccessToken(ALICE_ID);
        assertBearerProbe(rawToken, true);

        authorizationRepository.removeRoleFromUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);

        assertBearerProbe(rawToken, false);
        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH)
                .header("Authorization", "Bearer " + rawToken))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(ALICE_ID.toString()));
        assertThat(userRepository.findById(ALICE_ID).orElseThrow().credentialsVersion()).isZero();
    }

    @Test
    void invalidBearer_withPrivilegedSession_doesNotFallBackToSession() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        mockMvc.perform(get(PROBE_PATH)
                .session(session)
                .header("Authorization", "Bearer alx_pat_invalid"))
            .andExpect(status().isUnauthorized());
    }

    // Authentication is independent from authorization

    @Test
    void userWithoutRoles_canLoginUseSelfServiceAndOwnTokens() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(ALICE_ID.toString()));

        patchUsername(session, "alice-renamed")
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.username").value("alice-renamed"));

        String rawToken = createRawToken(session, "no-roles-token");

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH)
                .header("Authorization", "Bearer " + rawToken))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.username").value("alice-renamed"));

        mockMvc.perform(get(UserEndpoints.API_TOKENS_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.length()").value(1))
            .andExpect(jsonPath("$[0].name").value("no-roles-token"));

        assertProbe(session, false);
        assertBearerProbe(rawToken, false);
    }

    // Method security

    @Test
    void methodSecurity_deniesWithoutPermissionAndAllowsWithIt() {
        AuthenticatedUserPrincipal principal = new AuthenticatedUserPrincipal(
            ALICE_ID,
            "alice",
            "alice@example.test",
            0
        );

        Authentication withoutPermission = UsernamePasswordAuthenticationToken.authenticated(
            principal,
            null,
            List.of()
        );
        SecurityContextHolder.getContext().setAuthentication(withoutPermission);
        assertThatThrownBy(() -> protectedOperation.execute())
            .isInstanceOf(AccessDeniedException.class);

        Authentication withPermission = UsernamePasswordAuthenticationToken.authenticated(
            principal,
            null,
            List.of(new SimpleGrantedAuthority(PermissionCodes.USERS_MANAGE))
        );
        SecurityContextHolder.getContext().setAuthentication(withPermission);
        assertThat(protectedOperation.execute()).isEqualTo("ok");

        SecurityContextHolder.clearContext();
    }

    // Helpers

    private void assertProbe(MockHttpSession session, boolean expectedAllowed) throws Exception {
        mockMvc.perform(get(PROBE_PATH).session(session))
            .andExpect(status().is(expectedAllowed ? 200 : 403));
    }

    private void assertBearerProbe(String rawToken, boolean expectedAllowed) throws Exception {
        mockMvc.perform(get(PROBE_PATH).header("Authorization", "Bearer " + rawToken))
            .andExpect(status().is(expectedAllowed ? 200 : 403));
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

    private ResultActions createToken(MockHttpSession session, String name) throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        return mockMvc.perform(post(UserEndpoints.API_TOKENS_PATH)
            .session(session)
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue())
            .contentType(MediaType.APPLICATION_JSON)
            .content("{\"name\":\"" + name + "\",\"expiresAt\":\"" + Instant.now().plusSeconds(3600) + "\"}"));
    }

    private String createRawToken(MockHttpSession session, String name) throws Exception {
        MvcResult result = createToken(session, name)
            .andExpect(status().isCreated())
            .andReturn();
        return JsonPath.read(result.getResponse().getContentAsString(), "$.token");
    }

    private ResultActions adminPut(MockHttpSession session, String path, String body) throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        return mockMvc.perform(put(path)
            .session(session)
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue())
            .contentType(MediaType.APPLICATION_JSON)
            .content(body));
    }

    private ResultActions patchUsername(MockHttpSession session, String username) throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        return mockMvc.perform(patch(UserEndpoints.ME_PATH)
            .session(session)
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue())
            .contentType(MediaType.APPLICATION_JSON)
            .content("{\"username\":\"" + username + "\"}"));
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
