package es.alxarafe.alixar.audit;

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
}
