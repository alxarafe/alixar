package es.alxarafe.alixar.authentication.application;

public class InvalidPasswordException extends RuntimeException {

    public InvalidPasswordException() {
        super("Password must be at least 12 characters long");
    }
}