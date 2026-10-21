package es.alxarafe.alixar.audit.application;

/**
 * Canonical audit action identifiers.
 */
public enum AuditAction {
    USER_ENABLED,
    USER_DISABLED,
    ADMIN_USER_CREATED,
    ADMIN_USER_USERNAME_CHANGED,
    ADMIN_USER_PASSWORD_RESET,
    ADMIN_USER_ROLES_REPLACED,
    USER_USERNAME_CHANGED,
    USER_PASSWORD_CHANGED,
    PASSWORD_RESET_COMPLETED
}
