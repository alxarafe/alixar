package es.alxarafe.alixar.contact.infrastructure.dolibarr;

import es.alxarafe.alixar.contact.application.ContactNotFoundException;
import es.alxarafe.alixar.contact.application.ContactRepository;
import es.alxarafe.alixar.contact.application.CreateContactCommand;
import es.alxarafe.alixar.contact.application.InvalidThirdPartyReferenceException;
import es.alxarafe.alixar.contact.domain.Contact;
import org.springframework.http.HttpStatus;
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
                .onStatus(org.springframework.http.HttpStatusCode::is4xxClientError, (request, response) -> {
                    if (response.getStatusCode().value() == 404) {
                        throw new ContactNotFoundException(id);
                    }
                })
                .body(DolibarrContactDto.class);
            return mapToContact(dto);
        } catch (org.springframework.web.client.HttpClientErrorException.NotFound e) {
            throw new ContactNotFoundException(id);
        } catch (Exception e) {
            throw new DolibarrAdapterException("Failed to retrieve contact from Dolibarr", e);
        }
    }

    @Override
    public long create(CreateContactCommand command) {
        DolibarrCreateContactDto request = toDolibarrRequest(command);
        try {
            Integer createdId = restClient.post()
                .uri("/contacts")
                .body(request)
                .retrieve()
                .body(Integer.class);
            if (createdId == null || createdId <= 0) {
                throw new DolibarrAdapterException("Dolibarr returned invalid contact ID: " + createdId, new IllegalStateException("Invalid ID: " + createdId));
            }
            return createdId.longValue();
        } catch (DolibarrAdapterException e) {
            throw e;
        } catch (org.springframework.web.client.HttpClientErrorException e) {
            if (e.getStatusCode() == org.springframework.http.HttpStatus.NOT_FOUND) {
                String body = e.getResponseBodyAsString();
                if (body != null && body.contains("Thirdparty") && body.contains("not found")) {
                    throw new InvalidThirdPartyReferenceException("Invalid third party reference");
                }
                throw new DolibarrAdapterException("Dolibarr returned 404 during contact creation: " + e.getResponseBodyAsString(), e);
            }
            if (e.getStatusCode() == org.springframework.http.HttpStatus.BAD_REQUEST) {
                throw new DolibarrAdapterException("Dolibarr validation error: " + e.getResponseBodyAsString(), e);
            }
            throw new DolibarrAdapterException("Failed to create contact in Dolibarr", e);
        } catch (Exception e) {
            throw new DolibarrAdapterException("Failed to create contact in Dolibarr", e);
        }
    }

    private DolibarrCreateContactDto toDolibarrRequest(CreateContactCommand command) {
        return new DolibarrCreateContactDto(
            command.lastName(),
            command.firstName(),
            command.email(),
            command.thirdPartyId()
        );
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