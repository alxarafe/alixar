package es.alxarafe.alixar.authentication.application;

public class RoleInUseException extends RuntimeException {

    public RoleInUseException(String roleCode) {
        super("The role is assigned to users and cannot be deleted: " + roleCode);
    }
}
