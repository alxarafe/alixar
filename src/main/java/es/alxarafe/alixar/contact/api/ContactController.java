package es.alxarafe.alixar.contact.api;

import static es.alxarafe.alixar.contact.application.ContactFieldNames.BODY;
import static es.alxarafe.alixar.contact.application.ContactFieldNames.EMAIL;
import static es.alxarafe.alixar.contact.application.ContactFieldNames.FIRST_NAME;
import static es.alxarafe.alixar.contact.application.ContactFieldNames.LAST_NAME;
import static es.alxarafe.alixar.contact.application.ContactFieldNames.PAGE;
import static es.alxarafe.alixar.contact.application.ContactFieldNames.SIZE;
import static es.alxarafe.alixar.contact.application.ContactFieldNames.THIRD_PARTY_ID;

import es.alxarafe.alixar.contact.application.ContactListQuery;
import es.alxarafe.alixar.contact.application.ContactPage;
import es.alxarafe.alixar.contact.application.CreateContactCommand;
import es.alxarafe.alixar.contact.application.FieldUpdate;
import es.alxarafe.alixar.contact.application.GetContactUseCase;
import es.alxarafe.alixar.contact.application.InvalidContactDataException;
import es.alxarafe.alixar.contact.application.ListContactsUseCase;
import es.alxarafe.alixar.contact.application.UpdateContactCommand;
import es.alxarafe.alixar.contact.domain.Contact;
import es.alxarafe.alixar.contact.infrastructure.TransactionalContactService;
import es.alxarafe.alixar.core.application.ErrorCode;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import java.util.List;
import java.util.Set;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import tools.jackson.databind.JsonNode;

@RestController
@RequestMapping(ContactEndpoints.BASE_PATH)
class ContactController {

    private static final Set<String> UPDATE_FIELDS = Set.of(
        LAST_NAME,
        FIRST_NAME,
        EMAIL,
        THIRD_PARTY_ID
    );

    private final GetContactUseCase getContactUseCase;
    private final ListContactsUseCase listContactsUseCase;
    private final TransactionalContactService contactService;

    ContactController(
        GetContactUseCase getContactUseCase,
        ListContactsUseCase listContactsUseCase,
        TransactionalContactService contactService
    ) {
        this.getContactUseCase = getContactUseCase;
        this.listContactsUseCase = listContactsUseCase;
        this.contactService = contactService;
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    ResponseEntity<ContactPageResponse> listContacts(
        @RequestParam(name = PAGE, required = false) Integer page,
        @RequestParam(name = SIZE, required = false) Integer size,
        @RequestParam(name = THIRD_PARTY_ID, required = false) Long thirdPartyId
    ) {
        ContactPage result = listContactsUseCase.execute(
            ContactListQuery.of(page, size, thirdPartyId)
        );
        return ResponseEntity.ok(new ContactPageResponse(
            result.items().stream().map(this::toResponse).toList(),
            result.page(),
            result.size(),
            result.total()
        ));
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

    @PatchMapping(
        value = ContactEndpoints.ITEM_RELATIVE_PATH,
        consumes = ContactEndpoints.MERGE_PATCH_MEDIA_TYPE,
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    ResponseEntity<ContactResponse> updateContact(
        @PathVariable(ContactEndpoints.ID_PATH_VARIABLE) long id,
        @RequestBody JsonNode request
    ) {
        Contact contact = contactService.update(id, toUpdateCommand(request));
        return ResponseEntity.ok(toResponse(contact));
    }

    private UpdateContactCommand toUpdateCommand(JsonNode request) {
        if (request == null || !request.isObject()) {
            throw invalid(BODY);
        }
        request.propertyNames().forEach(field -> {
            if (!UPDATE_FIELDS.contains(field)) {
                throw invalid(field);
            }
        });
        return new UpdateContactCommand(
            patchText(request, LAST_NAME, true),
            patchText(request, FIRST_NAME, false),
            patchText(request, EMAIL, false),
            patchThirdPartyId(request)
        );
    }

    private FieldUpdate<String> patchText(JsonNode request, String field, boolean required) {
        if (!request.has(field)) {
            return FieldUpdate.absent();
        }
        JsonNode value = request.get(field);
        if (value.isNull()) {
            if (required) {
                throw required(field);
            }
            return FieldUpdate.of(null);
        }
        if (!value.isTextual()) {
            throw invalid(field);
        }
        return FieldUpdate.of(value.textValue());
    }

    private FieldUpdate<Long> patchThirdPartyId(JsonNode request) {
        if (!request.has(THIRD_PARTY_ID)) {
            return FieldUpdate.absent();
        }
        JsonNode value = request.get(THIRD_PARTY_ID);
        if (value.isNull()) {
            return FieldUpdate.of(null);
        }
        if (!value.isIntegralNumber()) {
            throw invalid(THIRD_PARTY_ID);
        }
        return FieldUpdate.of(value.longValue());
    }

    private InvalidContactDataException required(String field) {
        return new InvalidContactDataException(ErrorCode.VALIDATION_REQUIRED, field);
    }

    private InvalidContactDataException invalid(String field) {
        return new InvalidContactDataException(ErrorCode.VALIDATION_INVALID, field);
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

    record ContactPageResponse(
        List<ContactResponse> items,
        int page,
        int size,
        long total
    ) {
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