package es.alxarafe.alixar.authentication.application;

public class RoleNotFoundException extends RuntimeException {

    public RoleNotFoundException(String roleCode) {
        super("Role not found: " + roleCode);
    }
}
