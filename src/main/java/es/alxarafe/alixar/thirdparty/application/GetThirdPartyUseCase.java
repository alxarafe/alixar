package es.alxarafe.alixar.thirdparty.application;

import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.ID;

import es.alxarafe.alixar.core.application.ErrorCode;
import es.alxarafe.alixar.thirdparty.domain.ThirdParty;

public class GetThirdPartyUseCase {

    private final ThirdPartyRepository thirdPartyRepository;

    public GetThirdPartyUseCase(ThirdPartyRepository thirdPartyRepository) {
        this.thirdPartyRepository = thirdPartyRepository;
    }

    public ThirdParty execute(long id) {
        if (id <= 0) {
            throw new InvalidThirdPartyDataException(ErrorCode.VALIDATION_INVALID, ID);
        }
        return thirdPartyRepository.findById(id)
            .orElseThrow(() -> new ThirdPartyNotFoundException(id));
    }
}
