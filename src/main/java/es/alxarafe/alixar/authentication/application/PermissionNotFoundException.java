package es.alxarafe.alixar.authentication.application;

public class PermissionNotFoundException extends RuntimeException {

    public PermissionNotFoundException(String permissionCode) {
        super("Permission not found: " + permissionCode);
    }
}
