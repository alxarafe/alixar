package es.alxarafe.alixar.audit;

import es.alxarafe.alixar.audit.application.AuditReadLevel;
import es.alxarafe.alixar.audit.application.AuditReadPolicyRepository;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import java.time.Instant;
import java.util.Collections;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class InMemoryAuditReadPolicyRepository implements AuditReadPolicyRepository {

    private final Map<UUID, Map<AuditResourceType, AuditReadLevel>> rules = new HashMap<>();

    @Override
    public synchronized Map<AuditResourceType, AuditReadLevel> findRules(
        UUID configurationId
    ) {
        EnumMap<AuditResourceType, AuditReadLevel> copy =
            new EnumMap<>(AuditResourceType.class);
        copy.putAll(rules.getOrDefault(configurationId, Map.of()));
        return Collections.unmodifiableMap(copy);
    }

    @Override
    public synchronized void replaceRules(
        UUID configurationId,
        Map<AuditResourceType, AuditReadLevel> replacement,
        Instant updatedAt
    ) {
        EnumMap<AuditResourceType, AuditReadLevel> copy =
            new EnumMap<>(AuditResourceType.class);
        copy.putAll(replacement);
        rules.put(configurationId, Collections.unmodifiableMap(copy));
    }
}
