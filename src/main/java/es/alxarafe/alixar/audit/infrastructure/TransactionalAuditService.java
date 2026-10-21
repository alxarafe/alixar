package es.alxarafe.alixar.audit.infrastructure;

import es.alxarafe.alixar.audit.application.AuditChainVerifier;
import es.alxarafe.alixar.audit.application.AuditEventAppender;
import es.alxarafe.alixar.audit.application.AuditEventDraft;
import es.alxarafe.alixar.audit.application.AuditVerificationResult;
import es.alxarafe.alixar.audit.domain.AuditEvent;
import java.util.UUID;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

public class TransactionalAuditService {

    private final AuditEventAppender appender;
    private final AuditChainVerifier verifier;

    public TransactionalAuditService(AuditEventAppender appender, AuditChainVerifier verifier) {
        this.appender = appender;
        this.verifier = verifier;
    }

    @Transactional
    public AuditEvent append(AuditEventDraft draft) {
        return appender.append(draft);
    }

    @Transactional(readOnly = true, isolation = Isolation.REPEATABLE_READ)
    public AuditVerificationResult verify(UUID chainId) {
        return verifier.verify(chainId);
    }
}
