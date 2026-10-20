package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.application.AdministrationErrorCode;
import es.alxarafe.alixar.authentication.application.AuthorizationRepository;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.PermissionCodes;
import es.alxarafe.alixar.authentication.application.RoleCodes;
import es.alxarafe.alixar.authentication.application.RoleDefinition;
import es.alxarafe.alixar.authentication.application.UserRepository;
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
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.header;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Import(AuthenticationTestConfig.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class AdminRoleControllerTest {

    private static final UUID ALICE_ID = UUID.fromString("8f796219-e501-44e8-a4ab-4c014821ba58");
    private static final String USERNAME = "alice";
    private static final String PASSWORD = "correct-test-password";
    private static final String CSRF_COOKIE = "XSRF-TOKEN";
    private static final String CSRF_HEADER = "X-XSRF-TOKEN";
    private static final String SYSTEM_ADMIN_PATH =
        AdminUserEndpoints.ROLES_BASE_PATH + "/" + RoleCodes.SYSTEM_ADMIN;

    @Autowired
    private WebApplicationContext context;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AuthorizationRepository authorizationRepository;

    @Autowired
    private PasswordHasher passwordHasher;

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
        ((AuthenticationTestConfig.TestAuthorizationRepository) authorizationRepository).reset();
    }

    @Test
    void anonymous_roleEndpoints_returnUnauthorized() throws Exception {
        mockMvc.perform(get(AdminUserEndpoints.ROLES_BASE_PATH))
            .andExpect(status().isUnauthorized());
        mockMvc.perform(get(SYSTEM_ADMIN_PATH))
            .andExpect(status().isUnauthorized());

        Cookie csrfCookie = csrfCookieFromSafeRequest();
        mockMvc.perform(post(AdminUserEndpoints.ROLES_BASE_PATH)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{}"))
            .andExpect(status().isUnauthorized());
    }

    @Test
    void usersManageOnly_canListRolesButCannotReadDetailOrCreate() throws Exception {
        grantSystemAdmin();
        authorizationRepository.revokePermissionFromRole(RoleCodes.SYSTEM_ADMIN, PermissionCodes.ROLES_MANAGE);
        MockHttpSession session = authenticatedSession();

        mockMvc.perform(get(AdminUserEndpoints.ROLES_BASE_PATH).session(session))
            .andExpect(status().isOk());
        mockMvc.perform(get(SYSTEM_ADMIN_PATH).session(session))
            .andExpect(status().isForbidden());
        adminPost(session, createRoleJson("new-role", "New role", "[]"))
            .andExpect(status().isForbidden());
    }

    @Test
    void list_usesCanonicalContractAndDeterministicOrder() throws Exception {
        grantRolesManage();
        authorizationRepository.createRole(new RoleDefinition(
            "custom-role",
            "Custom role",
            false,
            List.of(PermissionCodes.USERS_MANAGE, PermissionCodes.ROLES_MANAGE)
        ));
        MockHttpSession session = authenticatedSession();

        mockMvc.perform(get(AdminUserEndpoints.ROLES_BASE_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.length()").value(2))
            .andExpect(jsonPath("$[0].code").value("custom-role"))
            .andExpect(jsonPath("$[0].name").value("Custom role"))
            .andExpect(jsonPath("$[0].builtIn").value(false))
            .andExpect(jsonPath("$[0].permissionCodes[0]").value(PermissionCodes.ROLES_MANAGE))
            .andExpect(jsonPath("$[0].permissionCodes[1]").value(PermissionCodes.USERS_MANAGE))
            .andExpect(jsonPath("$[1].code").value(RoleCodes.SYSTEM_ADMIN))
            .andExpect(jsonPath("$[1].builtIn").value(true))
            .andExpect(jsonPath("$[0].permissions").doesNotExist());
    }

    @Test
    void detail_returnsCanonicalContract() throws Exception {
        grantSystemAdmin();
        MockHttpSession session = authenticatedSession();

        mockMvc.perform(get(SYSTEM_ADMIN_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.code").value(RoleCodes.SYSTEM_ADMIN))
            .andExpect(jsonPath("$.name").value("System administrator"))
            .andExpect(jsonPath("$.builtIn").value(true))
            .andExpect(jsonPath("$.permissionCodes[0]").value(PermissionCodes.ROLES_MANAGE))
            .andExpect(jsonPath("$.permissionCodes[1]").value(PermissionCodes.USERS_MANAGE))
            .andExpect(jsonPath("$.permissions").doesNotExist());
    }

    @Test
    void detail_unknownRole_returnsNotFound() throws Exception {
        grantRolesManage();
        MockHttpSession session = authenticatedSession();

        mockMvc.perform(get(AdminUserEndpoints.ROLES_BASE_PATH + "/missing-role").session(session))
            .andExpect(status().isNotFound())
            .andExpect(jsonPath("$.code").value(AdministrationErrorCode.ADMIN_ROLE_NOT_FOUND.name()));
    }

    @Test
    void create_normalizesCodeNameAndPermissionsAndReturnsLocation() throws Exception {
        grantRolesManage();
        MockHttpSession session = authenticatedSession();

        adminPost(session, createRoleJson(
            " Operations-Team ",
            " Operations Team ",
            "[\" USERS.MANAGE \",\"users.manage\",\"roles.manage\"]"
        ))
            .andExpect(status().isCreated())
            .andExpect(header().string("Location", AdminUserEndpoints.ROLES_BASE_PATH + "/operations-team"))
            .andExpect(jsonPath("$.code").value("operations-team"))
            .andExpect(jsonPath("$.name").value("Operations Team"))
            .andExpect(jsonPath("$.builtIn").value(false))
            .andExpect(jsonPath("$.permissionCodes.length()").value(2))
            .andExpect(jsonPath("$.permissionCodes[0]").value(PermissionCodes.ROLES_MANAGE))
            .andExpect(jsonPath("$.permissionCodes[1]").value(PermissionCodes.USERS_MANAGE));

        mockMvc.perform(get(AdminUserEndpoints.ROLES_BASE_PATH + "/operations-team").session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.code").value("operations-team"))
            .andExpect(jsonPath("$.name").value("Operations Team"))
            .andExpect(jsonPath("$.builtIn").value(false));
    }

    @Test
    void create_withoutPermissions_startsEmpty() throws Exception {
        grantRolesManage();
        MockHttpSession session = authenticatedSession();

        adminPost(session, "{\"code\":\"empty-role\",\"name\":\"Empty role\"}")
            .andExpect(status().isCreated())
            .andExpect(jsonPath("$.permissionCodes.length()").value(0));
    }

    @Test
    void create_duplicateCode_returnsConflict() throws Exception {
        grantRolesManage();
        MockHttpSession session = authenticatedSession();

        adminPost(session, createRoleJson(RoleCodes.SYSTEM_ADMIN, "Duplicate", "[]"))
            .andExpect(status().isConflict())
            .andExpect(jsonPath("$.code").value(AdministrationErrorCode.ADMIN_ROLE_ALREADY_EXISTS.name()));
    }

    @Test
    void create_unknownPermission_doesNotCreateRole() throws Exception {
        grantRolesManage();
        MockHttpSession session = authenticatedSession();

        adminPost(session, createRoleJson("invalid-permission-role", "Invalid permission", "[\"missing.permission\"]"))
            .andExpect(status().isNotFound())
            .andExpect(jsonPath("$.code").value(AdministrationErrorCode.ADMIN_PERMISSION_NOT_FOUND.name()));

        mockMvc.perform(get(AdminUserEndpoints.ROLES_BASE_PATH + "/invalid-permission-role").session(session))
            .andExpect(status().isNotFound());
        mockMvc.perform(get(AdminUserEndpoints.ROLES_BASE_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.length()").value(1));
    }

    @Test
    void create_doesNotCreateUserRoleAssignments() throws Exception {
        grantRolesManage();
        MockHttpSession session = authenticatedSession();
        int assignmentsBefore = ((AuthenticationTestConfig.TestAuthorizationRepository) authorizationRepository)
            .userRoleCount();

        adminPost(session, createRoleJson("unassigned-role", "Unassigned role", "[\"users.manage\"]"))
            .andExpect(status().isCreated());

        assertThat(((AuthenticationTestConfig.TestAuthorizationRepository) authorizationRepository).userRoleCount())
            .isEqualTo(assignmentsBefore);
    }

    @Test
    void create_invalidCodeSyntax_returnsBadRequest() throws Exception {
        grantRolesManage();
        MockHttpSession session = authenticatedSession();

        adminPost(session, createRoleJson("invalid code", "Invalid code", "[]"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value(AdministrationErrorCode.ADMIN_INVALID_ROLE_CODE.name()))
            .andExpect(jsonPath("$.field").value("code"));

        mockMvc.perform(get(AdminUserEndpoints.ROLES_BASE_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.length()").value(1));
    }

    private void grantRolesManage() {
        grantSystemAdmin();
        authorizationRepository.revokePermissionFromRole(RoleCodes.SYSTEM_ADMIN, PermissionCodes.USERS_MANAGE);
    }

    private void grantSystemAdmin() {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
    }

    private ResultActions adminPost(MockHttpSession session, String body) throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        return mockMvc.perform(post(AdminUserEndpoints.ROLES_BASE_PATH)
            .session(session)
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue())
            .contentType(MediaType.APPLICATION_JSON)
            .content(body));
    }

    private String createRoleJson(String code, String name, String permissionCodesJson) {
        return "{\"code\":\"" + code
            + "\",\"name\":\"" + name
            + "\",\"permissionCodes\":" + permissionCodesJson + "}";
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
}
