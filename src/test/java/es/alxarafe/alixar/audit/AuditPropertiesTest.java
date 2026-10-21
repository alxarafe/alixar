package es.alxarafe.alixar.audit;

import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.infrastructure.AuditProperties;
import org.junit.jupiter.api.Test;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.test.context.runner.ApplicationContextRunner;
import org.springframework.context.annotation.Configuration;

import static org.assertj.core.api.Assertions.assertThat;

class AuditPropertiesTest {

    private final ApplicationContextRunner contextRunner = new ApplicationContextRunner()
        .withUserConfiguration(PropertiesConfiguration.class);

    @Test
    void defaultsToOff() {
        contextRunner.run(context ->
            assertThat(context.getBean(AuditProperties.class).getMode()).isEqualTo(AuditMode.OFF)
        );
    }

    @Test
    void bindsBasicModeWithoutChangingApplicationCode() {
        contextRunner
            .withPropertyValues("alixar.audit.mode=BASIC")
            .run(context ->
                assertThat(context.getBean(AuditProperties.class).getMode()).isEqualTo(AuditMode.BASIC)
            );
    }

    @Configuration(proxyBeanMethods = false)
    @EnableConfigurationProperties(AuditProperties.class)
    static class PropertiesConfiguration {
    }
}
