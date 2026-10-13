package es.alxarafe.alixar.contact.application;

public class ContactNotFoundException extends RuntimeException {

    private final ErrorCode errorCode;
    private final long id;

    public ContactNotFoundException(long id) {
        super(ErrorCode.CONTACT_NOT_FOUND.name() + ":" + id);
        this.errorCode = ErrorCode.CONTACT_NOT_FOUND;
        this.id = id;
    }

    public ErrorCode errorCode() {
        return errorCode;
    }

    public long id() {
        return id;
    }
}