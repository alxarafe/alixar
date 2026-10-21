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
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.patch;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
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
        auditProperties.setMode(AuditMode.OFF);
        auditEventRepository.seedChain(AuditChain.DEFAULT_CHAIN_ID);
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
        mockMvc.perform(patch(SYSTEM_ADMIN_PATH)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"name\":\"Renamed\"}"))
            .andExpect(status().isUnauthorized());
        mockMvc.perform(put(SYSTEM_ADMIN_PATH + "/permissions")
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"permissionCodes\":[]}"))
            .andExpect(status().isUnauthorized());
        mockMvc.perform(delete(SYSTEM_ADMIN_PATH)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue()))
            .andExpect(status().isUnauthorized());
    }

    @Test
    void usersManageOnly_canListRolesButCannotReadDetailOrCreate() throws Exception {
        grantSystemAdmin();
        authorizationRepository.revokePermissionFromRole(RoleCodes.SYSTEM_ADMIN, PermissionCodes.ROLES_MANAGE);
        authorizationRepository.createRole(new RoleDefinition(
            UUID.randomUUID(),
            "mutation-target",
            "Mutation target",
            false,
            List.of()
        ));
        MockHttpSession session = authenticatedSession();

        mockMvc.perform(get(AdminUserEndpoints.ROLES_BASE_PATH).session(session))
            .andExpect(status().isOk());
        mockMvc.perform(get(SYSTEM_ADMIN_PATH).session(session))
            .andExpect(status().isForbidden());
        adminPost(session, createRoleJson("new-role", "New role", "[]"))
            .andExpect(status().isForbidden());
        adminPatch(session, AdminUserEndpoints.ROLES_BASE_PATH + "/mutation-target", "{\"name\":\"Renamed\"}")
            .andExpect(status().isForbidden());
        adminPut(
            session,
            AdminUserEndpoints.ROLES_BASE_PATH + "/mutation-target/permissions",
            "{\"permissionCodes\":[]}"
        ).andExpect(status().isForbidden());
        adminDelete(session, AdminUserEndpoints.ROLES_BASE_PATH + "/mutation-target")
            .andExpect(status().isForbidden());
    }

    @Test
    void list_usesCanonicalContractAndDeterministicOrder() throws Exception {
        grantRolesManage();
        authorizationRepository.createRole(new RoleDefinition(
            UUID.randomUUID(),
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
    void create_blankCode_returnsBadRequestWithRoleLabel() throws Exception {
        grantRolesManage();
        MockHttpSession session = authenticatedSession();

        adminPost(session, createRoleJson("   ", "Blank code", "[]"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.field").value("code"))
            .andExpect(jsonPath("$.detail").value("The field Role code is required."));
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

    @Test
    void updateName_customRole_preservesCodePermissionsAndAssignments() throws Exception {
        grantRolesManage();
        authorizationRepository.createRole(new RoleDefinition(
            UUID.randomUUID(),
            "editable-role",
            "Editable role",
            false,
            List.of(PermissionCodes.USERS_MANAGE)
        ));
        authorizationRepository.assignRoleToUser(ALICE_ID, "editable-role");
        MockHttpSession session = authenticatedSession();

        adminPatch(session, AdminUserEndpoints.ROLES_BASE_PATH + "/editable-role", "{\"name\":\" Renamed role \"}")
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.code").value("editable-role"))
            .andExpect(jsonPath("$.name").value("Renamed role"))
            .andExpect(jsonPath("$.builtIn").value(false))
            .andExpect(jsonPath("$.permissionCodes[0]").value(PermissionCodes.USERS_MANAGE));

        RoleDefinition stored = authorizationRepository.findRoleByCode("editable-role").orElseThrow();
        assertThat(stored.permissionCodes()).containsExactly(PermissionCodes.USERS_MANAGE);
        assertThat(((AuthenticationTestConfig.TestAuthorizationRepository) authorizationRepository)
            .findRoleCodesByUser(ALICE_ID)).contains("editable-role");
    }

    @Test
    void updateName_builtInRole_returnsConflict() throws Exception {
        grantRolesManage();
        MockHttpSession session = authenticatedSession();

        adminPatch(session, SYSTEM_ADMIN_PATH, "{\"name\":\"Renamed\"}")
            .andExpect(status().isConflict())
            .andExpect(jsonPath("$.code").value(AdministrationErrorCode.ADMIN_BUILT_IN_ROLE_IMMUTABLE.name()));
    }

    @Test
    void updateName_unknownRole_returnsNotFound() throws Exception {
        grantRolesManage();
        MockHttpSession session = authenticatedSession();

        adminPatch(session, AdminUserEndpoints.ROLES_BASE_PATH + "/missing-role", "{\"name\":\"Renamed\"}")
            .andExpect(status().isNotFound())
            .andExpect(jsonPath("$.code").value(AdministrationErrorCode.ADMIN_ROLE_NOT_FOUND.name()));
    }

    @Test
    void updateName_blankName_returnsBadRequest() throws Exception {
        grantRolesManage();
        authorizationRepository.createRole(new RoleDefinition(UUID.randomUUID(), "editable-role", "Editable role", false, List.of()));
        MockHttpSession session = authenticatedSession();

        adminPatch(session, AdminUserEndpoints.ROLES_BASE_PATH + "/editable-role", "{\"name\":\"   \"}")
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.field").value("name"))
            .andExpect(jsonPath("$.detail").value("The field Role name is required."));
    }

    @Test
    void replacePermissions_normalizesAndReplacesAtomically() throws Exception {
        grantRolesManage();
        authorizationRepository.createRole(new RoleDefinition(
            UUID.randomUUID(),
            "editable-role",
            "Editable role",
            false,
            List.of(PermissionCodes.USERS_MANAGE)
        ));
        MockHttpSession session = authenticatedSession();
        String path = AdminUserEndpoints.ROLES_BASE_PATH + "/editable-role/permissions";

        adminPut(session, path, "{\"permissionCodes\":[\" ROLES.MANAGE \",\"roles.manage\",\"users.manage\"]}")
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.permissionCodes.length()").value(2))
            .andExpect(jsonPath("$.permissionCodes[0]").value(PermissionCodes.ROLES_MANAGE))
            .andExpect(jsonPath("$.permissionCodes[1]").value(PermissionCodes.USERS_MANAGE));

        adminPut(session, path, "{\"permissionCodes\":[]}")
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.permissionCodes.length()").value(0));

        assertThat(authorizationRepository.findPermissionCodesByRole("editable-role")).isEmpty();
    }

    @Test
    void replacePermissions_unknownPermission_keepsPreviousPermissions() throws Exception {
        grantRolesManage();
        authorizationRepository.createRole(new RoleDefinition(
            UUID.randomUUID(),
            "editable-role",
            "Editable role",
            false,
            List.of(PermissionCodes.USERS_MANAGE)
        ));
        MockHttpSession session = authenticatedSession();

        adminPut(
            session,
            AdminUserEndpoints.ROLES_BASE_PATH + "/editable-role/permissions",
            "{\"permissionCodes\":[\"roles.manage\",\"missing.permission\"]}"
        )
            .andExpect(status().isNotFound())
            .andExpect(jsonPath("$.code").value(AdministrationErrorCode.ADMIN_PERMISSION_NOT_FOUND.name()));

        assertThat(authorizationRepository.findPermissionCodesByRole("editable-role"))
            .containsExactly(PermissionCodes.USERS_MANAGE);
    }

    @Test
    void replacePermissions_builtInRole_returnsConflict() throws Exception {
        grantSystemAdmin();
        MockHttpSession session = authenticatedSession();

        adminPut(
            session,
            SYSTEM_ADMIN_PATH + "/permissions",
            "{\"permissionCodes\":[]}"
        )
            .andExpect(status().isConflict())
            .andExpect(jsonPath("$.code").value(AdministrationErrorCode.ADMIN_BUILT_IN_ROLE_IMMUTABLE.name()));

        assertThat(authorizationRepository.findPermissionCodesByRole(RoleCodes.SYSTEM_ADMIN))
            .containsExactlyInAnyOrder(PermissionCodes.USERS_MANAGE, PermissionCodes.ROLES_MANAGE);
    }

    @Test
    void replacePermissions_unknownRole_returnsNotFound() throws Exception {
        grantRolesManage();
        MockHttpSession session = authenticatedSession();

        adminPut(
            session,
            AdminUserEndpoints.ROLES_BASE_PATH + "/missing-role/permissions",
            "{\"permissionCodes\":[]}"
        )
            .andExpect(status().isNotFound())
            .andExpect(jsonPath("$.code").value(AdministrationErrorCode.ADMIN_ROLE_NOT_FOUND.name()));
    }

    @Test
    void replacePermissions_withoutPermissionCodes_returnsBadRequest() throws Exception {
        grantRolesManage();
        authorizationRepository.createRole(new RoleDefinition(UUID.randomUUID(), "editable-role", "Editable role", false, List.of()));
        MockHttpSession session = authenticatedSession();

        adminPut(session, AdminUserEndpoints.ROLES_BASE_PATH + "/editable-role/permissions", "{}")
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.field").value("permissionCodes"))
            .andExpect(jsonPath("$.detail").value("The field Permission codes is required."));
    }

    @Test
    void delete_customUnassignedRole_returnsNoContentAndRemovesIt() throws Exception {
        grantRolesManage();
        authorizationRepository.createRole(new RoleDefinition(UUID.randomUUID(), "free-role", "Free role", false, List.of()));
        MockHttpSession session = authenticatedSession();

        adminDelete(session, AdminUserEndpoints.ROLES_BASE_PATH + "/free-role")
            .andExpect(status().isNoContent());

        mockMvc.perform(get(AdminUserEndpoints.ROLES_BASE_PATH + "/free-role").session(session))
            .andExpect(status().isNotFound());
        assertThat(authorizationRepository.findRoleByCode("free-role")).isEmpty();
    }

    @Test
    void delete_assignedRole_returnsConflictAndKeepsAssignment() throws Exception {
        grantRolesManage();
        authorizationRepository.createRole(new RoleDefinition(UUID.randomUUID(), "in-use-role", "In use role", false, List.of()));
        authorizationRepository.assignRoleToUser(ALICE_ID, "in-use-role");
        MockHttpSession session = authenticatedSession();
        int assignmentsBefore = ((AuthenticationTestConfig.TestAuthorizationRepository) authorizationRepository)
            .userRoleCount();

        adminDelete(session, AdminUserEndpoints.ROLES_BASE_PATH + "/in-use-role")
            .andExpect(status().isConflict())
            .andExpect(jsonPath("$.code").value(AdministrationErrorCode.ADMIN_ROLE_IN_USE.name()));

        assertThat(authorizationRepository.findRoleByCode("in-use-role")).isPresent();
        assertThat(((AuthenticationTestConfig.TestAuthorizationRepository) authorizationRepository).userRoleCount())
            .isEqualTo(assignmentsBefore);
    }

    @Test
    void delete_builtInRole_returnsConflict() throws Exception {
        grantRolesManage();
        MockHttpSession session = authenticatedSession();

        adminDelete(session, SYSTEM_ADMIN_PATH)
            .andExpect(status().isConflict())
            .andExpect(jsonPath("$.code").value(AdministrationErrorCode.ADMIN_BUILT_IN_ROLE_IMMUTABLE.name()));

        assertThat(authorizationRepository.findRoleByCode(RoleCodes.SYSTEM_ADMIN)).isPresent();
    }

    @Test
    void delete_unknownRole_returnsNotFound() throws Exception {
        grantRolesManage();
        MockHttpSession session = authenticatedSession();

        adminDelete(session, AdminUserEndpoints.ROLES_BASE_PATH + "/missing-role")
            .andExpect(status().isNotFound())
            .andExpect(jsonPath("$.code").value(AdministrationErrorCode.ADMIN_ROLE_NOT_FOUND.name()));
    }

    @Test
    void basicAuditMode_roleLifecycleRecordsCanonicalEventsWithInternalRoleId() throws Exception {
        grantRolesManage();
        MockHttpSession session = authenticatedSession();
        auditProperties.setMode(AuditMode.BASIC);

        try {
            adminPost(session, createRoleJson("audited-role", "Audited role", "[\"users.manage\"]"))
                .andExpect(status().isCreated());
            UUID roleId = authorizationRepository.findRoleByCode("audited-role").orElseThrow().id();

            adminPatch(session, AdminUserEndpoints.ROLES_BASE_PATH + "/audited-role", "{\"name\":\"Renamed\"}")
                .andExpect(status().isOk());
            adminPut(
                session,
                AdminUserEndpoints.ROLES_BASE_PATH + "/audited-role/permissions",
                "{\"permissionCodes\":[\"roles.manage\"]}"
            ).andExpect(status().isOk());
            adminDelete(session, AdminUserEndpoints.ROLES_BASE_PATH + "/audited-role")
                .andExpect(status().isNoContent());

            List<AuditEvent> events = auditEvents();
            assertThat(events).extracting(AuditEvent::action).containsExactly(
                AuditAction.ROLE_CREATED.name(),
                AuditAction.ROLE_RENAMED.name(),
                AuditAction.ROLE_PERMISSIONS_REPLACED.name(),
                AuditAction.ROLE_DELETED.name()
            );
            assertThat(events).extracting(AuditEvent::authenticationType)
                .containsOnly(AuditAuthenticationType.SESSION);
            assertThat(events).extracting(AuditEvent::actorUserId).containsOnly(ALICE_ID);
            assertThat(events).extracting(AuditEvent::actorUsername).containsOnly(USERNAME);
            assertThat(events).extracting(AuditEvent::resourceType)
                .containsOnly(AuditResourceType.ROLE.name());
            assertThat(events).extracting(AuditEvent::resourceId).containsOnly(roleId.toString());
            assertThat(events).allSatisfy(event -> {
                assertThat(event.result()).isEqualTo(AuditResult.SUCCESS);
                assertThat(event.requestId()).isNull();
                assertThat(event.toString()).doesNotContain("audited-role");
            });
            assertThat(auditChainVerifier.verify(AuditChain.DEFAULT_CHAIN_ID).valid()).isTrue();
        } finally {
            auditProperties.setMode(AuditMode.OFF);
        }
    }

    @Test
    void basicAuditMode_noOpRoleRenameAndPermissionsReplacementDoNotRecordEvents() throws Exception {
        grantRolesManage();
        authorizationRepository.createRole(new RoleDefinition(
            UUID.randomUUID(),
            "editable-role",
            "Editable role",
            false,
            List.of(PermissionCodes.USERS_MANAGE)
        ));
        MockHttpSession session = authenticatedSession();
        auditProperties.setMode(AuditMode.BASIC);

        try {
            adminPatch(session, AdminUserEndpoints.ROLES_BASE_PATH + "/editable-role", "{\"name\":\" Editable role \"}")
                .andExpect(status().isOk());
            adminPut(
                session,
                AdminUserEndpoints.ROLES_BASE_PATH + "/editable-role/permissions",
                "{\"permissionCodes\":[\" USERS.MANAGE \",\"users.manage\"]}"
            ).andExpect(status().isOk());

            assertThat(auditEvents()).isEmpty();
        } finally {
            auditProperties.setMode(AuditMode.OFF);
        }
    }

    @Test
    void offAuditMode_roleCreationDoesNotRecordEvent() throws Exception {
        grantRolesManage();
        MockHttpSession session = authenticatedSession();

        adminPost(session, createRoleJson("off-audit-role", "Off audit role", "[]"))
            .andExpect(status().isCreated());

        assertThat(auditEvents()).isEmpty();
    }

    private List<AuditEvent> auditEvents() {
        return auditEventRepository.events(AuditChain.DEFAULT_CHAIN_ID);
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

    private ResultActions adminPatch(MockHttpSession session, String path, String body) throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        return mockMvc.perform(patch(path)
            .session(session)
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue())
            .contentType(MediaType.APPLICATION_JSON)
            .content(body));
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

    private ResultActions adminDelete(MockHttpSession session, String path) throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        return mockMvc.perform(delete(path)
            .session(session)
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue()));
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
