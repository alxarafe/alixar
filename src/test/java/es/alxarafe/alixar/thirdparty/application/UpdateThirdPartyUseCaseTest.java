package es.alxarafe.alixar.thirdparty.application;

import es.alxarafe.alixar.core.application.ErrorCode;
import es.alxarafe.alixar.thirdparty.domain.ThirdParty;
import java.util.List;
import java.util.Optional;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.ACTIVE;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.CUSTOMER;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.PROSPECT;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.SUPPLIER;
import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class UpdateThirdPartyUseCaseTest {

    private static final ThirdParty EXISTING = new ThirdParty(
        42L,
        "Acme",
        false,
        false,
        false,
        true,
        "B12345678",
        "ESB12345678",
        "Calle Mayor 1",
        "28001",
        "Madrid",
        "ES",
        "info@example.test",
        "+34 900 000 000",
        "https://example.test"
    );

    private final ThirdPartyRepository repository = mock(ThirdPartyRepository.class);
    private final UpdateThirdPartyUseCase useCase = new UpdateThirdPartyUseCase(repository);

    @BeforeEach
    void setUp() {
        when(repository.findById(42L)).thenReturn(Optional.of(EXISTING));
    }

    @Test
    void updatesOnlyName() {
        UpdateThirdPartyResult result = useCase.execute(42L, builder().name("New Name").build());

        assertThat(result.changed()).isTrue();
        assertThat(result.thirdParty().name()).isEqualTo("New Name");
        assertThat(result.thirdParty().email()).isEqualTo(EXISTING.email());
        verifyUpdated(result.thirdParty());
    }

    @Test
    void updatesOnlyBoolean() {
        UpdateThirdPartyResult result = useCase.execute(42L, builder().active(false).build());

        assertThat(result.changed()).isTrue();
        assertThat(result.thirdParty().active()).isFalse();
        assertThat(result.thirdParty().name()).isEqualTo(EXISTING.name());
        verifyUpdated(result.thirdParty());
    }

    @Test
    void updatesMultipleFields() {
        UpdateThirdPartyResult result = useCase.execute(
            42L,
            builder()
                .name("Acme Updated")
                .customer(true)
                .supplier(true)
                .email("updated@example.test")
                .build()
        );

        assertThat(result.changed()).isTrue();
        assertThat(result.thirdParty()).satisfies(thirdParty -> {
            assertThat(thirdParty.name()).isEqualTo("Acme Updated");
            assertThat(thirdParty.customer()).isTrue();
            assertThat(thirdParty.supplier()).isTrue();
            assertThat(thirdParty.email()).isEqualTo("updated@example.test");
            assertThat(thirdParty.town()).isEqualTo(EXISTING.town());
        });
        verifyUpdated(result.thirdParty());
    }

    @Test
    void clearsOptionalFieldWithPresentNull() {
        UpdateThirdPartyResult result = useCase.execute(42L, builder().email(null).build());

        assertThat(result.changed()).isTrue();
        assertThat(result.thirdParty().email()).isNull();
        assertThat(result.thirdParty().phone()).isEqualTo(EXISTING.phone());
        verifyUpdated(result.thirdParty());
    }

    @Test
    void omittedOptionalFieldRemainsUnchanged() {
        UpdateThirdPartyResult result = useCase.execute(42L, builder().name("New Name").build());

        assertThat(result.thirdParty().taxIdentifier()).isEqualTo(EXISTING.taxIdentifier());
        assertThat(result.thirdParty().address()).isEqualTo(EXISTING.address());
        assertThat(result.thirdParty().email()).isEqualTo(EXISTING.email());
    }

    @Test
    void blankOptionalFieldBecomesNull() {
        UpdateThirdPartyResult result = useCase.execute(42L, builder().address("   ").build());

        assertThat(result.thirdParty().address()).isNull();
        verifyUpdated(result.thirdParty());
    }

    @Test
    void uppercasesCountryCode() {
        UpdateThirdPartyResult result = useCase.execute(42L, builder().countryCode(" fr ").build());

        assertThat(result.thirdParty().countryCode()).isEqualTo("FR");
        verifyUpdated(result.thirdParty());
    }

    @Test
    void trimsName() {
        UpdateThirdPartyResult result = useCase.execute(42L, builder().name("  New Name  ").build());

        assertThat(result.thirdParty().name()).isEqualTo("New Name");
        verifyUpdated(result.thirdParty());
    }

    @Test
    void rejectsNullAndBlankName() {
        for (String value : java.util.Arrays.asList(null, "   ")) {
            assertThatThrownBy(() -> useCase.execute(42L, builder().name(value).build()))
                .isInstanceOfSatisfying(InvalidThirdPartyDataException.class, exception -> {
                    assertThat(exception.errorCode()).isEqualTo(ErrorCode.VALIDATION_REQUIRED);
                    assertThat(exception.field()).isEqualTo(ThirdPartyFieldNames.NAME);
                });
        }
        verify(repository, never()).update(any(ThirdParty.class));
    }

    @Test
    void rejectsNullNonNullableBooleans() {
        List<UpdateThirdPartyCommand> commands = List.of(
            builder().customer(null).build(),
            builder().prospect(null).build(),
            builder().supplier(null).build(),
            builder().active(null).build()
        );
        List<String> fields = List.of(CUSTOMER, PROSPECT, SUPPLIER, ACTIVE);

        for (int index = 0; index < commands.size(); index++) {
            UpdateThirdPartyCommand command = commands.get(index);
            String field = fields.get(index);
            assertThatThrownBy(() -> useCase.execute(42L, command))
                .isInstanceOfSatisfying(InvalidThirdPartyDataException.class, exception -> {
                    assertThat(exception.errorCode()).isEqualTo(ErrorCode.VALIDATION_INVALID);
                    assertThat(exception.field()).isEqualTo(field);
                });
        }
        verify(repository, never()).update(any(ThirdParty.class));
    }

    @Test
    void rejectsNonPositiveIdentifier() {
        for (long id : List.of(0L, -1L)) {
            assertThatThrownBy(() -> useCase.execute(id, builder().name("New Name").build()))
                .isInstanceOfSatisfying(InvalidThirdPartyDataException.class, exception -> {
                    assertThat(exception.errorCode()).isEqualTo(ErrorCode.VALIDATION_INVALID);
                    assertThat(exception.field()).isEqualTo(ThirdPartyFieldNames.ID);
                });
        }
    }

    @Test
    void rejectsMissingPositiveIdentifier() {
        when(repository.findById(404L)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> useCase.execute(404L, builder().name("New Name").build()))
            .isInstanceOf(ThirdPartyNotFoundException.class)
            .hasMessageContaining("THIRD_PARTY_NOT_FOUND:404");
    }

    @Test
    void emptyPatchIsNoOp() {
        UpdateThirdPartyResult result = useCase.execute(42L, builder().build());

        assertThat(result.changed()).isFalse();
        assertThat(result.thirdParty()).isEqualTo(EXISTING);
        verify(repository, never()).update(any(ThirdParty.class));
    }

    @Test
    void normalizedValueEqualToCurrentValueIsNoOp() {
        UpdateThirdPartyResult result = useCase.execute(42L, builder().name("  Acme  ").build());

        assertThat(result.changed()).isFalse();
        assertThat(result.thirdParty()).isEqualTo(EXISTING);
        verify(repository, never()).update(any(ThirdParty.class));
    }

    @Test
    void detectsRealChangeAfterNormalization() {
        UpdateThirdPartyResult result = useCase.execute(42L, builder().name("  Other  ").build());

        assertThat(result.changed()).isTrue();
        assertThat(result.thirdParty().name()).isEqualTo("Other");
        verifyUpdated(result.thirdParty());
    }

    private void verifyUpdated(ThirdParty expected) {
        ArgumentCaptor<ThirdParty> captor = ArgumentCaptor.forClass(ThirdParty.class);
        verify(repository).update(captor.capture());
        assertThat(captor.getValue()).isEqualTo(expected);
    }

    private CommandBuilder builder() {
        return new CommandBuilder();
    }

    private static final class CommandBuilder {

        private FieldUpdate<String> name = FieldUpdate.absent();
        private FieldUpdate<Boolean> customer = FieldUpdate.absent();
        private FieldUpdate<Boolean> prospect = FieldUpdate.absent();
        private FieldUpdate<Boolean> supplier = FieldUpdate.absent();
        private FieldUpdate<Boolean> active = FieldUpdate.absent();
        private FieldUpdate<String> taxIdentifier = FieldUpdate.absent();
        private FieldUpdate<String> intraCommunityVatNumber = FieldUpdate.absent();
        private FieldUpdate<String> address = FieldUpdate.absent();
        private FieldUpdate<String> postalCode = FieldUpdate.absent();
        private FieldUpdate<String> town = FieldUpdate.absent();
        private FieldUpdate<String> countryCode = FieldUpdate.absent();
        private FieldUpdate<String> email = FieldUpdate.absent();
        private FieldUpdate<String> phone = FieldUpdate.absent();
        private FieldUpdate<String> website = FieldUpdate.absent();

        CommandBuilder name(String value) {
            name = FieldUpdate.of(value);
            return this;
        }

        CommandBuilder customer(Boolean value) {
            customer = FieldUpdate.of(value);
            return this;
        }

        CommandBuilder prospect(Boolean value) {
            prospect = FieldUpdate.of(value);
            return this;
        }

        CommandBuilder supplier(Boolean value) {
            supplier = FieldUpdate.of(value);
            return this;
        }

        CommandBuilder active(Boolean value) {
            active = FieldUpdate.of(value);
            return this;
        }

        CommandBuilder taxIdentifier(String value) {
            taxIdentifier = FieldUpdate.of(value);
            return this;
        }

        CommandBuilder intraCommunityVatNumber(String value) {
            intraCommunityVatNumber = FieldUpdate.of(value);
            return this;
        }

        CommandBuilder address(String value) {
            address = FieldUpdate.of(value);
            return this;
        }

        CommandBuilder postalCode(String value) {
            postalCode = FieldUpdate.of(value);
            return this;
        }

        CommandBuilder town(String value) {
            town = FieldUpdate.of(value);
            return this;
        }

        CommandBuilder countryCode(String value) {
            countryCode = FieldUpdate.of(value);
            return this;
        }

        CommandBuilder email(String value) {
            email = FieldUpdate.of(value);
            return this;
        }

        CommandBuilder phone(String value) {
            phone = FieldUpdate.of(value);
            return this;
        }

        CommandBuilder website(String value) {
            website = FieldUpdate.of(value);
            return this;
        }

        UpdateThirdPartyCommand build() {
            return new UpdateThirdPartyCommand(
                name,
                customer,
                prospect,
                supplier,
                active,
                taxIdentifier,
                intraCommunityVatNumber,
                address,
                postalCode,
                town,
                countryCode,
                email,
                phone,
                website
            );
        }
    }
}
