package es.alxarafe.alixar.contact.application;

public class InvalidContactDataException extends RuntimeException {

    public InvalidContactDataException(String message) {
        super(message);
    }

}