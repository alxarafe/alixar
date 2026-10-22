package es.alxarafe.alixar.audit.application;

/**
 * Per-resource read audit coverage.
 *
 * <p>{@link #NONE} is represented by the absence of a persisted rule.</p>
 */
public enum AuditReadLevel {
    NONE,
    QUERY_ONLY,
    QUERY_AND_OBJECT
}
