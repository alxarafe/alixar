package es.alxarafe.alixar.thirdparty.application;

import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.ADDRESS;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.COUNTRY_CODE;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.EMAIL;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.INTRA_COMMUNITY_VAT_NUMBER;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.NAME;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.PHONE;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.POSTAL_CODE;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.TAX_IDENTIFIER;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.TOWN;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.WEBSITE;

import es.alxarafe.alixar.core.application.ErrorCode;
import es.alxarafe.alixar.thirdparty.domain.NewThirdParty;
import java.util.Locale;

public class CreateThirdPartyUseCase {

    private static final int NAME_MAX_LENGTH = 128;
    private static final int TAX_IDENTIFIER_MAX_LENGTH = 128;
    private static final int INTRA_COMMUNITY_VAT_NUMBER_MAX_LENGTH = 20;
    private static final int ADDRESS_MAX_LENGTH = 255;
    private static final int POSTAL_CODE_MAX_LENGTH = 25;
    private static final int TOWN_MAX_LENGTH = 50;
    private static final int COUNTRY_CODE_MAX_LENGTH = 2;
    private static final int EMAIL_MAX_LENGTH = 128;
    private static final int PHONE_MAX_LENGTH = 30;
    private static final int WEBSITE_MAX_LENGTH = 255;

    private final ThirdPartyRepository thirdPartyRepository;

    public CreateThirdPartyUseCase(ThirdPartyRepository thirdPartyRepository) {
        this.thirdPartyRepository = thirdPartyRepository;
    }

    public long execute(CreateThirdPartyCommand command) {
        String name = normalizeRequired(command.name(), NAME, NAME_MAX_LENGTH);
        String countryCode = normalizeOptional(
            command.countryCode(),
            COUNTRY_CODE,
            COUNTRY_CODE_MAX_LENGTH
        );

        NewThirdParty thirdParty = new NewThirdParty(
            name,
            Boolean.TRUE.equals(command.customer()),
            Boolean.TRUE.equals(command.prospect()),
            Boolean.TRUE.equals(command.supplier()),
            !Boolean.FALSE.equals(command.active()),
            normalizeOptional(command.taxIdentifier(), TAX_IDENTIFIER, TAX_IDENTIFIER_MAX_LENGTH),
            normalizeOptional(
                command.intraCommunityVatNumber(),
                INTRA_COMMUNITY_VAT_NUMBER,
                INTRA_COMMUNITY_VAT_NUMBER_MAX_LENGTH
            ),
            normalizeOptional(command.address(), ADDRESS, ADDRESS_MAX_LENGTH),
            normalizeOptional(command.postalCode(), POSTAL_CODE, POSTAL_CODE_MAX_LENGTH),
            normalizeOptional(command.town(), TOWN, TOWN_MAX_LENGTH),
            countryCode == null ? null : countryCode.toUpperCase(Locale.ROOT),
            normalizeOptional(command.email(), EMAIL, EMAIL_MAX_LENGTH),
            normalizeOptional(command.phone(), PHONE, PHONE_MAX_LENGTH),
            normalizeOptional(command.website(), WEBSITE, WEBSITE_MAX_LENGTH)
        );

        return thirdPartyRepository.create(thirdParty);
    }

    private String normalizeRequired(String value, String field, int maxLength) {
        if (value == null || value.isBlank()) {
            throw new InvalidThirdPartyDataException(ErrorCode.VALIDATION_REQUIRED, field);
        }
        String normalized = value.strip();
        validateLength(normalized, field, maxLength);
        return normalized;
    }

    private String normalizeOptional(String value, String field, int maxLength) {
        if (value == null) {
            return null;
        }
        String normalized = value.strip();
        if (normalized.isEmpty()) {
            return null;
        }
        validateLength(normalized, field, maxLength);
        return normalized;
    }

    private void validateLength(String value, String field, int maxLength) {
        if (value.length() > maxLength) {
            throw new InvalidThirdPartyDataException(ErrorCode.VALIDATION_INVALID, field);
        }
    }
}
