package es.alxarafe.alixar.thirdparty.api;

import es.alxarafe.alixar.audit.AuditModeTestSupport;
import es.alxarafe.alixar.audit.InMemoryAuditEventRepository;
import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditEvent;
import es.alxarafe.alixar.audit.domain.AuditResult;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig.TestApiTokenRepository;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig.TestAuthorizationRepository;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig.TestUserRepository;
import es.alxarafe.alixar.authentication.api.AuthenticationEndpoints;
import es.alxarafe.alixar.authentication.application.ApiTokenRepository;
import es.alxarafe.alixar.authentication.application.AuthorizationRepository;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.PermissionCodes;
import es.alxarafe.alixar.authentication.application.RoleCodes;
import es.alxarafe.alixar.authentication.application.TokenHasher;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.domain.ApiToken;
import es.alxarafe.alixar.authentication.domain.User;
import es.alxarafe.alixar.core.application.ErrorCode;
import es.alxarafe.alixar.thirdparty.ThirdPartyTestConfig.InMemoryThirdPartyRepository;
import es.alxarafe.alixar.thirdparty.application.ThirdPartyErrorCode;
import es.alxarafe.alixar.thirdparty.domain.NewThirdParty;
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
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.header;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Import(AuthenticationTestConfig.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class ThirdPartyControllerTest {

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

    @Autowired
    private es.alxarafe.alixar.thirdparty.application.ThirdPartyRepository thirdPartyRepository;

    @Autowired
    private AuditModeTestSupport auditMode;

    @Autowired
    private InMemoryAuditEventRepository auditEventRepository;

    private MockMvc mockMvc;

    @BeforeEach
    void setup() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).apply(springSecurity()).build();
        Instant now = Instant.parse("2026-10-28T10:00:00Z");
        ((TestUserRepository) userRepository).replaceWith(new User(
            ALICE_ID,
            USERNAME,
            "alice@example.test",
            passwordHasher.hash(PASSWORD),
            true,
            0,
            now,
            now
        ));
        ((TestApiTokenRepository) apiTokenRepository).replaceWith();
        ((TestAuthorizationRepository) authorizationRepository).reset();
        ((InMemoryThirdPartyRepository) thirdPartyRepository).reset();
        auditMode.reset();
        auditEventRepository.seedChain(AuditChain.DEFAULT_CHAIN_ID);
    }

    @Test
    void anonymousRequests_areRejected() throws Exception {
        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH + "/1"))
            .andExpect(status().isUnauthorized());
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        mockMvc.perform(post(ThirdPartyEndpoints.BASE_PATH)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content(minimalRequest("Acme")))
            .andExpect(status().isUnauthorized());
    }

    @Test
    void sessionWithoutPermission_isForbidden() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        authorizationRepository.replaceRolePermissions(
            RoleCodes.SYSTEM_ADMIN,
            List.of(PermissionCodes.ROLES_MANAGE)
        );
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH + "/1").session(session))
            .andExpect(status().isForbidden());
        mockMvc.perform(post(ThirdPartyEndpoints.BASE_PATH)
                .session(session)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content(minimalRequest("Acme")))
            .andExpect(status().isForbidden());
    }

    @Test
    void readPermission_allowsReadButNotCreate() throws Exception {
        long id = seedThirdParty();
        grantOnly(PermissionCodes.THIRD_PARTIES_READ);
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH + "/" + id).session(session))
            .andExpect(status().isOk());

        mockMvc.perform(post(ThirdPartyEndpoints.BASE_PATH)
                .session(session)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content(minimalRequest("Acme")))
            .andExpect(status().isForbidden());
    }

    @Test
    void managePermission_allowsCreateButNotRead() throws Exception {
        grantOnly(PermissionCodes.THIRD_PARTIES_MANAGE);
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        create(session, csrfCookie, minimalRequest("Acme"))
            .andExpect(status().isCreated());

        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH + "/1").session(session))
            .andExpect(status().isForbidden());
    }

    @Test
    void create_minimalRequest_returnsCreatedAndPersistsDefaults() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        create(session, csrfCookie, minimalRequest("  Acme Ibérica, S.L.  "))
            .andExpect(status().isCreated())
            .andExpect(header().string("Location", ThirdPartyEndpoints.BASE_PATH + "/1"))
            .andExpect(jsonPath("$.id").value(1))
            .andExpect(jsonPath("$.name").doesNotExist());

        assertThat(repository().all()).singleElement().satisfies(thirdParty -> {
            assertThat(thirdParty.id()).isEqualTo(1L);
            assertThat(thirdParty.name()).isEqualTo("Acme Ibérica, S.L.");
            assertThat(thirdParty.customer()).isFalse();
            assertThat(thirdParty.prospect()).isFalse();
            assertThat(thirdParty.supplier()).isFalse();
            assertThat(thirdParty.active()).isTrue();
            assertThat(thirdParty.taxIdentifier()).isNull();
            assertThat(thirdParty.countryCode()).isNull();
        });
    }

    @Test
    void create_fullRequest_normalizesValues() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        create(session, csrfCookie, """
            {
              "name": "  Acme Ibérica, S.L.  ",
              "customer": true,
              "prospect": false,
              "supplier": true,
              "active": false,
              "taxIdentifier": " B12345678 ",
              "intraCommunityVatNumber": "",
              "address": " Calle Mayor 1 ",
              "postalCode": " 28001 ",
              "town": " Madrid ",
              "countryCode": " es ",
              "email": " info@example.test ",
              "phone": " +34 900 000 000 ",
              "website": " https://example.test "
            }
            """)
            .andExpect(status().isCreated());

        assertThat(repository().all()).singleElement().satisfies(thirdParty -> {
            assertThat(thirdParty.customer()).isTrue();
            assertThat(thirdParty.prospect()).isFalse();
            assertThat(thirdParty.supplier()).isTrue();
            assertThat(thirdParty.active()).isFalse();
            assertThat(thirdParty.taxIdentifier()).isEqualTo("B12345678");
            assertThat(thirdParty.intraCommunityVatNumber()).isNull();
            assertThat(thirdParty.address()).isEqualTo("Calle Mayor 1");
            assertThat(thirdParty.postalCode()).isEqualTo("28001");
            assertThat(thirdParty.town()).isEqualTo("Madrid");
            assertThat(thirdParty.countryCode()).isEqualTo("ES");
            assertThat(thirdParty.email()).isEqualTo("info@example.test");
            assertThat(thirdParty.phone()).isEqualTo("+34 900 000 000");
            assertThat(thirdParty.website()).isEqualTo("https://example.test");
        });
    }

    @Test
    void create_missingBlankOrNullName_returnsRequiredError() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        for (String body : List.of("{}", "{\"name\":null}", "{\"name\":\"   \"}")) {
            create(session, csrfCookie, body)
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("$.code").value(ErrorCode.VALIDATION_REQUIRED.name()))
                .andExpect(jsonPath("$.field").value("name"))
                .andExpect(jsonPath("$.detail").exists());
        }
        assertThat(repository().all()).isEmpty();
    }

    @Test
    void create_nonTextName_returnsInvalidError() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        create(session, csrfCookie, "{\"name\":123}")
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value(ErrorCode.VALIDATION_INVALID.name()))
            .andExpect(jsonPath("$.field").value("name"));
    }

    @Test
    void create_unknownField_isRejected() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        create(session, csrfCookie, "{\"name\":\"Acme\",\"legacyId\":7}")
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value(ErrorCode.VALIDATION_INVALID.name()))
            .andExpect(jsonPath("$.field").value("legacyId"));
        create(session, csrfCookie, "{\"name\":\"Acme\",\"id\":7}")
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.field").value("id"));
    }

    @Test
    void create_invalidBooleanOrBody_returnsInvalidError() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        create(session, csrfCookie, "{\"name\":\"Acme\",\"customer\":\"yes\"}")
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.field").value("customer"));
        create(session, csrfCookie, "[]")
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.field").value("body"));
        create(session, csrfCookie, "{not-json")
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.field").value("body"));
    }

    @Test
    void create_nameTooLong_returnsInvalidError() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        create(session, csrfCookie, "{\"name\":\"" + "x".repeat(129) + "\"}")
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value(ErrorCode.VALIDATION_INVALID.name()))
            .andExpect(jsonPath("$.field").value("name"));
        assertThat(repository().all()).isEmpty();
    }

    @Test
    void create_withoutCsrfToken_isForbidden() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession();

        mockMvc.perform(post(ThirdPartyEndpoints.BASE_PATH)
                .session(session)
                .contentType(MediaType.APPLICATION_JSON)
                .content(minimalRequest("Acme")))
            .andExpect(status().isForbidden());
    }

    @Test
    void bearerToken_createAndRead_doNotRequireCsrf() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        String rawToken = personalAccessToken();

        mockMvc.perform(post(ThirdPartyEndpoints.BASE_PATH)
                .header("Authorization", "Bearer " + rawToken)
                .contentType(MediaType.APPLICATION_JSON)
                .content(minimalRequest("Acme")))
            .andExpect(status().isCreated())
            .andExpect(header().string("Location", ThirdPartyEndpoints.BASE_PATH + "/1"));

        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH + "/1")
                .header("Authorization", "Bearer " + rawToken))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.name").value("Acme"));
    }

    @Test
    void get_returnsCompleteRepresentation() throws Exception {
        long id = seedThirdParty();
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession();

        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH + "/" + id).session(session))
            .andExpect(status().isOk())
            .andExpect(content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON))
            .andExpect(jsonPath("$.id").value(id))
            .andExpect(jsonPath("$.name").value("Acme Ibérica, S.L."))
            .andExpect(jsonPath("$.customer").value(true))
            .andExpect(jsonPath("$.prospect").value(false))
            .andExpect(jsonPath("$.supplier").value(true))
            .andExpect(jsonPath("$.active").value(true))
            .andExpect(jsonPath("$.taxIdentifier").value("B12345678"))
            .andExpect(jsonPath("$.intraCommunityVatNumber").value("ESB12345678"))
            .andExpect(jsonPath("$.address").value("Calle Mayor 1"))
            .andExpect(jsonPath("$.postalCode").value("28001"))
            .andExpect(jsonPath("$.town").value("Madrid"))
            .andExpect(jsonPath("$.countryCode").value("ES"))
            .andExpect(jsonPath("$.email").value("info@example.test"))
            .andExpect(jsonPath("$.phone").value("+34 900 000 000"))
            .andExpect(jsonPath("$.website").value("https://example.test"));
    }

    @Test
    void get_unknownId_returnsNotFound() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession();

        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH + "/404").session(session))
            .andExpect(status().isNotFound())
            .andExpect(jsonPath("$.code").value(ThirdPartyErrorCode.THIRD_PARTY_NOT_FOUND.name()))
            .andExpect(jsonPath("$.detail").exists());
    }

    @Test
    void get_invalidIdentifier_returnsInvalidError() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession();

        for (String id : List.of("0", "-1", "abc")) {
            mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH + "/" + id).session(session))
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("$.code").value(ErrorCode.VALIDATION_INVALID.name()))
                .andExpect(jsonPath("$.field").value("id"));
        }
    }

    @Test
    void validationAndNotFoundMessages_areLocalized() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        mockMvc.perform(post(ThirdPartyEndpoints.BASE_PATH)
                .session(session)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .header("Accept-Language", "en")
                .contentType(MediaType.APPLICATION_JSON)
                .content("{}"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.detail").value("The field Name is required."))
            .andExpect(jsonPath("$.title").value("Validation Error"));

        mockMvc.perform(post(ThirdPartyEndpoints.BASE_PATH)
                .session(session)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .header("Accept-Language", "es")
                .contentType(MediaType.APPLICATION_JSON)
                .content("{}"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.detail").value("El campo Nombre es obligatorio."))
            .andExpect(jsonPath("$.title").value("Error de validaci\u00f3n"));

        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH + "/404")
                .session(session)
                .header("Accept-Language", "es"))
            .andExpect(status().isNotFound())
            .andExpect(jsonPath("$.detail").value("Tercero no encontrado."))
            .andExpect(jsonPath("$.title").value("Tercero no encontrado"));
    }

    @Test
    void basicMode_create_appendsSuccessEventWithoutBusinessPayload() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        auditMode.setMode(AuditMode.BASIC);
        try {
            create(session, csrfCookie, minimalRequest("Acme"))
                .andExpect(status().isCreated());

            assertThat(auditEvents()).singleElement().satisfies(event -> {
                assertThat(event.action()).isEqualTo(AuditAction.THIRD_PARTY_CREATED.name());
                assertThat(event.resourceType()).isEqualTo(AuditResourceType.THIRD_PARTY.name());
                assertThat(event.resourceId()).isEqualTo("1");
                assertThat(event.result()).isEqualTo(AuditResult.SUCCESS);
                assertThat(event.actorUserId()).isEqualTo(ALICE_ID);
                assertThat(event.actorUsername()).isEqualTo(USERNAME);
                assertThat(event.authenticationType()).isEqualTo(AuditAuthenticationType.SESSION);
                assertThat(event.toString()).doesNotContain("Acme");
            });
        } finally {
            auditMode.reset();
        }
    }

    @Test
    void offMode_create_doesNotAppendAuditEvent() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        create(session, csrfCookie, minimalRequest("Acme"))
            .andExpect(status().isCreated());

        assertThat(auditEvents()).isEmpty();
    }

    @Test
    void basicMode_deniedRead_appendsAccessDeniedForThirdPartyFamily() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        authorizationRepository.replaceRolePermissions(
            RoleCodes.SYSTEM_ADMIN,
            List.of(PermissionCodes.ROLES_MANAGE)
        );
        MockHttpSession session = authenticatedSession();
        auditMode.setMode(AuditMode.BASIC);
        try {
            mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH + "/123").session(session))
                .andExpect(status().isForbidden());

            assertThat(auditEvents()).singleElement().satisfies(event -> {
                assertThat(event.action()).isEqualTo(AuditAction.ACCESS_DENIED.name());
                assertThat(event.resourceType()).isEqualTo(AuditResourceType.HTTP_REQUEST.name());
                assertThat(event.resourceId()).isEqualTo("GET /api/thirdparties");
            });
        } finally {
            auditMode.reset();
        }
    }

    @Test
    void list_empty_returnsCanonicalPage() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession();

        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON))
            .andExpect(jsonPath("$.items.length()").value(0))
            .andExpect(jsonPath("$.page").value(0))
            .andExpect(jsonPath("$.size").value(20))
            .andExpect(jsonPath("$.total").value(0));
    }

    @Test
    void list_defaultsAndCustomPaginationReportIndependentTotal() throws Exception {
        seedThirdParty("One", true, false, false, true);
        seedThirdParty("Two", false, false, false, true);
        seedThirdParty("Three", false, false, false, true);
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession();

        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH).session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.page").value(0))
            .andExpect(jsonPath("$.size").value(20))
            .andExpect(jsonPath("$.total").value(3))
            .andExpect(jsonPath("$.items.length()").value(3))
            .andExpect(jsonPath("$.items[0].id").value(1))
            .andExpect(jsonPath("$.items[1].id").value(2))
            .andExpect(jsonPath("$.items[2].id").value(3));

        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH)
                .param("page", "1")
                .param("size", "1")
                .session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.page").value(1))
            .andExpect(jsonPath("$.size").value(1))
            .andExpect(jsonPath("$.total").value(3))
            .andExpect(jsonPath("$.items.length()").value(1))
            .andExpect(jsonPath("$.items[0].id").value(2));

        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH)
                .param("size", "2")
                .session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.page").value(0))
            .andExpect(jsonPath("$.size").value(2))
            .andExpect(jsonPath("$.total").value(3))
            .andExpect(jsonPath("$.items.length()").value(2));
    }

    @Test
    void list_supportsIndividualAndCombinedBooleanFilters() throws Exception {
        seedThirdParty("Customer", true, false, false, true);
        seedThirdParty("Prospect", false, true, false, true);
        seedThirdParty("Supplier", false, false, true, false);
        seedThirdParty("CustomerSupplier", true, false, true, true);
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession();

        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH)
                .param("customer", "true")
                .session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.total").value(2))
            .andExpect(jsonPath("$.items[0].id").value(1))
            .andExpect(jsonPath("$.items[1].id").value(4));

        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH)
                .param("prospect", "true")
                .session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.total").value(1))
            .andExpect(jsonPath("$.items[0].id").value(2));

        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH)
                .param("supplier", "true")
                .session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.total").value(2))
            .andExpect(jsonPath("$.items[0].id").value(3))
            .andExpect(jsonPath("$.items[1].id").value(4));

        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH)
                .param("active", "false")
                .session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.total").value(1))
            .andExpect(jsonPath("$.items[0].id").value(3));

        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH)
                .param("customer", "true")
                .param("supplier", "true")
                .param("active", "true")
                .session(session))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.total").value(1))
            .andExpect(jsonPath("$.items[0].id").value(4));
    }

    @Test
    void list_invalidPaginationOrFilterValue_returnsValidationInvalid() throws Exception {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession();

        assertInvalidListParameter(session, "page", "-1");
        assertInvalidListParameter(session, "size", "0");
        assertInvalidListParameter(session, "size", "101");
        assertInvalidListParameter(session, "customer", "invalid");
    }

    @Test
    void list_requiresReadPermissionForSessionsAndBearerTokens() throws Exception {
        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH))
            .andExpect(status().isUnauthorized());

        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        authorizationRepository.replaceRolePermissions(
            RoleCodes.SYSTEM_ADMIN,
            List.of(PermissionCodes.THIRD_PARTIES_MANAGE)
        );
        MockHttpSession session = authenticatedSession();
        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH).session(session))
            .andExpect(status().isForbidden());

        grantOnly(PermissionCodes.THIRD_PARTIES_READ);
        MockHttpSession readSession = authenticatedSession();
        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH).session(readSession))
            .andExpect(status().isOk());

        String rawToken = personalAccessToken();
        authorizationRepository.replaceRolePermissions(
            RoleCodes.SYSTEM_ADMIN,
            List.of(PermissionCodes.THIRD_PARTIES_READ)
        );
        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH)
                .header("Authorization", "Bearer " + rawToken))
            .andExpect(status().isOk());
    }

    @Test
    void list_doesNotAppendThirdPartyAuditEvent() throws Exception {
        seedThirdParty("Acme", true, false, false, true);
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        MockHttpSession session = authenticatedSession();
        auditMode.setMode(AuditMode.BASIC);
        try {
            mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH).session(session))
                .andExpect(status().isOk());

            assertThat(auditEvents())
                .noneMatch(event -> event.resourceType().equals(AuditResourceType.THIRD_PARTY.name()));
        } finally {
            auditMode.reset();
        }
    }

    private void assertInvalidListParameter(
        MockHttpSession session,
        String parameter,
        String value
    ) throws Exception {
        mockMvc.perform(get(ThirdPartyEndpoints.BASE_PATH)
                .param(parameter, value)
                .session(session))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value(ErrorCode.VALIDATION_INVALID.name()))
            .andExpect(jsonPath("$.field").value(parameter));
    }

    private long seedThirdParty(
        String name,
        boolean customer,
        boolean prospect,
        boolean supplier,
        boolean active
    ) {
        return repository().create(new NewThirdParty(
            name,
            customer,
            prospect,
            supplier,
            active,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null
        ));
    }

    private ResultActions create(
        MockHttpSession session,
        Cookie csrfCookie,
        String body
    ) throws Exception {
        return mockMvc.perform(post(ThirdPartyEndpoints.BASE_PATH)
            .session(session)
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue())
            .contentType(MediaType.APPLICATION_JSON)
            .content(body));
    }

    private void grantOnly(String permissionCode) {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        authorizationRepository.replaceRolePermissions(
            RoleCodes.SYSTEM_ADMIN,
            List.of(permissionCode)
        );
    }

    private long seedThirdParty() {
        return repository().create(new NewThirdParty(
            "Acme Ibérica, S.L.",
            true,
            false,
            true,
            true,
            "B12345678",
            "ESB12345678",
            "Calle Mayor 1",
            "28001",
            "Madrid",
            "ES",
            "info@example.test",
            "+34 900 000 000",
            "https://example.test"
        ));
    }

    private InMemoryThirdPartyRepository repository() {
        return (InMemoryThirdPartyRepository) thirdPartyRepository;
    }

    private String minimalRequest(String name) {
        return "{\"name\":\"" + name + "\"}";
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

    private List<AuditEvent> auditEvents() {
        return auditEventRepository.events(AuditChain.DEFAULT_CHAIN_ID);
    }
}
