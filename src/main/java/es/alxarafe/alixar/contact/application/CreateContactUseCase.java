package es.alxarafe.alixar.contact.application;

import es.alxarafe.alixar.core.application.ErrorCode;
import org.springframework.stereotype.Component;

@Component
public class CreateContactUseCase {

    private final ContactRepository contactRepository;
    private final ThirdPartyReferenceChecker thirdPartyReferenceChecker;

    public CreateContactUseCase(
        ContactRepository contactRepository,
        ThirdPartyReferenceChecker thirdPartyReferenceChecker
    ) {
        this.contactRepository = contactRepository;
        this.thirdPartyReferenceChecker = thirdPartyReferenceChecker;
    }

    public long execute(CreateContactCommand command) {
        if (command.lastName() == null || command.lastName().isBlank()) {
            throw new InvalidContactDataException(ErrorCode.VALIDATION_REQUIRED, "lastName");
        }
        if (command.thirdPartyId() != null
            && !thirdPartyReferenceChecker.existsById(command.thirdPartyId())) {
            throw new InvalidThirdPartyReferenceException();
        }
        return contactRepository.create(command);
    }

}