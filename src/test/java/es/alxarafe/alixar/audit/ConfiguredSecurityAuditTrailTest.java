package es.alxarafe.alixar.audit;

import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditActor;
import es.alxarafe.alixar.audit.application.AuditEventDraft;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditPolicyProvider;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditUnavailableException;
import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditResult;
import es.alxarafe.alixar.audit.infrastructure.ConfiguredSecurityAuditTrail;
import es.alxarafe.alixar.audit.infrastructure.TransactionalAuditService;
import java.util.UUID;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatCode;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoInteractions;
import static org.mockito.Mockito.when;

class ConfiguredSecurityAuditTrailTest {

    private static final UUID ACTOR_ID = UUID.fromString("8f796219-e501-44e8-a4ab-4c014821ba58");
    private static final AuditActor ACTOR = new AuditActor(
        ACTOR_ID,
        "alice",
        AuditAuthenticationType.SESSION
    );

    private final AuditPolicyProvider policyProvider = mock(AuditPolicyProvider.class);
    private final TransactionalAuditService auditService = mock(TransactionalAuditService.class);
    private final ConfiguredSecurityAuditTrail auditTrail =
        new ConfiguredSecurityAuditTrail(policyProvider, auditService);

    @Test
    void offMode_doesNotAppendAnySecurityEvent() {
        when(policyProvider.currentMode()).thenReturn(AuditMode.OFF);

        auditTrail.loginSucceeded(ACTOR);
        auditTrail.loginFailed();
        auditTrail.logout(ACTOR);
        auditTrail.accessDenied(ACTOR, "GET /api/admin/users");

        verifyNoInteractions(auditService);
    }

    @Test
    void basicMode_loginSucceededAppendsMandatoryUserEvent() {
        when(policyProvider.currentMode()).thenReturn(AuditMode.BASIC);

        auditTrail.loginSucceeded(ACTOR);

        AuditEventDraft draft = capturedAppend();
        assertThat(draft.chainId()).isEqualTo(AuditChain.DEFAULT_CHAIN_ID);
        assertThat(draft.actorUserId()).isEqualTo(ACTOR_ID);
        assertThat(draft.actorUsername()).isEqualTo("alice");
        assertThat(draft.authenticationType()).isEqualTo(AuditAuthenticationType.SESSION);
        assertThat(draft.action()).isEqualTo(AuditAction.LOGIN_SUCCEEDED.name());
        assertThat(draft.resourceType()).isEqualTo(AuditResourceType.USER.name());
        assertThat(draft.resourceId()).isEqualTo(ACTOR_ID.toString());
        assertThat(draft.result()).isEqualTo(AuditResult.SUCCESS);
        verify(auditService, never()).appendIsolated(any());
    }

    @Test
    void basicMode_loginSucceededAppendFailureIsFailClosed() {
        when(policyProvider.currentMode()).thenReturn(AuditMode.BASIC);
        when(auditService.append(any())).thenThrow(new IllegalStateException("database down"));

        assertThatThrownBy(() -> auditTrail.loginSucceeded(ACTOR))
            .isInstanceOf(AuditUnavailableException.class);
    }

    @Test
    void basicMode_policyFailureOnLoginSucceededIsFailClosed() {
        when(policyProvider.currentMode()).thenThrow(new IllegalStateException("policy unavailable"));

        assertThatThrownBy(() -> auditTrail.loginSucceeded(ACTOR))
            .isInstanceOf(AuditUnavailableException.class);
    }

    @Test
    void basicMode_loginFailedAppendsIsolatedEventWithoutActorOrIdentifier() {
        when(policyProvider.currentMode()).thenReturn(AuditMode.BASIC);

        auditTrail.loginFailed();

        AuditEventDraft draft = capturedIsolatedAppend();
        assertThat(draft.actorUserId()).isNull();
        assertThat(draft.actorUsername()).isNull();
        assertThat(draft.authenticationType()).isNull();
        assertThat(draft.action()).isEqualTo(AuditAction.LOGIN_FAILED.name());
        assertThat(draft.resourceType()).isEqualTo(AuditResourceType.AUTHENTICATION.name());
        assertThat(draft.resourceId()).isNull();
        assertThat(draft.result()).isEqualTo(AuditResult.FAILURE);
    }

    @Test
    void basicMode_loginFailedAppendFailureIsSwallowed() {
        when(policyProvider.currentMode()).thenReturn(AuditMode.BASIC);
        when(auditService.appendIsolated(any())).thenThrow(new IllegalStateException("database down"));

        assertThatCode(auditTrail::loginFailed).doesNotThrowAnyException();
    }

    @Test
    void basicMode_logoutAppendsIsolatedUserEvent() {
        when(policyProvider.currentMode()).thenReturn(AuditMode.BASIC);

        auditTrail.logout(ACTOR);

        AuditEventDraft draft = capturedIsolatedAppend();
        assertThat(draft.actorUserId()).isEqualTo(ACTOR_ID);
        assertThat(draft.actorUsername()).isEqualTo("alice");
        assertThat(draft.authenticationType()).isEqualTo(AuditAuthenticationType.SESSION);
        assertThat(draft.action()).isEqualTo(AuditAction.LOGOUT.name());
        assertThat(draft.resourceType()).isEqualTo(AuditResourceType.USER.name());
        assertThat(draft.resourceId()).isEqualTo(ACTOR_ID.toString());
        assertThat(draft.result()).isEqualTo(AuditResult.SUCCESS);
    }

    @Test
    void basicMode_logoutAppendFailureIsSwallowed() {
        when(policyProvider.currentMode()).thenReturn(AuditMode.BASIC);
        when(auditService.appendIsolated(any())).thenThrow(new IllegalStateException("database down"));

        assertThatCode(() -> auditTrail.logout(ACTOR)).doesNotThrowAnyException();
    }

    @Test
    void basicMode_accessDeniedAppendsIsolatedHttpRequestEvent() {
        when(policyProvider.currentMode()).thenReturn(AuditMode.BASIC);

        auditTrail.accessDenied(ACTOR, "PATCH /api/admin/users");

        AuditEventDraft draft = capturedIsolatedAppend();
        assertThat(draft.actorUserId()).isEqualTo(ACTOR_ID);
        assertThat(draft.actorUsername()).isEqualTo("alice");
        assertThat(draft.authenticationType()).isEqualTo(AuditAuthenticationType.SESSION);
        assertThat(draft.action()).isEqualTo(AuditAction.ACCESS_DENIED.name());
        assertThat(draft.resourceType()).isEqualTo(AuditResourceType.HTTP_REQUEST.name());
        assertThat(draft.resourceId()).isEqualTo("PATCH /api/admin/users");
        assertThat(draft.result()).isEqualTo(AuditResult.DENIED);
        verify(auditService, never()).append(any());
    }

    @Test
    void basicMode_accessDeniedAppendFailureIsSwallowed() {
        when(policyProvider.currentMode()).thenReturn(AuditMode.BASIC);
        when(auditService.appendIsolated(any())).thenThrow(new IllegalStateException("database down"));

        assertThatCode(() -> auditTrail.accessDenied(ACTOR, "GET /api/admin/users"))
            .doesNotThrowAnyException();
    }

    @Test
    void basicMode_accessDeniedPolicyFailureIsSwallowed() {
        when(policyProvider.currentMode()).thenThrow(new IllegalStateException("policy unavailable"));

        assertThatCode(() -> auditTrail.accessDenied(ACTOR, "GET /api/admin/users"))
            .doesNotThrowAnyException();
    }

    private AuditEventDraft capturedAppend() {
        ArgumentCaptor<AuditEventDraft> captor = ArgumentCaptor.forClass(AuditEventDraft.class);
        verify(auditService).append(captor.capture());
        return captor.getValue();
    }

    private AuditEventDraft capturedIsolatedAppend() {
        ArgumentCaptor<AuditEventDraft> captor = ArgumentCaptor.forClass(AuditEventDraft.class);
        verify(auditService).appendIsolated(captor.capture());
        return captor.getValue();
    }
}
