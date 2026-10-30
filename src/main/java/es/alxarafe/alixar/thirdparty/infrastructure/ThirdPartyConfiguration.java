package es.alxarafe.alixar.thirdparty.infrastructure;

import es.alxarafe.alixar.audit.application.AuditTrail;
import es.alxarafe.alixar.thirdparty.application.CreateThirdPartyUseCase;
import es.alxarafe.alixar.thirdparty.application.GetThirdPartyUseCase;
import es.alxarafe.alixar.thirdparty.application.ListThirdPartiesUseCase;
import es.alxarafe.alixar.thirdparty.application.ThirdPartyRepository;
import es.alxarafe.alixar.thirdparty.application.UpdateThirdPartyUseCase;
import es.alxarafe.alixar.thirdparty.infrastructure.persistence.JooqThirdPartyRepository;
import org.jooq.DSLContext;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;

@AutoConfiguration
public class ThirdPartyConfiguration {

    @Bean
    @ConditionalOnMissingBean(ThirdPartyRepository.class)
    ThirdPartyRepository thirdPartyRepository(DSLContext dsl) {
        return new JooqThirdPartyRepository(dsl);
    }

    @Bean
    CreateThirdPartyUseCase createThirdPartyUseCase(ThirdPartyRepository thirdPartyRepository) {
        return new CreateThirdPartyUseCase(thirdPartyRepository);
    }

    @Bean
    GetThirdPartyUseCase getThirdPartyUseCase(ThirdPartyRepository thirdPartyRepository) {
        return new GetThirdPartyUseCase(thirdPartyRepository);
    }

    @Bean
    ListThirdPartiesUseCase listThirdPartiesUseCase(ThirdPartyRepository thirdPartyRepository) {
        return new ListThirdPartiesUseCase(thirdPartyRepository);
    }

    @Bean
    UpdateThirdPartyUseCase updateThirdPartyUseCase(ThirdPartyRepository thirdPartyRepository) {
        return new UpdateThirdPartyUseCase(thirdPartyRepository);
    }

    @Bean
    TransactionalThirdPartyService transactionalThirdPartyService(
        CreateThirdPartyUseCase createThirdPartyUseCase,
        UpdateThirdPartyUseCase updateThirdPartyUseCase,
        AuditTrail auditTrail
    ) {
        return new TransactionalThirdPartyService(
            createThirdPartyUseCase,
            updateThirdPartyUseCase,
            auditTrail
        );
    }
}
