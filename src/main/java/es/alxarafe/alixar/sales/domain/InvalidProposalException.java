package es.alxarafe.alixar.sales.domain;

public class InvalidProposalException extends RuntimeException {
    private final String field;
    private final boolean required;
    public InvalidProposalException(String field, boolean required) {
        this.field = field;
        this.required = required;
    }
    public String field() { return field; }
    public boolean required() { return required; }
}
