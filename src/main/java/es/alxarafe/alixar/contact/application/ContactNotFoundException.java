package es.alxarafe.alixar.contact.application;

public class ContactNotFoundException extends RuntimeException {

    public ContactNotFoundException(long id) {
        super("Contact not found: " + id);
    }

}