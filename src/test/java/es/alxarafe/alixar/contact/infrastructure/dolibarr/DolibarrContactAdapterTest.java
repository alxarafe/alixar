package es.alxarafe.alixar.contact.infrastructure.dolibarr;

import es.alxarafe.alixar.contact.application.ContactNotFoundException;
import es.alxarafe.alixar.contact.domain.Contact;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpStatus;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestClient;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class DolibarrContactAdapterTest {

    @Mock
    RestClient restClient;

    @Mock
    RestClient.RequestHeadersUriSpec requestHeadersUriSpec;

    @Mock
    RestClient.RequestHeadersSpec requestHeadersSpec;

    @Mock
    RestClient.ResponseSpec responseSpec;

    private DolibarrContactAdapter createAdapter() {
        return new DolibarrContactAdapter(restClient);
    }

    @Test
    void findById_mapsDolibarrResponseToCanonicalContact() {
        DolibarrContactDto dto = new DolibarrContactDto(3L, "Doe", "John", "john@example.test", null, null);

        when(restClient.get()).thenReturn(requestHeadersUriSpec);
        when(requestHeadersUriSpec.uri("/contacts/{id}", 3L)).thenReturn(requestHeadersSpec);
        when(requestHeadersSpec.retrieve()).thenReturn(responseSpec);
        when(responseSpec.onStatus(any(), any())).thenReturn(responseSpec);
        when(responseSpec.body(DolibarrContactDto.class)).thenReturn(dto);

        DolibarrContactAdapter adapter = createAdapter();
        Contact contact = adapter.findById(3L);

        assertThat(contact.id()).isEqualTo(3L);
        assertThat(contact.lastName()).isEqualTo("Doe");
        assertThat(contact.firstName()).isEqualTo("John");
        assertThat(contact.email()).isEqualTo("john@example.test");
        assertThat(contact.thirdPartyId()).isNull();

        verify(restClient).get();
    }

    @Test
    void findById_withThirdParty_mapsFkSocToThirdPartyId() {
        DolibarrContactDto dto = new DolibarrContactDto(3L, "Doe", "John", "john@example.test", 42L, null);

        when(restClient.get()).thenReturn(requestHeadersUriSpec);
        when(requestHeadersUriSpec.uri("/contacts/{id}", 3L)).thenReturn(requestHeadersSpec);
        when(requestHeadersSpec.retrieve()).thenReturn(responseSpec);
        when(responseSpec.onStatus(any(), any())).thenReturn(responseSpec);
        when(responseSpec.body(DolibarrContactDto.class)).thenReturn(dto);

        DolibarrContactAdapter adapter = createAdapter();
        Contact contact = adapter.findById(3L);

        assertThat(contact.thirdPartyId()).isEqualTo(42L);
    }

    @Test
    void findById_withSocidAlias_mapsSocidToThirdPartyId() {
        DolibarrContactDto dto = new DolibarrContactDto(3L, "Doe", "John", "john@example.test", null, 42L);

        when(restClient.get()).thenReturn(requestHeadersUriSpec);
        when(requestHeadersUriSpec.uri("/contacts/{id}", 3L)).thenReturn(requestHeadersSpec);
        when(requestHeadersSpec.retrieve()).thenReturn(responseSpec);
        when(responseSpec.onStatus(any(), any())).thenReturn(responseSpec);
        when(responseSpec.body(DolibarrContactDto.class)).thenReturn(dto);

        DolibarrContactAdapter adapter = createAdapter();
        Contact contact = adapter.findById(3L);

        assertThat(contact.thirdPartyId()).isEqualTo(42L);
    }

    @Test
    void findById_upstream404_throwsContactNotFoundException() {
        HttpClientErrorException notFound = HttpClientErrorException.create(HttpStatus.NOT_FOUND, "Not Found", null, null, null);

        when(restClient.get()).thenReturn(requestHeadersUriSpec);
        when(requestHeadersUriSpec.uri("/contacts/{id}", 999L)).thenReturn(requestHeadersSpec);
        when(requestHeadersSpec.retrieve()).thenReturn(responseSpec);
        when(responseSpec.onStatus(any(), any())).thenReturn(responseSpec);
        when(responseSpec.body(DolibarrContactDto.class)).thenThrow(notFound);

        DolibarrContactAdapter adapter = createAdapter();

        assertThatThrownBy(() -> adapter.findById(999L))
            .isInstanceOf(ContactNotFoundException.class)
            .hasMessageContaining("999");
    }

    @Test
    void findById_other4xx_throwsDolibarrAdapterException() {
        HttpClientErrorException unauthorized = HttpClientErrorException.create(HttpStatus.UNAUTHORIZED, "Unauthorized", null, null, null);

        when(restClient.get()).thenReturn(requestHeadersUriSpec);
        when(requestHeadersUriSpec.uri("/contacts/{id}", 3L)).thenReturn(requestHeadersSpec);
        when(requestHeadersSpec.retrieve()).thenReturn(responseSpec);
        when(responseSpec.onStatus(any(), any())).thenReturn(responseSpec);
        when(responseSpec.body(DolibarrContactDto.class)).thenThrow(unauthorized);

        DolibarrContactAdapter adapter = createAdapter();

        assertThatThrownBy(() -> adapter.findById(3L))
            .isInstanceOf(DolibarrAdapterException.class)
            .hasMessageContaining("Failed to retrieve contact from Dolibarr");
    }

    @Test
    void findById_unexpectedException_throwsDolibarrAdapterException() {
        when(restClient.get()).thenReturn(requestHeadersUriSpec);
        when(requestHeadersUriSpec.uri("/contacts/{id}", 3L)).thenReturn(requestHeadersSpec);
        when(requestHeadersSpec.retrieve()).thenReturn(responseSpec);
        when(responseSpec.onStatus(any(), any())).thenReturn(responseSpec);
        when(responseSpec.body(DolibarrContactDto.class)).thenThrow(new RuntimeException("Connection timeout"));

        DolibarrContactAdapter adapter = createAdapter();

        assertThatThrownBy(() -> adapter.findById(3L))
            .isInstanceOf(DolibarrAdapterException.class)
            .hasMessageContaining("Failed to retrieve contact from Dolibarr");
    }

}