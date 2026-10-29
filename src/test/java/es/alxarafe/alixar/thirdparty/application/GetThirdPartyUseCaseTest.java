package es.alxarafe.alixar.thirdparty.application;

import es.alxarafe.alixar.core.application.ErrorCode;
import es.alxarafe.alixar.thirdparty.domain.ThirdParty;
import java.util.Optional;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

class GetThirdPartyUseCaseTest {

    private final ThirdPartyRepository repository = mock(ThirdPartyRepository.class);
    private final GetThirdPartyUseCase useCase = new GetThirdPartyUseCase(repository);

    @Test
    void returnsExistingThirdParty() {
        ThirdParty thirdParty = new ThirdParty(
            42L,
            "Acme",
            true,
            false,
            true,
            true,
            null,
            null,
            null,
            null,
            null,
            "ES",
            null,
            null,
            null
        );
        when(repository.findById(42L)).thenReturn(Optional.of(thirdParty));

        assertThat(useCase.execute(42L)).isSameAs(thirdParty);
    }

    @Test
    void rejectsNonPositiveIdentifiers() {
        assertThatThrownBy(() -> useCase.execute(0L))
            .isInstanceOfSatisfying(InvalidThirdPartyDataException.class, exception -> {
                assertThat(exception.errorCode()).isEqualTo(ErrorCode.VALIDATION_INVALID);
                assertThat(exception.field()).isEqualTo(ThirdPartyFieldNames.ID);
            });
        assertThatThrownBy(() -> useCase.execute(-1L))
            .isInstanceOf(InvalidThirdPartyDataException.class);
    }

    @Test
    void rejectsUnknownPositiveIdentifier() {
        when(repository.findById(404L)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> useCase.execute(404L))
            .isInstanceOf(ThirdPartyNotFoundException.class)
            .hasMessageContaining("THIRD_PARTY_NOT_FOUND:404");
    }
}
