package es.alxarafe.alixar.contact.application;

import es.alxarafe.alixar.contact.domain.Contact;
import es.alxarafe.alixar.core.application.ErrorCode;
import java.util.List;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class DeleteContactUseCaseTest {

    private static final long ID = 42L;
    private static final Contact EXISTING = new Contact(
        ID,
        "Doe",
        "John",
        "john@example.test",
        10L
    );

    private final ContactRepository repository = mock(ContactRepository.class);
    private final DeleteContactUseCase useCase = new DeleteContactUseCase(repository);

    @Test
    void deletesExistingContact() {
        when(repository.findById(ID)).thenReturn(EXISTING);
        when(repository.deleteById(ID)).thenReturn(1);

        useCase.execute(ID);

        verify(repository).deleteById(ID);
    }

    @Test
    void rejectsMissingContact() {
        when(repository.findById(404L))
            .thenThrow(new ContactNotFoundException(404L));

        assertThatThrownBy(() -> useCase.execute(404L))
            .isInstanceOf(ContactNotFoundException.class)
            .hasMessageContaining("CONTACT_NOT_FOUND:404");
        verify(repository, never()).deleteById(404L);
    }

    @Test
    void rejectsNonPositiveIdentifier() {
        for (long id : List.of(0L, -1L)) {
            assertThatThrownBy(() -> useCase.execute(id))
                .isInstanceOfSatisfying(InvalidContactDataException.class, exception -> {
                    assertThat(exception.errorCode()).isEqualTo(ErrorCode.VALIDATION_INVALID);
                    assertThat(exception.field()).isEqualTo(ContactFieldNames.ID);
                });
        }
        verify(repository, never()).deleteById(0L);
        verify(repository, never()).deleteById(-1L);
    }

    @Test
    void reportsNotFoundWhenConcurrentDeleteRemovesTheRow() {
        when(repository.findById(ID)).thenReturn(EXISTING);
        when(repository.deleteById(ID)).thenReturn(0);

        assertThatThrownBy(() -> useCase.execute(ID))
            .isInstanceOf(ContactNotFoundException.class)
            .hasMessageContaining("CONTACT_NOT_FOUND:42");
    }
}
