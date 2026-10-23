package es.alxarafe.alixar.audit.application;

import java.util.Objects;

/**
 * Signals a malformed or unsupported audit read policy request.
 */
public class InvalidAuditReadPolicyException extends RuntimeException {

    private final String field;

    public InvalidAuditReadPolicyException(String field) {
        super("Invalid audit read policy field: " + Objects.requireNonNull(field, "field"));
        this.field = field;
    }

    public String field() {
        return field;
    }
}
