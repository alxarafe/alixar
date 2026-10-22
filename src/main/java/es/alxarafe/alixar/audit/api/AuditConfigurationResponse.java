package es.alxarafe.alixar.audit.api;

import es.alxarafe.alixar.audit.application.AuditMode;
import java.time.Instant;
import java.util.UUID;

record AuditConfigurationResponse(UUID id, AuditMode mode, Instant updatedAt) {
}
