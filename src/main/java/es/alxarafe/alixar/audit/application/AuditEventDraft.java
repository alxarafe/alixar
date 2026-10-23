package es.alxarafe.alixar.audit.application;

import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import es.alxarafe.alixar.audit.domain.AuditResult;
import java.util.Objects;
import java.util.UUID;

public record AuditEventDraft(
    UUID chainId,
    UUID actorUserId,
    String actorUsername,
    AuditAuthenticationType authenticationType,
    String action,
    String resourceType,
    String resourceId,
    AuditResult result,
    String requestId
) {

    public AuditEventDraft {
        Objects.requireNonNull(chainId, "chainId");
        Objects.requireNonNull(result, "result");
        if (action == null || action.isBlank()) {
            throw new IllegalArgumentException("action must not be blank");
        }
    }
}
