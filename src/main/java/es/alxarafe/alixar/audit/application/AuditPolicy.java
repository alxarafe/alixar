package es.alxarafe.alixar.audit.application;

import java.util.Objects;

/**
 * Immutable snapshot of the effective audit mode and read rules.
 */
public record AuditPolicy(AuditMode mode, AuditReadPolicy readPolicy) {

    public AuditPolicy {
        Objects.requireNonNull(mode, "mode");
        Objects.requireNonNull(readPolicy, "readPolicy");
    }

    public AuditReadLevel readLevelFor(AuditResourceType resourceType) {
        return readPolicy.levelFor(resourceType);
    }
}
