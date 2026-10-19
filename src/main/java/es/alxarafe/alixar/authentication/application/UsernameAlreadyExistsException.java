package es.alxarafe.alixar.authentication.application;

public class UsernameAlreadyExistsException extends RuntimeException {

    public UsernameAlreadyExistsException() {
        super("The requested username is already in use");
    }
}
