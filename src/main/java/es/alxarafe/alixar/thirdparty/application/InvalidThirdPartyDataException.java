package es.alxarafe.alixar.thirdparty.application;

import es.alxarafe.alixar.core.application.ErrorCode;

public class InvalidThirdPartyDataException extends RuntimeException {

    private final ErrorCode errorCode;
    private final String field;

    public InvalidThirdPartyDataException(ErrorCode errorCode, String field) {
        super(errorCode.name() + ":" + field);
        this.errorCode = errorCode;
        this.field = field;
    }

    public ErrorCode errorCode() {
        return errorCode;
    }

    public String field() {
        return field;
    }
}
