package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.application.AdministrationErrorCode;
import es.alxarafe.alixar.authentication.application.ApiTokenRepository;
import es.alxarafe.alixar.authentication.application.AuthorizationRepository;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.PasswordResetTokenRepository;
import es.alxarafe.alixar.authentication.application.PasswordResetTokenGenerator;
import es.alxarafe.alixar.authentication.application.PermissionCodes;
import es.alxarafe.alixar.authentication.application.RoleCodes;
import es.alxarafe.alixar.authentication.application.RoleDefinition;
import es.alxarafe.alixar.authentication.application.TokenHasher;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.domain.ApiToken;
import es.alxarafe.alixar.authentication.domain.PasswordResetToken;
import es.alxarafe.alixar.authentication.domain.User;
import jakarta.servlet.http.Cookie;
import java.time.Instant;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;
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
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Import(AuthenticationTestConfig.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class AdminUserControllerTest {

    private static final UUID ALICE_ID = UUID.fromString("8f796219-e501-44e8-a4ab-4c014821ba58");
    private static final UUID BOB_ID = UUID.fromString("3c15acbf-6e74-4af1-8cfe-1452a2935870");
    private static final UUID CAROL_ID = UUID.fromString("4d26bdac-7f85-5bf2-9daf-2563b3946981");
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
    private PasswordResetTokenRepository passwordResetTokenRepository;

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
        SecurityContextHolder.clearContext();
        Instant now = Instant.parse("2026-10-17T10:00:00Z");
        ((AuthenticationTestConfig.TestUserRepository) userRepository).replaceWith(
            user(ALICE_ID, "alice", "alice@example.test", true, 0, now),
            user(BOB_ID, "bob", "bob@example.test", true, 0, now),
            user(CAROL_ID, "carol", "carol@example.test", false, 0, now)
        );
        ((AuthenticationTestConfig.TestPasswordResetTokenRepository) passwordResetTokenRepository).replaceWith();
        ((AuthenticationTestConfig.TestApiTokenRepository) apiTokenRepository).replaceWith();
        ((AuthenticationTestConfig.TestAuthorizationRepository) authorizationRepository).reset();
    }

    @Test
    void anonymous_readEndpoints_returnUnauthorized() throws Exception {
        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH))
            .andExpect(status().isUnauthorized());
        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH + "/" + ALICE_ID))
            .andExpect(status().isUnauthorized());
        mockMvc.perform(get(AdminUserEndpoints.ROLES_BASE_PATH))
            .andExpect(status().isUnauthorized());
    }

    @Test
    void sessionWithoutPermission_returnsForbiddenOnReadEndpoints() throws Exception {
        MockHttpSession session = authenticatedSession("bob", PASSWORD);

        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH).session(session))
            .andExpect(status().isForbidden());
        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH + "/" + ALICE_ID).session(session))
            .andExpect(status().isForbidden());
        mockMvc.perform(get(AdminUserEndpoints.ROLES_BASE_PATH).session(session))
            .andExpect(status().isForbidden());
    }

    @Test
    void sessionWithPermission_returnsOkOnReadEndpoints() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH).session(session))
            .andExpect(status().isOk());
        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH + "/" + ALICE_ID).session(session))
            .andExpect(status().isOk());
        mockMvc.perform(get(AdminUserEndpoints.ROLES_BASE_PATH).session(session))
            .andExpect(status().isOk());
    }

    @Test
    void bearerWithoutPermission_returnsForbiddenOnReadEndpoints() throws Exception {
        String rawToken = personalAccessToken(BOB_ID);

        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH).header("Authorization", "Bearer " + rawToken))
            .andExpect(status().isForbidden());
        mockMvc.perform(get(AdminUserEndpoints.ROLES_BASE_PATH).header("Authorization", "Bearer " + rawToken))
            .andExpect(status().isForbidden());
    }

    @Test
    void bearerWithPermission_returnsOkOnReadEndpoints() throws Exception {
        grantSystemAdmin(ALICE_ID);
        String rawToken = personalAccessToken(ALICE_ID);

        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH).header("Authorization", "Bearer " + rawToken))
            .andExpect(status().isOk());
        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH + "/" + ALICE_ID)
                .header("Authorization", "Bearer " + rawToken))
            .andExpect(status().isOk());
        mockMvc.perform(get(AdminUserEndpoints.ROLES_BASE_PATH)
                .header("Authorization", "Bearer " + rawToken))
            .andExpect(status().isOk());
    }

    @Test
    void list_usesDefaultsAndStableUsernameThenIdOrder() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.page").value(0))
            .andExpect(jsonPath("$.size").value(20))
            .andExpect(jsonPath("$.total").value(3))
            .andExpect(jsonPath("$.items.length()").value(3))
            .andExpect(jsonPath("$.items[0].username").value("alice"))
            .andExpect(jsonPath("$.items[1].username").value("bob"))
            .andExpect(jsonPath("$.items[2].username").value("carol"));
    }

    @Test
    void list_paginates() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH)
                .param(AdminUserEndpoints.PAGE_PARAM, "0")
                .param(AdminUserEndpoints.SIZE_PARAM, "2")
                .session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.items.length()").value(2))
            .andExpect(jsonPath("$.total").value(3));

        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH)
                .param(AdminUserEndpoints.PAGE_PARAM, "1")
                .param(AdminUserEndpoints.SIZE_PARAM, "2")
                .session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.items.length()").value(1))
            .andExpect(jsonPath("$.items[0].username").value("carol"));
    }

    @Test
    void list_filtersByEnabled() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH)
                .param(AdminUserEndpoints.ENABLED_PARAM, "false")
                .session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.total").value(1))
            .andExpect(jsonPath("$.items[0].username").value("carol"));

        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH)
                .param(AdminUserEndpoints.ENABLED_PARAM, "true")
                .session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.total").value(2));
    }

    @Test
    void list_searchesUsernameAndEmailCaseInsensitively() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH)
                .param(AdminUserEndpoints.QUERY_PARAM, "ALI")
                .session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.total").value(1))
            .andExpect(jsonPath("$.items[0].username").value("alice"));

        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH)
                .param(AdminUserEndpoints.QUERY_PARAM, "BOB@EXAMPLE")
                .session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.total").value(1))
            .andExpect(jsonPath("$.items[0].username").value("bob"));
    }

    @Test
    void list_rejectsInvalidPagination() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH)
                .param(AdminUserEndpoints.PAGE_PARAM, "-1")
                .session(session))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value(AdministrationErrorCode.ADMIN_INVALID_PAGINATION.name()))
            .andExpect(jsonPath("$.field").value("page"));

        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH)
                .param(AdminUserEndpoints.SIZE_PARAM, "0")
                .session(session))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value(AdministrationErrorCode.ADMIN_INVALID_PAGINATION.name()))
            .andExpect(jsonPath("$.field").value("size"));

        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH)
                .param(AdminUserEndpoints.SIZE_PARAM, "101")
                .session(session))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value(AdministrationErrorCode.ADMIN_INVALID_PAGINATION.name()))
            .andExpect(jsonPath("$.field").value("size"));
    }

    @Test
    void detail_returnsSafeFieldsAndRoles() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH + "/" + ALICE_ID).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(ALICE_ID.toString()))
            .andExpect(jsonPath("$.username").value("alice"))
            .andExpect(jsonPath("$.email").value("alice@example.test"))
            .andExpect(jsonPath("$.enabled").value(true))
            .andExpect(jsonPath("$.createdAt").isNotEmpty())
            .andExpect(jsonPath("$.updatedAt").isNotEmpty())
            .andExpect(jsonPath("$.roles.length()").value(1))
            .andExpect(jsonPath("$.roles[0]").value(RoleCodes.SYSTEM_ADMIN))
            .andExpect(jsonPath("$.passwordHash").doesNotExist())
            .andExpect(jsonPath("$.credentialsVersion").doesNotExist())
            .andExpect(jsonPath("$.password").doesNotExist())
            .andExpect(jsonPath("$.token").doesNotExist())
            .andExpect(jsonPath("$.resetToken").doesNotExist());
    }

    @Test
    void detail_unknownUser_returnsNotFound() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH + "/" + UUID.randomUUID()).session(session))
            .andExpect(status().isNotFound())
            .andExpect(jsonPath("$.code").value(AdministrationErrorCode.ADMIN_USER_NOT_FOUND.name()));
    }

    @Test
    void roles_returnsReadOnlyCatalogueWithPermissions() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        mockMvc.perform(get(AdminUserEndpoints.ROLES_BASE_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.length()").value(1))
            .andExpect(jsonPath("$[0].code").value(RoleCodes.SYSTEM_ADMIN))
            .andExpect(jsonPath("$[0].name").value("System administrator"))
            .andExpect(jsonPath("$[0].permissions.length()").value(1))
            .andExpect(jsonPath("$[0].permissions[0]").value(PermissionCodes.USERS_MANAGE))
            .andExpect(jsonPath("$[0].id").doesNotExist());
    }

    @Test
    void list_and_detail_doNotExposeSecrets() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        String passwordHash = userRepository.findById(ALICE_ID).orElseThrow().passwordHash();

        MvcResult list = mockMvc.perform(get(AdminUserEndpoints.BASE_PATH).session(session))
            .andExpect(status().isOk())
            .andReturn();
        MvcResult detail = mockMvc.perform(get(AdminUserEndpoints.BASE_PATH + "/" + ALICE_ID).session(session))
            .andExpect(status().isOk())
            .andReturn();

        assertThat(list.getResponse().getContentAsString()).doesNotContain(passwordHash);
        assertThat(detail.getResponse().getContentAsString()).doesNotContain(passwordHash);
    }

    @Test
    void readEndpoints_doNotMutateManagedState() throws Exception {
        grantSystemAdmin(ALICE_ID);
        Instant now = Instant.now();
        passwordResetTokenRepository.create(new PasswordResetToken(
            UUID.randomUUID(),
            BOB_ID,
            tokenHasher.hash(PasswordResetTokenGenerator.generate()),
            now.plusSeconds(1800),
            null,
            now
        ));
        apiTokenRepository.create(
            new ApiToken(
                UUID.randomUUID(),
                BOB_ID,
                "read-only-probe",
                0,
                now,
                now.plusSeconds(3600),
                null,
                null
            ),
            tokenHasher.hash("alx_pat_read-only-probe")
        );

        ManagedState before = managedState();
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH).session(session))
            .andExpect(status().isOk());
        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH + "/" + BOB_ID).session(session))
            .andExpect(status().isOk());
        mockMvc.perform(get(AdminUserEndpoints.ROLES_BASE_PATH).session(session))
            .andExpect(status().isOk());

        assertThat(managedState()).isEqualTo(before);
    }

    @Test
    void anonymous_writeEndpoints_returnUnauthorized() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        mockMvc.perform(post(AdminUserEndpoints.BASE_PATH)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content(createUserJson("new-user", "new-user@example.test", "new-user-password-123", null)))
            .andExpect(status().isUnauthorized());
        mockMvc.perform(patch(AdminUserEndpoints.BASE_PATH + "/" + ALICE_ID)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"username\":\"renamed\"}"))
            .andExpect(status().isUnauthorized());
        mockMvc.perform(patch(AdminUserEndpoints.BASE_PATH + "/" + ALICE_ID + "/enabled")
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"enabled\":false}"))
            .andExpect(status().isUnauthorized());
        mockMvc.perform(post(AdminUserEndpoints.BASE_PATH + "/" + ALICE_ID + "/password-reset")
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"newPassword\":\"new-password-123\"}"))
            .andExpect(status().isUnauthorized());
    }

    @Test
    void sessionWithoutPermission_returnsForbiddenOnWriteEndpoints() throws Exception {
        MockHttpSession session = authenticatedSession("bob", PASSWORD);
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        mockMvc.perform(post(AdminUserEndpoints.BASE_PATH)
                .session(session)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content(createUserJson("new-user", "new-user@example.test", "new-user-password-123", null)))
            .andExpect(status().isForbidden());
        mockMvc.perform(patch(AdminUserEndpoints.BASE_PATH + "/" + ALICE_ID)
                .session(session)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"username\":\"renamed\"}"))
            .andExpect(status().isForbidden());
        mockMvc.perform(patch(AdminUserEndpoints.BASE_PATH + "/" + ALICE_ID + "/enabled")
                .session(session)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"enabled\":false}"))
            .andExpect(status().isForbidden());
        mockMvc.perform(post(AdminUserEndpoints.BASE_PATH + "/" + ALICE_ID + "/password-reset")
                .session(session)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"newPassword\":\"new-password-123\"}"))
            .andExpect(status().isForbidden());
    }

    @Test
    void bearerWithoutPermission_returnsForbiddenOnWriteEndpoints() throws Exception {
        String rawToken = personalAccessToken(BOB_ID);

        mockMvc.perform(post(AdminUserEndpoints.BASE_PATH)
                .header("Authorization", "Bearer " + rawToken)
                .contentType(MediaType.APPLICATION_JSON)
                .content(createUserJson("new-user", "new-user@example.test", "new-user-password-123", null)))
            .andExpect(status().isForbidden());
        mockMvc.perform(patch(AdminUserEndpoints.BASE_PATH + "/" + ALICE_ID)
                .header("Authorization", "Bearer " + rawToken)
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"username\":\"renamed\"}"))
            .andExpect(status().isForbidden());
        mockMvc.perform(patch(AdminUserEndpoints.BASE_PATH + "/" + ALICE_ID + "/enabled")
                .header("Authorization", "Bearer " + rawToken)
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"enabled\":false}"))
            .andExpect(status().isForbidden());
        mockMvc.perform(post(AdminUserEndpoints.BASE_PATH + "/" + ALICE_ID + "/password-reset")
                .header("Authorization", "Bearer " + rawToken)
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"newPassword\":\"new-password-123\"}"))
            .andExpect(status().isForbidden());
    }

    @Test
    void create_withPermission_createsDisabledUserWithRoles() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        adminPost(session, createUserJson(
            "NEW.USER",
            "NEW.USER@EXAMPLE.TEST",
            "new-user-password-123",
            "[\"" + RoleCodes.SYSTEM_ADMIN + "\"]"
        ))
            .andExpect(status().isCreated())
            .andExpect(jsonPath("$.username").value("new.user"))
            .andExpect(jsonPath("$.email").value("new.user@example.test"))
            .andExpect(jsonPath("$.enabled").value(false))
            .andExpect(jsonPath("$.roles.length()").value(1))
            .andExpect(jsonPath("$.roles[0]").value(RoleCodes.SYSTEM_ADMIN))
            .andExpect(jsonPath("$.passwordHash").doesNotExist())
            .andExpect(jsonPath("$.credentialsVersion").doesNotExist())
            .andExpect(jsonPath("$.password").doesNotExist())
            .andExpect(jsonPath("$.resetToken").doesNotExist())
            .andExpect(jsonPath("$.token").doesNotExist());

        User created = userRepository.findByUsername("new.user").orElseThrow();
        assertThat(created.enabled()).isFalse();
        assertThat(created.credentialsVersion()).isZero();
        assertThat(authorizationRepository.findRoleCodesForUser(created.id()))
            .containsExactly(RoleCodes.SYSTEM_ADMIN);
    }

    @Test
    void create_withoutRoleCodes_createsUserWithoutRoles() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        adminPost(session, createUserJson(
            "new-user",
            "new-user@example.test",
            "new-user-password-123",
            null
        ))
            .andExpect(status().isCreated())
            .andExpect(jsonPath("$.roles.length()").value(0));

        adminPost(session, createUserJson(
            "new-user-empty-roles",
            "new-user-empty-roles@example.test",
            "new-user-password-123",
            "[]"
        ))
            .andExpect(status().isCreated())
            .andExpect(jsonPath("$.roles.length()").value(0));

        User created = userRepository.findByUsername("new-user").orElseThrow();
        assertThat(authorizationRepository.findRoleCodesForUser(created.id())).isEmpty();
        User createdWithEmptyRoles = userRepository.findByUsername("new-user-empty-roles").orElseThrow();
        assertThat(authorizationRepository.findRoleCodesForUser(createdWithEmptyRoles.id())).isEmpty();
    }

    @Test
    void bearerWithPermission_canCreateAndRenameUser() throws Exception {
        grantSystemAdmin(ALICE_ID);
        String rawToken = personalAccessToken(ALICE_ID);

        mockMvc.perform(post(AdminUserEndpoints.BASE_PATH)
                .header("Authorization", "Bearer " + rawToken)
                .contentType(MediaType.APPLICATION_JSON)
                .content(createUserJson("new-user", "new-user@example.test", "new-user-password-123", null)))
            .andExpect(status().isCreated());

        UUID createdId = userRepository.findByUsername("new-user").orElseThrow().id();
        mockMvc.perform(patch(AdminUserEndpoints.BASE_PATH + "/" + createdId)
                .header("Authorization", "Bearer " + rawToken)
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"username\":\"renamed-user\"}"))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.username").value("renamed-user"));
    }

    @Test
    void create_unknownRole_returnsNotFoundAndDoesNotCreateUser() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        long usersBefore = userRepository.count(null, null);

        adminPost(session, createUserJson(
            "new-user",
            "new-user@example.test",
            "new-user-password-123",
            "[\"missing-role\"]"
        ))
            .andExpect(status().isNotFound())
            .andExpect(jsonPath("$.code").value(AdministrationErrorCode.ADMIN_ROLE_NOT_FOUND.name()));

        assertThat(userRepository.count(null, null)).isEqualTo(usersBefore);
        assertThat(userRepository.findByUsername("new-user")).isEmpty();
    }

    @Test
    void create_duplicateUsernameOrEmail_returnsConflict() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        adminPost(session, createUserJson(
            "ALICE",
            "different@example.test",
            "new-user-password-123",
            null
        ))
            .andExpect(status().isConflict())
            .andExpect(jsonPath("$.code").value("AUTH_USERNAME_ALREADY_EXISTS"));

        adminPost(session, createUserJson(
            "different-user",
            "ALICE@EXAMPLE.TEST",
            "new-user-password-123",
            null
        ))
            .andExpect(status().isConflict())
            .andExpect(jsonPath("$.code").value(AdministrationErrorCode.ADMIN_EMAIL_ALREADY_EXISTS.name()));

        assertThat(userRepository.findByUsername("different-user")).isEmpty();
    }

    @Test
    void create_invalidPasswordOrEmail_returnsBadRequest() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        adminPost(session, createUserJson(
            "new-user",
            "new-user@example.test",
            "short",
            null
        ))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("AUTH_INVALID_PASSWORD"));

        adminPost(session, createUserJson(
            "new-user",
            "not-an-email",
            "new-user-password-123",
            null
        ))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("email"));

        assertThat(userRepository.findByUsername("new-user")).isEmpty();
    }

    @Test
    void createdUserIsDisabledAndCannotLogIn() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        adminPost(session, createUserJson(
            "new-user",
            "new-user@example.test",
            "new-user-password-123",
            "[\"" + RoleCodes.SYSTEM_ADMIN + "\"]"
        ))
            .andExpect(status().isCreated());

        login("new-user", "new-user-password-123")
            .andExpect(status().isUnauthorized());
    }

    @Test
    void updateUsername_changesOnlyUsernameAndKeepsCredentialsSessionsAndTokens() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession adminSession = authenticatedSession("alice", PASSWORD);
        MockHttpSession bobSession = authenticatedSession("bob", PASSWORD);
        String rawBobToken = personalAccessToken(BOB_ID);

        User before = userRepository.findById(BOB_ID).orElseThrow();
        List<String> rolesBefore = authorizationRepository.findRoleCodesForUser(BOB_ID);
        List<PasswordResetToken> resetTokensBefore =
            ((AuthenticationTestConfig.TestPasswordResetTokenRepository) passwordResetTokenRepository).all();
        List<ApiToken> tokensBefore = apiTokenRepository.findAllByUserId(BOB_ID);

        adminPatch(adminSession, BOB_ID, "{\"username\":\"bob-renamed\"}")
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.username").value("bob-renamed"))
            .andExpect(jsonPath("$.email").value("bob@example.test"))
            .andExpect(jsonPath("$.enabled").value(true));

        User after = userRepository.findById(BOB_ID).orElseThrow();
        assertThat(after.username()).isEqualTo("bob-renamed");
        assertThat(after.email()).isEqualTo(before.email());
        assertThat(after.enabled()).isEqualTo(before.enabled());
        assertThat(after.credentialsVersion()).isEqualTo(before.credentialsVersion());
        assertThat(after.passwordHash()).isEqualTo(before.passwordHash());
        assertThat(authorizationRepository.findRoleCodesForUser(BOB_ID)).isEqualTo(rolesBefore);
        assertThat(((AuthenticationTestConfig.TestPasswordResetTokenRepository) passwordResetTokenRepository).all())
            .isEqualTo(resetTokensBefore);
        assertThat(apiTokenRepository.findAllByUserId(BOB_ID)).isEqualTo(tokensBefore);

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(bobSession))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(BOB_ID.toString()));
        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH)
                .header("Authorization", "Bearer " + rawBobToken))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(BOB_ID.toString()));
    }

    @Test
    void updateUsername_duplicateBlankOrUnknown_returnsExpectedErrors() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        adminPatch(session, BOB_ID, "{\"username\":\"ALICE\"}")
            .andExpect(status().isConflict())
            .andExpect(jsonPath("$.code").value("AUTH_USERNAME_ALREADY_EXISTS"));
        adminPatch(session, BOB_ID, "{\"username\":\"   \"}")
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("username"));
        adminPatch(session, UUID.randomUUID(), "{\"username\":\"renamed\"}")
            .andExpect(status().isNotFound())
            .andExpect(jsonPath("$.code").value(AdministrationErrorCode.ADMIN_USER_NOT_FOUND.name()));

        assertThat(userRepository.findById(BOB_ID).orElseThrow().username()).isEqualTo("bob");
    }

    @Test
    void disableAndEnable_areIdempotentAndPreserveCredentialsVersionRules() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        adminPatchEnabled(session, BOB_ID, false)
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.enabled").value(false));
        assertThat(userRepository.findById(BOB_ID).orElseThrow().credentialsVersion()).isEqualTo(1);

        adminPatchEnabled(session, BOB_ID, false)
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.enabled").value(false));
        assertThat(userRepository.findById(BOB_ID).orElseThrow().credentialsVersion()).isEqualTo(1);

        adminPatchEnabled(session, BOB_ID, true)
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.enabled").value(true));
        assertThat(userRepository.findById(BOB_ID).orElseThrow().credentialsVersion()).isEqualTo(1);

        adminPatchEnabled(session, BOB_ID, true)
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.enabled").value(true));
        assertThat(userRepository.findById(BOB_ID).orElseThrow().credentialsVersion()).isEqualTo(1);

        login("bob", PASSWORD).andExpect(status().isOk());
    }

    @Test
    void disable_invalidatesPendingPasswordResetTokens() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        Instant now = Instant.now();
        passwordResetTokenRepository.create(new PasswordResetToken(
            UUID.randomUUID(),
            BOB_ID,
            tokenHasher.hash(PasswordResetTokenGenerator.generate()),
            now.plusSeconds(1800),
            null,
            now
        ));

        adminPatchEnabled(session, BOB_ID, false)
            .andExpect(status().isOk());

        PasswordResetToken token =
            ((AuthenticationTestConfig.TestPasswordResetTokenRepository) passwordResetTokenRepository)
                .all()
                .getFirst();
        assertThat(token.usedAt()).isNotNull();
    }

    @Test
    void disableThenEnable_keepsPreviousSessionsAndTokensInvalid() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession adminSession = authenticatedSession("alice", PASSWORD);
        MockHttpSession bobSession = authenticatedSession("bob", PASSWORD);
        String bobToken = personalAccessToken(BOB_ID);
        List<ApiToken> tokensBefore = apiTokenRepository.findAllByUserId(BOB_ID);

        adminPatchEnabled(adminSession, BOB_ID, false)
            .andExpect(status().isOk());
        adminPatchEnabled(adminSession, BOB_ID, true)
            .andExpect(status().isOk());

        assertThat(apiTokenRepository.findAllByUserId(BOB_ID)).isEqualTo(tokensBefore);
        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(bobSession))
            .andExpect(status().isUnauthorized());
        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH)
                .header("Authorization", "Bearer " + bobToken))
            .andExpect(status().isUnauthorized());
        login("bob", PASSWORD).andExpect(status().isOk());
    }

    @Test
    void selfDisable_withSession_endsAccessOnTheNextRequest() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        adminPatchEnabled(session, ALICE_ID, false)
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.enabled").value(false));

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
            .andExpect(status().isUnauthorized());
    }

    @Test
    void selfDisable_withBearerToken_endsAccessOnTheNextRequest() throws Exception {
        grantSystemAdmin(ALICE_ID);
        String rawToken = personalAccessToken(ALICE_ID);

        mockMvc.perform(patch(AdminUserEndpoints.BASE_PATH + "/" + ALICE_ID + "/enabled")
                .header("Authorization", "Bearer " + rawToken)
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"enabled\":false}"))
            .andExpect(status().isOk());

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH)
                .header("Authorization", "Bearer " + rawToken))
            .andExpect(status().isUnauthorized());
    }

    @Test
    void adminPasswordReset_changesPasswordAndInvalidatesPreviousCredentialsAndResetTokens() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession adminSession = authenticatedSession("alice", PASSWORD);
        MockHttpSession bobSession = authenticatedSession("bob", PASSWORD);
        String bobToken = personalAccessToken(BOB_ID);
        Instant now = Instant.now();
        passwordResetTokenRepository.create(new PasswordResetToken(
            UUID.randomUUID(),
            BOB_ID,
            tokenHasher.hash(PasswordResetTokenGenerator.generate()),
            now.plusSeconds(1800),
            null,
            now
        ));
        User before = userRepository.findById(BOB_ID).orElseThrow();
        List<String> rolesBefore = authorizationRepository.findRoleCodesForUser(BOB_ID);
        List<ApiToken> tokensBefore = apiTokenRepository.findAllByUserId(BOB_ID);

        adminResetPassword(adminSession, BOB_ID, "new-bob-password-123")
            .andExpect(status().isNoContent());

        User after = userRepository.findById(BOB_ID).orElseThrow();
        assertThat(after.passwordHash()).isNotEqualTo(before.passwordHash());
        assertThat(after.credentialsVersion()).isEqualTo(before.credentialsVersion() + 1);
        assertThat(after.username()).isEqualTo(before.username());
        assertThat(after.email()).isEqualTo(before.email());
        assertThat(after.enabled()).isEqualTo(before.enabled());
        assertThat(authorizationRepository.findRoleCodesForUser(BOB_ID)).isEqualTo(rolesBefore);
        assertThat(apiTokenRepository.findAllByUserId(BOB_ID)).isEqualTo(tokensBefore);
        assertThat(((AuthenticationTestConfig.TestPasswordResetTokenRepository) passwordResetTokenRepository)
            .all()
            .getFirst()
            .usedAt()).isNotNull();

        login("bob", PASSWORD).andExpect(status().isUnauthorized());
        login("bob", "new-bob-password-123").andExpect(status().isOk());
        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(bobSession))
            .andExpect(status().isUnauthorized());
        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH)
                .header("Authorization", "Bearer " + bobToken))
            .andExpect(status().isUnauthorized());
    }

    @Test
    void selfPasswordReset_invalidatesCurrentSessionAndAllowsNewLogin() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        adminResetPassword(session, ALICE_ID, "new-alice-password-123")
            .andExpect(status().isNoContent());

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
            .andExpect(status().isUnauthorized());
        login("alice", PASSWORD).andExpect(status().isUnauthorized());
        login("alice", "new-alice-password-123").andExpect(status().isOk());
    }

    @Test
    void enableAndReset_returnExpectedErrorsForUnknownOrInvalidInput() throws Exception {
        grantSystemAdmin(ALICE_ID);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        UUID unknownId = UUID.randomUUID();

        adminPatchEnabled(session, unknownId, false)
            .andExpect(status().isNotFound())
            .andExpect(jsonPath("$.code").value(AdministrationErrorCode.ADMIN_USER_NOT_FOUND.name()));
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        mockMvc.perform(patch(AdminUserEndpoints.BASE_PATH + "/" + BOB_ID + "/enabled")
                .session(session)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"enabled\":null}"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("enabled"));

        adminResetPassword(session, unknownId, "new-password-123")
            .andExpect(status().isNotFound())
            .andExpect(jsonPath("$.code").value(AdministrationErrorCode.ADMIN_USER_NOT_FOUND.name()));
        adminResetPassword(session, BOB_ID, "short")
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("AUTH_INVALID_PASSWORD"));
        adminResetPassword(session, BOB_ID, "   ")
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("newPassword"));
    }

    private ResultActions adminPost(MockHttpSession session, String body) throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        return mockMvc.perform(post(AdminUserEndpoints.BASE_PATH)
            .session(session)
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue())
            .contentType(MediaType.APPLICATION_JSON)
            .content(body));
    }

    private ResultActions adminPatch(MockHttpSession session, UUID userId, String body) throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        return mockMvc.perform(patch(AdminUserEndpoints.BASE_PATH + "/" + userId)
            .session(session)
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue())
            .contentType(MediaType.APPLICATION_JSON)
            .content(body));
    }

    private ResultActions adminPatchEnabled(MockHttpSession session, UUID userId, boolean enabled) throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        return mockMvc.perform(patch(AdminUserEndpoints.BASE_PATH + "/" + userId + "/enabled")
            .session(session)
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue())
            .contentType(MediaType.APPLICATION_JSON)
            .content("{\"enabled\":" + enabled + "}"));
    }

    private ResultActions adminResetPassword(MockHttpSession session, UUID userId, String newPassword)
        throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        return mockMvc.perform(post(AdminUserEndpoints.BASE_PATH + "/" + userId + "/password-reset")
            .session(session)
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue())
            .contentType(MediaType.APPLICATION_JSON)
            .content("{\"newPassword\":\"" + newPassword + "\"}"));
    }

    private String createUserJson(String username, String email, String password, String roleCodesJson) {
        String roleCodes = roleCodesJson != null ? ",\"roleCodes\":" + roleCodesJson : "";
        return "{\"username\":\"" + username
            + "\",\"email\":\"" + email
            + "\",\"password\":\"" + password + "\""
            + roleCodes + "}";
    }

    private ManagedState managedState() {
        List<User> users = ((AuthenticationTestConfig.TestUserRepository) userRepository).all();
        List<RoleDefinition> roles = authorizationRepository.findAllRoles();
        Map<UUID, List<String>> userRoles = users.stream()
            .collect(Collectors.toMap(
                User::id,
                user -> authorizationRepository.findRoleCodesForUser(user.id())
            ));
        List<PasswordResetToken> resetTokens =
            ((AuthenticationTestConfig.TestPasswordResetTokenRepository) passwordResetTokenRepository).all();
        List<ApiToken> apiTokens =
            ((AuthenticationTestConfig.TestApiTokenRepository) apiTokenRepository).all();
        return new ManagedState(users, roles, userRoles, resetTokens, apiTokens);
    }

    private void grantSystemAdmin(UUID userId) {
        authorizationRepository.assignRoleToUser(userId, RoleCodes.SYSTEM_ADMIN);
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

    private String personalAccessToken(UUID userId) {
        Instant now = Instant.now();
        String rawToken = "alx_pat_test-" + UUID.randomUUID();
        apiTokenRepository.create(
            new ApiToken(UUID.randomUUID(), userId, "test", 0, now, now.plusSeconds(3600), null, null),
            tokenHasher.hash(rawToken)
        );
        return rawToken;
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

    private record ManagedState(
        List<User> users,
        List<RoleDefinition> roles,
        Map<UUID, List<String>> userRoles,
        List<PasswordResetToken> resetTokens,
        List<ApiToken> apiTokens
    ) {
    }
}
