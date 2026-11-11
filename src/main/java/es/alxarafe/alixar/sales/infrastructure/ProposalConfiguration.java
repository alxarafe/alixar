package es.alxarafe.alixar.sales.infrastructure;

import es.alxarafe.alixar.sales.application.*;
import es.alxarafe.alixar.sales.infrastructure.persistence.*;
import es.alxarafe.alixar.audit.application.AuditTrail;
import java.time.Clock;
import org.jooq.DSLContext;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.transaction.PlatformTransactionManager;

@AutoConfiguration
public class ProposalConfiguration {
    @Bean
    @ConditionalOnMissingBean(ProposalRepository.class)
    ProposalRepository proposalRepository(DSLContext dsl) { return new JooqProposalRepository(dsl); }
    @Bean
    @ConditionalOnMissingBean(EligibleThirdParty.class)
    EligibleThirdParty eligibleThirdParty(DSLContext dsl) { return new JooqEligibleThirdParty(dsl); }
    @Bean
    CreateProposalUseCase createProposalUseCase(ProposalRepository repository, EligibleThirdParty thirdParty) {
        return new CreateProposalUseCase(repository, thirdParty, Clock.systemUTC());
    }
    @Bean
    GetProposalUseCase getProposalUseCase(ProposalRepository repository) { return new GetProposalUseCase(repository); }
    @Bean
    TransactionalProposalService transactionalProposalService(CreateProposalUseCase create, GetProposalUseCase get,
        AuditTrail audit, ProposalRepository repository, EligibleThirdParty thirdParty,
        ObjectProvider<PlatformTransactionManager> transactions) {
        // Resolve the mandatory transaction dependency only for replacement, preserving COM-01 test contexts.
        return new TransactionalProposalService(create, get, audit,
            () -> new InternalProposalDraftReplacement(repository, thirdParty, Clock.systemUTC(), transactions.getObject()));
    }
}
