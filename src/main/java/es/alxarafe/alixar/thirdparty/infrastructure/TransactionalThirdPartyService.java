package es.alxarafe.alixar.thirdparty.infrastructure;

import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditTrail;
import es.alxarafe.alixar.audit.application.AuditUnavailableException;
import es.alxarafe.alixar.thirdparty.application.CreateThirdPartyCommand;
import es.alxarafe.alixar.thirdparty.application.CreateThirdPartyUseCase;
import org.springframework.transaction.annotation.Transactional;

public class TransactionalThirdPartyService {

    private final CreateThirdPartyUseCase createThirdPartyUseCase;
    private final AuditTrail auditTrail;

    public TransactionalThirdPartyService(
        CreateThirdPartyUseCase createThirdPartyUseCase,
        AuditTrail auditTrail
    ) {
        this.createThirdPartyUseCase = createThirdPartyUseCase;
        this.auditTrail = auditTrail;
    }

    @Transactional
    public long create(CreateThirdPartyCommand command) {
        long id = createThirdPartyUseCase.execute(command);
        try {
            auditTrail.recordSuccess(
                AuditAction.THIRD_PARTY_CREATED,
                AuditResourceType.THIRD_PARTY,
                Long.toString(id)
            );
        } catch (AuditUnavailableException exception) {
            throw exception;
        } catch (RuntimeException exception) {
            throw new AuditUnavailableException();
        }
        return id;
    }
}
