package es.alxarafe.alixar.audit;

import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditPolicyConfiguration;
import es.alxarafe.alixar.audit.infrastructure.AuditConfigurationBootstrap;
import es.alxarafe.alixar.audit.infrastructure.AuditProperties;
import es.alxarafe.alixar.audit.infrastructure.CachedAuditPolicyProvider;
import java.time.Clock;
import java.time.Duration;
import java.time.Instant;
import java.time.ZoneOffset;
import java.util.UUID;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

class AuditConfigurationBootstrapTest {

    private static final Instant NOW = Instant.parse("2026-10-21T10:00:00Z");

    private final InMemoryAuditConfigurationRepository repository =
        new InMemoryAuditConfigurationRepository(Clock.fixed(NOW, ZoneOffset.UTC));
    private final AuditProperties properties = new AuditProperties();
    private final CachedAuditPolicyProvider policyProvider = new CachedAuditPolicyProvider(
        repository,
        Clock.fixed(NOW, ZoneOffset.UTC),
        Duration.ZERO
    );
    private final AuditConfigurationBootstrap bootstrap = new AuditConfigurationBootstrap(
        repository,
        properties,
        policyProvider,
        Clock.fixed(NOW, ZoneOffset.UTC)
    );

    @Test
    void createsConfigurationFromPropertyWhenMissing() {
        properties.setMode("BASIC");

        bootstrap.initialize();

        assertThat(repository.find().orElseThrow().mode()).isEqualTo(AuditMode.BASIC);
        assertThat(policyProvider.currentMode()).isEqualTo(AuditMode.BASIC);
    }

    @Test
    void persistedModeWinsOverDifferentProperty() {
        repository.setMode(AuditMode.BASIC);
        properties.setMode("OFF");

        bootstrap.initialize();

        assertThat(repository.find().orElseThrow().mode()).isEqualTo(AuditMode.BASIC);
        assertThat(policyProvider.currentMode()).isEqualTo(AuditMode.BASIC);
    }

    @Test
    void invalidPropertyFailsWhenConfigurationIsMissing() {
        properties.setMode("INVALID");

        assertThatThrownBy(bootstrap::initialize)
            .isInstanceOf(IllegalArgumentException.class);
        assertThat(repository.find()).isEmpty();
    }

    @Test
    void invalidPropertyIsIgnoredWhenConfigurationExists() {
        repository.setMode(AuditMode.BASIC);
        properties.setMode("INVALID");

        bootstrap.initialize();

        assertThat(repository.find().orElseThrow().mode()).isEqualTo(AuditMode.BASIC);
        assertThat(policyProvider.currentMode()).isEqualTo(AuditMode.BASIC);
    }

    @Test
    void insertDoesNotOverwriteExistingConfiguration() {
        AuditPolicyConfiguration existing =
            new AuditPolicyConfiguration(UUID.randomUUID(), AuditMode.BASIC, NOW);
        repository.insertIfAbsent(existing);

        repository.insertIfAbsent(
            new AuditPolicyConfiguration(UUID.randomUUID(), AuditMode.OFF, NOW.plusSeconds(1))
        );

        assertThat(repository.find()).contains(existing);
    }
}
