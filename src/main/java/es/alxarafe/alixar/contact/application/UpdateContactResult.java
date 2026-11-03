package es.alxarafe.alixar.contact.application;

import es.alxarafe.alixar.contact.domain.Contact;

public record UpdateContactResult(
    Contact contact,
    boolean changed
) {
}
