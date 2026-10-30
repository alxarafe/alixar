package es.alxarafe.alixar.thirdparty.application;

import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.PAGE;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.SIZE;

import es.alxarafe.alixar.core.application.ErrorCode;

public record ThirdPartyListQuery(
    int page,
    int size,
    Boolean customer,
    Boolean prospect,
    Boolean supplier,
    Boolean active
) {

    public static final int DEFAULT_PAGE = 0;
    public static final int DEFAULT_SIZE = 20;
    public static final int MAX_SIZE = 100;

    public ThirdPartyListQuery {
        if (page < DEFAULT_PAGE) {
            throw invalid(PAGE);
        }
        if (size < 1 || size > MAX_SIZE) {
            throw invalid(SIZE);
        }
    }

    public static ThirdPartyListQuery of(
        Integer page,
        Integer size,
        Boolean customer,
        Boolean prospect,
        Boolean supplier,
        Boolean active
    ) {
        return new ThirdPartyListQuery(
            page != null ? page : DEFAULT_PAGE,
            size != null ? size : DEFAULT_SIZE,
            customer,
            prospect,
            supplier,
            active
        );
    }

    public long offset() {
        return (long) page * size;
    }

    private static InvalidThirdPartyDataException invalid(String field) {
        return new InvalidThirdPartyDataException(ErrorCode.VALIDATION_INVALID, field);
    }
}
