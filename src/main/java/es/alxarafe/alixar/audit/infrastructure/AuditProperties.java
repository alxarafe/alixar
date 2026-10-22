package es.alxarafe.alixar.audit.infrastructure;

import es.alxarafe.alixar.audit.application.AuditMode;
import java.util.Locale;
import java.util.Objects;
import java.util.Optional;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * Bootstrap audit configuration.
 *
 * <p>{@code alixar.audit.mode} is used only while no persisted configuration
 * exists. Once {@code audit_configuration} contains a row, that row is
 * authoritative. The value is parsed lazily so an invalid bootstrap value does
 * not prevent startup when a persisted configuration is already present.</p>
 */
@ConfigurationProperties(prefix = AuditProperties.PREFIX)
public class AuditProperties {

    public static final String PREFIX = "alixar.audit";
    public static final String DEFAULT_MODE = AuditMode.OFF.name();

    private String mode = DEFAULT_MODE;

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = Objects.requireNonNull(mode, "mode");
    }

    /**
     * Parses the bootstrap mode, failing when it is not supported.
     *
     * <p>Use this only when no persisted configuration exists.</p>
     */
    public AuditMode bootstrapMode() {
        return parsedMode()
            .orElseThrow(() -> new IllegalArgumentException(
                "Invalid " + PREFIX + ".mode value: " + mode
            ));
    }

    /**
     * Parses the configured value when it is valid, ignoring unsupported values.
     */
    public Optional<AuditMode> parsedMode() {
        String normalized = mode.strip().toUpperCase(Locale.ROOT);
        if (normalized.isEmpty()) {
            return Optional.empty();
        }
        try {
            return Optional.of(AuditMode.valueOf(normalized));
        } catch (IllegalArgumentException exception) {
            return Optional.empty();
        }
    }
}
