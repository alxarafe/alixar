package es.alxarafe.alixar.audit.infrastructure;

import es.alxarafe.alixar.audit.application.AuditConfigurationMissingException;
import es.alxarafe.alixar.audit.application.AuditConfigurationRepository;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditPolicy;
import es.alxarafe.alixar.audit.application.AuditPolicyConfiguration;
import es.alxarafe.alixar.audit.application.AuditPolicyProvider;
import es.alxarafe.alixar.audit.application.AuditReadPolicy;
import es.alxarafe.alixar.audit.application.AuditReadPolicyRepository;
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
    private final AuditReadPolicyRepository readPolicyRepository;
    private final Clock clock;
    private final Duration refreshInterval;
    private volatile Snapshot snapshot;

    public CachedAuditPolicyProvider(
        AuditConfigurationRepository repository,
        AuditReadPolicyRepository readPolicyRepository,
        Clock clock,
        Duration refreshInterval
    ) {
        this.repository = Objects.requireNonNull(repository, "repository");
        this.readPolicyRepository =
            Objects.requireNonNull(readPolicyRepository, "readPolicyRepository");
        this.clock = Objects.requireNonNull(clock, "clock");
        this.refreshInterval = Objects.requireNonNull(refreshInterval, "refreshInterval");
        if (refreshInterval.isNegative()) {
            throw new IllegalArgumentException("refreshInterval must not be negative");
        }
    }

    @Override
    public AuditMode currentMode() {
        return currentPolicy().mode();
    }

    @Override
    public AuditPolicy currentPolicy() {
        Snapshot current = snapshot;
        if (current == null || isExpired(current)) {
            current = refresh();
        }
        return current.policy();
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
                "Could not refresh persisted audit policy; keeping mode {}",
                current.policy().mode(),
                exception
            );
            return current;
        }
    }

    private Snapshot load() {
        AuditPolicyConfiguration configuration = repository.find()
            .orElseThrow(AuditConfigurationMissingException::new);
        AuditReadPolicy readPolicy = new AuditReadPolicy(
            configuration.id(),
            readPolicyRepository.findRules(configuration.id())
        );
        return new Snapshot(
            new AuditPolicy(configuration.mode(), readPolicy),
            clock.instant()
        );
    }

    private boolean isExpired(Snapshot current) {
        return !clock.instant().isBefore(current.loadedAt().plus(refreshInterval));
    }

    private record Snapshot(AuditPolicy policy, Instant loadedAt) {
    }
}
