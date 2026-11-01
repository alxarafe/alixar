package es.alxarafe.alixar.thirdparty.application;

import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.ID;

import es.alxarafe.alixar.core.application.ErrorCode;

public class DeleteThirdPartyUseCase {

    private final ThirdPartyRepository thirdPartyRepository;
    private final LinkedContactChecker linkedContactChecker;

    public DeleteThirdPartyUseCase(
        ThirdPartyRepository thirdPartyRepository,
        LinkedContactChecker linkedContactChecker
    ) {
        this.thirdPartyRepository = thirdPartyRepository;
        this.linkedContactChecker = linkedContactChecker;
    }

    public void execute(long id) {
        if (id <= 0) {
            throw new InvalidThirdPartyDataException(ErrorCode.VALIDATION_INVALID, ID);
        }
        if (thirdPartyRepository.findById(id).isEmpty()) {
            throw new ThirdPartyNotFoundException(id);
        }
        if (linkedContactChecker.existsForThirdParty(id)) {
            throw new ThirdPartyDeleteConflictException();
        }
        if (thirdPartyRepository.deleteById(id) == 0) {
            throw new ThirdPartyNotFoundException(id);
        }
    }
}
