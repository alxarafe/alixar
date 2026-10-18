package es.alxarafe.alixar.contact.api;

import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.contact.ContactTestConfig;
import es.alxarafe.alixar.contact.application.CreateContactUseCase;
import es.alxarafe.alixar.contact.application.InvalidThirdPartyReferenceException;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;

import org.springframework.test.context.ActiveProfiles;

@ActiveProfiles("test")
@Import({ContactTestConfig.class, AuthenticationTestConfig.class})
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class ContactI18nTest {

    @Autowired
    private WebApplicationContext context;

    @Autowired
    private CreateContactUseCase createContactUseCase;

    private MockMvc mockMvc;

    @org.junit.jupiter.api.BeforeEach
    void setup() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).apply(springSecurity()).build();
    }

    @Test
    void createContact_missingLastName_english_returnsLocalizedError() throws Exception {
        mockMvc.perform(post("/api/contacts")
                .contentType("application/json")
                .header("Accept-Language", "en")
                .content("{\"firstName\":\"John\",\"email\":\"john@example.test\"}"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("lastName"))
            .andExpect(jsonPath("$.detail").value("The field Last name is required."))
            .andExpect(jsonPath("$.title").value("Validation Error"))
            .andExpect(jsonPath("$.type").value("urn:alixar:error:validation-required"));
    }

    @Test
    void createContact_missingLastName_spanish_returnsLocalizedError() throws Exception {
        mockMvc.perform(post("/api/contacts")
                .contentType("application/json")
                .header("Accept-Language", "es")
                .content("{\"firstName\":\"John\",\"email\":\"john@example.test\"}"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("lastName"))
            .andExpect(jsonPath("$.detail").value("El campo Apellido es obligatorio."))
            .andExpect(jsonPath("$.title").value("Error de validaci\u00f3n"))
            .andExpect(jsonPath("$.type").value("urn:alixar:error:validation-required"));
    }

    @Test
    void createContact_missingLastName_spanishRegional_returnsLocalizedError() throws Exception {
        mockMvc.perform(post("/api/contacts")
                .contentType("application/json")
                .header("Accept-Language", "es-ES")
                .content("{\"firstName\":\"John\",\"email\":\"john@example.test\"}"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("lastName"))
            .andExpect(jsonPath("$.detail").value("El campo Apellido es obligatorio."))
            .andExpect(jsonPath("$.title").value("Error de validaci\u00f3n"))
            .andExpect(jsonPath("$.type").value("urn:alixar:error:validation-required"));
    }

    @Test
    void createContact_missingLastName_unsupportedLocale_fallsBackToEnglish() throws Exception {
        mockMvc.perform(post("/api/contacts")
                .contentType("application/json")
                .header("Accept-Language", "fr")
                .content("{\"firstName\":\"John\",\"email\":\"john@example.test\"}"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("lastName"))
            .andExpect(jsonPath("$.detail").value("The field Last name is required."))
            .andExpect(jsonPath("$.title").value("Validation Error"))
            .andExpect(jsonPath("$.type").value("urn:alixar:error:validation-required"));
    }

    @Test
    void createContact_invalidThirdParty_english_returnsLocalizedError() throws Exception {
        when(createContactUseCase.execute(
            org.mockito.ArgumentMatchers.any(es.alxarafe.alixar.contact.application.CreateContactCommand.class)
        )).thenThrow(new InvalidThirdPartyReferenceException());

        mockMvc.perform(post("/api/contacts")
                .contentType("application/json")
                .header("Accept-Language", "en")
                .content("{\"lastName\":\"Doe\",\"firstName\":\"John\",\"email\":\"john@example.test\",\"thirdPartyId\":999}"))
            .andExpect(status().isUnprocessableEntity())
            .andExpect(jsonPath("$.code").value("CONTACT_INVALID_THIRD_PARTY_REFERENCE"))
            .andExpect(jsonPath("$.detail").value("The referenced third party does not exist."))
            .andExpect(jsonPath("$.title").value("Invalid Third Party Reference"))
            .andExpect(jsonPath("$.type").value("urn:alixar:error:contact-invalid-third-party-reference"));
    }

    @Test
    void createContact_invalidThirdParty_spanish_returnsLocalizedError() throws Exception {
        when(createContactUseCase.execute(
            org.mockito.ArgumentMatchers.any(es.alxarafe.alixar.contact.application.CreateContactCommand.class)
        )).thenThrow(new InvalidThirdPartyReferenceException());

        mockMvc.perform(post("/api/contacts")
                .contentType("application/json")
                .header("Accept-Language", "es")
                .content("{\"lastName\":\"Doe\",\"firstName\":\"John\",\"email\":\"john@example.test\",\"thirdPartyId\":999}"))
            .andExpect(status().isUnprocessableEntity())
            .andExpect(jsonPath("$.code").value("CONTACT_INVALID_THIRD_PARTY_REFERENCE"))
            .andExpect(jsonPath("$.detail").value("El tercero indicado no existe."))
            .andExpect(jsonPath("$.title").value("Referencia de tercero no v\u00e1lida"))
            .andExpect(jsonPath("$.type").value("urn:alixar:error:contact-invalid-third-party-reference"));
    }
}
