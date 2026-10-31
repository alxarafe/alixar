package es.alxarafe.alixar.contact;

import es.alxarafe.alixar.contact.application.ContactRepository;
import es.alxarafe.alixar.contact.application.CreateContactUseCase;
import es.alxarafe.alixar.contact.application.GetContactUseCase;
import es.alxarafe.alixar.contact.application.ThirdPartyReferenceChecker;
import org.mockito.Mockito;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;

@TestConfiguration
public class ContactTestConfig {

    @Bean
    @Primary
    ContactRepository contactRepository() {
        return Mockito.mock(ContactRepository.class);
    }

    @Bean
    @Primary
    ThirdPartyReferenceChecker thirdPartyReferenceChecker() {
        return Mockito.mock(ThirdPartyReferenceChecker.class);
    }

    @Bean
    @Primary
    GetContactUseCase getContactUseCase(ContactRepository contactRepository) {
        return new GetContactUseCase(contactRepository);
    }

    @Bean
    @Primary
    CreateContactUseCase createContactUseCase() {
        return Mockito.mock(CreateContactUseCase.class);
    }

}
