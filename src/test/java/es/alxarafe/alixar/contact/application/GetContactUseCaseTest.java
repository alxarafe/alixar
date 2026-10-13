package es.alxarafe.alixar.contact.application;

import es.alxarafe.alixar.contact.domain.Contact;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class GetContactUseCaseTest {

    @Mock
    ContactRepository contactRepository;

    @Test
    void execute_delegatesToRepository() {
        Contact expected = new Contact(3L, "Doe", "John", "john@example.test", null);
        when(contactRepository.findById(3L)).thenReturn(expected);

        GetContactUseCase useCase = new GetContactUseCase(contactRepository);
        Contact result = useCase.execute(3L);

        assertThat(result).isEqualTo(expected);
    }

    @Test
    void execute_propagatesNotFoundException() {
        when(contactRepository.findById(999L)).thenThrow(new ContactNotFoundException(999L));

        GetContactUseCase useCase = new GetContactUseCase(contactRepository);

        assertThatThrownBy(() -> useCase.execute(999L))
            .isInstanceOf(ContactNotFoundException.class)
            .hasMessageContaining("999");
    }

}