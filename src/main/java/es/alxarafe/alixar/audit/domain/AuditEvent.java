package es.alxarafe.alixar.audit.domain;

import java.time.Instant;
import java.util.UUID;

public record AuditEvent(
    UUID id,
    UUID chainId,
    long sequence,
    Instant occurredAt,
    UUID actorUserId,
    String actorUsername,
    AuditAuthenticationType authenticationType,
    String action,
    String resourceType,
    String resourceId,
    AuditResult result,
    String requestId,
    int integrityFormatVersion,
    String previousHash,
    String eventHash
) {

    public AuditEvent withEventHash(String hash) {
        return new AuditEvent(
            id,
            chainId,
            sequence,
            occurredAt,
            actorUserId,
            actorUsername,
            authenticationType,
            action,
            resourceType,
            resourceId,
            result,
            requestId,
            integrityFormatVersion,
            previousHash,
            hash
        );
    }
}
