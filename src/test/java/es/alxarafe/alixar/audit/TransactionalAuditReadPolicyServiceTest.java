package es.alxarafe.alixar.audit;

import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditConfigurationMissingException;
import es.alxarafe.alixar.audit.application.AuditConfigurationRepository;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditPolicyConfiguration;
import es.alxarafe.alixar.audit.application.AuditReadLevel;
import es.alxarafe.alixar.audit.application.AuditReadPolicyRepository;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditTrail;
import es.alxarafe.alixar.audit.infrastructure.CachedAuditPolicyProvider;
import es.alxarafe.alixar.audit.infrastructure.TransactionalAuditReadPolicyService;
import java.time.Clock;
import java.time.Instant;
import java.time.ZoneOffset;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import org.junit.jupiter.api.Test;
import org.mockito.InOrder;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.inOrder;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoInteractions;
import static org.mockito.Mockito.when;

class TransactionalAuditReadPolicyServiceTest {

    private static final UUID CONFIGURATION_ID =
        UUID.fromString("3c15acbf-6e74-4af1-8cfe-1452a2935870");
    private static final Instant NOW = Instant.parse("2026-10-22T10:00:00Z");

    private final AuditConfigurationRepository configurationRepository =
        mock(AuditConfigurationRepository.class);
    private final AuditReadPolicyRepository readPolicyRepository =
        mock(AuditReadPolicyRepository.class);
    private final AuditTrail auditTrail = mock(AuditTrail.class);
    private final CachedAuditPolicyProvider policyProvider = mock(CachedAuditPolicyProvider.class);
    private final TransactionalAuditReadPolicyService service =
        new TransactionalAuditReadPolicyService(
            configurationRepository,
            readPolicyRepository,
            auditTrail,
            policyProvider,
            Clock.fixed(NOW, ZoneOffset.UTC)
        );

    @Test
    void sameRulesAreNoOp() {
        when(configurationRepository.findForUpdate())
            .thenReturn(Optional.of(configuration()));
        when(readPolicyRepository.findRules(CONFIGURATION_ID)).thenReturn(Map.of(
            AuditResourceType.USER,
            AuditReadLevel.QUERY_ONLY
        ));

        var result = service.replaceRules(Map.of(
            AuditResourceType.USER,
            AuditReadLevel.QUERY_ONLY
        ));

        assertThat(result.rules()).containsExactlyEntriesOf(Map.of(
            AuditResourceType.USER,
            AuditReadLevel.QUERY_ONLY
        ));
        verify(readPolicyRepository, never()).replaceRules(
            org.mockito.ArgumentMatchers.any(),
            org.mockito.ArgumentMatchers.any(),
            org.mockito.ArgumentMatchers.any()
        );
        verifyNoInteractions(auditTrail, policyProvider);
    }

    @Test
    void addingRuleReplacesRulesAppendsEventAndReloads() {
        when(configurationRepository.findForUpdate())
            .thenReturn(Optional.of(configuration()));
        when(readPolicyRepository.findRules(CONFIGURATION_ID)).thenReturn(Map.of());

        var result = service.replaceRules(Map.of(
            AuditResourceType.USER,
            AuditReadLevel.QUERY_ONLY
        ));

        assertThat(result.rules()).containsExactlyEntriesOf(Map.of(
            AuditResourceType.USER,
            AuditReadLevel.QUERY_ONLY
        ));
        verify(readPolicyRepository).replaceRules(
            CONFIGURATION_ID,
            Map.of(AuditResourceType.USER, AuditReadLevel.QUERY_ONLY),
            NOW
        );
        verify(auditTrail).recordMandatorySuccess(
            AuditAction.AUDIT_READ_POLICY_RULE_CHANGED_TO_QUERY_ONLY,
            AuditResourceType.AUDIT_READ_POLICY,
            AuditResourceType.USER.name()
        );
        verify(policyProvider).reload();
    }

    @Test
    void changesAndRemovalsAppendDeterministicEvents() {
        when(configurationRepository.findForUpdate())
            .thenReturn(Optional.of(configuration()));
        when(readPolicyRepository.findRules(CONFIGURATION_ID)).thenReturn(Map.of(
            AuditResourceType.USER,
            AuditReadLevel.QUERY_ONLY,
            AuditResourceType.ROLE,
            AuditReadLevel.QUERY_AND_OBJECT
        ));

        service.replaceRules(Map.of(
            AuditResourceType.USER,
            AuditReadLevel.NONE,
            AuditResourceType.ROLE,
            AuditReadLevel.QUERY_ONLY
        ));

        verify(readPolicyRepository).replaceRules(
            CONFIGURATION_ID,
            Map.of(AuditResourceType.ROLE, AuditReadLevel.QUERY_ONLY),
            NOW
        );
        InOrder inOrder = inOrder(auditTrail);
        inOrder.verify(auditTrail).recordMandatorySuccess(
            AuditAction.AUDIT_READ_POLICY_RULE_CHANGED_TO_QUERY_ONLY,
            AuditResourceType.AUDIT_READ_POLICY,
            AuditResourceType.ROLE.name()
        );
        inOrder.verify(auditTrail).recordMandatorySuccess(
            AuditAction.AUDIT_READ_POLICY_RULE_CHANGED_TO_NONE,
            AuditResourceType.AUDIT_READ_POLICY,
            AuditResourceType.USER.name()
        );
    }

    @Test
    void noneOnlyRequestIsNormalizedToNoOp() {
        when(configurationRepository.findForUpdate())
            .thenReturn(Optional.of(configuration()));
        when(readPolicyRepository.findRules(CONFIGURATION_ID)).thenReturn(Map.of());

        var result = service.replaceRules(Map.of(
            AuditResourceType.USER,
            AuditReadLevel.NONE
        ));

        assertThat(result.rules()).isEmpty();
        verify(readPolicyRepository, never()).replaceRules(
            org.mockito.ArgumentMatchers.any(),
            org.mockito.ArgumentMatchers.any(),
            org.mockito.ArgumentMatchers.any()
        );
        verifyNoInteractions(auditTrail, policyProvider);
    }

    @Test
    void unsupportedResourceTypeIsRejectedBeforePersistence() {
        when(configurationRepository.findForUpdate())
            .thenReturn(Optional.of(configuration()));

        assertThatThrownBy(() -> service.replaceRules(Map.of(
            AuditResourceType.API_TOKEN,
            AuditReadLevel.QUERY_ONLY
        ))).isInstanceOf(IllegalArgumentException.class);
        verify(readPolicyRepository, never()).replaceRules(
            org.mockito.ArgumentMatchers.any(),
            org.mockito.ArgumentMatchers.any(),
            org.mockito.ArgumentMatchers.any()
        );
        verifyNoInteractions(auditTrail, policyProvider);
    }

    @Test
    void appendFailureDoesNotReloadTheCache() {
        when(configurationRepository.findForUpdate())
            .thenReturn(Optional.of(configuration()));
        when(readPolicyRepository.findRules(CONFIGURATION_ID)).thenReturn(Map.of());
        doThrow(new IllegalStateException("audit append failed"))
            .when(auditTrail)
            .recordMandatorySuccess(
                AuditAction.AUDIT_READ_POLICY_RULE_CHANGED_TO_QUERY_ONLY,
                AuditResourceType.AUDIT_READ_POLICY,
                AuditResourceType.USER.name()
            );

        assertThatThrownBy(() -> service.replaceRules(Map.of(
            AuditResourceType.USER,
            AuditReadLevel.QUERY_ONLY
        ))).isInstanceOf(IllegalStateException.class);
        verify(policyProvider, never()).reload();
    }

    @Test
    void cacheReloadFailureDoesNotFailTheUpdate() {
        when(configurationRepository.findForUpdate())
            .thenReturn(Optional.of(configuration()));
        when(readPolicyRepository.findRules(CONFIGURATION_ID)).thenReturn(Map.of());
        doThrow(new IllegalStateException("database unavailable")).when(policyProvider).reload();

        var result = service.replaceRules(Map.of(
            AuditResourceType.USER,
            AuditReadLevel.QUERY_ONLY
        ));

        assertThat(result.levelFor(AuditResourceType.USER))
            .isEqualTo(AuditReadLevel.QUERY_ONLY);
    }

    @Test
    void missingConfigurationThrows() {
        when(configurationRepository.findForUpdate()).thenReturn(Optional.empty());

        assertThatThrownBy(() -> service.replaceRules(Map.of()))
            .isInstanceOf(AuditConfigurationMissingException.class);
    }

    private AuditPolicyConfiguration configuration() {
        return new AuditPolicyConfiguration(
            CONFIGURATION_ID,
            AuditMode.SELECTIVE,
            NOW.minusSeconds(60)
        );
    }
}
