package es.alxarafe.alixar.audit;

import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditConfigurationRepository;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditPolicyConfiguration;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditTrail;
import es.alxarafe.alixar.audit.infrastructure.CachedAuditPolicyProvider;
import es.alxarafe.alixar.audit.infrastructure.TransactionalAuditConfigurationService;
import java.time.Clock;
import java.time.Instant;
import java.time.ZoneOffset;
import java.util.Optional;
import java.util.UUID;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoInteractions;
import static org.mockito.Mockito.when;

class TransactionalAuditConfigurationServiceTest {

    private static final UUID CONFIGURATION_ID =
        UUID.fromString("3c15acbf-6e74-4af1-8cfe-1452a2935870");
    private static final Instant NOW = Instant.parse("2026-10-22T10:00:00Z");

    private final AuditConfigurationRepository repository =
        mock(AuditConfigurationRepository.class);
    private final AuditTrail auditTrail = mock(AuditTrail.class);
    private final CachedAuditPolicyProvider policyProvider = mock(CachedAuditPolicyProvider.class);
    private final TransactionalAuditConfigurationService service =
        new TransactionalAuditConfigurationService(
            repository,
            auditTrail,
            policyProvider,
            Clock.fixed(NOW, ZoneOffset.UTC)
        );

    @Test
    void sameModeIsNoOp() {
        AuditPolicyConfiguration current = configuration(AuditMode.OFF);
        when(repository.findForUpdate()).thenReturn(Optional.of(current));

        AuditPolicyConfiguration result = service.updateMode(AuditMode.OFF);

        assertThat(result).isEqualTo(current);
        verify(repository, never()).updateMode(
            org.mockito.ArgumentMatchers.any(),
            org.mockito.ArgumentMatchers.any(),
            org.mockito.ArgumentMatchers.any()
        );
        verifyNoInteractions(auditTrail, policyProvider);
    }

    @Test
    void offToBasicUpdatesAndAppendsMandatoryEvent() {
        when(repository.findForUpdate()).thenReturn(Optional.of(configuration(AuditMode.OFF)));

        AuditPolicyConfiguration result = service.updateMode(AuditMode.BASIC);

        assertThat(result).isEqualTo(
            new AuditPolicyConfiguration(CONFIGURATION_ID, AuditMode.BASIC, NOW)
        );
        verify(repository).updateMode(CONFIGURATION_ID, AuditMode.BASIC, NOW);
        verify(auditTrail).recordMandatorySuccess(
            AuditAction.AUDIT_MODE_CHANGED_TO_BASIC,
            AuditResourceType.AUDIT_CONFIGURATION,
            CONFIGURATION_ID.toString()
        );
        verify(policyProvider).reload();
    }

    @Test
    void basicToOffUpdatesAndAppendsMandatoryEvent() {
        when(repository.findForUpdate()).thenReturn(Optional.of(configuration(AuditMode.BASIC)));

        service.updateMode(AuditMode.OFF);

        verify(repository).updateMode(CONFIGURATION_ID, AuditMode.OFF, NOW);
        verify(auditTrail).recordMandatorySuccess(
            AuditAction.AUDIT_MODE_CHANGED_TO_OFF,
            AuditResourceType.AUDIT_CONFIGURATION,
            CONFIGURATION_ID.toString()
        );
    }

    @Test
    void appendFailureDoesNotReloadTheCache() {
        when(repository.findForUpdate()).thenReturn(Optional.of(configuration(AuditMode.OFF)));
        doThrow(new IllegalStateException("audit append failed"))
            .when(auditTrail)
            .recordMandatorySuccess(
                AuditAction.AUDIT_MODE_CHANGED_TO_BASIC,
                AuditResourceType.AUDIT_CONFIGURATION,
                CONFIGURATION_ID.toString()
            );

        assertThatThrownBy(() -> service.updateMode(AuditMode.BASIC))
            .isInstanceOf(IllegalStateException.class);
        verify(policyProvider, never()).reload();
    }

    @Test
    void cacheReloadFailureDoesNotFailTheUpdate() {
        when(repository.findForUpdate()).thenReturn(Optional.of(configuration(AuditMode.OFF)));
        doThrow(new IllegalStateException("database unavailable")).when(policyProvider).reload();

        AuditPolicyConfiguration result = service.updateMode(AuditMode.BASIC);

        assertThat(result.mode()).isEqualTo(AuditMode.BASIC);
    }

    private AuditPolicyConfiguration configuration(AuditMode mode) {
        return new AuditPolicyConfiguration(CONFIGURATION_ID, mode, NOW.minusSeconds(60));
    }
}
