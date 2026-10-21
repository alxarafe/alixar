package es.alxarafe.alixar.audit.application;

/**
 * Raised when an audit event is required but the authenticated actor cannot be
 * resolved.
 */
public class AuditActorUnavailableException extends RuntimeException {

    public AuditActorUnavailableException() {
        super("Authenticated audit actor is unavailable");
    }
}
