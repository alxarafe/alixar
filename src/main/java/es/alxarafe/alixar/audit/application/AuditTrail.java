package es.alxarafe.alixar.audit.application;

/**
 * Records mandatory successful audit events.
 *
 * <p>Implementations apply the configured {@link AuditMode}. When an event is
 * required, it must be recorded in the caller's business transaction so that a
 * failure rolls back the business change.</p>
 */
public interface AuditTrail {

    void recordSuccess(AuditAction action, AuditResourceType resourceType, String resourceId);

    void recordSuccess(
        AuditActor actor,
        AuditAction action,
        AuditResourceType resourceType,
        String resourceId
    );
}
