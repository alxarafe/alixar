package es.alxarafe.alixar.contact.api;

import es.alxarafe.alixar.contact.application.ContactNotFoundException;
import es.alxarafe.alixar.contact.application.GetContactUseCase;
import es.alxarafe.alixar.contact.domain.Contact;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/contacts")
class ContactController {

    private final GetContactUseCase getContactUseCase;

    ContactController(GetContactUseCase getContactUseCase) {
        this.getContactUseCase = getContactUseCase;
    }

    @GetMapping(value = "/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    ResponseEntity<ContactResponse> getContact(@PathVariable("id") long id) {
        Contact contact = getContactUseCase.execute(id);
        return ResponseEntity.ok(toResponse(contact));
    }

    private ContactResponse toResponse(Contact contact) {
        return new ContactResponse(
            contact.id(),
            contact.lastName(),
            contact.firstName(),
            contact.email(),
            contact.thirdPartyId()
        );
    }

    record ContactResponse(
        long id,
        String lastName,
        String firstName,
        String email,
        Long thirdPartyId
    ) {
    }

}