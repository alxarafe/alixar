package es.alxarafe.alixar.contact.infrastructure;

import es.alxarafe.alixar.audit.application.AuditTrail;
import es.alxarafe.alixar.contact.application.ContactRepository;
import es.alxarafe.alixar.contact.application.CreateContactUseCase;
import es.alxarafe.alixar.contact.application.DeleteContactUseCase;
import es.alxarafe.alixar.contact.application.ThirdPartyReferenceChecker;
import es.alxarafe.alixar.contact.application.UpdateContactUseCase;
import es.alxarafe.alixar.contact.infrastructure.persistence.JooqContactRepository;
import es.alxarafe.alixar.contact.infrastructure.persistence.JooqThirdPartyReferenceChecker;
import org.jooq.DSLContext;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;

@AutoConfiguration
public class ContactConfiguration {

    @Bean
    @ConditionalOnMissingBean(ContactRepository.class)
    ContactRepository contactRepository(DSLContext dsl) {
        return new JooqContactRepository(dsl);
    }

    @Bean
    @ConditionalOnMissingBean(ThirdPartyReferenceChecker.class)
    ThirdPartyReferenceChecker thirdPartyReferenceChecker(DSLContext dsl) {
        return new JooqThirdPartyReferenceChecker(dsl);
    }

    @Bean
    UpdateContactUseCase updateContactUseCase(
        ContactRepository contactRepository,
        ThirdPartyReferenceChecker thirdPartyReferenceChecker
    ) {
        return new UpdateContactUseCase(contactRepository, thirdPartyReferenceChecker);
    }

    @Bean
    DeleteContactUseCase deleteContactUseCase(ContactRepository contactRepository) {
        return new DeleteContactUseCase(contactRepository);
    }

    @Bean
    TransactionalContactService transactionalContactService(
        CreateContactUseCase createContactUseCase,
        UpdateContactUseCase updateContactUseCase,
        DeleteContactUseCase deleteContactUseCase,
        AuditTrail auditTrail
    ) {
        return new TransactionalContactService(
            createContactUseCase,
            updateContactUseCase,
            deleteContactUseCase,
            auditTrail
        );
    }
}
