package es.alxarafe.alixar.audit.infrastructure;

import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditActor;
import es.alxarafe.alixar.audit.application.AuditActorResolver;
import es.alxarafe.alixar.audit.application.AuditActorUnavailableException;
import es.alxarafe.alixar.audit.application.AuditEventDraft;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditPolicyProvider;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditTrail;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditResult;
import java.util.Objects;

public class ConfiguredAuditTrail implements AuditTrail {

    private final AuditPolicyProvider policyProvider;
    private final AuditActorResolver actorResolver;
    private final TransactionalAuditService auditService;

    public ConfiguredAuditTrail(
        AuditPolicyProvider policyProvider,
        AuditActorResolver actorResolver,
        TransactionalAuditService auditService
    ) {
        this.policyProvider = policyProvider;
        this.actorResolver = actorResolver;
        this.auditService = auditService;
    }

    @Override
    public void recordSuccess(AuditAction action, AuditResourceType resourceType, String resourceId) {
        requireArguments(action, resourceType, resourceId);
        if (policyProvider.currentMode() == AuditMode.OFF) {
            return;
        }

        AuditActor actor = actorResolver.resolveCurrentActor()
            .orElseThrow(AuditActorUnavailableException::new);
        append(actor, action, resourceType, resourceId);
    }

    @Override
    public void recordSuccess(
        AuditActor actor,
        AuditAction action,
        AuditResourceType resourceType,
        String resourceId
    ) {
        requireArguments(action, resourceType, resourceId);
        Objects.requireNonNull(actor, "actor");
        if (policyProvider.currentMode() == AuditMode.OFF) {
            return;
        }

        append(actor, action, resourceType, resourceId);
    }

    @Override
    public void recordMandatorySuccess(
        AuditAction action,
        AuditResourceType resourceType,
        String resourceId
    ) {
        requireArguments(action, resourceType, resourceId);
        AuditActor actor = actorResolver.resolveCurrentActor()
            .orElseThrow(AuditActorUnavailableException::new);
        append(actor, action, resourceType, resourceId);
    }

    private void append(
        AuditActor actor,
        AuditAction action,
        AuditResourceType resourceType,
        String resourceId
    ) {
        auditService.append(new AuditEventDraft(
            AuditChain.DEFAULT_CHAIN_ID,
            actor.userId(),
            actor.username(),
            actor.authenticationType(),
            action.name(),
            resourceType.name(),
            resourceId,
            AuditResult.SUCCESS,
            null
        ));
    }

    private void requireArguments(
        AuditAction action,
        AuditResourceType resourceType,
        String resourceId
    ) {
        Objects.requireNonNull(action, "action");
        Objects.requireNonNull(resourceType, "resourceType");
        Objects.requireNonNull(resourceId, "resourceId");
    }
}
