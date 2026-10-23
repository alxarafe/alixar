package es.alxarafe.alixar.audit.api;

import java.util.UUID;

record AuditVerificationResponse(
    UUID chainId,
    boolean valid,
    long checkedEvents,
    String failure,
    Long failedSequence
) {
}
