package es.alxarafe.alixar.contact.application;

import es.alxarafe.alixar.core.application.ErrorCode;
import org.springframework.stereotype.Component;

@Component
public class CreateContactUseCase {

    private final ContactRepository contactRepository;

    public CreateContactUseCase(ContactRepository contactRepository) {
        this.contactRepository = contactRepository;
    }

    public long execute(CreateContactCommand command) {
        if (command.lastName() == null || command.lastName().isBlank()) {
            throw new InvalidContactDataException(ErrorCode.VALIDATION_REQUIRED, "lastName");
        }
        return contactRepository.create(command);
    }

}