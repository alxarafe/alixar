package es.alxarafe.alixar.audit;

import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.infrastructure.CachedAuditPolicyProvider;

/**
 * Changes the test audit policy and immediately refreshes the cached provider.
 */
public class AuditModeTestSupport {

    private final InMemoryAuditConfigurationRepository repository;
    private final CachedAuditPolicyProvider policyProvider;

    public AuditModeTestSupport(
        InMemoryAuditConfigurationRepository repository,
        CachedAuditPolicyProvider policyProvider
    ) {
        this.repository = repository;
        this.policyProvider = policyProvider;
    }

    public void setMode(AuditMode mode) {
        repository.setMode(mode);
        policyProvider.reload();
    }

    public void reset() {
        setMode(AuditMode.OFF);
    }
}
