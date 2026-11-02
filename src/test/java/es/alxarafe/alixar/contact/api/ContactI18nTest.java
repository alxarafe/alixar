package es.alxarafe.alixar.contact.api;

import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig.TestAuthorizationRepository;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig.TestUserRepository;
import es.alxarafe.alixar.authentication.api.AuthenticationEndpoints;
import es.alxarafe.alixar.authentication.application.AuthorizationRepository;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.RoleCodes;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.domain.User;
import es.alxarafe.alixar.contact.ContactTestConfig;
import es.alxarafe.alixar.contact.application.CreateContactCommand;
import es.alxarafe.alixar.contact.application.CreateContactUseCase;
import es.alxarafe.alixar.contact.application.InvalidThirdPartyReferenceException;
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

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.reset;
import static org.mockito.Mockito.when;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Import({ContactTestConfig.class, AuthenticationTestConfig.class})
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class ContactI18nTest {

    private static final UUID ALICE_ID = UUID.fromString("8f796219-e501-44e8-a4ab-4c014821ba58");
    private static final String USERNAME = "alice";
    private static final String PASSWORD = "correct-test-password";
    private static final String CSRF_COOKIE = "XSRF-TOKEN";
    private static final String CSRF_HEADER = "X-XSRF-TOKEN";

    @Autowired
    private WebApplicationContext context;

    @Autowired
    private CreateContactUseCase createContactUseCase;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AuthorizationRepository authorizationRepository;

    @Autowired
    private PasswordHasher passwordHasher;

    private MockMvc mockMvc;

    @BeforeEach
    void setup() {
        reset(createContactUseCase);
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
    }

    @Test
    void createContact_missingLastName_english_returnsLocalizedError() throws Exception {
        mockMvc.perform(authenticatedPost(
                "{\"firstName\":\"John\",\"email\":\"john@example.test\"}", "en"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("lastName"))
            .andExpect(jsonPath("$.detail").value("The field Last name is required."))
            .andExpect(jsonPath("$.title").value("Validation Error"))
            .andExpect(jsonPath("$.type").value("urn:alixar:error:validation-required"));
    }

    @Test
    void createContact_missingLastName_spanish_returnsLocalizedError() throws Exception {
        mockMvc.perform(authenticatedPost(
                "{\"firstName\":\"John\",\"email\":\"john@example.test\"}", "es"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("lastName"))
            .andExpect(jsonPath("$.detail").value("El campo Apellido es obligatorio."))
            .andExpect(jsonPath("$.title").value("Error de validaci\u00f3n"))
            .andExpect(jsonPath("$.type").value("urn:alixar:error:validation-required"));
    }

    @Test
    void createContact_missingLastName_spanishRegional_returnsLocalizedError() throws Exception {
        mockMvc.perform(authenticatedPost(
                "{\"firstName\":\"John\",\"email\":\"john@example.test\"}", "es-ES"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("lastName"))
            .andExpect(jsonPath("$.detail").value("El campo Apellido es obligatorio."))
            .andExpect(jsonPath("$.title").value("Error de validaci\u00f3n"))
            .andExpect(jsonPath("$.type").value("urn:alixar:error:validation-required"));
    }

    @Test
    void createContact_missingLastName_unsupportedLocale_fallsBackToEnglish() throws Exception {
        mockMvc.perform(authenticatedPost(
                "{\"firstName\":\"John\",\"email\":\"john@example.test\"}", "fr"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("lastName"))
            .andExpect(jsonPath("$.detail").value("The field Last name is required."))
            .andExpect(jsonPath("$.title").value("Validation Error"))
            .andExpect(jsonPath("$.type").value("urn:alixar:error:validation-required"));
    }

    @Test
    void createContact_invalidThirdParty_english_returnsLocalizedError() throws Exception {
        when(createContactUseCase.execute(any(CreateContactCommand.class)))
            .thenThrow(new InvalidThirdPartyReferenceException());

        mockMvc.perform(authenticatedPost(
                "{\"lastName\":\"Doe\",\"firstName\":\"John\",\"email\":\"john@example.test\",\"thirdPartyId\":999}",
                "en"))
            .andExpect(status().isUnprocessableEntity())
            .andExpect(jsonPath("$.code").value("CONTACT_INVALID_THIRD_PARTY_REFERENCE"))
            .andExpect(jsonPath("$.detail").value("The referenced third party does not exist."))
            .andExpect(jsonPath("$.title").value("Invalid Third Party Reference"))
            .andExpect(jsonPath("$.type").value("urn:alixar:error:contact-invalid-third-party-reference"));
    }

    @Test
    void createContact_invalidThirdParty_spanish_returnsLocalizedError() throws Exception {
        when(createContactUseCase.execute(any(CreateContactCommand.class)))
            .thenThrow(new InvalidThirdPartyReferenceException());

        mockMvc.perform(authenticatedPost(
                "{\"lastName\":\"Doe\",\"firstName\":\"John\",\"email\":\"john@example.test\",\"thirdPartyId\":999}",
                "es"))
            .andExpect(status().isUnprocessableEntity())
            .andExpect(jsonPath("$.code").value("CONTACT_INVALID_THIRD_PARTY_REFERENCE"))
            .andExpect(jsonPath("$.detail").value("El tercero indicado no existe."))
            .andExpect(jsonPath("$.title").value("Referencia de tercero no v\u00e1lida"))
            .andExpect(jsonPath("$.type").value("urn:alixar:error:contact-invalid-third-party-reference"));
    }

    private org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder authenticatedPost(
        String body,
        String locale
    ) throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        return post(ContactEndpoints.BASE_PATH)
            .session(authenticatedSession())
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue())
            .contentType(MediaType.APPLICATION_JSON)
            .header("Accept-Language", locale)
            .content(body);
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
