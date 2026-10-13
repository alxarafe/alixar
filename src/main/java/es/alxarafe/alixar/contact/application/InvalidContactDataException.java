package es.alxarafe.alixar.contact.application;

import es.alxarafe.alixar.core.application.ErrorCode;

public class InvalidContactDataException extends RuntimeException {

    private final ErrorCode errorCode;
    private final String field;

    public InvalidContactDataException(ErrorCode errorCode, String field) {
        super(errorCode + ":" + field);
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