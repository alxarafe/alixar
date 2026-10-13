package es.alxarafe.alixar.contact.application;

public class InvalidThirdPartyReferenceException extends RuntimeException {

    private final ErrorCode errorCode;

    public InvalidThirdPartyReferenceException() {
        super(ErrorCode.CONTACT_INVALID_THIRD_PARTY_REFERENCE.name());
        this.errorCode = ErrorCode.CONTACT_INVALID_THIRD_PARTY_REFERENCE;
    }

    public ErrorCode errorCode() {
        return errorCode;
    }
}