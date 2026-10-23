package es.alxarafe.alixar.audit.api;

import java.time.Instant;
import java.util.UUID;

record AuditEventResponse(
    UUID id,
    UUID chainId,
    long sequence,
    Instant occurredAt,
    UUID actorUserId,
    String actorUsername,
    String authenticationType,
    String action,
    String resourceType,
    String resourceId,
    String result,
    String requestId,
    int integrityFormatVersion,
    String previousHash,
    String eventHash
) {
}
