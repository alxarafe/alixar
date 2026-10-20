package es.alxarafe.alixar.authentication.application;

public class ApiTokenNotFoundException extends RuntimeException {

    public ApiTokenNotFoundException() {
        super("The API token was not found");
    }
}
