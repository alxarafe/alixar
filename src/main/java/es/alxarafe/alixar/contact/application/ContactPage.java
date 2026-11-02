package es.alxarafe.alixar.contact.application;

import es.alxarafe.alixar.contact.domain.Contact;
import java.util.List;

public record ContactPage(
    List<Contact> items,
    int page,
    int size,
    long total
) {

    public ContactPage {
        items = List.copyOf(items);
    }
}
