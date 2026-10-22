package es.alxarafe.alixar.audit.infrastructure;

import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditActor;
import es.alxarafe.alixar.audit.application.AuditEventDraft;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditPolicyProvider;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditUnavailableException;
import es.alxarafe.alixar.audit.application.SecurityAuditTrail;
import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditResult;
import java.util.Objects;
import java.util.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ConfiguredSecurityAuditTrail implements SecurityAuditTrail {

    private static final Logger LOGGER =
        LoggerFactory.getLogger(ConfiguredSecurityAuditTrail.class);

    private final AuditPolicyProvider policyProvider;
    private final TransactionalAuditService auditService;

    public ConfiguredSecurityAuditTrail(
        AuditPolicyProvider policyProvider,
        TransactionalAuditService auditService
    ) {
        this.policyProvider = Objects.requireNonNull(policyProvider, "policyProvider");
        this.auditService = Objects.requireNonNull(auditService, "auditService");
    }

    @Override
    public void loginSucceeded(AuditActor actor) {
        Objects.requireNonNull(actor, "actor");
        try {
            if (policyProvider.currentMode() == AuditMode.OFF) {
                return;
            }
            auditService.append(draft(
                actor.userId(),
                actor.username(),
                actor.authenticationType(),
                AuditAction.LOGIN_SUCCEEDED,
                AuditResourceType.USER,
                actor.userId().toString(),
                AuditResult.SUCCESS
            ));
        } catch (RuntimeException exception) {
            LOGGER.error("Could not append mandatory login audit event", exception);
            throw new AuditUnavailableException();
        }
    }

    @Override
    public void loginFailed() {
        bestEffort(
            null,
            null,
            null,
            AuditAction.LOGIN_FAILED,
            AuditResourceType.AUTHENTICATION,
            null,
            AuditResult.FAILURE
        );
    }

    @Override
    public void logout(AuditActor actor) {
        Objects.requireNonNull(actor, "actor");
        bestEffort(
            actor.userId(),
            actor.username(),
            actor.authenticationType(),
            AuditAction.LOGOUT,
            AuditResourceType.USER,
            actor.userId().toString(),
            AuditResult.SUCCESS
        );
    }

    @Override
    public void accessDenied(AuditActor actor, String resourceId) {
        Objects.requireNonNull(actor, "actor");
        Objects.requireNonNull(resourceId, "resourceId");
        bestEffort(
            actor.userId(),
            actor.username(),
            actor.authenticationType(),
            AuditAction.ACCESS_DENIED,
            AuditResourceType.HTTP_REQUEST,
            resourceId,
            AuditResult.DENIED
        );
    }

    private void bestEffort(
        UUID actorUserId,
        String actorUsername,
        AuditAuthenticationType authenticationType,
        AuditAction action,
        AuditResourceType resourceType,
        String resourceId,
        AuditResult result
    ) {
        try {
            if (policyProvider.currentMode() == AuditMode.OFF) {
                return;
            }
            auditService.appendIsolated(draft(
                actorUserId,
                actorUsername,
                authenticationType,
                action,
                resourceType,
                resourceId,
                result
            ));
        } catch (RuntimeException exception) {
            LOGGER.warn(
                "Could not append {} audit event; preserving original outcome",
                action,
                exception
            );
        }
    }

    private AuditEventDraft draft(
        UUID actorUserId,
        String actorUsername,
        AuditAuthenticationType authenticationType,
        AuditAction action,
        AuditResourceType resourceType,
        String resourceId,
        AuditResult result
    ) {
        return new AuditEventDraft(
            AuditChain.DEFAULT_CHAIN_ID,
            actorUserId,
            actorUsername,
            authenticationType,
            action.name(),
            resourceType.name(),
            resourceId,
            result,
            null
        );
    }
}
