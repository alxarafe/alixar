package es.alxarafe.alixar.audit.application;

import java.util.Optional;

/**
 * Persistence port for the singleton audit configuration.
 */
public interface AuditConfigurationRepository {

    Optional<AuditPolicyConfiguration> find();

    /**
     * Creates the configuration only when none exists.
     *
     * <p>An existing configuration must never be overwritten.</p>
     */
    void insertIfAbsent(AuditPolicyConfiguration configuration);
}
