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
import java.util.Locale;

final class ThirdPartyNormalizer {

    private ThirdPartyNormalizer() {
    }

    static String normalizeRequired(String value, String field) {
        if (value == null || value.isBlank()) {
            throw new InvalidThirdPartyDataException(ErrorCode.VALIDATION_REQUIRED, field);
        }
        String normalized = value.strip();
        validateLength(normalized, field);
        return normalized;
    }

    static String normalizeOptional(String value, String field) {
        if (value == null) {
            return null;
        }
        String normalized = value.strip();
        if (normalized.isEmpty()) {
            return null;
        }
        validateLength(normalized, field);
        return normalized;
    }

    static String normalizeCountryCode(String value) {
        String normalized = normalizeOptional(value, COUNTRY_CODE);
        return normalized == null ? null : normalized.toUpperCase(Locale.ROOT);
    }

    private static void validateLength(String value, String field) {
        if (value.length() > maxLength(field)) {
            throw new InvalidThirdPartyDataException(ErrorCode.VALIDATION_INVALID, field);
        }
    }

    private static int maxLength(String field) {
        return switch (field) {
            case NAME -> 128;
            case TAX_IDENTIFIER -> 128;
            case INTRA_COMMUNITY_VAT_NUMBER -> 20;
            case ADDRESS -> 255;
            case POSTAL_CODE -> 25;
            case TOWN -> 50;
            case COUNTRY_CODE -> 2;
            case EMAIL -> 128;
            case PHONE -> 30;
            case WEBSITE -> 255;
            default -> throw new IllegalArgumentException("Unknown ThirdParty field: " + field);
        };
    }
}
