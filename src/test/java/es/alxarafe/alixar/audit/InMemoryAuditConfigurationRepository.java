package es.alxarafe.alixar.audit;

import es.alxarafe.alixar.audit.application.AuditConfigurationRepository;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditPolicyConfiguration;
import java.time.Clock;
import java.time.Instant;
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
    public synchronized Optional<AuditPolicyConfiguration> findForUpdate() {
        return find();
    }

    @Override
    public synchronized void insertIfAbsent(AuditPolicyConfiguration candidate) {
        if (configuration == null) {
            configuration = candidate;
        }
    }

    @Override
    public synchronized void updateMode(UUID id, AuditMode mode, Instant updatedAt) {
        if (configuration == null || !configuration.id().equals(id)) {
            throw new IllegalStateException("Persisted audit configuration was not updated");
        }
        configuration = new AuditPolicyConfiguration(id, mode, updatedAt);
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
