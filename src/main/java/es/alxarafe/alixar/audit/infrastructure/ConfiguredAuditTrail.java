package es.alxarafe.alixar.audit.infrastructure;

import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditActor;
import es.alxarafe.alixar.audit.application.AuditActorResolver;
import es.alxarafe.alixar.audit.application.AuditActorUnavailableException;
import es.alxarafe.alixar.audit.application.AuditEventDraft;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditTrail;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditResult;
import java.util.Objects;

public class ConfiguredAuditTrail implements AuditTrail {

    private final AuditProperties properties;
    private final AuditActorResolver actorResolver;
    private final TransactionalAuditService auditService;

    public ConfiguredAuditTrail(
        AuditProperties properties,
        AuditActorResolver actorResolver,
        TransactionalAuditService auditService
    ) {
        this.properties = properties;
        this.actorResolver = actorResolver;
        this.auditService = auditService;
    }

    @Override
    public void recordSuccess(AuditAction action, AuditResourceType resourceType, String resourceId) {
        Objects.requireNonNull(action, "action");
        Objects.requireNonNull(resourceType, "resourceType");
        Objects.requireNonNull(resourceId, "resourceId");

        if (properties.getMode() == AuditMode.OFF) {
            return;
        }

        AuditActor actor = actorResolver.resolveCurrentActor()
            .orElseThrow(AuditActorUnavailableException::new);
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
}
