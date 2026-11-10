package es.alxarafe.alixar.sales.application;

import es.alxarafe.alixar.sales.domain.Proposal;

public interface ProposalRepository {
    long create(Proposal draft);
    Proposal findById(long id);
}
