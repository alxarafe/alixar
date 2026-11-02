package es.alxarafe.alixar.contact.infrastructure;

import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditTrail;
import es.alxarafe.alixar.audit.application.AuditUnavailableException;
import es.alxarafe.alixar.contact.application.CreateContactCommand;
import es.alxarafe.alixar.contact.application.CreateContactUseCase;
import org.springframework.transaction.annotation.Transactional;

public class TransactionalContactService {

    private final CreateContactUseCase createContactUseCase;
    private final AuditTrail auditTrail;

    public TransactionalContactService(
        CreateContactUseCase createContactUseCase,
        AuditTrail auditTrail
    ) {
        this.createContactUseCase = createContactUseCase;
        this.auditTrail = auditTrail;
    }

    @Transactional
    public long create(CreateContactCommand command) {
        long id = createContactUseCase.execute(command);
        recordAudit(id);
        return id;
    }

    private void recordAudit(long id) {
        try {
            auditTrail.recordSuccess(
                AuditAction.CONTACT_CREATED,
                AuditResourceType.CONTACT,
                Long.toString(id)
            );
        } catch (AuditUnavailableException exception) {
            throw exception;
        } catch (RuntimeException exception) {
            throw new AuditUnavailableException();
        }
    }
}
