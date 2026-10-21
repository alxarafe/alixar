package es.alxarafe.alixar.audit.application;

public record AuditVerificationResult(
    boolean valid,
    long checkedEvents,
    AuditVerificationFailure failure,
    Long failedSequence
) {

    public static AuditVerificationResult valid(long checkedEvents) {
        return new AuditVerificationResult(true, checkedEvents, null, null);
    }

    public static AuditVerificationResult invalid(
        long checkedEvents,
        AuditVerificationFailure failure,
        Long failedSequence
    ) {
        return new AuditVerificationResult(false, checkedEvents, failure, failedSequence);
    }
}
