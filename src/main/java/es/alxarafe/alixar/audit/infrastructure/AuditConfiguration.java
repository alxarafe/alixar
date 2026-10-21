package es.alxarafe.alixar.audit.infrastructure;

import es.alxarafe.alixar.audit.application.AuditActorResolver;
import es.alxarafe.alixar.audit.application.AuditCanonicalEncoder;
import es.alxarafe.alixar.audit.application.AuditChainVerifier;
import es.alxarafe.alixar.audit.application.AuditEventAppender;
import es.alxarafe.alixar.audit.application.AuditEventRepository;
import es.alxarafe.alixar.audit.application.AuditHashCalculator;
import es.alxarafe.alixar.audit.application.AuditTrail;
import es.alxarafe.alixar.audit.application.ListAuditEventsUseCase;
import java.time.Clock;
import org.jooq.DSLContext;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

@AutoConfiguration
@EnableConfigurationProperties(AuditProperties.class)
public class AuditConfiguration {

    @Bean
    @ConditionalOnMissingBean
    AuditCanonicalEncoder auditCanonicalEncoder() {
        return new AuditCanonicalEncoder();
    }

    @Bean
    @ConditionalOnMissingBean
    AuditHashCalculator auditHashCalculator() {
        return new AuditHashCalculator();
    }

    @Bean
    @ConditionalOnMissingBean(Clock.class)
    Clock auditClock() {
        return Clock.systemUTC();
    }

    @Bean
    @ConditionalOnMissingBean(AuditEventRepository.class)
    AuditEventRepository auditEventRepository(DSLContext dsl) {
        return new JooqAuditEventRepository(dsl);
    }

    @Bean
    AuditEventAppender auditEventAppender(
        AuditEventRepository auditEventRepository,
        AuditCanonicalEncoder auditCanonicalEncoder,
        AuditHashCalculator auditHashCalculator,
        Clock clock
    ) {
        return new AuditEventAppender(
            auditEventRepository,
            auditCanonicalEncoder,
            auditHashCalculator,
            clock
        );
    }

    @Bean
    TransactionalAuditService transactionalAuditService(AuditEventAppender auditEventAppender) {
        return new TransactionalAuditService(auditEventAppender);
    }

    @Bean
    @ConditionalOnMissingBean(AuditTrail.class)
    AuditTrail auditTrail(
        AuditProperties auditProperties,
        AuditActorResolver auditActorResolver,
        TransactionalAuditService transactionalAuditService
    ) {
        return new ConfiguredAuditTrail(
            auditProperties,
            auditActorResolver,
            transactionalAuditService
        );
    }

    @Bean
    AuditChainVerifier auditChainVerifier(
        AuditEventRepository auditEventRepository,
        AuditCanonicalEncoder auditCanonicalEncoder,
        AuditHashCalculator auditHashCalculator
    ) {
        return new AuditChainVerifier(
            auditEventRepository,
            auditCanonicalEncoder,
            auditHashCalculator
        );
    }

    @Bean
    ListAuditEventsUseCase listAuditEventsUseCase(AuditEventRepository auditEventRepository) {
        return new ListAuditEventsUseCase(auditEventRepository);
    }
}
