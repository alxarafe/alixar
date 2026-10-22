package es.alxarafe.alixar.audit.application;

import java.time.Instant;
import java.util.Map;
import java.util.UUID;

/**
 * Persistence port for audit read policy rules.
 *
 * <p>Only active rules are stored; {@link AuditReadLevel#NONE} is represented
 * by the absence of a row.</p>
 */
public interface AuditReadPolicyRepository {

    Map<AuditResourceType, AuditReadLevel> findRules(UUID configurationId);

    /**
     * Replaces every active rule for the configuration.
     */
    void replaceRules(
        UUID configurationId,
        Map<AuditResourceType, AuditReadLevel> rules,
        Instant updatedAt
    );
}
