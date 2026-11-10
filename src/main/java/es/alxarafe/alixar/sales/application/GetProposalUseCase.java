package es.alxarafe.alixar.sales.application;

import es.alxarafe.alixar.sales.domain.*;

public class GetProposalUseCase {
    private final ProposalRepository repository;
    public GetProposalUseCase(ProposalRepository repository) { this.repository = repository; }
    public Proposal execute(long id) {
        if (id <= 0) { throw new InvalidProposalException(ProposalFields.ID, false); }
        return repository.findById(id);
    }
}
