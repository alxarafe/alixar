package es.alxarafe.alixar.audit.application;

import java.util.Collections;
import java.util.EnumMap;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.UUID;

/**
 * Active read policy rules for the singleton audit configuration.
 */
public record AuditReadPolicy(
    UUID configurationId,
    Map<AuditResourceType, AuditReadLevel> rules
) {

    public static final Set<AuditResourceType> CONFIGURABLE_RESOURCE_TYPES =
        Set.of(AuditResourceType.USER, AuditResourceType.ROLE);

    public AuditReadPolicy {
        Objects.requireNonNull(configurationId, "configurationId");
        Objects.requireNonNull(rules, "rules");
        EnumMap<AuditResourceType, AuditReadLevel> copy =
            new EnumMap<>(AuditResourceType.class);
        rules.forEach((resourceType, readLevel) -> {
            Objects.requireNonNull(resourceType, "resourceType");
            Objects.requireNonNull(readLevel, "readLevel");
            if (!CONFIGURABLE_RESOURCE_TYPES.contains(resourceType)) {
                throw new IllegalArgumentException(
                    "Resource type is not configurable: " + resourceType
                );
            }
            if (readLevel == AuditReadLevel.NONE) {
                throw new IllegalArgumentException(
                    "NONE must be represented by the absence of a rule"
                );
            }
            copy.put(resourceType, readLevel);
        });
        rules = Collections.unmodifiableMap(copy);
    }

    public AuditReadLevel levelFor(AuditResourceType resourceType) {
        return rules.getOrDefault(resourceType, AuditReadLevel.NONE);
    }
}
