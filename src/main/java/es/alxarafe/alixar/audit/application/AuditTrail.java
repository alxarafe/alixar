package es.alxarafe.alixar.audit.application;

/**
 * Records mandatory successful audit events.
 *
 * <p>{@link #recordSuccess} applies the configured {@link AuditMode}.
 * {@link #recordMandatorySuccess} records regardless of the current mode.
 * When an event is required, it must be recorded in the caller's business
 * transaction so that a failure rolls back the business change.</p>
 */
public interface AuditTrail {

    void recordSuccess(AuditAction action, AuditResourceType resourceType, String resourceId);

    void recordSuccess(
        AuditActor actor,
        AuditAction action,
        AuditResourceType resourceType,
        String resourceId
    );

    void recordMandatorySuccess(
        AuditAction action,
        AuditResourceType resourceType,
        String resourceId
    );
}
