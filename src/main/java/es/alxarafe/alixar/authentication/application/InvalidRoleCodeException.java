package es.alxarafe.alixar.authentication.application;

public class InvalidRoleCodeException extends RuntimeException {

    public InvalidRoleCodeException() {
        super("The role code does not match the required syntax");
    }
}
