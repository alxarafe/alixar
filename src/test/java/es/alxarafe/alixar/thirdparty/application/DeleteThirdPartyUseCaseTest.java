package es.alxarafe.alixar.thirdparty.application;

import es.alxarafe.alixar.core.application.ErrorCode;
import es.alxarafe.alixar.thirdparty.domain.ThirdParty;
import java.util.List;
import java.util.Optional;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class DeleteThirdPartyUseCaseTest {

    private static final long ID = 42L;
    private static final ThirdParty EXISTING = new ThirdParty(
        ID,
        "Acme",
        false,
        false,
        false,
        true,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null
    );

    private final ThirdPartyRepository repository = mock(ThirdPartyRepository.class);
    private final LinkedContactChecker linkedContactChecker = mock(LinkedContactChecker.class);
    private final DeleteThirdPartyUseCase useCase =
        new DeleteThirdPartyUseCase(repository, linkedContactChecker);

    @Test
    void deletesExistingThirdPartyWithoutLinkedContacts() {
        when(repository.findById(ID)).thenReturn(Optional.of(EXISTING));
        when(linkedContactChecker.existsForThirdParty(ID)).thenReturn(false);
        when(repository.deleteById(ID)).thenReturn(1);

        useCase.execute(ID);

        verify(repository).deleteById(ID);
    }

    @Test
    void rejectsMissingThirdParty() {
        when(repository.findById(404L)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> useCase.execute(404L))
            .isInstanceOf(ThirdPartyNotFoundException.class)
            .hasMessageContaining("THIRD_PARTY_NOT_FOUND:404");
        verify(repository, never()).deleteById(404L);
    }

    @Test
    void rejectsThirdPartyWithLinkedContactsWithoutDeleting() {
        when(repository.findById(ID)).thenReturn(Optional.of(EXISTING));
        when(linkedContactChecker.existsForThirdParty(ID)).thenReturn(true);

        assertThatThrownBy(() -> useCase.execute(ID))
            .isInstanceOfSatisfying(ThirdPartyDeleteConflictException.class, exception ->
                assertThat(exception.errorCode())
                    .isEqualTo(ThirdPartyErrorCode.THIRD_PARTY_DELETE_CONFLICT)
            );
        verify(repository, never()).deleteById(ID);
    }

    @Test
    void rejectsNonPositiveIdentifier() {
        for (long id : List.of(0L, -1L)) {
            assertThatThrownBy(() -> useCase.execute(id))
                .isInstanceOfSatisfying(InvalidThirdPartyDataException.class, exception -> {
                    assertThat(exception.errorCode())
                        .isEqualTo(ErrorCode.VALIDATION_INVALID);
                    assertThat(exception.field())
                        .isEqualTo(ThirdPartyFieldNames.ID);
                });
        }
        verify(repository, never()).deleteById(0L);
        verify(repository, never()).deleteById(-1L);
    }

    @Test
    void reportsNotFoundWhenConcurrentDeleteRemovesTheRow() {
        when(repository.findById(ID)).thenReturn(Optional.of(EXISTING));
        when(linkedContactChecker.existsForThirdParty(ID)).thenReturn(false);
        when(repository.deleteById(ID)).thenReturn(0);

        assertThatThrownBy(() -> useCase.execute(ID))
            .isInstanceOf(ThirdPartyNotFoundException.class);
    }
}
