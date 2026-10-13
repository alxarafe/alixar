package es.alxarafe.alixar.contact.api;

import es.alxarafe.alixar.contact.application.ContactNotFoundException;
import es.alxarafe.alixar.contact.application.GetContactUseCase;
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

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Import(ContactTestConfig.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class ContactControllerTest {

    @Autowired
    private WebApplicationContext context;

    @Autowired
    private GetContactUseCase getContactUseCase;

    private MockMvc mockMvc;

    @BeforeEach
    void setup() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
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

}