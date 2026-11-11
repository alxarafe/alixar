package es.alxarafe.alixar.sales.infrastructure;

import es.alxarafe.alixar.sales.application.*;
import es.alxarafe.alixar.sales.domain.Proposal;
import es.alxarafe.alixar.audit.application.*;
import java.util.function.Supplier;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

public class TransactionalProposalService {
    private final CreateProposalUseCase create;
    private final GetProposalUseCase get;
    private final AuditTrail audit;
    private final Supplier<InternalProposalDraftReplacement> replacement;
    TransactionalProposalService(CreateProposalUseCase create, GetProposalUseCase get, AuditTrail audit,
        Supplier<InternalProposalDraftReplacement> replacement) {
        this.create = create;
        this.get = get;
        this.audit = audit;
        this.replacement = replacement;
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

    @Transactional(isolation = Isolation.READ_COMMITTED)
    public long replaceDraft(long id, ReplaceProposalDraftCommand command) {
        var result = replacement.get().replace(id, command);
        if (result.changed()) {
            try { audit.recordSuccess(AuditAction.PROPOSAL_UPDATED, AuditResourceType.PROPOSAL, Long.toString(result.id())); }
            catch (AuditUnavailableException ex) { throw ex; }
            catch (RuntimeException ex) { throw new AuditUnavailableException(); }
        }
        return result.version();
    }
}
