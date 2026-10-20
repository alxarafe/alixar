package es.alxarafe.alixar.authentication.application;

public class InvalidPaginationException extends RuntimeException {

    private final String field;

    public InvalidPaginationException(String field) {
        super("Invalid pagination parameter: " + field);
        this.field = field;
    }

    public String field() {
        return field;
    }
}
