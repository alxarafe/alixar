package es.alxarafe.alixar.audit;

import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditActor;
import es.alxarafe.alixar.audit.application.AuditActorResolver;
import es.alxarafe.alixar.audit.application.AuditEventDraft;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditPolicy;
import es.alxarafe.alixar.audit.application.AuditPolicyProvider;
import es.alxarafe.alixar.audit.application.AuditReadLevel;
import es.alxarafe.alixar.audit.application.AuditReadPolicy;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditUnavailableException;
import es.alxarafe.alixar.audit.application.PreparedReadAudit;
import es.alxarafe.alixar.audit.application.ReadAuditKind;
import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import es.alxarafe.alixar.audit.domain.AuditResult;
import es.alxarafe.alixar.audit.infrastructure.ConfiguredReadAuditRecorder;
import es.alxarafe.alixar.audit.infrastructure.TransactionalAuditService;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoInteractions;
import static org.mockito.Mockito.when;

class ConfiguredReadAuditRecorderTest {

    private static final UUID CONFIGURATION_ID = UUID.randomUUID();
    private static final UUID ACTOR_ID = UUID.randomUUID();
    private static final UUID RESOURCE_ID = UUID.randomUUID();
    private static final AuditActor ACTOR = new AuditActor(
        ACTOR_ID,
        "audit-user",
        AuditAuthenticationType.SESSION
    );

    private final AuditPolicyProvider policyProvider = mock(AuditPolicyProvider.class);
    private final AuditActorResolver actorResolver = mock(AuditActorResolver.class);
    private final TransactionalAuditService auditService = mock(TransactionalAuditService.class);
    private final ConfiguredReadAuditRecorder recorder = new ConfiguredReadAuditRecorder(
        policyProvider,
        actorResolver,
        auditService
    );

    @Test
    void basicMode_neverResolvesActorOrAppends() {
        when(policyProvider.currentPolicy()).thenReturn(policy(
            AuditMode.BASIC,
            Map.of(AuditResourceType.USER, AuditReadLevel.QUERY_AND_OBJECT)
        ));

        assertThat(recorder.prepare(AuditResourceType.USER, ReadAuditKind.QUERY)).isEmpty();
        assertThat(recorder.prepare(AuditResourceType.USER, ReadAuditKind.OBJECT)).isEmpty();

        verifyNoInteractions(actorResolver, auditService);
    }

    @Test
    void selectiveQueryOnly_preparesQueryAndNotObject() {
        when(policyProvider.currentPolicy()).thenReturn(policy(
            AuditMode.SELECTIVE,
            Map.of(AuditResourceType.USER, AuditReadLevel.QUERY_ONLY)
        ));
        when(actorResolver.resolveCurrentActor()).thenReturn(Optional.of(ACTOR));

        PreparedReadAudit query = recorder.prepare(
            AuditResourceType.USER,
            ReadAuditKind.QUERY
        ).orElseThrow();

        assertThat(query.action()).isEqualTo(AuditAction.READ_QUERY);
        assertThat(recorder.prepare(AuditResourceType.USER, ReadAuditKind.OBJECT)).isEmpty();
        verify(actorResolver).resolveCurrentActor();
    }

    @Test
    void selectiveQueryOnly_recordsQueryWithNoResourceId() {
        PreparedReadAudit query = new PreparedReadAudit(
            ACTOR,
            AuditResourceType.USER,
            ReadAuditKind.QUERY
        );

        recorder.record(query, RESOURCE_ID);

        AuditEventDraft draft = capturedDraft();
        assertThat(draft.action()).isEqualTo(AuditAction.READ_QUERY.name());
        assertThat(draft.resourceType()).isEqualTo(AuditResourceType.USER.name());
        assertThat(draft.resourceId()).isNull();
        assertThat(draft.result()).isEqualTo(AuditResult.SUCCESS);
        assertThat(draft.actorUserId()).isEqualTo(ACTOR_ID);
        assertThat(draft.actorUsername()).isEqualTo("audit-user");
        assertThat(draft.authenticationType()).isEqualTo(AuditAuthenticationType.SESSION);
        assertThat(draft.requestId()).isNull();
    }

    @Test
    void selectiveQueryAndObject_recordsObjectWithInternalResourceId() {
        when(policyProvider.currentPolicy()).thenReturn(policy(
            AuditMode.SELECTIVE,
            Map.of(AuditResourceType.ROLE, AuditReadLevel.QUERY_AND_OBJECT)
        ));
        when(actorResolver.resolveCurrentActor()).thenReturn(Optional.of(ACTOR));

        PreparedReadAudit object = recorder.prepare(
            AuditResourceType.ROLE,
            ReadAuditKind.OBJECT
        ).orElseThrow();
        recorder.record(object, RESOURCE_ID);

        AuditEventDraft draft = capturedDraft();
        assertThat(draft.action()).isEqualTo(AuditAction.READ_OBJECT.name());
        assertThat(draft.resourceType()).isEqualTo(AuditResourceType.ROLE.name());
        assertThat(draft.resourceId()).isEqualTo(RESOURCE_ID.toString());
    }

    @Test
    void selectiveNone_doesNotResolveActorOrAppend() {
        when(policyProvider.currentPolicy()).thenReturn(policy(AuditMode.SELECTIVE, Map.of()));

        assertThat(recorder.prepare(AuditResourceType.USER, ReadAuditKind.QUERY)).isEmpty();
        assertThat(recorder.prepare(AuditResourceType.USER, ReadAuditKind.OBJECT)).isEmpty();
        verifyNoInteractions(actorResolver, auditService);
    }

    @Test
    void requiredReadWithoutActor_failsClosed() {
        when(policyProvider.currentPolicy()).thenReturn(policy(
            AuditMode.SELECTIVE,
            Map.of(AuditResourceType.USER, AuditReadLevel.QUERY_ONLY)
        ));
        when(actorResolver.resolveCurrentActor()).thenReturn(Optional.empty());

        assertThatThrownBy(() -> recorder.prepare(
            AuditResourceType.USER,
            ReadAuditKind.QUERY
        )).isInstanceOf(AuditUnavailableException.class);
        verify(auditService, never()).appendIsolated(any());
    }

    @Test
    void policyEvaluationFailure_failsClosed() {
        when(policyProvider.currentPolicy()).thenThrow(new IllegalStateException("unavailable"));

        assertThatThrownBy(() -> recorder.prepare(
            AuditResourceType.USER,
            ReadAuditKind.QUERY
        )).isInstanceOf(AuditUnavailableException.class);
        verifyNoInteractions(actorResolver, auditService);
    }

    @Test
    void appendFailure_failsClosed() {
        PreparedReadAudit query = new PreparedReadAudit(
            ACTOR,
            AuditResourceType.USER,
            ReadAuditKind.QUERY
        );
        when(auditService.appendIsolated(any()))
            .thenThrow(new IllegalStateException("audit unavailable"));

        assertThatThrownBy(() -> recorder.record(query, null))
            .isInstanceOf(AuditUnavailableException.class);
    }

    private AuditPolicy policy(
        AuditMode mode,
        Map<AuditResourceType, AuditReadLevel> rules
    ) {
        return new AuditPolicy(
            mode,
            new AuditReadPolicy(CONFIGURATION_ID, rules)
        );
    }

    private AuditEventDraft capturedDraft() {
        ArgumentCaptor<AuditEventDraft> captor =
            ArgumentCaptor.forClass(AuditEventDraft.class);
        verify(auditService).appendIsolated(captor.capture());
        return captor.getValue();
    }
}
