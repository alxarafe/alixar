package es.alxarafe.alixar.audit.application;

import es.alxarafe.alixar.audit.domain.AuditEvent;
import java.util.List;

public class ListAuditEventsUseCase {

    private final AuditEventRepository auditEventRepository;

    public ListAuditEventsUseCase(AuditEventRepository auditEventRepository) {
        this.auditEventRepository = auditEventRepository;
    }

    public List<AuditEvent> execute(AuditEventQuery query) {
        return auditEventRepository.findEvents(query);
    }
}
