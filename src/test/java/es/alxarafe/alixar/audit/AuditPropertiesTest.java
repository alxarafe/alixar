package es.alxarafe.alixar.audit;

import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.infrastructure.AuditProperties;
import org.junit.jupiter.api.Test;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.test.context.runner.ApplicationContextRunner;
import org.springframework.context.annotation.Configuration;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

class AuditPropertiesTest {

    private final ApplicationContextRunner contextRunner = new ApplicationContextRunner()
        .withUserConfiguration(PropertiesConfiguration.class);

    @Test
    void defaultsToOff() {
        contextRunner.run(context -> {
            AuditProperties properties = context.getBean(AuditProperties.class);

            assertThat(properties.getMode()).isEqualTo(AuditProperties.DEFAULT_MODE);
            assertThat(properties.bootstrapMode()).isEqualTo(AuditMode.OFF);
        });
    }

    @Test
    void bindsBasicModeWithoutChangingApplicationCode() {
        contextRunner
            .withPropertyValues("alixar.audit.mode=BASIC")
            .run(context -> {
                AuditProperties properties = context.getBean(AuditProperties.class);

                assertThat(properties.getMode()).isEqualTo("BASIC");
                assertThat(properties.bootstrapMode()).isEqualTo(AuditMode.BASIC);
            });
    }

    @Test
    void invalidValueBindsButFailsLazyBootstrapParsing() {
        contextRunner
            .withPropertyValues("alixar.audit.mode=UNSUPPORTED")
            .run(context -> {
                AuditProperties properties = context.getBean(AuditProperties.class);

                assertThat(properties.getMode()).isEqualTo("UNSUPPORTED");
                assertThat(properties.parsedMode()).isEmpty();
                assertThatThrownBy(properties::bootstrapMode)
                    .isInstanceOf(IllegalArgumentException.class);
            });
    }

    @Configuration(proxyBeanMethods = false)
    @EnableConfigurationProperties(AuditProperties.class)
    static class PropertiesConfiguration {
    }
}
