package es.alxarafe.alixar.contact.application;

import org.springframework.stereotype.Component;

@Component
public class ListContactsUseCase {

    private final ContactRepository contactRepository;

    public ListContactsUseCase(ContactRepository contactRepository) {
        this.contactRepository = contactRepository;
    }

    public ContactPage execute(ContactListQuery query) {
        return contactRepository.findPage(query);
    }
}
