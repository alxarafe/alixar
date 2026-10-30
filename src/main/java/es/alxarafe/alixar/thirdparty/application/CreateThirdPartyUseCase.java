package es.alxarafe.alixar.thirdparty.application;

import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.ADDRESS;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.EMAIL;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.INTRA_COMMUNITY_VAT_NUMBER;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.NAME;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.PHONE;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.POSTAL_CODE;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.TAX_IDENTIFIER;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.TOWN;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.WEBSITE;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyNormalizer.normalizeCountryCode;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyNormalizer.normalizeOptional;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyNormalizer.normalizeRequired;

import es.alxarafe.alixar.thirdparty.domain.NewThirdParty;

public class CreateThirdPartyUseCase {

    private final ThirdPartyRepository thirdPartyRepository;

    public CreateThirdPartyUseCase(ThirdPartyRepository thirdPartyRepository) {
        this.thirdPartyRepository = thirdPartyRepository;
    }

    public long execute(CreateThirdPartyCommand command) {
        NewThirdParty thirdParty = new NewThirdParty(
            normalizeRequired(command.name(), NAME),
            Boolean.TRUE.equals(command.customer()),
            Boolean.TRUE.equals(command.prospect()),
            Boolean.TRUE.equals(command.supplier()),
            !Boolean.FALSE.equals(command.active()),
            normalizeOptional(command.taxIdentifier(), TAX_IDENTIFIER),
            normalizeOptional(
                command.intraCommunityVatNumber(),
                INTRA_COMMUNITY_VAT_NUMBER
            ),
            normalizeOptional(command.address(), ADDRESS),
            normalizeOptional(command.postalCode(), POSTAL_CODE),
            normalizeOptional(command.town(), TOWN),
            normalizeCountryCode(command.countryCode()),
            normalizeOptional(command.email(), EMAIL),
            normalizeOptional(command.phone(), PHONE),
            normalizeOptional(command.website(), WEBSITE)
        );

        return thirdPartyRepository.create(thirdParty);
    }
}
