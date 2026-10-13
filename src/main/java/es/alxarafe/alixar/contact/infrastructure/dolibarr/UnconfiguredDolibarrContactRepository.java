package es.alxarafe.alixar.contact.infrastructure.dolibarr;

import es.alxarafe.alixar.contact.application.ContactRepository;
import es.alxarafe.alixar.contact.domain.Contact;

class UnconfiguredDolibarrContactRepository implements ContactRepository {

    @Override
    public Contact findById(long id) {
        throw new IllegalStateException("Dolibarr integration not configured. Set ALIXAR_DOLIBARR_BASE_URL and ALIXAR_DOLIBARR_API_KEY.");
    }

}