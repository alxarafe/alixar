package es.alxarafe.alixar.contact.application;

import static es.alxarafe.alixar.contact.application.ContactFieldNames.ID;

import es.alxarafe.alixar.core.application.ErrorCode;

public class DeleteContactUseCase {

    private final ContactRepository contactRepository;

    public DeleteContactUseCase(ContactRepository contactRepository) {
        this.contactRepository = contactRepository;
    }

    public void execute(long id) {
        if (id <= 0) {
            throw new InvalidContactDataException(ErrorCode.VALIDATION_INVALID, ID);
        }
        contactRepository.findById(id);
        if (contactRepository.deleteById(id) == 0) {
            throw new ContactNotFoundException(id);
        }
    }
}
