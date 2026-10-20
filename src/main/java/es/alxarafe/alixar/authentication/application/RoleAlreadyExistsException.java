package es.alxarafe.alixar.authentication.application;

public class RoleAlreadyExistsException extends RuntimeException {

    public RoleAlreadyExistsException() {
        super("The requested role code is already in use");
    }
}
