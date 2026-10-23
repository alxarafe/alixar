package es.alxarafe.alixar.audit;

import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditActor;
import es.alxarafe.alixar.audit.application.AuditActorResolver;
import es.alxarafe.alixar.audit.application.AuditActorUnavailableException;
import es.alxarafe.alixar.audit.application.AuditEventDraft;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditPolicyProvider;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditResult;
import es.alxarafe.alixar.audit.infrastructure.ConfiguredAuditTrail;
import es.alxarafe.alixar.audit.infrastructure.TransactionalAuditService;
import java.util.Optional;
import java.util.UUID;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoInteractions;
import static org.mockito.Mockito.when;

class ConfiguredAuditTrailTest {

    private static final UUID ACTOR_ID = UUID.fromString("8f796219-e501-44e8-a4ab-4c014821ba58");
    private static final UUID RESOURCE_ID = UUID.fromString("3c15acbf-6e74-4af1-8cfe-1452a2935870");

    private final AuditPolicyProvider policyProvider = mock(AuditPolicyProvider.class);
    private final AuditActorResolver actorResolver = mock(AuditActorResolver.class);
    private final TransactionalAuditService auditService = mock(TransactionalAuditService.class);
    private final ConfiguredAuditTrail auditTrail =
        new ConfiguredAuditTrail(policyProvider, actorResolver, auditService);

    @Test
    void offMode_doesNotResolveActorOrBuildAnEvent() {
        when(policyProvider.currentMode()).thenReturn(AuditMode.OFF);

        auditTrail.recordSuccess(AuditAction.USER_DISABLED, AuditResourceType.USER, RESOURCE_ID.toString());

        verifyNoInteractions(actorResolver, auditService);
    }

    @Test
    void basicMode_appendsSuccessfulEventForResolvedActor() {
        when(policyProvider.currentMode()).thenReturn(AuditMode.BASIC);
        AuditActor actor = new AuditActor(ACTOR_ID, "alice", AuditAuthenticationType.SESSION);
        when(actorResolver.resolveCurrentActor()).thenReturn(Optional.of(actor));

        auditTrail.recordSuccess(AuditAction.USER_DISABLED, AuditResourceType.USER, RESOURCE_ID.toString());

        var captor = org.mockito.ArgumentCaptor.forClass(AuditEventDraft.class);
        verify(auditService).append(captor.capture());
        AuditEventDraft draft = captor.getValue();
        assertThat(draft.chainId()).isEqualTo(AuditChain.DEFAULT_CHAIN_ID);
        assertThat(draft.actorUserId()).isEqualTo(ACTOR_ID);
        assertThat(draft.actorUsername()).isEqualTo("alice");
        assertThat(draft.authenticationType()).isEqualTo(AuditAuthenticationType.SESSION);
        assertThat(draft.action()).isEqualTo(AuditAction.USER_DISABLED.name());
        assertThat(draft.resourceType()).isEqualTo(AuditResourceType.USER.name());
        assertThat(draft.resourceId()).isEqualTo(RESOURCE_ID.toString());
        assertThat(draft.result()).isEqualTo(AuditResult.SUCCESS);
        assertThat(draft.requestId()).isNull();
    }

    @Test
    void basicMode_withoutResolvedActor_failsWithoutAppending() {
        when(policyProvider.currentMode()).thenReturn(AuditMode.BASIC);
        when(actorResolver.resolveCurrentActor()).thenReturn(Optional.empty());

        assertThatThrownBy(() -> auditTrail.recordSuccess(
            AuditAction.USER_ENABLED,
            AuditResourceType.USER,
            RESOURCE_ID.toString()
        )).isInstanceOf(AuditActorUnavailableException.class);
        verifyNoInteractions(auditService);
    }
    @Test
    void offMode_withExplicitActorDoesNotAppendAnEvent() {
        when(policyProvider.currentMode()).thenReturn(AuditMode.OFF);
        AuditActor actor = new AuditActor(ACTOR_ID, "alice", AuditAuthenticationType.RECOVERY_TOKEN);

        auditTrail.recordSuccess(
            actor,
            AuditAction.PASSWORD_RESET_COMPLETED,
            AuditResourceType.USER,
            RESOURCE_ID.toString()
        );

        verifyNoInteractions(actorResolver, auditService);
    }

    @Test
    void basicMode_withExplicitActorAppendsThatActorWithoutResolvingIt() {
        when(policyProvider.currentMode()).thenReturn(AuditMode.BASIC);
        AuditActor actor = new AuditActor(ACTOR_ID, "alice", AuditAuthenticationType.RECOVERY_TOKEN);

        auditTrail.recordSuccess(
            actor,
            AuditAction.PASSWORD_RESET_COMPLETED,
            AuditResourceType.USER,
            RESOURCE_ID.toString()
        );

        var captor = org.mockito.ArgumentCaptor.forClass(AuditEventDraft.class);
        verify(auditService).append(captor.capture());
        AuditEventDraft draft = captor.getValue();
        assertThat(draft.actorUserId()).isEqualTo(ACTOR_ID);
        assertThat(draft.actorUsername()).isEqualTo("alice");
        assertThat(draft.authenticationType()).isEqualTo(AuditAuthenticationType.RECOVERY_TOKEN);
        assertThat(draft.action()).isEqualTo(AuditAction.PASSWORD_RESET_COMPLETED.name());
        assertThat(draft.resourceType()).isEqualTo(AuditResourceType.USER.name());
        assertThat(draft.resourceId()).isEqualTo(RESOURCE_ID.toString());
        assertThat(draft.result()).isEqualTo(AuditResult.SUCCESS);
        assertThat(draft.requestId()).isNull();
        verifyNoInteractions(actorResolver);
    }

    @Test
    void mandatorySuccess_inOffModeAppendsAnEvent() {
        when(policyProvider.currentMode()).thenReturn(AuditMode.OFF);
        AuditActor actor = new AuditActor(ACTOR_ID, "alice", AuditAuthenticationType.SESSION);
        when(actorResolver.resolveCurrentActor()).thenReturn(Optional.of(actor));

        auditTrail.recordMandatorySuccess(
            AuditAction.AUDIT_MODE_CHANGED_TO_OFF,
            AuditResourceType.AUDIT_CONFIGURATION,
            RESOURCE_ID.toString()
        );

        var captor = org.mockito.ArgumentCaptor.forClass(AuditEventDraft.class);
        verify(auditService).append(captor.capture());
        AuditEventDraft draft = captor.getValue();
        assertThat(draft.actorUserId()).isEqualTo(ACTOR_ID);
        assertThat(draft.actorUsername()).isEqualTo("alice");
        assertThat(draft.authenticationType()).isEqualTo(AuditAuthenticationType.SESSION);
        assertThat(draft.action()).isEqualTo(AuditAction.AUDIT_MODE_CHANGED_TO_OFF.name());
        assertThat(draft.resourceType()).isEqualTo(AuditResourceType.AUDIT_CONFIGURATION.name());
        assertThat(draft.resourceId()).isEqualTo(RESOURCE_ID.toString());
        assertThat(draft.result()).isEqualTo(AuditResult.SUCCESS);
        assertThat(draft.requestId()).isNull();
        verifyNoInteractions(policyProvider);
    }

    @Test
    void mandatorySuccess_withoutResolvedActorFailsWithoutAppending() {
        when(actorResolver.resolveCurrentActor()).thenReturn(Optional.empty());

        assertThatThrownBy(() -> auditTrail.recordMandatorySuccess(
            AuditAction.AUDIT_MODE_CHANGED_TO_BASIC,
            AuditResourceType.AUDIT_CONFIGURATION,
            RESOURCE_ID.toString()
        )).isInstanceOf(AuditActorUnavailableException.class);
        verifyNoInteractions(policyProvider, auditService);
    }

}
