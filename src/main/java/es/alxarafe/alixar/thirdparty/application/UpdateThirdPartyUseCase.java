package es.alxarafe.alixar.thirdparty.application;

import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.ACTIVE;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.ADDRESS;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.COUNTRY_CODE;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.CUSTOMER;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.EMAIL;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.ID;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.INTRA_COMMUNITY_VAT_NUMBER;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.NAME;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.PHONE;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.POSTAL_CODE;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.PROSPECT;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.SUPPLIER;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.TAX_IDENTIFIER;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.TOWN;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.WEBSITE;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyNormalizer.normalizeCountryCode;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyNormalizer.normalizeOptional;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyNormalizer.normalizeRequired;

import es.alxarafe.alixar.core.application.ErrorCode;
import es.alxarafe.alixar.thirdparty.domain.ThirdParty;

public class UpdateThirdPartyUseCase {

    private final ThirdPartyRepository thirdPartyRepository;

    public UpdateThirdPartyUseCase(ThirdPartyRepository thirdPartyRepository) {
        this.thirdPartyRepository = thirdPartyRepository;
    }

    public UpdateThirdPartyResult execute(long id, UpdateThirdPartyCommand command) {
        if (id <= 0) {
            throw new InvalidThirdPartyDataException(ErrorCode.VALIDATION_INVALID, ID);
        }
        ThirdParty current = thirdPartyRepository.findById(id)
            .orElseThrow(() -> new ThirdPartyNotFoundException(id));
        String countryCode = command.countryCode().present()
            ? normalizeCountryCode(command.countryCode().value())
            : current.countryCode();
        ThirdParty updated = new ThirdParty(
            id,
            command.name().present()
                ? normalizeRequired(command.name().value(), NAME)
                : current.name(),
            booleanValue(command.customer(), current.customer(), CUSTOMER),
            booleanValue(command.prospect(), current.prospect(), PROSPECT),
            booleanValue(command.supplier(), current.supplier(), SUPPLIER),
            booleanValue(command.active(), current.active(), ACTIVE),
            optionalValue(command.taxIdentifier(), current.taxIdentifier(), TAX_IDENTIFIER),
            optionalValue(
                command.intraCommunityVatNumber(),
                current.intraCommunityVatNumber(),
                INTRA_COMMUNITY_VAT_NUMBER
            ),
            optionalValue(command.address(), current.address(), ADDRESS),
            optionalValue(command.postalCode(), current.postalCode(), POSTAL_CODE),
            optionalValue(command.town(), current.town(), TOWN),
            countryCode,
            optionalValue(command.email(), current.email(), EMAIL),
            optionalValue(command.phone(), current.phone(), PHONE),
            optionalValue(command.website(), current.website(), WEBSITE)
        );

        if (updated.equals(current)) {
            return new UpdateThirdPartyResult(updated, false);
        }
        thirdPartyRepository.update(updated);
        return new UpdateThirdPartyResult(updated, true);
    }

    private boolean booleanValue(FieldUpdate<Boolean> update, boolean current, String field) {
        if (!update.present()) {
            return current;
        }
        if (update.value() == null) {
            throw new InvalidThirdPartyDataException(ErrorCode.VALIDATION_INVALID, field);
        }
        return update.value();
    }

    private String optionalValue(
        FieldUpdate<String> update,
        String current,
        String field
    ) {
        return update.present() ? normalizeOptional(update.value(), field) : current;
    }
}
