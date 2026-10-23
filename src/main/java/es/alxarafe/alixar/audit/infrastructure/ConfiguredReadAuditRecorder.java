package es.alxarafe.alixar.audit.infrastructure;

import es.alxarafe.alixar.audit.application.AuditActor;
import es.alxarafe.alixar.audit.application.AuditActorResolver;
import es.alxarafe.alixar.audit.application.AuditEventDraft;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditPolicy;
import es.alxarafe.alixar.audit.application.AuditPolicyProvider;
import es.alxarafe.alixar.audit.application.AuditReadLevel;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditUnavailableException;
import es.alxarafe.alixar.audit.application.PreparedReadAudit;
import es.alxarafe.alixar.audit.application.ReadAuditKind;
import es.alxarafe.alixar.audit.application.ReadAuditRecorder;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditResult;
import java.util.Objects;
import java.util.Optional;
import java.util.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ConfiguredReadAuditRecorder implements ReadAuditRecorder {

    private static final Logger LOGGER =
        LoggerFactory.getLogger(ConfiguredReadAuditRecorder.class);

    private final AuditPolicyProvider policyProvider;
    private final AuditActorResolver actorResolver;
    private final TransactionalAuditService auditService;

    public ConfiguredReadAuditRecorder(
        AuditPolicyProvider policyProvider,
        AuditActorResolver actorResolver,
        TransactionalAuditService auditService
    ) {
        this.policyProvider = Objects.requireNonNull(policyProvider, "policyProvider");
        this.actorResolver = Objects.requireNonNull(actorResolver, "actorResolver");
        this.auditService = Objects.requireNonNull(auditService, "auditService");
    }

    @Override
    public Optional<PreparedReadAudit> prepare(
        AuditResourceType resourceType,
        ReadAuditKind kind
    ) {
        Objects.requireNonNull(resourceType, "resourceType");
        Objects.requireNonNull(kind, "kind");

        AuditPolicy policy;
        try {
            policy = policyProvider.currentPolicy();
        } catch (RuntimeException exception) {
            LOGGER.error("Could not evaluate mandatory read audit policy", exception);
            throw new AuditUnavailableException();
        }
        if (policy.mode() != AuditMode.SELECTIVE
            || !requiresAudit(policy, resourceType, kind)) {
            return Optional.empty();
        }

        AuditActor actor;
        try {
            actor = actorResolver.resolveCurrentActor()
                .orElseThrow(AuditUnavailableException::new);
        } catch (AuditUnavailableException exception) {
            throw exception;
        } catch (RuntimeException exception) {
            LOGGER.error("Could not resolve mandatory read audit actor", exception);
            throw new AuditUnavailableException();
        }
        return Optional.of(new PreparedReadAudit(actor, resourceType, kind));
    }

    @Override
    public void record(PreparedReadAudit audit, UUID resourceId) {
        Objects.requireNonNull(audit, "audit");
        String encodedResourceId = switch (audit.kind()) {
            case QUERY -> null;
            case OBJECT -> Objects.requireNonNull(resourceId, "resourceId").toString();
        };
        AuditActor actor = audit.actor();
        try {
            auditService.appendIsolated(new AuditEventDraft(
                AuditChain.DEFAULT_CHAIN_ID,
                actor.userId(),
                actor.username(),
                actor.authenticationType(),
                audit.action().name(),
                audit.resourceType().name(),
                encodedResourceId,
                AuditResult.SUCCESS,
                null
            ));
        } catch (RuntimeException exception) {
            LOGGER.error("Could not append mandatory read audit event", exception);
            throw new AuditUnavailableException();
        }
    }

    private boolean requiresAudit(
        AuditPolicy policy,
        AuditResourceType resourceType,
        ReadAuditKind kind
    ) {
        AuditReadLevel level = policy.readLevelFor(resourceType);
        return switch (kind) {
            case QUERY -> level != AuditReadLevel.NONE;
            case OBJECT -> level == AuditReadLevel.QUERY_AND_OBJECT;
        };
    }
}
