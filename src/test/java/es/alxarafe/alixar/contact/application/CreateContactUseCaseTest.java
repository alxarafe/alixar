package es.alxarafe.alixar.contact.application;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class CreateContactUseCaseTest {

    @Mock
    ContactRepository contactRepository;

    @Test
    void execute_validCommand_delegatesToRepository() {
        CreateContactCommand command = new CreateContactCommand("Doe", "John", "john@example.test", null);
        when(contactRepository.create(command)).thenReturn(42L);

        CreateContactUseCase useCase = new CreateContactUseCase(contactRepository);
        long createdId = useCase.execute(command);

        assertThat(createdId).isEqualTo(42L);
    }

    @Test
    void execute_missingLastName_throwsInvalidContactDataException() {
        CreateContactCommand command = new CreateContactCommand(null, "John", "john@example.test", null);

        CreateContactUseCase useCase = new CreateContactUseCase(contactRepository);

        assertThatThrownBy(() -> useCase.execute(command))
            .isInstanceOf(InvalidContactDataException.class)
            .hasMessageContaining("lastName");
    }

    @Test
    void execute_blankLastName_throwsInvalidContactDataException() {
        CreateContactCommand command = new CreateContactCommand("  ", "John", "john@example.test", null);

        CreateContactUseCase useCase = new CreateContactUseCase(contactRepository);

        assertThatThrownBy(() -> useCase.execute(command))
            .isInstanceOf(InvalidContactDataException.class)
            .hasMessageContaining("lastName");
    }

    @Test
    void execute_emptyLastName_throwsInvalidContactDataException() {
        CreateContactCommand command = new CreateContactCommand("", "John", "john@example.test", null);

        CreateContactUseCase useCase = new CreateContactUseCase(contactRepository);

        assertThatThrownBy(() -> useCase.execute(command))
            .isInstanceOf(InvalidContactDataException.class)
            .hasMessageContaining("lastName");
    }

    @Test
    void execute_withThirdPartyId_delegatesToRepository() {
        CreateContactCommand command = new CreateContactCommand("Doe", "John", "john@example.test", 42L);
        when(contactRepository.create(command)).thenReturn(43L);

        CreateContactUseCase useCase = new CreateContactUseCase(contactRepository);
        long createdId = useCase.execute(command);

        assertThat(createdId).isEqualTo(43L);
    }

}