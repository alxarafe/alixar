package es.alxarafe.alixar.audit;

import es.alxarafe.alixar.audit.application.AuditConfigurationRepository;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditPolicyConfiguration;
import java.time.Clock;
import java.util.Optional;
import java.util.UUID;

public class InMemoryAuditConfigurationRepository implements AuditConfigurationRepository {

    private final Clock clock;
    private AuditPolicyConfiguration configuration;

    public InMemoryAuditConfigurationRepository(Clock clock) {
        this.clock = clock;
    }

    @Override
    public synchronized Optional<AuditPolicyConfiguration> find() {
        return Optional.ofNullable(configuration);
    }

    @Override
    public synchronized void insertIfAbsent(AuditPolicyConfiguration candidate) {
        if (configuration == null) {
            configuration = candidate;
        }
    }

    public synchronized void setMode(AuditMode mode) {
        if (configuration == null) {
            configuration = new AuditPolicyConfiguration(UUID.randomUUID(), mode, clock.instant());
            return;
        }
        configuration = new AuditPolicyConfiguration(
            configuration.id(),
            mode,
            clock.instant()
        );
    }
}
