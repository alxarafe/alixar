package es.alxarafe.alixar.authentication.application;

public class InvalidCurrentPasswordException extends RuntimeException {

    public InvalidCurrentPasswordException() {
        super("The current password is incorrect");
    }
}
