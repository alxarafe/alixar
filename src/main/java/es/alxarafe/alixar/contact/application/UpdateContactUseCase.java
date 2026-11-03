package es.alxarafe.alixar.contact.application;

import static es.alxarafe.alixar.contact.application.ContactFieldNames.ID;
import static es.alxarafe.alixar.contact.application.ContactFieldNames.LAST_NAME;
import static es.alxarafe.alixar.contact.application.ContactFieldNames.THIRD_PARTY_ID;

import es.alxarafe.alixar.contact.domain.Contact;
import es.alxarafe.alixar.core.application.ErrorCode;

public class UpdateContactUseCase {

    private final ContactRepository contactRepository;
    private final ThirdPartyReferenceChecker thirdPartyReferenceChecker;

    public UpdateContactUseCase(
        ContactRepository contactRepository,
        ThirdPartyReferenceChecker thirdPartyReferenceChecker
    ) {
        this.contactRepository = contactRepository;
        this.thirdPartyReferenceChecker = thirdPartyReferenceChecker;
    }

    public UpdateContactResult execute(long id, UpdateContactCommand command) {
        if (id <= 0) {
            throw new InvalidContactDataException(ErrorCode.VALIDATION_INVALID, ID);
        }
        Contact current = contactRepository.findById(id);
        Contact updated = new Contact(
            id,
            lastNameValue(command.lastName(), current.lastName()),
            optionalValue(command.firstName(), current.firstName()),
            optionalValue(command.email(), current.email()),
            thirdPartyValue(command.thirdPartyId(), current.thirdPartyId())
        );

        if (updated.equals(current)) {
            return new UpdateContactResult(current, false);
        }
        contactRepository.update(updated);
        return new UpdateContactResult(updated, true);
    }

    private String lastNameValue(FieldUpdate<String> update, String current) {
        if (!update.present()) {
            return current;
        }
        if (update.value() == null || update.value().isBlank()) {
            throw new InvalidContactDataException(ErrorCode.VALIDATION_REQUIRED, LAST_NAME);
        }
        return update.value();
    }

    private String optionalValue(FieldUpdate<String> update, String current) {
        return update.present() ? update.value() : current;
    }

    private Long thirdPartyValue(FieldUpdate<Long> update, Long current) {
        if (!update.present()) {
            return current;
        }
        Long value = update.value();
        if (value == null) {
            return null;
        }
        if (value <= 0) {
            throw new InvalidContactDataException(ErrorCode.VALIDATION_INVALID, THIRD_PARTY_ID);
        }
        if (!thirdPartyReferenceChecker.existsById(value)) {
            throw new InvalidThirdPartyReferenceException();
        }
        return value;
    }
}
