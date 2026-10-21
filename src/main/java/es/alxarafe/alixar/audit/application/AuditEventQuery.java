package es.alxarafe.alixar.audit.application;

import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditResult;
import java.util.Objects;
import java.util.UUID;

/**
 * Read query over the events of one audit chain.
 *
 * <p>{@code sequence} is scoped to {@code chainId}. Pagination is keyset-based
 * and ascending, so a caller advances with the last sequence returned.</p>
 */
public record AuditEventQuery(
    UUID chainId,
    long afterSequence,
    int limit,
    AuditAction action,
    AuditResourceType resourceType,
    String resourceId,
    UUID actorUserId,
    AuditResult result
) {

    public static final String AFTER_SEQUENCE_PARAM = "afterSequence";
    public static final String LIMIT_PARAM = "limit";
    public static final String ACTION_PARAM = "action";
    public static final String RESOURCE_TYPE_PARAM = "resourceType";
    public static final String RESOURCE_ID_PARAM = "resourceId";
    public static final String ACTOR_USER_ID_PARAM = "actorUserId";
    public static final String RESULT_PARAM = "result";

    public static final long DEFAULT_AFTER_SEQUENCE = 0L;
    public static final int DEFAULT_LIMIT = 50;
    public static final int MAX_LIMIT = 200;

    public AuditEventQuery {
        Objects.requireNonNull(chainId, "chainId");
        if (afterSequence < DEFAULT_AFTER_SEQUENCE) {
            throw new InvalidAuditQueryException(AFTER_SEQUENCE_PARAM);
        }
        if (limit < 1 || limit > MAX_LIMIT) {
            throw new InvalidAuditQueryException(LIMIT_PARAM);
        }
        resourceId = normalizeOptional(resourceId);
    }

    public static AuditEventQuery forDefaultChain(
        Long afterSequence,
        Integer limit,
        AuditAction action,
        AuditResourceType resourceType,
        String resourceId,
        UUID actorUserId,
        AuditResult result
    ) {
        return new AuditEventQuery(
            AuditChain.DEFAULT_CHAIN_ID,
            afterSequence != null ? afterSequence : DEFAULT_AFTER_SEQUENCE,
            limit != null ? limit : DEFAULT_LIMIT,
            action,
            resourceType,
            resourceId,
            actorUserId,
            result
        );
    }

    private static String normalizeOptional(String value) {
        if (value == null || value.isBlank()) {
            return null;
        }
        return value.strip();
    }
}
