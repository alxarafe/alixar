package es.alxarafe.alixar.thirdparty.application;

import es.alxarafe.alixar.core.application.ErrorCode;
import es.alxarafe.alixar.thirdparty.domain.NewThirdParty;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class CreateThirdPartyUseCaseTest {

    private final ThirdPartyRepository repository = mock(ThirdPartyRepository.class);
    private final CreateThirdPartyUseCase useCase = new CreateThirdPartyUseCase(repository);

    @Test
    void appliesDefaultsAndNormalizesOptionalText() {
        when(repository.create(org.mockito.ArgumentMatchers.any())).thenReturn(42L);

        long id = useCase.execute(new CreateThirdPartyCommand(
            "  Acme Ibérica, S.L.  ",
            null,
            null,
            null,
            null,
            "  B12345678 ",
            " ",
            null,
            " 28001 ",
            "",
            " es ",
            " info@example.test ",
            null,
            " https://example.test "
        ));

        assertThat(id).isEqualTo(42L);
        ArgumentCaptor<NewThirdParty> captor = ArgumentCaptor.forClass(NewThirdParty.class);
        verify(repository).create(captor.capture());
        assertThat(captor.getValue()).isEqualTo(new NewThirdParty(
            "Acme Ibérica, S.L.",
            false,
            false,
            false,
            true,
            "B12345678",
            null,
            null,
            "28001",
            null,
            "ES",
            "info@example.test",
            null,
            "https://example.test"
        ));
    }

    @Test
    void preservesExplicitBooleanValues() {
        when(repository.create(org.mockito.ArgumentMatchers.any())).thenReturn(7L);

        useCase.execute(new CreateThirdPartyCommand(
            "Acme",
            true,
            true,
            true,
            false,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null
        ));

        ArgumentCaptor<NewThirdParty> captor = ArgumentCaptor.forClass(NewThirdParty.class);
        verify(repository).create(captor.capture());
        assertThat(captor.getValue().customer()).isTrue();
        assertThat(captor.getValue().prospect()).isTrue();
        assertThat(captor.getValue().supplier()).isTrue();
        assertThat(captor.getValue().active()).isFalse();
    }

    @Test
    void rejectsMissingOrBlankName() {
        assertThatThrownBy(() -> useCase.execute(command(null)))
            .isInstanceOfSatisfying(InvalidThirdPartyDataException.class, exception -> {
                assertThat(exception.errorCode()).isEqualTo(ErrorCode.VALIDATION_REQUIRED);
                assertThat(exception.field()).isEqualTo(ThirdPartyFieldNames.NAME);
            });
        assertThatThrownBy(() -> useCase.execute(command("   ")))
            .isInstanceOfSatisfying(InvalidThirdPartyDataException.class, exception ->
                assertThat(exception.errorCode()).isEqualTo(ErrorCode.VALIDATION_REQUIRED)
            );
    }

    @Test
    void rejectsValuesExceedingStorageLimits() {
        assertThatThrownBy(() -> useCase.execute(command("x".repeat(129))))
            .isInstanceOfSatisfying(InvalidThirdPartyDataException.class, exception -> {
                assertThat(exception.errorCode()).isEqualTo(ErrorCode.VALIDATION_INVALID);
                assertThat(exception.field()).isEqualTo(ThirdPartyFieldNames.NAME);
            });
        assertThatThrownBy(() -> useCase.execute(new CreateThirdPartyCommand(
            "Acme",
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            "ESP",
            null,
            null,
            null
        )))
            .isInstanceOfSatisfying(InvalidThirdPartyDataException.class, exception -> {
                assertThat(exception.errorCode()).isEqualTo(ErrorCode.VALIDATION_INVALID);
                assertThat(exception.field()).isEqualTo(ThirdPartyFieldNames.COUNTRY_CODE);
            });
    }

    private CreateThirdPartyCommand command(String name) {
        return new CreateThirdPartyCommand(
            name,
            null,
            null,
            null,
            null,
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
    }
}
