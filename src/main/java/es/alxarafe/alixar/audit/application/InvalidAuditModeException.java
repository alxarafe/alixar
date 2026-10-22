package es.alxarafe.alixar.audit.application;

/**
 * Signals that an API request contains an unsupported audit mode.
 */
public class InvalidAuditModeException extends RuntimeException {

    public InvalidAuditModeException() {
        super("Unsupported audit mode");
    }
}
