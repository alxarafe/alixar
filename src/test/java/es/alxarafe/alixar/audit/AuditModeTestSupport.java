package es.alxarafe.alixar.audit;

import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditReadLevel;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.infrastructure.CachedAuditPolicyProvider;
import java.time.Instant;
import java.util.Map;

/**
 * Changes the test audit policy and immediately refreshes the cached provider.
 */
public class AuditModeTestSupport {

    private final InMemoryAuditConfigurationRepository repository;
    private final InMemoryAuditReadPolicyRepository readPolicyRepository;
    private final CachedAuditPolicyProvider policyProvider;

    public AuditModeTestSupport(
        InMemoryAuditConfigurationRepository repository,
        InMemoryAuditReadPolicyRepository readPolicyRepository,
        CachedAuditPolicyProvider policyProvider
    ) {
        this.repository = repository;
        this.readPolicyRepository = readPolicyRepository;
        this.policyProvider = policyProvider;
    }

    public void setMode(AuditMode mode) {
        repository.setMode(mode);
        policyProvider.reload();
    }

    public void setReadRules(Map<AuditResourceType, AuditReadLevel> rules) {
        repository.find()
            .ifPresent(configuration -> readPolicyRepository.replaceRules(
                configuration.id(),
                rules,
                Instant.now()
            ));
        policyProvider.reload();
    }

    public void reset() {
        setMode(AuditMode.OFF);
        setReadRules(Map.of());
    }
}
