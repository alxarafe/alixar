package es.alxarafe.alixar.contact.infrastructure.dolibarr;

import es.alxarafe.alixar.contact.application.ContactNotFoundException;
import es.alxarafe.alixar.contact.application.ContactRepository;
import es.alxarafe.alixar.contact.domain.Contact;
import org.springframework.http.HttpStatusCode;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestClient;

class DolibarrContactAdapter implements ContactRepository {

    private final RestClient restClient;

    DolibarrContactAdapter(String baseUrl, String apiKey) {
        this(RestClient.builder()
            .baseUrl(baseUrl)
            .defaultHeader("DOLAPIKEY", apiKey)
            .build());
    }

    DolibarrContactAdapter(RestClient restClient) {
        this.restClient = restClient;
    }

    @Override
    public Contact findById(long id) {
        try {
            DolibarrContactDto dto = restClient.get()
                .uri("/contacts/{id}", id)
                .retrieve()
                .onStatus(HttpStatusCode::is4xxClientError, (request, response) -> {
                    if (response.getStatusCode().value() == 404) {
                        throw new ContactNotFoundException(id);
                    }
                })
                .body(DolibarrContactDto.class);
            return mapToContact(dto);
        } catch (HttpClientErrorException.NotFound e) {
            throw new ContactNotFoundException(id);
        } catch (Exception e) {
            throw new DolibarrAdapterException("Failed to retrieve contact from Dolibarr", e);
        }
    }

    private Contact mapToContact(DolibarrContactDto dto) {
        return new Contact(
            dto.id(),
            dto.lastname(),
            dto.firstname(),
            dto.email(),
            dto.thirdPartyId()
        );
    }

}