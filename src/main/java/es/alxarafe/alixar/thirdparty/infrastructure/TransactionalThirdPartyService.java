package es.alxarafe.alixar.thirdparty.infrastructure;

import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditTrail;
import es.alxarafe.alixar.audit.application.AuditUnavailableException;
import es.alxarafe.alixar.thirdparty.application.CreateThirdPartyCommand;
import es.alxarafe.alixar.thirdparty.application.CreateThirdPartyUseCase;
import es.alxarafe.alixar.thirdparty.application.UpdateThirdPartyCommand;
import es.alxarafe.alixar.thirdparty.application.UpdateThirdPartyResult;
import es.alxarafe.alixar.thirdparty.application.UpdateThirdPartyUseCase;
import es.alxarafe.alixar.thirdparty.domain.ThirdParty;
import org.springframework.transaction.annotation.Transactional;

public class TransactionalThirdPartyService {

    private final CreateThirdPartyUseCase createThirdPartyUseCase;
    private final UpdateThirdPartyUseCase updateThirdPartyUseCase;
    private final AuditTrail auditTrail;

    public TransactionalThirdPartyService(
        CreateThirdPartyUseCase createThirdPartyUseCase,
        UpdateThirdPartyUseCase updateThirdPartyUseCase,
        AuditTrail auditTrail
    ) {
        this.createThirdPartyUseCase = createThirdPartyUseCase;
        this.updateThirdPartyUseCase = updateThirdPartyUseCase;
        this.auditTrail = auditTrail;
    }

    @Transactional
    public long create(CreateThirdPartyCommand command) {
        long id = createThirdPartyUseCase.execute(command);
        recordAudit(AuditAction.THIRD_PARTY_CREATED, id);
        return id;
    }

    @Transactional
    public ThirdParty update(long id, UpdateThirdPartyCommand command) {
        UpdateThirdPartyResult result = updateThirdPartyUseCase.execute(id, command);
        if (result.changed()) {
            recordAudit(AuditAction.THIRD_PARTY_UPDATED, id);
        }
        return result.thirdParty();
    }

    private void recordAudit(AuditAction action, long id) {
        try {
            auditTrail.recordSuccess(
                action,
                AuditResourceType.THIRD_PARTY,
                Long.toString(id)
            );
        } catch (AuditUnavailableException exception) {
            throw exception;
        } catch (RuntimeException exception) {
            throw new AuditUnavailableException();
        }
    }
}
