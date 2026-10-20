package es.alxarafe.alixar.contact.api;

import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.contact.application.ContactNotFoundException;
import es.alxarafe.alixar.contact.application.ContactRepository;
import es.alxarafe.alixar.contact.application.CreateContactUseCase;
import es.alxarafe.alixar.contact.application.GetContactUseCase;
import es.alxarafe.alixar.contact.application.InvalidContactDataException;
import es.alxarafe.alixar.contact.application.InvalidThirdPartyReferenceException;
import es.alxarafe.alixar.contact.ContactTestConfig;
import es.alxarafe.alixar.contact.domain.Contact;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.mockito.Mockito.reset;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.header;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;

@Import({ContactTestConfig.class, AuthenticationTestConfig.class})
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class ContactControllerTest {

    @Autowired
    private WebApplicationContext context;

    @Autowired
    private GetContactUseCase getContactUseCase;

    @Autowired
    private CreateContactUseCase createContactUseCase;

    @Autowired
    private ContactRepository contactRepository;

    private MockMvc mockMvc;

    @BeforeEach
    void setup() {
        reset(createContactUseCase, contactRepository);
        mockMvc = MockMvcBuilders.webAppContextSetup(context).apply(springSecurity()).build();
    }

    @Test
    void getContact_returnsCanonicalResponse() throws Exception {
        Contact contact = new Contact(3L, "Doe", "John", "john@example.test", null);
        when(getContactUseCase.execute(3L)).thenReturn(contact);

        mockMvc.perform(get("/api/contacts/3"))
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

        mockMvc.perform(get("/api/contacts/3"))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.thirdPartyId").value(42));
    }

    @Test
    void getContact_notFound_returns404() throws Exception {
        when(getContactUseCase.execute(999L)).thenThrow(new ContactNotFoundException(999L));

        mockMvc.perform(get("/api/contacts/999"))
            .andExpect(status().isNotFound());
    }

    @Test
    void getContact_responseDoesNotContainDolibarrFields() throws Exception {
        Contact contact = new Contact(3L, "Doe", "John", "john@example.test", null);
        when(getContactUseCase.execute(3L)).thenReturn(contact);

        mockMvc.perform(get("/api/contacts/3"))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.lastname").doesNotExist())
            .andExpect(jsonPath("$.firstname").doesNotExist())
            .andExpect(jsonPath("$.fk_soc").doesNotExist())
            .andExpect(jsonPath("$.socid").doesNotExist())
            .andExpect(jsonPath("$.socname").doesNotExist())
            .andExpect(jsonPath("$.statut").doesNotExist());
    }

    @Test
    void createContact_returns201AndLocation() throws Exception {
        when(createContactUseCase.execute(
            new es.alxarafe.alixar.contact.application.CreateContactCommand("Doe", "John", "john@example.test", null)
        )).thenReturn(42L);

        mockMvc.perform(post("/api/contacts")
                .contentType("application/json")
                .content("{\"lastName\":\"Doe\",\"firstName\":\"John\",\"email\":\"john@example.test\"}"))
            .andExpect(status().isCreated())
            .andExpect(header().string("Location", "/api/contacts/42"))
            .andExpect(jsonPath("$.id").value(42));
    }

    @Test
    void createContact_withThirdPartyId_returns201() throws Exception {
        when(createContactUseCase.execute(
            new es.alxarafe.alixar.contact.application.CreateContactCommand("Doe", "John", "john@example.test", 42L)
        )).thenReturn(43L);

        mockMvc.perform(post("/api/contacts")
                .contentType("application/json")
                .content("{\"lastName\":\"Doe\",\"firstName\":\"John\",\"email\":\"john@example.test\",\"thirdPartyId\":42}"))
            .andExpect(status().isCreated())
            .andExpect(header().string("Location", "/api/contacts/43"))
            .andExpect(jsonPath("$.id").value(43));
    }

    @Test
    void createContact_missingLastName_returns400WithValidationError() throws Exception {
        mockMvc.perform(post("/api/contacts")
                .contentType("application/json")
                .content("{\"firstName\":\"John\",\"email\":\"john@example.test\"}"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("lastName"))
            .andExpect(jsonPath("$.detail").value("The field Last name is required."));
    }

    @Test
    void createContact_blankLastName_returns400WithValidationError() throws Exception {
        mockMvc.perform(post("/api/contacts")
                .contentType("application/json")
                .content("{\"lastName\":\"  \",\"firstName\":\"John\",\"email\":\"john@example.test\"}"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("lastName"))
            .andExpect(jsonPath("$.detail").value("The field Last name is required."));
    }

    @Test
    void createContact_emptyLastName_returns400WithValidationError() throws Exception {
        mockMvc.perform(post("/api/contacts")
                .contentType("application/json")
                .content("{\"lastName\":\"\",\"firstName\":\"John\",\"email\":\"john@example.test\"}"))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"))
            .andExpect(jsonPath("$.field").value("lastName"))
            .andExpect(jsonPath("$.detail").value("The field Last name is required."));
    }

    @Test
    void createContact_invalidThirdParty_returns422() throws Exception {
        when(createContactUseCase.execute(
            new es.alxarafe.alixar.contact.application.CreateContactCommand("Doe", "John", "john@example.test", 999L)
        )).thenThrow(new InvalidThirdPartyReferenceException());

        mockMvc.perform(post("/api/contacts")
                .contentType("application/json")
                .content("{\"lastName\":\"Doe\",\"firstName\":\"John\",\"email\":\"john@example.test\",\"thirdPartyId\":999}"))
            .andExpect(status().isUnprocessableEntity())
            .andExpect(jsonPath("$.code").value("CONTACT_INVALID_THIRD_PARTY_REFERENCE"))
            .andExpect(jsonPath("$.detail").value("The referenced third party does not exist."));
    }

    @Test
    void createContact_usesCanonicalNamesNotLegacy() throws Exception {
        when(createContactUseCase.execute(
            new es.alxarafe.alixar.contact.application.CreateContactCommand("Doe", "John", "john@example.test", null)
        )).thenReturn(42L);

        mockMvc.perform(post("/api/contacts")
                .contentType("application/json")
                .content("{\"lastName\":\"Doe\",\"firstName\":\"John\",\"email\":\"john@example.test\"}"))
            .andExpect(status().isCreated())
            .andExpect(jsonPath("$.lastname").doesNotExist())
            .andExpect(jsonPath("$.firstname").doesNotExist())
            .andExpect(jsonPath("$.fk_soc").doesNotExist())
            .andExpect(jsonPath("$.socid").doesNotExist());
    }

}
