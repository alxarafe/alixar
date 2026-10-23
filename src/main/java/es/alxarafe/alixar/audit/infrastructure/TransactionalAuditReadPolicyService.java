package es.alxarafe.alixar.audit.infrastructure;

import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditConfigurationMissingException;
import es.alxarafe.alixar.audit.application.AuditConfigurationRepository;
import es.alxarafe.alixar.audit.application.AuditPolicyConfiguration;
import es.alxarafe.alixar.audit.application.AuditReadLevel;
import es.alxarafe.alixar.audit.application.AuditReadPolicy;
import es.alxarafe.alixar.audit.application.AuditReadPolicyRepository;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditTrail;
import java.time.Clock;
import java.time.Instant;
import java.util.Collections;
import java.util.Comparator;
import java.util.EnumMap;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.TreeSet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronization;
import org.springframework.transaction.support.TransactionSynchronizationManager;

public class TransactionalAuditReadPolicyService {

    private static final Logger LOGGER =
        LoggerFactory.getLogger(TransactionalAuditReadPolicyService.class);

    private final AuditConfigurationRepository configurationRepository;
    private final AuditReadPolicyRepository readPolicyRepository;
    private final AuditTrail auditTrail;
    private final CachedAuditPolicyProvider policyProvider;
    private final Clock clock;

    public TransactionalAuditReadPolicyService(
        AuditConfigurationRepository configurationRepository,
        AuditReadPolicyRepository readPolicyRepository,
        AuditTrail auditTrail,
        CachedAuditPolicyProvider policyProvider,
        Clock clock
    ) {
        this.configurationRepository = configurationRepository;
        this.readPolicyRepository = readPolicyRepository;
        this.auditTrail = auditTrail;
        this.policyProvider = policyProvider;
        this.clock = clock;
    }

    @Transactional
    public AuditReadPolicy replaceRules(
        Map<AuditResourceType, AuditReadLevel> requestedRules
    ) {
        Objects.requireNonNull(requestedRules, "requestedRules");
        AuditPolicyConfiguration current = configurationRepository.findForUpdate()
            .orElseThrow(AuditConfigurationMissingException::new);
        Map<AuditResourceType, AuditReadLevel> currentRules =
            readPolicyRepository.findRules(current.id());
        Map<AuditResourceType, AuditReadLevel> normalized = normalize(requestedRules);
        if (currentRules.equals(normalized)) {
            return new AuditReadPolicy(current.id(), currentRules);
        }

        Instant updatedAt = clock.instant();
        readPolicyRepository.replaceRules(current.id(), normalized, updatedAt);
        changedResourceTypes(currentRules, normalized).forEach(resourceType ->
            auditTrail.recordMandatorySuccess(
                actionFor(levelOrNone(normalized, resourceType)),
                AuditResourceType.AUDIT_READ_POLICY,
                resourceType.name()
            )
        );
        reloadAfterCommit();
        return new AuditReadPolicy(current.id(), normalized);
    }

    private Map<AuditResourceType, AuditReadLevel> normalize(
        Map<AuditResourceType, AuditReadLevel> requestedRules
    ) {
        EnumMap<AuditResourceType, AuditReadLevel> normalized =
            new EnumMap<>(AuditResourceType.class);
        requestedRules.forEach((resourceType, readLevel) -> {
            Objects.requireNonNull(resourceType, "resourceType");
            Objects.requireNonNull(readLevel, "readLevel");
            if (!AuditReadPolicy.CONFIGURABLE_RESOURCE_TYPES.contains(resourceType)) {
                throw new IllegalArgumentException(
                    "Resource type is not configurable: " + resourceType
                );
            }
            if (readLevel != AuditReadLevel.NONE) {
                normalized.put(resourceType, readLevel);
            }
        });
        return Collections.unmodifiableMap(normalized);
    }

    private Set<AuditResourceType> changedResourceTypes(
        Map<AuditResourceType, AuditReadLevel> currentRules,
        Map<AuditResourceType, AuditReadLevel> requestedRules
    ) {
        Set<AuditResourceType> changed = new TreeSet<>(
            Comparator.comparing(AuditResourceType::name)
        );
        for (AuditResourceType resourceType : AuditReadPolicy.CONFIGURABLE_RESOURCE_TYPES) {
            if (levelOrNone(currentRules, resourceType)
                != levelOrNone(requestedRules, resourceType)) {
                changed.add(resourceType);
            }
        }
        return changed;
    }

    private AuditReadLevel levelOrNone(
        Map<AuditResourceType, AuditReadLevel> rules,
        AuditResourceType resourceType
    ) {
        return rules.getOrDefault(resourceType, AuditReadLevel.NONE);
    }

    private AuditAction actionFor(AuditReadLevel readLevel) {
        return switch (readLevel) {
            case NONE -> AuditAction.AUDIT_READ_POLICY_RULE_CHANGED_TO_NONE;
            case QUERY_ONLY -> AuditAction.AUDIT_READ_POLICY_RULE_CHANGED_TO_QUERY_ONLY;
            case QUERY_AND_OBJECT ->
                AuditAction.AUDIT_READ_POLICY_RULE_CHANGED_TO_QUERY_AND_OBJECT;
        };
    }

    private void reloadAfterCommit() {
        if (!TransactionSynchronizationManager.isSynchronizationActive()) {
            reloadPolicyCache();
            return;
        }
        TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronization() {
            @Override
            public void afterCommit() {
                reloadPolicyCache();
            }
        });
    }

    private void reloadPolicyCache() {
        try {
            policyProvider.reload();
        } catch (RuntimeException exception) {
            LOGGER.warn(
                "Could not reload persisted audit policy after commit; TTL will retry",
                exception
            );
        }
    }
}
