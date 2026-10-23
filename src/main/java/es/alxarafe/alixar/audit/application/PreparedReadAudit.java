package es.alxarafe.alixar.audit.application;

import java.util.Objects;

public record PreparedReadAudit(
    AuditActor actor,
    AuditResourceType resourceType,
    ReadAuditKind kind
) {

    public PreparedReadAudit {
        Objects.requireNonNull(actor, "actor");
        Objects.requireNonNull(resourceType, "resourceType");
        Objects.requireNonNull(kind, "kind");
    }

    public AuditAction action() {
        return switch (kind) {
            case QUERY -> AuditAction.READ_QUERY;
            case OBJECT -> AuditAction.READ_OBJECT;
        };
    }
}
