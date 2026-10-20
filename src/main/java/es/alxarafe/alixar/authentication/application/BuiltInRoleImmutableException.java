package es.alxarafe.alixar.authentication.application;

public class BuiltInRoleImmutableException extends RuntimeException {

    public BuiltInRoleImmutableException(String roleCode) {
        super("The built-in role cannot be changed or deleted: " + roleCode);
    }
}
