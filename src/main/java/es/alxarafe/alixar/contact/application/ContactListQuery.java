package es.alxarafe.alixar.contact.application;

import static es.alxarafe.alixar.contact.application.ContactFieldNames.PAGE;
import static es.alxarafe.alixar.contact.application.ContactFieldNames.SIZE;
import static es.alxarafe.alixar.contact.application.ContactFieldNames.THIRD_PARTY_ID;

import es.alxarafe.alixar.core.application.ErrorCode;

public record ContactListQuery(
    int page,
    int size,
    Long thirdPartyId
) {

    public static final int DEFAULT_PAGE = 0;
    public static final int DEFAULT_SIZE = 20;
    public static final int MAX_SIZE = 100;

    public ContactListQuery {
        if (page < DEFAULT_PAGE) {
            throw invalid(PAGE);
        }
        if (size < 1 || size > MAX_SIZE) {
            throw invalid(SIZE);
        }
        if (thirdPartyId != null && thirdPartyId <= 0) {
            throw invalid(THIRD_PARTY_ID);
        }
    }

    public static ContactListQuery of(Integer page, Integer size, Long thirdPartyId) {
        return new ContactListQuery(
            page != null ? page : DEFAULT_PAGE,
            size != null ? size : DEFAULT_SIZE,
            thirdPartyId
        );
    }

    public long offset() {
        return (long) page * size;
    }

    private static InvalidContactDataException invalid(String field) {
        return new InvalidContactDataException(ErrorCode.VALIDATION_INVALID, field);
    }
}
