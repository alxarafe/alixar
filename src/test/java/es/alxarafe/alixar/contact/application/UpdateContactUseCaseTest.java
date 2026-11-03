package es.alxarafe.alixar.contact.application;

import es.alxarafe.alixar.contact.domain.Contact;
import es.alxarafe.alixar.core.application.ErrorCode;
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class UpdateContactUseCaseTest {

    private static final Contact EXISTING = new Contact(
        42L,
        "Doe",
        "John",
        "john@example.test",
        10L
    );

    private final ContactRepository repository = mock(ContactRepository.class);
    private final ThirdPartyReferenceChecker thirdPartyReferenceChecker =
        mock(ThirdPartyReferenceChecker.class);
    private final UpdateContactUseCase useCase =
        new UpdateContactUseCase(repository, thirdPartyReferenceChecker);

    @BeforeEach
    void setUp() {
        when(repository.findById(42L)).thenReturn(EXISTING);
        when(thirdPartyReferenceChecker.existsById(10L)).thenReturn(true);
        when(thirdPartyReferenceChecker.existsById(99L)).thenReturn(true);
    }

    @Test
    void updatesOnlyLastName() {
        UpdateContactResult result = useCase.execute(42L, builder().lastName("Smith").build());

        assertThat(result.changed()).isTrue();
        assertThat(result.contact()).isEqualTo(new Contact(
            42L,
            "Smith",
            EXISTING.firstName(),
            EXISTING.email(),
            EXISTING.thirdPartyId()
        ));
        verifyUpdated(result.contact());
    }

    @Test
    void updatesOnlyFirstName() {
        UpdateContactResult result = useCase.execute(42L, builder().firstName("Jane").build());

        assertThat(result.changed()).isTrue();
        assertThat(result.contact().firstName()).isEqualTo("Jane");
        assertThat(result.contact().lastName()).isEqualTo(EXISTING.lastName());
        verifyUpdated(result.contact());
    }

    @Test
    void clearsFirstNameWithNull() {
        UpdateContactResult result = useCase.execute(42L, builder().firstName(null).build());

        assertThat(result.changed()).isTrue();
        assertThat(result.contact().firstName()).isNull();
        verifyUpdated(result.contact());
    }

    @Test
    void updatesEmail() {
        UpdateContactResult result = useCase.execute(
            42L,
            builder().email("jane@example.test").build()
        );

        assertThat(result.changed()).isTrue();
        assertThat(result.contact().email()).isEqualTo("jane@example.test");
        verifyUpdated(result.contact());
    }

    @Test
    void clearsEmailWithNull() {
        UpdateContactResult result = useCase.execute(42L, builder().email(null).build());

        assertThat(result.changed()).isTrue();
        assertThat(result.contact().email()).isNull();
        verifyUpdated(result.contact());
    }

    @Test
    void reassignsThirdParty() {
        UpdateContactResult result = useCase.execute(42L, builder().thirdPartyId(99L).build());

        assertThat(result.changed()).isTrue();
        assertThat(result.contact().thirdPartyId()).isEqualTo(99L);
        verifyUpdated(result.contact());
    }

    @Test
    void unlinksThirdPartyWithNull() {
        UpdateContactResult result = useCase.execute(42L, builder().thirdPartyId(null).build());

        assertThat(result.changed()).isTrue();
        assertThat(result.contact().thirdPartyId()).isNull();
        verifyUpdated(result.contact());
    }

    @Test
    void rejectsMissingThirdPartyReference() {
        when(thirdPartyReferenceChecker.existsById(404L)).thenReturn(false);

        assertThatThrownBy(() -> useCase.execute(42L, builder().thirdPartyId(404L).build()))
            .isInstanceOf(InvalidThirdPartyReferenceException.class);
        verify(repository, never()).update(any(Contact.class));
    }

    @Test
    void rejectsNullAndBlankLastName() {
        for (String value : java.util.Arrays.asList(null, "", "   ")) {
            assertThatThrownBy(() -> useCase.execute(42L, builder().lastName(value).build()))
                .isInstanceOfSatisfying(InvalidContactDataException.class, exception -> {
                    assertThat(exception.errorCode()).isEqualTo(ErrorCode.VALIDATION_REQUIRED);
                    assertThat(exception.field()).isEqualTo(ContactFieldNames.LAST_NAME);
                });
        }
        verify(repository, never()).update(any(Contact.class));
    }

    @Test
    void rejectsNonPositiveThirdPartyIdentifier() {
        for (long value : List.of(0L, -1L)) {
            assertThatThrownBy(() -> useCase.execute(42L, builder().thirdPartyId(value).build()))
                .isInstanceOfSatisfying(InvalidContactDataException.class, exception -> {
                    assertThat(exception.errorCode()).isEqualTo(ErrorCode.VALIDATION_INVALID);
                    assertThat(exception.field()).isEqualTo(ContactFieldNames.THIRD_PARTY_ID);
                });
        }
        verify(repository, never()).update(any(Contact.class));
    }

    @Test
    void omittedFieldsRemainUnchanged() {
        UpdateContactResult result = useCase.execute(42L, builder().lastName("Smith").build());

        assertThat(result.contact().firstName()).isEqualTo(EXISTING.firstName());
        assertThat(result.contact().email()).isEqualTo(EXISTING.email());
        assertThat(result.contact().thirdPartyId()).isEqualTo(EXISTING.thirdPartyId());
    }

    @Test
    void emptyPatchIsNoOp() {
        UpdateContactResult result = useCase.execute(42L, builder().build());

        assertThat(result.changed()).isFalse();
        assertThat(result.contact()).isEqualTo(EXISTING);
        verify(repository, never()).update(any(Contact.class));
    }

    @Test
    void sameValueIsNoOp() {
        UpdateContactResult result = useCase.execute(
            42L,
            builder()
                .lastName(EXISTING.lastName())
                .firstName(EXISTING.firstName())
                .email(EXISTING.email())
                .thirdPartyId(EXISTING.thirdPartyId())
                .build()
        );

        assertThat(result.changed()).isFalse();
        assertThat(result.contact()).isEqualTo(EXISTING);
        verify(repository, never()).update(any(Contact.class));
    }

    @Test
    void rejectsNonPositiveIdentifier() {
        for (long id : List.of(0L, -1L)) {
            assertThatThrownBy(() -> useCase.execute(id, builder().lastName("Smith").build()))
                .isInstanceOfSatisfying(InvalidContactDataException.class, exception -> {
                    assertThat(exception.errorCode()).isEqualTo(ErrorCode.VALIDATION_INVALID);
                    assertThat(exception.field()).isEqualTo(ContactFieldNames.ID);
                });
        }
    }

    @Test
    void rejectsMissingPositiveIdentifier() {
        when(repository.findById(404L)).thenThrow(new ContactNotFoundException(404L));

        assertThatThrownBy(() -> useCase.execute(404L, builder().lastName("Smith").build()))
            .isInstanceOf(ContactNotFoundException.class)
            .hasMessageContaining("CONTACT_NOT_FOUND:404");
    }

    private void verifyUpdated(Contact expected) {
        ArgumentCaptor<Contact> captor = ArgumentCaptor.forClass(Contact.class);
        verify(repository).update(captor.capture());
        assertThat(captor.getValue()).isEqualTo(expected);
    }

    private CommandBuilder builder() {
        return new CommandBuilder();
    }

    private static final class CommandBuilder {

        private FieldUpdate<String> lastName = FieldUpdate.absent();
        private FieldUpdate<String> firstName = FieldUpdate.absent();
        private FieldUpdate<String> email = FieldUpdate.absent();
        private FieldUpdate<Long> thirdPartyId = FieldUpdate.absent();

        CommandBuilder lastName(String value) {
            lastName = FieldUpdate.of(value);
            return this;
        }

        CommandBuilder firstName(String value) {
            firstName = FieldUpdate.of(value);
            return this;
        }

        CommandBuilder email(String value) {
            email = FieldUpdate.of(value);
            return this;
        }

        CommandBuilder thirdPartyId(Long value) {
            thirdPartyId = FieldUpdate.of(value);
            return this;
        }

        UpdateContactCommand build() {
            return new UpdateContactCommand(lastName, firstName, email, thirdPartyId);
        }
    }
}
