package es.alxarafe.alixar.audit.application;

/**
 * Configured audit policy.
 *
 * <p>{@link #OFF} disables ordinary persistent audit events.
 * {@link #BASIC} enables only the explicitly instrumented security and
 * administration baseline. {@link #SELECTIVE} always includes that baseline and
 * stores additive read policy rules. Read event capture is instrumented
 * separately.</p>
 */
public enum AuditMode {
    OFF,
    BASIC,
    SELECTIVE
}
