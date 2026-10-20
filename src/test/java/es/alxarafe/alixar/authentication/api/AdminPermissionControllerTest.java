package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.application.ApiTokenRepository;
import es.alxarafe.alixar.authentication.application.AuthorizationRepository;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.PermissionCodes;
import es.alxarafe.alixar.authentication.application.RoleCodes;
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
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Import(AuthenticationTestConfig.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class AdminPermissionControllerTest {

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
    private ApiTokenRepository apiTokenRepository;

    @Autowired
    private PasswordHasher passwordHasher;

    @Autowired
    private TokenHasher tokenHasher;

    private MockMvc mockMvc;

    @BeforeEach
    void setup() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).apply(springSecurity()).build();
        Instant now = Instant.parse("2026-10-20T10:00:00Z");
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
        ((AuthenticationTestConfig.TestApiTokenRepository) apiTokenRepository).replaceWith();
        ((AuthenticationTestConfig.TestAuthorizationRepository) authorizationRepository).reset();
    }

    @Test
    void anonymous_permissionCatalogue_returnsUnauthorized() throws Exception {
        mockMvc.perform(get(AdminUserEndpoints.PERMISSIONS_BASE_PATH))
            .andExpect(status().isUnauthorized());
    }

    @Test
    void noPermissions_deniesAllAdministrativeNamespace() throws Exception {
        MockHttpSession session = authenticatedSession();
        assertSessionAccess(session, 403, 403, 403);

        String rawToken = personalAccessToken();
        assertBearerAccess(rawToken, 403, 403, 403);
    }

    @Test
    void usersManageOnly_allowsUsersAndRoleCatalogueButNotPermissionCatalogue() throws Exception {
        grantOnly(PermissionCodes.USERS_MANAGE);
        MockHttpSession session = authenticatedSession();

        assertSessionAccess(session, 200, 200, 403);
    }

    @Test
    void rolesManageOnly_allowsRoleAdministrationButNotUsers() throws Exception {
        grantOnly(PermissionCodes.ROLES_MANAGE);
        MockHttpSession session = authenticatedSession();

        assertSessionAccess(session, 403, 200, 200);
    }

    @Test
    void usersManageOnly_bearerUsesTheSamePolicy() throws Exception {
        grantOnly(PermissionCodes.USERS_MANAGE);
        String rawToken = personalAccessToken();

        assertBearerAccess(rawToken, 200, 200, 403);
    }

    @Test
    void rolesManageOnly_bearerUsesTheSamePolicy() throws Exception {
        grantOnly(PermissionCodes.ROLES_MANAGE);
        String rawToken = personalAccessToken();

        assertBearerAccess(rawToken, 403, 200, 200);
    }

    @Test
    void roleSubpaths_areReservedForRolesManage() throws Exception {
        grantOnly(PermissionCodes.USERS_MANAGE);
        MockHttpSession session = authenticatedSession();
        String roleDetailPath = AdminUserEndpoints.ROLES_BASE_PATH + "/" + RoleCodes.SYSTEM_ADMIN;

        mockMvc.perform(get(roleDetailPath).session(session))
            .andExpect(status().isForbidden());

        grantOnly(PermissionCodes.ROLES_MANAGE);

        mockMvc.perform(get(roleDetailPath).session(session))
            .andExpect(status().isNotFound());
    }

    @Test
    void permissionCatalogue_isSortedAndExposesOnlyStableFields() throws Exception {
        grantOnly(PermissionCodes.ROLES_MANAGE);
        MockHttpSession session = authenticatedSession();

        mockMvc.perform(get(AdminUserEndpoints.PERMISSIONS_BASE_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.length()").value(2))
            .andExpect(jsonPath("$[0].code").value(PermissionCodes.ROLES_MANAGE))
            .andExpect(jsonPath("$[0].description")
                .value("Manage roles and their permission assignments"))
            .andExpect(jsonPath("$[1].code").value(PermissionCodes.USERS_MANAGE))
            .andExpect(jsonPath("$[1].description").value("Manage users"))
            .andExpect(jsonPath("$[0].id").doesNotExist());
    }

    private void grantOnly(String permissionCode) {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        authorizationRepository.grantPermissionToRole(RoleCodes.SYSTEM_ADMIN, permissionCode);
        if (PermissionCodes.USERS_MANAGE.equals(permissionCode)) {
            authorizationRepository.revokePermissionFromRole(
                RoleCodes.SYSTEM_ADMIN,
                PermissionCodes.ROLES_MANAGE
            );
        } else {
            authorizationRepository.revokePermissionFromRole(
                RoleCodes.SYSTEM_ADMIN,
                PermissionCodes.USERS_MANAGE
            );
        }
    }

    private void assertSessionAccess(
        MockHttpSession session,
        int usersStatus,
        int rolesStatus,
        int permissionsStatus
    ) throws Exception {
        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH).session(session))
            .andExpect(status().is(usersStatus));
        mockMvc.perform(get(AdminUserEndpoints.ROLES_BASE_PATH).session(session))
            .andExpect(status().is(rolesStatus));
        mockMvc.perform(get(AdminUserEndpoints.PERMISSIONS_BASE_PATH).session(session))
            .andExpect(status().is(permissionsStatus));
    }

    private void assertBearerAccess(
        String rawToken,
        int usersStatus,
        int rolesStatus,
        int permissionsStatus
    ) throws Exception {
        mockMvc.perform(get(AdminUserEndpoints.BASE_PATH)
                .header("Authorization", "Bearer " + rawToken))
            .andExpect(status().is(usersStatus));
        mockMvc.perform(get(AdminUserEndpoints.ROLES_BASE_PATH)
                .header("Authorization", "Bearer " + rawToken))
            .andExpect(status().is(rolesStatus));
        mockMvc.perform(get(AdminUserEndpoints.PERMISSIONS_BASE_PATH)
                .header("Authorization", "Bearer " + rawToken))
            .andExpect(status().is(permissionsStatus));
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

    private String personalAccessToken() {
        Instant now = Instant.now();
        String rawToken = "alx_pat_test-" + UUID.randomUUID();
        apiTokenRepository.create(
            new ApiToken(UUID.randomUUID(), ALICE_ID, "test", 0, now, now.plusSeconds(3600), null, null),
            tokenHasher.hash(rawToken)
        );
        return rawToken;
    }

    private Cookie csrfCookieFromSafeRequest() throws Exception {
        MvcResult result = mockMvc.perform(get("/health"))
            .andExpect(status().isOk())
            .andReturn();
        return result.getResponse().getCookie(CSRF_COOKIE);
    }
}
