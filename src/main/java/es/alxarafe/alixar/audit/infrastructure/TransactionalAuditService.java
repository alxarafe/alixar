package es.alxarafe.alixar.audit.infrastructure;

import es.alxarafe.alixar.audit.application.AuditEventAppender;
import es.alxarafe.alixar.audit.application.AuditEventDraft;
import es.alxarafe.alixar.audit.domain.AuditEvent;
import org.springframework.transaction.annotation.Transactional;

public class TransactionalAuditService {

    private final AuditEventAppender appender;

    public TransactionalAuditService(AuditEventAppender appender) {
        this.appender = appender;
    }

    @Transactional
    public AuditEvent append(AuditEventDraft draft) {
        return appender.append(draft);
    }
}
