package es.alxarafe.alixar.audit;

import es.alxarafe.alixar.audit.infrastructure.CachedAuditPolicyProvider;
import java.time.Clock;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;

@TestConfiguration
public class AuditTestConfig {

    @Bean
    @Primary
    public InMemoryAuditEventRepository testAuditEventRepository() {
        return new InMemoryAuditEventRepository();
    }

    @Bean
    @Primary
    public InMemoryAuditConfigurationRepository testAuditConfigurationRepository(Clock clock) {
        return new InMemoryAuditConfigurationRepository(clock);
    }

    @Bean
    public AuditModeTestSupport auditModeTestSupport(
        InMemoryAuditConfigurationRepository testAuditConfigurationRepository,
        CachedAuditPolicyProvider auditPolicyProvider
    ) {
        return new AuditModeTestSupport(testAuditConfigurationRepository, auditPolicyProvider);
    }
}
