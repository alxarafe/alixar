package es.alxarafe.alixar.audit.application;

import java.time.Instant;
import java.util.Optional;
import java.util.UUID;

/**
 * Persistence port for the singleton audit configuration.
 */
public interface AuditConfigurationRepository {

    Optional<AuditPolicyConfiguration> find();

    /**
     * Reads and locks the singleton configuration for the current transaction.
     */
    Optional<AuditPolicyConfiguration> findForUpdate();

    /**
     * Creates the configuration only when none exists.
     *
     * <p>An existing configuration must never be overwritten.</p>
     */
    void insertIfAbsent(AuditPolicyConfiguration configuration);

    /**
     * Replaces the mode and update timestamp of an existing configuration.
     */
    void updateMode(UUID id, AuditMode mode, Instant updatedAt);
}
