package es.alxarafe.alixar.audit;

import es.alxarafe.alixar.audit.application.AuditConfigurationMissingException;
import es.alxarafe.alixar.audit.application.AuditConfigurationRepository;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditPolicyConfiguration;
import es.alxarafe.alixar.audit.infrastructure.CachedAuditPolicyProvider;
import java.time.Clock;
import java.time.Duration;
import java.time.Instant;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.util.Optional;
import java.util.UUID;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class CachedAuditPolicyProviderTest {

    private static final Instant START = Instant.parse("2026-10-21T10:00:00Z");
    private static final Duration REFRESH_INTERVAL = Duration.ofSeconds(15);

    private final AuditConfigurationRepository repository =
        mock(AuditConfigurationRepository.class);
    private final MutableClock clock = new MutableClock(START);
    private final CachedAuditPolicyProvider provider =
        new CachedAuditPolicyProvider(repository, clock, REFRESH_INTERVAL);

    @Test
    void cachesModeUntilRefreshIntervalExpires() {
        when(repository.find()).thenReturn(Optional.of(configuration(AuditMode.BASIC)));

        assertThat(provider.currentMode()).isEqualTo(AuditMode.BASIC);

        when(repository.find()).thenReturn(Optional.of(configuration(AuditMode.OFF)));
        clock.advance(REFRESH_INTERVAL.minusSeconds(1));
        assertThat(provider.currentMode()).isEqualTo(AuditMode.BASIC);

        clock.advance(Duration.ofSeconds(1));
        assertThat(provider.currentMode()).isEqualTo(AuditMode.OFF);
        verify(repository, times(2)).find();
    }

    @Test
    void reloadForcesImmediateRefresh() {
        when(repository.find()).thenReturn(Optional.of(configuration(AuditMode.BASIC)));
        assertThat(provider.currentMode()).isEqualTo(AuditMode.BASIC);

        when(repository.find()).thenReturn(Optional.of(configuration(AuditMode.OFF)));
        provider.reload();

        assertThat(provider.currentMode()).isEqualTo(AuditMode.OFF);
    }

    @Test
    void missingConfigurationThrows() {
        when(repository.find()).thenReturn(Optional.empty());

        assertThatThrownBy(provider::currentMode)
            .isInstanceOf(AuditConfigurationMissingException.class);
    }

    @Test
    void refreshFailureKeepsLastKnownMode() {
        when(repository.find()).thenReturn(Optional.of(configuration(AuditMode.BASIC)));
        assertThat(provider.currentMode()).isEqualTo(AuditMode.BASIC);

        when(repository.find()).thenThrow(new IllegalStateException("database unavailable"));
        clock.advance(REFRESH_INTERVAL);

        assertThat(provider.currentMode()).isEqualTo(AuditMode.BASIC);
    }

    @Test
    void refreshFailureWithoutCachedModeThrows() {
        when(repository.find()).thenThrow(new IllegalStateException("database unavailable"));

        assertThatThrownBy(provider::currentMode)
            .isInstanceOf(IllegalStateException.class);
    }

    private AuditPolicyConfiguration configuration(AuditMode mode) {
        return new AuditPolicyConfiguration(UUID.randomUUID(), mode, START);
    }

    private static final class MutableClock extends Clock {

        private Instant instant;

        private MutableClock(Instant instant) {
            this.instant = instant;
        }

        @Override
        public ZoneId getZone() {
            return ZoneOffset.UTC;
        }

        @Override
        public Clock withZone(ZoneId zone) {
            return this;
        }

        @Override
        public Instant instant() {
            return instant;
        }

        private void advance(Duration duration) {
            instant = instant.plus(duration);
        }
    }
}
