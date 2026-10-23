package es.alxarafe.alixar.audit.application;

/**
 * Raised when a mandatory security audit event cannot be persisted.
 */
public class AuditUnavailableException extends RuntimeException {

    public AuditUnavailableException() {
        super("Security audit service is unavailable");
    }
}
