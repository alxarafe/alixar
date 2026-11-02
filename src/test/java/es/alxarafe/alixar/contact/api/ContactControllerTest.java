package es.alxarafe.alixar.contact.api;

import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
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
import es.alxarafe.alixar.contact.ContactTestConfig;
import es.alxarafe.alixar.contact.application.ContactNotFoundException;
import es.alxarafe.alixar.contact.application.ContactRepository;
import es.alxarafe.alixar.contact.application.CreateContactCommand;
import es.alxarafe.alixar.contact.application.CreateContactUseCase;
import es.alxarafe.alixar.contact.application.GetContactUseCase;
import es.alxarafe.alixar.contact.application.InvalidThirdPartyReferenceException;
import es.alxarafe.alixar.contact.domain.Contact;
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
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.mockito.Mockito.reset;
import static org.mockito.Mockito.when;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.header;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Import({ContactTestConfig.class, AuthenticationTestConfig.class})
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class ContactControllerTest {

    private static final UUID ALICE_ID = UUID.fromString("8f796219-e501-44e8-a4ab-4c014821ba58");
    private static final String USERNAME = "alice";
    private static final String PASSWORD = "correct-test-password";
    private static final String CSRF_COOKIE = "XSRF-TOKEN";
    private static final String CSRF_HEADER = "X-XSRF-TOKEN";

    @Autowired
    private WebApplicationContext context;

    @Autowired
    private GetContactUseCase getContactUseCase;

    @Autowired
    private CreateContactUseCase createContactUseCase;

    @Autowired
    private ContactRepository contactRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AuthorizationRepository authorizationRepository;

    @Autowired
    private PasswordHasher passwordHasher;

    @Autowired
    private ApiTokenRepository apiTokenRepository;

    @Autowired
    private TokenHasher tokenHasher;

    private MockMvc mockMvc;

    @BeforeEach
    void setup() {
        reset(createContactUseCase, contactRepository);
        mockMvc = MockMvcBuilders.webAppContextSetup(context).apply(springSecurity()).build();
        Instant now = Instant.parse("2026-11-02T10:00:00Z");
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
        ((TestAuthorizationRepository) authorizationRepository).reset();
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        ((AuthenticationTestConfig.TestApiTokenRepository) apiTokenRepository).replaceWith();
    }

    @Test
    void getContact_returnsCanonicalResponse() throws Exception {
        Contact contact = new Contact(3L, "Doe", "John", "john@example.test", null);
        when(getContactUseCase.execute(3L)).thenReturn(contact);

        mockMvc.perform(get(ContactEndpoints.BASE_PATH + "/3").session(authenticatedSession()))
            .andExpect(status().isOk())
            .andExpect(content().contentType("application/json"))
            .andExpect(jsonPath("$.id").value(3))
            .andExpect(jsonPath("$.lastName").value("Doe"))
            .andExpect(jsonPath("$.firstName").value("John"))
            .andExpect(jsonPath("$.email").value("john@example.test"))
            .andExpect(jsonPath("$.thirdPartyId").doesNotExist());
    }

    @Test
    void getContact_withThirdParty_returnsThirdPartyId() throws Exception {
        Contact contact = new Contact(3L, "Doe", "John", "john@example.test", 42L);
        when(getContactUseCase.execute(3L)).thenReturn(contact);

        mockMvc.perform(get(ContactEndpoints.BASE_PATH + "/3").session(authenticatedSession()))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.thirdPartyId").value(42));
    }

    @Test
    void getContact_notFound_returns404() throws Exception {
        when(getContactUseCase.execute(999L)).thenThrow(new ContactNotFoundException(999L));

        mockMvc.perform(get(ContactEndpoints.BASE_PATH + "/999").session(authenticatedSession()))
            .andExpect(status().isNotFound());
    }

    @Test
    void getContact_responseDoesNotContainDolibarrFields() throws Exception {
        Contact contact = new Contact(3L, "Doe", "John", "john@example.test", null);
        when(getContactUseCase.execute(3L)).thenReturn(contact);

        mockMvc.perform(get(ContactEndpoints.BASE_PATH + "/3").session(authenticatedSession()))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.lastname").doesNotExist())
            .andExpect(jsonPath("$.firstname").doesNotExist())
            .andExpect(jsonPath("$.fk_soc").doesNotExist())
            .andExpect(jsonPath("$.socid").doesNotExist())
            .andExpect(jsonPath("$.socname").doesNotExist())
            .andExpect(jsonPath("$.statut").doesNotExist());
    }

    @Test
    void getContact_requiresAuthenticationAndReadPermission() throws Exception {
        mockMvc.perform(get(ContactEndpoints.BASE_PATH + "/3"))
            .andExpect(status().isUnauthorized());

        grantOnly(PermissionCodes.CONTACTS_MANAGE);
        mockMvc.perform(get(ContactEndpoints.BASE_PATH + "/3").session(authenticatedSession()))
            .andExpect(status().isForbidden());

        grantOnly(PermissionCodes.CONTACTS_READ);
        Contact contact = new Contact(3L, "Doe", "John", "john@example.test", null);
        when(getContactUseCase.execute(3L)).thenReturn(contact);
        mockMvc.perform(get(ContactEndpoints.BASE_PATH + "/3").session(authenticatedSession()))
            .andExpect(status().isOk());

        when(getContactUseCase.execute(3L)).thenReturn(contact);
        mockMvc.perform(get(ContactEndpoints.BASE_PATH + "/3")
                .header("Authorization", "Bearer " + personalAccessToken()))
            .andExpect(status().isOk());
    }

    @Test
    void createContact_returns201AndLocation() throws Exception {
        when(createContactUseCase.execute(
            new CreateContactCommand("Doe", "John", "john@example.test", null)
        )).thenReturn(42L);

        mockMvc.perform(authenticatedPost(
                "{\"lastName\":\"Doe\",\"firstName\":\"John\",\"email\":\"john@example.test\"}"))
            .andExpect(status().isCreated())
            .andExpect(header().string("Location", "/api/contacts/42"))
            .andExpect(jsonPath("$.id").value(42));
    }

    @Test
    void createContact_withThirdPartyId_returns201() throws Exception {
        when(createContactUseCase.execute(
            new CreateContactCommand("Doe", "John", "john@example.test", 42L)
        )).thenReturn(43L);

        mockMvc.perform(authenticatedPost(
                "{\"lastName\":\"Doe\",\"firstName\":\"John\",\"email\":\"john@example.test\",\"thirdPartyId\":42}"))
            .andExpect(status().isCreated())
            .andExpect(header().string("Location", "/api/contacts/43"))
            .andExpect(jsonPath("$.id").value(43));
    }

    @Test
    void createContact_missingLastName_returns400WithValidationError() throws Exception {
        mockMvc.perform(authenticatedPost(
                "{\"firstName\":\"John\",\"email\":\"john@example.test\"}"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("lastName"))
            .andExpect(jsonPath("$.detail").value("The field Last name is required."));
    }

    @Test
    void createContact_blankLastName_returns400WithValidationError() throws Exception {
        mockMvc.perform(authenticatedPost(
                "{\"lastName\":\"  \",\"firstName\":\"John\",\"email\":\"john@example.test\"}"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("lastName"))
            .andExpect(jsonPath("$.detail").value("The field Last name is required."));
    }

    @Test
    void createContact_emptyLastName_returns400WithValidationError() throws Exception {
        mockMvc.perform(authenticatedPost(
                "{\"lastName\":\"\",\"firstName\":\"John\",\"email\":\"john@example.test\"}"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("lastName"))
            .andExpect(jsonPath("$.detail").value("The field Last name is required."));
    }

    @Test
    void createContact_invalidThirdParty_returns422() throws Exception {
        when(createContactUseCase.execute(
            new CreateContactCommand("Doe", "John", "john@example.test", 999L)
        )).thenThrow(new InvalidThirdPartyReferenceException());

        mockMvc.perform(authenticatedPost(
                "{\"lastName\":\"Doe\",\"firstName\":\"John\",\"email\":\"john@example.test\",\"thirdPartyId\":999}"))
            .andExpect(status().isUnprocessableEntity())
            .andExpect(jsonPath("$.code").value("CONTACT_INVALID_THIRD_PARTY_REFERENCE"))
            .andExpect(jsonPath("$.detail").value("The referenced third party does not exist."));
    }

    @Test
    void createContact_usesCanonicalNamesNotLegacy() throws Exception {
        when(createContactUseCase.execute(
            new CreateContactCommand("Doe", "John", "john@example.test", null)
        )).thenReturn(42L);

        mockMvc.perform(authenticatedPost(
                "{\"lastName\":\"Doe\",\"firstName\":\"John\",\"email\":\"john@example.test\"}"))
            .andExpect(status().isCreated())
            .andExpect(jsonPath("$.lastname").doesNotExist())
            .andExpect(jsonPath("$.firstname").doesNotExist())
            .andExpect(jsonPath("$.fk_soc").doesNotExist())
            .andExpect(jsonPath("$.socid").doesNotExist());
    }

    @Test
    void createContact_requiresAuthenticationAndManagePermission() throws Exception {
        String body = "{\"lastName\":\"Doe\"}";
        Cookie anonymousCsrfCookie = csrfCookieFromSafeRequest();
        mockMvc.perform(post(ContactEndpoints.BASE_PATH)
                .cookie(anonymousCsrfCookie)
                .header(CSRF_HEADER, anonymousCsrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content(body))
            .andExpect(status().isUnauthorized());

        grantOnly(PermissionCodes.CONTACTS_READ);
        mockMvc.perform(authenticatedPost(body))
            .andExpect(status().isForbidden());

        grantOnly(PermissionCodes.CONTACTS_MANAGE);
        when(createContactUseCase.execute(
            new CreateContactCommand("Doe", null, null, null)
        )).thenReturn(7L);
        mockMvc.perform(authenticatedPost(body))
            .andExpect(status().isCreated());

        when(createContactUseCase.execute(
            new CreateContactCommand("Doe", null, null, null)
        )).thenReturn(8L);
        mockMvc.perform(post(ContactEndpoints.BASE_PATH)
                .header("Authorization", "Bearer " + personalAccessToken())
                .contentType(MediaType.APPLICATION_JSON)
                .content(body))
            .andExpect(status().isCreated());
    }

    @Test
    void createContact_sessionRequiresCsrfAndBearerDoesNot() throws Exception {
        when(createContactUseCase.execute(
            new CreateContactCommand("Doe", null, null, null)
        )).thenReturn(9L);

        mockMvc.perform(post(ContactEndpoints.BASE_PATH)
                .session(authenticatedSession())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"lastName\":\"Doe\"}"))
            .andExpect(status().isForbidden());

        mockMvc.perform(authenticatedPost("{\"lastName\":\"Doe\"}"))
            .andExpect(status().isCreated());

        mockMvc.perform(post(ContactEndpoints.BASE_PATH)
                .header("Authorization", "Bearer " + personalAccessToken())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"lastName\":\"Doe\"}"))
            .andExpect(status().isCreated());
    }

    private org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder authenticatedPost(
        String body
    ) throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        return post(ContactEndpoints.BASE_PATH)
            .session(authenticatedSession())
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue())
            .contentType(MediaType.APPLICATION_JSON)
            .content(body);
    }

    private void grantOnly(String permissionCode) {
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        authorizationRepository.replaceRolePermissions(
            RoleCodes.SYSTEM_ADMIN,
            List.of(permissionCode)
        );
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
}
