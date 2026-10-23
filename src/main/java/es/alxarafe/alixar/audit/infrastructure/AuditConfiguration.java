package es.alxarafe.alixar.audit.infrastructure;

import es.alxarafe.alixar.audit.application.AuditActorResolver;
import es.alxarafe.alixar.audit.application.AuditCanonicalEncoder;
import es.alxarafe.alixar.audit.application.AuditChainVerifier;
import es.alxarafe.alixar.audit.application.AuditConfigurationRepository;
import es.alxarafe.alixar.audit.application.AuditEventAppender;
import es.alxarafe.alixar.audit.application.AuditEventRepository;
import es.alxarafe.alixar.audit.application.AuditHashCalculator;
import es.alxarafe.alixar.audit.application.AuditPolicyProvider;
import es.alxarafe.alixar.audit.application.AuditReadPolicyRepository;
import es.alxarafe.alixar.audit.application.AuditTrail;
import es.alxarafe.alixar.audit.application.ListAuditEventsUseCase;
import es.alxarafe.alixar.audit.application.ReadAuditRecorder;
import es.alxarafe.alixar.audit.application.SecurityAuditTrail;
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
    TransactionalAuditService transactionalAuditService(
        AuditEventAppender auditEventAppender,
        AuditChainVerifier auditChainVerifier
    ) {
        return new TransactionalAuditService(auditEventAppender, auditChainVerifier);
    }

    @Bean
    @ConditionalOnMissingBean(AuditConfigurationRepository.class)
    AuditConfigurationRepository auditConfigurationRepository(DSLContext dsl) {
        return new JooqAuditConfigurationRepository(dsl);
    }

    @Bean
    @ConditionalOnMissingBean(AuditReadPolicyRepository.class)
    AuditReadPolicyRepository auditReadPolicyRepository(DSLContext dsl) {
        return new JooqAuditReadPolicyRepository(dsl);
    }

    @Bean
    @ConditionalOnMissingBean(CachedAuditPolicyProvider.class)
    CachedAuditPolicyProvider auditPolicyProvider(
        AuditConfigurationRepository auditConfigurationRepository,
        AuditReadPolicyRepository auditReadPolicyRepository,
        Clock clock
    ) {
        return new CachedAuditPolicyProvider(
            auditConfigurationRepository,
            auditReadPolicyRepository,
            clock,
            CachedAuditPolicyProvider.DEFAULT_REFRESH_INTERVAL
        );
    }

    @Bean
    @ConditionalOnMissingBean(AuditTrail.class)
    AuditTrail auditTrail(
        AuditPolicyProvider auditPolicyProvider,
        AuditActorResolver auditActorResolver,
        TransactionalAuditService transactionalAuditService
    ) {
        return new ConfiguredAuditTrail(
            auditPolicyProvider,
            auditActorResolver,
            transactionalAuditService
        );
    }

    @Bean
    @ConditionalOnMissingBean(SecurityAuditTrail.class)
    SecurityAuditTrail securityAuditTrail(
        AuditPolicyProvider auditPolicyProvider,
        TransactionalAuditService transactionalAuditService
    ) {
        return new ConfiguredSecurityAuditTrail(
            auditPolicyProvider,
            transactionalAuditService
        );
    }

    @Bean
    @ConditionalOnMissingBean(ReadAuditRecorder.class)
    ReadAuditRecorder readAuditRecorder(
        AuditPolicyProvider auditPolicyProvider,
        AuditActorResolver auditActorResolver,
        TransactionalAuditService transactionalAuditService
    ) {
        return new ConfiguredReadAuditRecorder(
            auditPolicyProvider,
            auditActorResolver,
            transactionalAuditService
        );
    }

    @Bean
    @ConditionalOnMissingBean(TransactionalAuditConfigurationService.class)
    TransactionalAuditConfigurationService transactionalAuditConfigurationService(
        AuditConfigurationRepository auditConfigurationRepository,
        AuditTrail auditTrail,
        CachedAuditPolicyProvider auditPolicyProvider,
        Clock clock
    ) {
        return new TransactionalAuditConfigurationService(
            auditConfigurationRepository,
            auditTrail,
            auditPolicyProvider,
            clock
        );
    }

    @Bean
    @ConditionalOnMissingBean(TransactionalAuditReadPolicyService.class)
    TransactionalAuditReadPolicyService transactionalAuditReadPolicyService(
        AuditConfigurationRepository auditConfigurationRepository,
        AuditReadPolicyRepository auditReadPolicyRepository,
        AuditTrail auditTrail,
        CachedAuditPolicyProvider auditPolicyProvider,
        Clock clock
    ) {
        return new TransactionalAuditReadPolicyService(
            auditConfigurationRepository,
            auditReadPolicyRepository,
            auditTrail,
            auditPolicyProvider,
            clock
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
