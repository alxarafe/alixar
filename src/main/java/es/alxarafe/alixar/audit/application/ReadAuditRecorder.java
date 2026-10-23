package es.alxarafe.alixar.audit.application;

import java.util.Optional;
import java.util.UUID;

public interface ReadAuditRecorder {

    Optional<PreparedReadAudit> prepare(AuditResourceType resourceType, ReadAuditKind kind);

    void record(PreparedReadAudit audit, UUID resourceId);
}
