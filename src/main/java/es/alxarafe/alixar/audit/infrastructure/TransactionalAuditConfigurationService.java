package es.alxarafe.alixar.audit.infrastructure;

import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditConfigurationMissingException;
import es.alxarafe.alixar.audit.application.AuditConfigurationRepository;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditPolicyConfiguration;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditTrail;
import java.time.Clock;
import java.time.Instant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronization;
import org.springframework.transaction.support.TransactionSynchronizationManager;

public class TransactionalAuditConfigurationService {

    private static final Logger LOGGER =
        LoggerFactory.getLogger(TransactionalAuditConfigurationService.class);

    private final AuditConfigurationRepository repository;
    private final AuditTrail auditTrail;
    private final CachedAuditPolicyProvider policyProvider;
    private final Clock clock;

    public TransactionalAuditConfigurationService(
        AuditConfigurationRepository repository,
        AuditTrail auditTrail,
        CachedAuditPolicyProvider policyProvider,
        Clock clock
    ) {
        this.repository = repository;
        this.auditTrail = auditTrail;
        this.policyProvider = policyProvider;
        this.clock = clock;
    }

    @Transactional
    public AuditPolicyConfiguration updateMode(AuditMode requestedMode) {
        AuditPolicyConfiguration current = repository.findForUpdate()
            .orElseThrow(AuditConfigurationMissingException::new);
        if (current.mode() == requestedMode) {
            return current;
        }

        Instant updatedAt = clock.instant();
        repository.updateMode(current.id(), requestedMode, updatedAt);
        auditTrail.recordMandatorySuccess(
            actionFor(requestedMode),
            AuditResourceType.AUDIT_CONFIGURATION,
            current.id().toString()
        );
        reloadAfterCommit();
        return new AuditPolicyConfiguration(current.id(), requestedMode, updatedAt);
    }

    private AuditAction actionFor(AuditMode mode) {
        return switch (mode) {
            case BASIC -> AuditAction.AUDIT_MODE_CHANGED_TO_BASIC;
            case OFF -> AuditAction.AUDIT_MODE_CHANGED_TO_OFF;
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
                "Could not reload persisted audit configuration after commit; TTL will retry",
                exception
            );
        }
    }
}
