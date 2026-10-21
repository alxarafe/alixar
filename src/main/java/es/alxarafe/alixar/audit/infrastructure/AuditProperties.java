package es.alxarafe.alixar.audit.infrastructure;

import es.alxarafe.alixar.audit.application.AuditMode;
import java.util.Objects;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = AuditProperties.PREFIX)
public class AuditProperties {

    public static final String PREFIX = "alixar.audit";

    private AuditMode mode = AuditMode.OFF;

    public AuditMode getMode() {
        return mode;
    }

    public void setMode(AuditMode mode) {
        this.mode = Objects.requireNonNull(mode, "mode");
    }
}
