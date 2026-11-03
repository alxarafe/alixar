package es.alxarafe.alixar.contact.infrastructure;

import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditTrail;
import es.alxarafe.alixar.audit.application.AuditUnavailableException;
import es.alxarafe.alixar.contact.application.CreateContactCommand;
import es.alxarafe.alixar.contact.application.CreateContactUseCase;
import es.alxarafe.alixar.contact.application.UpdateContactCommand;
import es.alxarafe.alixar.contact.application.UpdateContactResult;
import es.alxarafe.alixar.contact.application.UpdateContactUseCase;
import es.alxarafe.alixar.contact.domain.Contact;
import org.springframework.transaction.annotation.Transactional;

public class TransactionalContactService {

    private final CreateContactUseCase createContactUseCase;
    private final UpdateContactUseCase updateContactUseCase;
    private final AuditTrail auditTrail;

    public TransactionalContactService(
        CreateContactUseCase createContactUseCase,
        UpdateContactUseCase updateContactUseCase,
        AuditTrail auditTrail
    ) {
        this.createContactUseCase = createContactUseCase;
        this.updateContactUseCase = updateContactUseCase;
        this.auditTrail = auditTrail;
    }

    @Transactional
    public long create(CreateContactCommand command) {
        long id = createContactUseCase.execute(command);
        recordAudit(AuditAction.CONTACT_CREATED, id);
        return id;
    }

    @Transactional
    public Contact update(long id, UpdateContactCommand command) {
        UpdateContactResult result = updateContactUseCase.execute(id, command);
        if (result.changed()) {
            recordAudit(AuditAction.CONTACT_UPDATED, id);
        }
        return result.contact();
    }

    private void recordAudit(AuditAction action, long id) {
        try {
            auditTrail.recordSuccess(
                action,
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
