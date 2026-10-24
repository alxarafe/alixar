package es.alxarafe.alixar.authentication.api;

import com.jayway.jsonpath.JsonPath;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig.TestApiTokenRepository;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig.TestAuthorizationRepository;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig.TestUserRepository;
import es.alxarafe.alixar.authentication.application.ApiTokenRepository;
import es.alxarafe.alixar.authentication.application.AuthorizationRepository;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.RoleDefinition;
import es.alxarafe.alixar.authentication.application.TokenHasher;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.domain.ApiToken;
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
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Import(AuthenticationTestConfig.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class EffectiveAuthorizationContextTest {

    private static final UUID ALICE_ID = UUID.fromString("8f796219-e501-44e8-a4ab-4c014821ba58");
    private static final String PASSWORD = "correct-test-password";
    private static final String ACCOUNTING = "accounting";
    private static final String WAREHOUSE = "warehouse";
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
        Instant now = Instant.parse("2026-10-17T10:00:00Z");
        ((TestUserRepository) userRepository).replaceWith(new User(
            ALICE_ID,
            "alice",
            "alice@example.test",
            passwordHasher.hash(PASSWORD),
            true,
            0,
            now,
            now
        ));
        ((TestAuthorizationRepository) authorizationRepository).reset();
        ((TestApiTokenRepository) apiTokenRepository).replaceWith();
    }

    @Test
    void me_withSingleRole_returnsAssignedRoleAndItsPermissions() throws Exception {
        createRole(ACCOUNTING, "invoices.read");
        authorizationRepository.assignRoleToUser(ALICE_ID, ACCOUNTING);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(ALICE_ID.toString()))
            .andExpect(jsonPath("$.username").value("alice"))
            .andExpect(jsonPath("$.email").value("alice@example.test"))
            .andExpect(jsonPath("$.roles.length()").value(1))
            .andExpect(jsonPath("$.roles[0]").value(ACCOUNTING))
            .andExpect(jsonPath("$.permissions.length()").value(1))
            .andExpect(jsonPath("$.permissions[0]").value("invoices.read"));
    }

    @Test
    void me_withMultipleRoles_returnsUnionWithoutDuplicatesInDeterministicOrder() throws Exception {
        createRole(ACCOUNTING, "invoices.read", "invoices.create");
        createRole(WAREHOUSE, "invoices.approve", "invoices.read");
        authorizationRepository.assignRoleToUser(ALICE_ID, WAREHOUSE);
        authorizationRepository.assignRoleToUser(ALICE_ID, ACCOUNTING);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.roles.length()").value(2))
            .andExpect(jsonPath("$.roles[0]").value(ACCOUNTING))
            .andExpect(jsonPath("$.roles[1]").value(WAREHOUSE))
            .andExpect(jsonPath("$.permissions.length()").value(3))
            .andExpect(jsonPath("$.permissions[0]").value("invoices.approve"))
            .andExpect(jsonPath("$.permissions[1]").value("invoices.create"))
            .andExpect(jsonPath("$.permissions[2]").value("invoices.read"));
    }

    @Test
    void me_withoutRoles_returnsEmptyArrays() throws Exception {
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.roles.length()").value(0))
            .andExpect(jsonPath("$.permissions.length()").value(0));
    }

    @Test
    void me_reflectsRolePermissionChangesOnNextRequestWithoutLogout() throws Exception {
        createRole(ACCOUNTING, "invoices.read");
        authorizationRepository.assignRoleToUser(ALICE_ID, ACCOUNTING);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.permissions.length()").value(1))
            .andExpect(jsonPath("$.permissions[0]").value("invoices.read"));

        authorizationRepository.grantPermissionToRole(ACCOUNTING, "invoices.approve");

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.roles.length()").value(1))
            .andExpect(jsonPath("$.permissions.length()").value(2))
            .andExpect(jsonPath("$.permissions[0]").value("invoices.approve"))
            .andExpect(jsonPath("$.permissions[1]").value("invoices.read"));

        authorizationRepository.revokePermissionFromRole(ACCOUNTING, "invoices.read");

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.permissions.length()").value(1))
            .andExpect(jsonPath("$.permissions[0]").value("invoices.approve"));
    }

    @Test
    void me_reflectsRoleAssignmentAndRemovalOnNextRequestWithoutLogout() throws Exception {
        createRole(ACCOUNTING, "invoices.read");
        createRole(WAREHOUSE, "stock.read", "invoices.read");
        authorizationRepository.assignRoleToUser(ALICE_ID, ACCOUNTING);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.roles.length()").value(1))
            .andExpect(jsonPath("$.roles[0]").value(ACCOUNTING))
            .andExpect(jsonPath("$.permissions.length()").value(1))
            .andExpect(jsonPath("$.permissions[0]").value("invoices.read"));

        authorizationRepository.assignRoleToUser(ALICE_ID, WAREHOUSE);

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.roles.length()").value(2))
            .andExpect(jsonPath("$.roles[0]").value(ACCOUNTING))
            .andExpect(jsonPath("$.roles[1]").value(WAREHOUSE))
            .andExpect(jsonPath("$.permissions.length()").value(2))
            .andExpect(jsonPath("$.permissions[0]").value("invoices.read"))
            .andExpect(jsonPath("$.permissions[1]").value("stock.read"));

        authorizationRepository.removeRoleFromUser(ALICE_ID, ACCOUNTING);

        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.roles.length()").value(1))
            .andExpect(jsonPath("$.roles[0]").value(WAREHOUSE))
            .andExpect(jsonPath("$.permissions.length()").value(2))
            .andExpect(jsonPath("$.permissions[0]").value("invoices.read"))
            .andExpect(jsonPath("$.permissions[1]").value("stock.read"));
    }

    @Test
    void me_withSessionAndPat_returnsSameEffectiveAuthorizationContext() throws Exception {
        createRole(ACCOUNTING, "invoices.read");
        createRole(WAREHOUSE, "stock.read", "invoices.read");
        authorizationRepository.assignRoleToUser(ALICE_ID, ACCOUNTING);
        authorizationRepository.assignRoleToUser(ALICE_ID, WAREHOUSE);
        MockHttpSession session = authenticatedSession("alice", PASSWORD);
        String rawToken = personalAccessToken(ALICE_ID);

        AuthorizationContext sessionContext = authorizationContext(
            mockMvc.perform(get(AuthenticationEndpoints.ME_PATH).session(session))
                .andExpect(status().isOk())
                .andReturn()
        );
        AuthorizationContext patContext = authorizationContext(
            mockMvc.perform(get(AuthenticationEndpoints.ME_PATH)
                    .header("Authorization", "Bearer " + rawToken))
                .andExpect(status().isOk())
                .andReturn()
        );

        assertThat(patContext).isEqualTo(sessionContext);
        assertThat(sessionContext.roles()).containsExactly(ACCOUNTING, WAREHOUSE);
        assertThat(sessionContext.permissions()).containsExactly("invoices.read", "stock.read");
    }

    @Test
    void login_stillReturnsOnlyIdentity() throws Exception {
        login("alice", PASSWORD)
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(ALICE_ID.toString()))
            .andExpect(jsonPath("$.username").value("alice"))
            .andExpect(jsonPath("$.email").value("alice@example.test"))
            .andExpect(jsonPath("$.roles").doesNotExist())
            .andExpect(jsonPath("$.permissions").doesNotExist());
    }

    @Test
    void me_withoutAuthentication_returnsUnauthorized() throws Exception {
        mockMvc.perform(get(AuthenticationEndpoints.ME_PATH))
            .andExpect(status().isUnauthorized());
    }

    private void createRole(String code, String... permissionCodes) {
        authorizationRepository.createRole(new RoleDefinition(
            UUID.randomUUID(),
            code,
            code,
            false,
            List.of(permissionCodes)
        ));
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

    private AuthorizationContext authorizationContext(MvcResult result) throws Exception {
        String body = result.getResponse().getContentAsString();
        List<String> roles = JsonPath.read(body, "$.roles");
        List<String> permissions = JsonPath.read(body, "$.permissions");
        return new AuthorizationContext(roles, permissions);
    }

    private record AuthorizationContext(List<String> roles, List<String> permissions) {
    }

    private ResultActions login(String identifier, String password) throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        return mockMvc.perform(post(AuthenticationEndpoints.LOGIN_PATH)
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue())
            .contentType("application/json")
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
