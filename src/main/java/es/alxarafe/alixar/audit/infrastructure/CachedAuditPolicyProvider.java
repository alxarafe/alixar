package es.alxarafe.alixar.audit.infrastructure;

import es.alxarafe.alixar.audit.application.AuditConfigurationMissingException;
import es.alxarafe.alixar.audit.application.AuditConfigurationRepository;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditPolicyProvider;
import java.time.Clock;
import java.time.Duration;
import java.time.Instant;
import java.util.Objects;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Caches the persisted audit policy for a short interval.
 *
 * <p>This keeps the {@link AuditMode#OFF} path free of database access for
 * ordinary audited operations. The cache is local to each instance, so changes
 * take up to {@link #DEFAULT_REFRESH_INTERVAL} to become visible on other
 * nodes. That is a documented temporary limitation, not a distributed cache.</p>
 */
public class CachedAuditPolicyProvider implements AuditPolicyProvider {

    public static final Duration DEFAULT_REFRESH_INTERVAL = Duration.ofSeconds(15);

    private static final Logger LOGGER = LoggerFactory.getLogger(CachedAuditPolicyProvider.class);

    private final AuditConfigurationRepository repository;
    private final Clock clock;
    private final Duration refreshInterval;
    private volatile Snapshot snapshot;

    public CachedAuditPolicyProvider(
        AuditConfigurationRepository repository,
        Clock clock,
        Duration refreshInterval
    ) {
        this.repository = Objects.requireNonNull(repository, "repository");
        this.clock = Objects.requireNonNull(clock, "clock");
        this.refreshInterval = Objects.requireNonNull(refreshInterval, "refreshInterval");
        if (refreshInterval.isNegative()) {
            throw new IllegalArgumentException("refreshInterval must not be negative");
        }
    }

    @Override
    public AuditMode currentMode() {
        Snapshot current = snapshot;
        if (current == null || isExpired(current)) {
            current = refresh();
        }
        return current.mode();
    }

    /**
     * Forces a reload from the repository.
     */
    public void reload() {
        synchronized (this) {
            snapshot = load();
        }
    }

    private synchronized Snapshot refresh() {
        Snapshot current = snapshot;
        if (current != null && !isExpired(current)) {
            return current;
        }
        try {
            Snapshot loaded = load();
            snapshot = loaded;
            return loaded;
        } catch (RuntimeException exception) {
            if (current == null) {
                throw exception;
            }
            LOGGER.warn(
                "Could not refresh persisted audit configuration; keeping mode {}",
                current.mode(),
                exception
            );
            return current;
        }
    }

    private Snapshot load() {
        AuditMode mode = repository.find()
            .orElseThrow(AuditConfigurationMissingException::new)
            .mode();
        return new Snapshot(mode, clock.instant());
    }

    private boolean isExpired(Snapshot current) {
        return !clock.instant().isBefore(current.loadedAt().plus(refreshInterval));
    }

    private record Snapshot(AuditMode mode, Instant loadedAt) {
    }
}
