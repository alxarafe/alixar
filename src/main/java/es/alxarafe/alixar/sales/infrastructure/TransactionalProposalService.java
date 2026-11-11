package es.alxarafe.alixar.sales.infrastructure;

import es.alxarafe.alixar.sales.application.*;
import es.alxarafe.alixar.sales.domain.Proposal;
import es.alxarafe.alixar.audit.application.*;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

public class TransactionalProposalService {
    private final CreateProposalUseCase create;
    private final GetProposalUseCase get;
    private final AuditTrail audit;
    public TransactionalProposalService(CreateProposalUseCase create, GetProposalUseCase get, AuditTrail audit) {
        this.create = create;
        this.get = get;
        this.audit = audit;
    }
    @Transactional
    public long create(CreateProposalCommand command) {
        long id = create.execute(command);
        try { audit.recordSuccess(AuditAction.PROPOSAL_CREATED, AuditResourceType.PROPOSAL, Long.toString(id)); }
        catch (AuditUnavailableException ex) { throw ex; }
        catch (RuntimeException ex) { throw new AuditUnavailableException(); }
        return id;
    }
    @Transactional(readOnly = true, isolation = Isolation.REPEATABLE_READ)
    public Proposal get(long id) { return get.execute(id); }
}
