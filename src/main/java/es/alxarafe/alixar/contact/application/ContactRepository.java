package es.alxarafe.alixar.contact.application;

import es.alxarafe.alixar.contact.domain.Contact;

public interface ContactRepository {

    Contact findById(long id);

    long create(CreateContactCommand command);

    void update(Contact contact);

    ContactPage findPage(ContactListQuery query);

}