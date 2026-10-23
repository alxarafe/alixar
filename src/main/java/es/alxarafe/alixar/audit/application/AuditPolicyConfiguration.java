package es.alxarafe.alixar.audit.application;

import java.time.Instant;
import java.util.Objects;
import java.util.UUID;

/**
 * Persisted audit policy configuration.
 *
 * <p>There is at most one active configuration. Its {@code updatedAt} records
 * when the policy was last changed.</p>
 */
public record AuditPolicyConfiguration(UUID id, AuditMode mode, Instant updatedAt) {

    public AuditPolicyConfiguration {
        Objects.requireNonNull(id, "id");
        Objects.requireNonNull(mode, "mode");
        Objects.requireNonNull(updatedAt, "updatedAt");
    }
}
