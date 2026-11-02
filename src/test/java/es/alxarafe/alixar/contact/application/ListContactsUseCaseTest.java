package es.alxarafe.alixar.contact.application;

import es.alxarafe.alixar.contact.domain.Contact;
import es.alxarafe.alixar.core.application.ErrorCode;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class ListContactsUseCaseTest {

    private final ContactRepository repository = mock(ContactRepository.class);
    private final ListContactsUseCase useCase = new ListContactsUseCase(repository);

    @Test
    void appliesDefaultPaginationAndForwardsQueryToRepository() {
        ContactPage page = new ContactPage(List.of(), 0, 20, 0);
        when(repository.findPage(any())).thenReturn(page);

        ContactPage result = useCase.execute(ContactListQuery.of(null, null, null));

        assertThat(result).isSameAs(page);
        assertThat(capturedQuery()).isEqualTo(new ContactListQuery(0, 20, null));
    }

    @Test
    void forwardsRequestedPageSizeAndThirdPartyFilter() {
        when(repository.findPage(any())).thenReturn(new ContactPage(List.of(), 2, 5, 0));

        ContactPage result = useCase.execute(ContactListQuery.of(2, 5, 42L));

        assertThat(result.page()).isEqualTo(2);
        assertThat(result.size()).isEqualTo(5);
        assertThat(capturedQuery()).isEqualTo(new ContactListQuery(2, 5, 42L));
    }

    @Test
    void preservesTotalIndependentFromPageItemCount() {
        Contact contact = new Contact(7L, "Doe", "John", "john@example.test", 42L);
        when(repository.findPage(any()))
            .thenReturn(new ContactPage(List.of(contact), 0, 1, 42));

        ContactPage result = useCase.execute(ContactListQuery.of(0, 1, 42L));

        assertThat(result.items()).containsExactly(contact);
        assertThat(result.total()).isEqualTo(42);
    }

    @Test
    void rejectsNegativePage() {
        assertThatThrownBy(() -> ContactListQuery.of(-1, null, null))
            .isInstanceOfSatisfying(InvalidContactDataException.class, exception -> {
                assertThat(exception.errorCode()).isEqualTo(ErrorCode.VALIDATION_INVALID);
                assertThat(exception.field()).isEqualTo(ContactFieldNames.PAGE);
            });
    }

    @Test
    void rejectsSizeOutsideSupportedRange() {
        for (int size : List.of(0, 101)) {
            assertThatThrownBy(() -> ContactListQuery.of(null, size, null))
                .isInstanceOfSatisfying(InvalidContactDataException.class, exception -> {
                    assertThat(exception.errorCode()).isEqualTo(ErrorCode.VALIDATION_INVALID);
                    assertThat(exception.field()).isEqualTo(ContactFieldNames.SIZE);
                });
        }
    }

    @Test
    void rejectsNonPositiveThirdPartyId() {
        for (long thirdPartyId : List.of(0L, -1L)) {
            assertThatThrownBy(() -> ContactListQuery.of(null, null, thirdPartyId))
                .isInstanceOfSatisfying(InvalidContactDataException.class, exception -> {
                    assertThat(exception.errorCode()).isEqualTo(ErrorCode.VALIDATION_INVALID);
                    assertThat(exception.field()).isEqualTo(ContactFieldNames.THIRD_PARTY_ID);
                });
        }
    }

    private ContactListQuery capturedQuery() {
        ArgumentCaptor<ContactListQuery> captor =
            ArgumentCaptor.forClass(ContactListQuery.class);
        verify(repository).findPage(captor.capture());
        return captor.getValue();
    }
}
