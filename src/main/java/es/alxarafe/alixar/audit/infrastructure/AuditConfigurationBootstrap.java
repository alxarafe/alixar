package es.alxarafe.alixar.audit.infrastructure;

import es.alxarafe.alixar.audit.application.AuditConfigurationRepository;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditPolicyConfiguration;
import java.time.Clock;
import java.util.Optional;
import java.util.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * Creates the persisted audit configuration on first startup.
 *
 * <p>{@code alixar.audit.mode} is honored only while no configuration row
 * exists. Once a row exists it is authoritative; an invalid bootstrap value is
 * ignored and logged instead of preventing startup.</p>
 */
@Component
@Order(Ordered.HIGHEST_PRECEDENCE)
public class AuditConfigurationBootstrap implements ApplicationRunner {

    private static final Logger LOGGER = LoggerFactory.getLogger(AuditConfigurationBootstrap.class);

    private final AuditConfigurationRepository repository;
    private final AuditProperties properties;
    private final CachedAuditPolicyProvider policyProvider;
    private final Clock clock;

    public AuditConfigurationBootstrap(
        AuditConfigurationRepository repository,
        AuditProperties properties,
        CachedAuditPolicyProvider policyProvider,
        Clock clock
    ) {
        this.repository = repository;
        this.properties = properties;
        this.policyProvider = policyProvider;
        this.clock = clock;
    }

    @Override
    public void run(ApplicationArguments arguments) {
        initialize();
    }

    public void initialize() {
        Optional<AuditPolicyConfiguration> existing = repository.find();
        if (existing.isEmpty()) {
            AuditMode mode = properties.bootstrapMode();
            repository.insertIfAbsent(new AuditPolicyConfiguration(
                UUID.randomUUID(),
                mode,
                clock.instant()
            ));
            existing = repository.find();
            if (existing.isEmpty()) {
                throw new IllegalStateException("Persisted audit configuration was not created");
            }
            LOGGER.info(
                "Initialized persisted audit configuration with mode {}",
                existing.orElseThrow().mode()
            );
        } else {
            logIgnoredBootstrapValue(existing.orElseThrow());
        }
        policyProvider.reload();
    }

    private void logIgnoredBootstrapValue(AuditPolicyConfiguration existing) {
        Optional<AuditMode> bootstrapMode = properties.parsedMode();
        if (bootstrapMode.isEmpty()) {
            LOGGER.warn(
                "Ignoring invalid {}.mode={}; persisted audit configuration is authoritative",
                AuditProperties.PREFIX,
                properties.getMode()
            );
            return;
        }
        if (bootstrapMode.orElseThrow() != existing.mode()) {
            LOGGER.warn(
                "Ignoring {}.mode={}; persisted audit configuration already uses {}",
                AuditProperties.PREFIX,
                properties.getMode(),
                existing.mode()
            );
        }
    }
}
