package es.alxarafe.alixar.sales.application;

import es.alxarafe.alixar.sales.domain.Proposal;
import java.time.Instant;

public interface ProposalRepository {
    long create(Proposal draft);
    Proposal findById(long id);
    /** Lock the root and verify version/state before loading lines in the same transaction. */
    Proposal lockAndFindById(long id, long expectedVersion);
    /** Replace all lines and guard the header write; caller owns the enclosing transaction. */
    void replace(PrepareProposalDraftReplacement.Prepared replacement, long expectedVersion, Instant updatedAt);
}
