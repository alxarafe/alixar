package es.alxarafe.alixar.contact.infrastructure.dolibarr;

import es.alxarafe.alixar.contact.application.CreateContactCommand;
import es.alxarafe.alixar.contact.application.ContactNotFoundException;
import es.alxarafe.alixar.contact.application.InvalidThirdPartyReferenceException;
import es.alxarafe.alixar.contact.domain.Contact;
import es.alxarafe.alixar.contact.infrastructure.dolibarr.DolibarrAdapterException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestClient;

import java.nio.charset.StandardCharsets;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.mockito.Mockito.lenient;

@ExtendWith(MockitoExtension.class)
class DolibarrContactAdapterTest {

    @Mock
    RestClient restClient;

    @Mock
    RestClient.RequestHeadersUriSpec getRequestHeadersUriSpec;

    @Mock
    RestClient.RequestBodyUriSpec postRequestBodyUriSpec;

    @Mock
    RestClient.RequestBodySpec postRequestBodySpec;

    @Mock
    RestClient.RequestHeadersSpec requestHeadersSpec;

    @Mock
    RestClient.ResponseSpec responseSpec;

    private DolibarrContactAdapter adapter;

    @BeforeEach
    void setUp() {
        adapter = new DolibarrContactAdapter(restClient);
        // Shared chain setup - lenient because not all tests use every link
        lenient().when(restClient.get()).thenReturn(getRequestHeadersUriSpec);
        lenient().when(getRequestHeadersUriSpec.uri(eq("/contacts/{id}"), anyLong())).thenReturn(getRequestHeadersUriSpec);
        lenient().when(getRequestHeadersUriSpec.retrieve()).thenReturn(responseSpec);
        lenient().when(responseSpec.onStatus(any(), any())).thenReturn(responseSpec);

        lenient().when(restClient.post()).thenReturn(postRequestBodyUriSpec);
        lenient().when(postRequestBodyUriSpec.uri("/contacts")).thenReturn(postRequestBodyUriSpec);
        lenient().when(postRequestBodyUriSpec.body(any(DolibarrCreateContactDto.class))).thenReturn(postRequestBodySpec);
        lenient().when(postRequestBodySpec.retrieve()).thenReturn(responseSpec);
        lenient().when(responseSpec.onStatus(any(), any())).thenReturn(responseSpec);
    }

    @Test
    void findById_existingContact_returnsContact() {
        DolibarrContactDto dto = new DolibarrContactDto(1L, "Doe", "John", "john@example.test", 42L, 42L);
        when(responseSpec.body(DolibarrContactDto.class)).thenReturn(dto);

        Contact contact = adapter.findById(1L);

        assertThat(contact.id()).isEqualTo(1L);
        assertThat(contact.lastName()).isEqualTo("Doe");
        assertThat(contact.firstName()).isEqualTo("John");
        assertThat(contact.email()).isEqualTo("john@example.test");
        assertThat(contact.thirdPartyId()).isEqualTo(42L);
    }

    @Test
    void findById_notFound_throwsContactNotFoundException() {
        HttpClientErrorException notFound = HttpClientErrorException.create(HttpStatus.NOT_FOUND, "Not Found", new HttpHeaders(), null, StandardCharsets.UTF_8);
        when(responseSpec.body(DolibarrContactDto.class)).thenThrow(notFound);

        assertThatThrownBy(() -> adapter.findById(999L))
            .isInstanceOf(ContactNotFoundException.class)
            .hasMessageContaining("999");
    }

    @Test
    void findById_other4xx_throwsDolibarrAdapterException() {
        HttpClientErrorException unauthorized = HttpClientErrorException.create(HttpStatus.UNAUTHORIZED, "Unauthorized", new HttpHeaders(), null, StandardCharsets.UTF_8);
        when(responseSpec.body(DolibarrContactDto.class)).thenThrow(unauthorized);

        assertThatThrownBy(() -> adapter.findById(3L))
            .isInstanceOf(DolibarrAdapterException.class)
            .hasMessageContaining("Failed to retrieve contact from Dolibarr");
    }

    @Test
    void findById_unexpectedException_throwsDolibarrAdapterException() {
        when(responseSpec.body(DolibarrContactDto.class)).thenThrow(new RuntimeException("Connection timeout"));

        assertThatThrownBy(() -> adapter.findById(3L))
            .isInstanceOf(DolibarrAdapterException.class)
            .hasMessageContaining("Failed to retrieve contact from Dolibarr");
    }

    @Test
    void create_standaloneContact_mapsCanonicalToLegacyRequest() {
        when(responseSpec.body(Integer.class)).thenReturn(42);

        long createdId = adapter.create(new CreateContactCommand("Doe", "John", "john@example.test", null));

        assertThat(createdId).isEqualTo(42L);
        verify(postRequestBodyUriSpec).body(new DolibarrCreateContactDto("Doe", "John", "john@example.test", null));
    }

    @Test
    void create_withThirdParty_mapsThirdPartyIdToSocid() {
        when(responseSpec.body(Integer.class)).thenReturn(43);

        long createdId = adapter.create(new CreateContactCommand("Doe", "John", "john@example.test", 42L));

        assertThat(createdId).isEqualTo(43L);
        verify(postRequestBodyUriSpec).body(new DolibarrCreateContactDto("Doe", "John", "john@example.test", 42L));
    }

    @Test
    void create_upstreamReturnsValidId_returnsParsedId() {
        when(responseSpec.body(Integer.class)).thenReturn(123);

        long createdId = adapter.create(new CreateContactCommand("Doe", "John", "john@example.test", null));

        assertThat(createdId).isEqualTo(123L);
    }

    @Test
    void create_upstreamReturnsNull_throwsDolibarrAdapterException() {
        when(responseSpec.body(Integer.class)).thenReturn(null);

        assertThatThrownBy(() -> adapter.create(new CreateContactCommand("Doe", "John", "john@example.test", null)))
            .isInstanceOf(DolibarrAdapterException.class)
            .hasMessageContaining("Dolibarr returned invalid contact ID: null");
    }

    @Test
    void create_upstreamReturnsZero_throwsDolibarrAdapterException() {
        when(responseSpec.body(Integer.class)).thenReturn(0);

        assertThatThrownBy(() -> adapter.create(new CreateContactCommand("Doe", "John", "john@example.test", null)))
            .isInstanceOf(DolibarrAdapterException.class)
            .hasMessageContaining("Dolibarr returned invalid contact ID: 0");
    }

    @Test
    void create_upstream400_validationError_throwsDolibarrAdapterException() {
        HttpHeaders headers = new HttpHeaders();
        HttpClientErrorException badRequest = HttpClientErrorException.create(HttpStatus.BAD_REQUEST, "Bad Request", headers, "Validation error".getBytes(), StandardCharsets.UTF_8);
        when(responseSpec.body(Integer.class)).thenThrow(badRequest);

        assertThatThrownBy(() -> adapter.create(new CreateContactCommand("Doe", "John", "john@example.test", 999L)))
            .isInstanceOf(DolibarrAdapterException.class)
            .hasMessageContaining("Dolibarr validation error: Validation error");
    }

    @Test
    void create_upstream422_unrelated_throwsDolibarrAdapterException() {
        HttpHeaders headers = new HttpHeaders();
        HttpClientErrorException unprocessable = HttpClientErrorException.create(HttpStatus.UNPROCESSABLE_ENTITY, "Unprocessable Entity", headers, "Unprocessable".getBytes(), StandardCharsets.UTF_8);
        when(responseSpec.body(Integer.class)).thenThrow(unprocessable);

        assertThatThrownBy(() -> adapter.create(new CreateContactCommand("Doe", "John", "john@example.test", 999L)))
            .isInstanceOf(DolibarrAdapterException.class)
            .hasMessageContaining("Failed to create contact in Dolibarr");
    }

    @Test
    void create_upstream404_thirdPartyNotFound_throwsInvalidThirdPartyReferenceException() {
        HttpHeaders headers = new HttpHeaders();
        HttpClientErrorException notFound = new HttpClientErrorException(HttpStatus.NOT_FOUND, "Not Found", headers, "Thirdparty not found".getBytes(), StandardCharsets.UTF_8);
        when(responseSpec.body(Integer.class)).thenThrow(notFound);

        assertThatThrownBy(() -> adapter.create(new CreateContactCommand("Doe", "John", "john@example.test", 999L)))
            .isInstanceOf(InvalidThirdPartyReferenceException.class)
            .hasMessageContaining("Invalid third party reference");
    }

    @Test
    void create_upstream404_unrelated_throwsDolibarrAdapterException() {
        HttpHeaders headers = new HttpHeaders();
        HttpClientErrorException notFound = new HttpClientErrorException(HttpStatus.NOT_FOUND, "Not Found", headers, "Resource not found".getBytes(), StandardCharsets.UTF_8);
        when(responseSpec.body(Integer.class)).thenThrow(notFound);

        assertThatThrownBy(() -> adapter.create(new CreateContactCommand("Doe", "John", "john@example.test", 999L)))
            .isInstanceOf(DolibarrAdapterException.class)
            .hasMessageContaining("Dolibarr returned 404 during contact creation: Resource not found");
    }

    @Test
    void create_upstream400_unrelated_throwsDolibarrAdapterException() {
        HttpHeaders headers = new HttpHeaders();
        HttpClientErrorException badRequest = HttpClientErrorException.create(HttpStatus.BAD_REQUEST, "Bad Request", headers, "Some other error".getBytes(), StandardCharsets.UTF_8);
        when(responseSpec.body(Integer.class)).thenThrow(badRequest);

        assertThatThrownBy(() -> adapter.create(new CreateContactCommand("Doe", "John", "john@example.test", 999L)))
            .isInstanceOf(DolibarrAdapterException.class)
            .hasMessageContaining("Dolibarr validation error: Some other error");
    }

    @Test
    void create_unexpectedException_throwsDolibarrAdapterException() {
        when(responseSpec.body(Integer.class)).thenThrow(new RuntimeException("Connection timeout"));

        assertThatThrownBy(() -> adapter.create(new CreateContactCommand("Doe", "John", "john@example.test", null)))
            .isInstanceOf(DolibarrAdapterException.class)
            .hasMessageContaining("Failed to create contact in Dolibarr");
    }
}