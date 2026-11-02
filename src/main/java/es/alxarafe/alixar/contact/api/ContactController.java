package es.alxarafe.alixar.contact.api;

import es.alxarafe.alixar.contact.application.CreateContactCommand;
import es.alxarafe.alixar.contact.application.GetContactUseCase;
import es.alxarafe.alixar.contact.domain.Contact;
import es.alxarafe.alixar.contact.infrastructure.TransactionalContactService;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(ContactEndpoints.BASE_PATH)
class ContactController {

    private final GetContactUseCase getContactUseCase;
    private final TransactionalContactService contactService;

    ContactController(GetContactUseCase getContactUseCase, TransactionalContactService contactService) {
        this.getContactUseCase = getContactUseCase;
        this.contactService = contactService;
    }

    @GetMapping(
        value = ContactEndpoints.ITEM_RELATIVE_PATH,
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    ResponseEntity<ContactResponse> getContact(
        @PathVariable(ContactEndpoints.ID_PATH_VARIABLE) long id
    ) {
        Contact contact = getContactUseCase.execute(id);
        return ResponseEntity.ok(toResponse(contact));
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    ResponseEntity<CreateContactResponse> createContact(@Valid @RequestBody CreateContactRequest request) {
        long createdId = contactService.create(toCommand(request));
        return ResponseEntity.created(
                java.net.URI.create(ContactEndpoints.BASE_PATH + "/" + createdId))
            .body(new CreateContactResponse(createdId));
    }

    private CreateContactCommand toCommand(CreateContactRequest request) {
        return new CreateContactCommand(
            request.lastName(),
            request.firstName(),
            request.email(),
            request.thirdPartyId()
        );
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

    record CreateContactRequest(
        @NotBlank(message = "{validation.required}") String lastName,
        String firstName,
        String email,
        Long thirdPartyId
    ) {
    }

    record CreateContactResponse(
        long id
    ) {
    }

}