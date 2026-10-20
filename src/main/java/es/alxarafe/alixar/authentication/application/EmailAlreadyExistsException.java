package es.alxarafe.alixar.authentication.application;

public class EmailAlreadyExistsException extends RuntimeException {

    public EmailAlreadyExistsException() {
        super("The requested email is already in use");
    }
}
