package es.alxarafe.alixar.authentication.application;

public class InvalidRoleNameException extends RuntimeException {

    public InvalidRoleNameException() {
        super("The role name must not be blank");
    }
}
