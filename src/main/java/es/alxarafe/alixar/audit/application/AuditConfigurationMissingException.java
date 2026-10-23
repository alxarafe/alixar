package es.alxarafe.alixar.audit.application;

/**
 * Signals that the persisted audit configuration has not been bootstrapped.
 */
public class AuditConfigurationMissingException extends RuntimeException {

    public AuditConfigurationMissingException() {
        super("Persisted audit configuration is missing");
    }
}
