package es.alxarafe.alixar.contact.application;

import es.alxarafe.alixar.contact.domain.Contact;
import org.springframework.stereotype.Component;

@Component
public class GetContactUseCase {

    private final ContactRepository contactRepository;

    public GetContactUseCase(ContactRepository contactRepository) {
        this.contactRepository = contactRepository;
    }

    public Contact execute(long id) {
        return contactRepository.findById(id);
    }

}