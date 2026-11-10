package es.alxarafe.alixar.sales.domain;

import java.time.Instant;
import java.util.List;

/** Stored snapshots are read without recalculating them under the current policy. */
public record Proposal(long id, long thirdPartyId, String currency, String state, long version,
    String monetaryPolicyId, List<ProposalLine> lines, Amounts totals,
    Instant createdAt, Instant updatedAt) {
    public Proposal { lines = List.copyOf(lines); }
}
