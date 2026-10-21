package es.alxarafe.alixar.audit.application;

/**
 * Configured audit policy.
 *
 * <p>{@link #OFF} disables persistent audit events. {@link #BASIC} enables only
 * the events that are explicitly instrumented as basic events.</p>
 */
public enum AuditMode {
    OFF,
    BASIC
}
