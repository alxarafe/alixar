package es.alxarafe.alixar.contact.application;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class CreateContactUseCaseTest {

    @Mock
    ContactRepository contactRepository;

    @Mock
    ThirdPartyReferenceChecker thirdPartyReferenceChecker;

    @Test
    void execute_validStandaloneCommand_delegatesToRepository() {
        CreateContactCommand command = new CreateContactCommand("Doe", "John", "john@example.test", null);
        when(contactRepository.create(command)).thenReturn(42L);

        CreateContactUseCase useCase = new CreateContactUseCase(contactRepository, thirdPartyReferenceChecker);
        long createdId = useCase.execute(command);

        assertThat(createdId).isEqualTo(42L);
        verify(thirdPartyReferenceChecker, never()).existsById(42L);
    }

    @Test
    void execute_missingLastName_throwsInvalidContactDataException() {
        CreateContactCommand command = new CreateContactCommand(null, "John", "john@example.test", null);

        CreateContactUseCase useCase = new CreateContactUseCase(contactRepository, thirdPartyReferenceChecker);

        assertThatThrownBy(() -> useCase.execute(command))
            .isInstanceOf(InvalidContactDataException.class)
            .hasMessageContaining("lastName");
    }

    @Test
    void execute_blankLastName_throwsInvalidContactDataException() {
        CreateContactCommand command = new CreateContactCommand("  ", "John", "john@example.test", null);

        CreateContactUseCase useCase = new CreateContactUseCase(contactRepository, thirdPartyReferenceChecker);

        assertThatThrownBy(() -> useCase.execute(command))
            .isInstanceOf(InvalidContactDataException.class)
            .hasMessageContaining("lastName");
    }

    @Test
    void execute_emptyLastName_throwsInvalidContactDataException() {
        CreateContactCommand command = new CreateContactCommand("", "John", "john@example.test", null);

        CreateContactUseCase useCase = new CreateContactUseCase(contactRepository, thirdPartyReferenceChecker);

        assertThatThrownBy(() -> useCase.execute(command))
            .isInstanceOf(InvalidContactDataException.class)
            .hasMessageContaining("lastName");
    }

    @Test
    void execute_withExistingThirdParty_delegatesToRepository() {
        CreateContactCommand command = new CreateContactCommand("Doe", "John", "john@example.test", 42L);
        when(thirdPartyReferenceChecker.existsById(42L)).thenReturn(true);
        when(contactRepository.create(command)).thenReturn(43L);

        CreateContactUseCase useCase = new CreateContactUseCase(contactRepository, thirdPartyReferenceChecker);
        long createdId = useCase.execute(command);

        assertThat(createdId).isEqualTo(43L);
    }

    @Test
    void execute_withMissingThirdParty_throwsInvalidThirdPartyReferenceException() {
        CreateContactCommand command = new CreateContactCommand("Doe", "John", "john@example.test", 999L);
        when(thirdPartyReferenceChecker.existsById(999L)).thenReturn(false);

        CreateContactUseCase useCase = new CreateContactUseCase(contactRepository, thirdPartyReferenceChecker);

        assertThatThrownBy(() -> useCase.execute(command))
            .isInstanceOf(InvalidThirdPartyReferenceException.class);
        verify(contactRepository, never()).create(command);
    }

}
