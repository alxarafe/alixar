package es.alxarafe.alixar.audit.application;

public class InvalidAuditQueryException extends RuntimeException {

    private final String parameter;

    public InvalidAuditQueryException(String parameter) {
        super("Invalid audit query parameter: " + parameter);
        this.parameter = parameter;
    }

    public String parameter() {
        return parameter;
    }
}
