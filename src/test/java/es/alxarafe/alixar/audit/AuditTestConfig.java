package es.alxarafe.alixar.audit;

import es.alxarafe.alixar.audit.application.AuditEventRepository;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;

@TestConfiguration
public class AuditTestConfig {

    @Bean
    @Primary
    public AuditEventRepository testAuditEventRepository() {
        return new InMemoryAuditEventRepository();
    }
}
