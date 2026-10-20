package es.alxarafe.alixar.authentication.application;

public class InvalidApiTokenExpirationException extends RuntimeException {

    public InvalidApiTokenExpirationException() {
        super("The API token expiration is invalid");
    }
}
