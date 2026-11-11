package es.alxarafe.alixar.sales.application;

import es.alxarafe.alixar.sales.domain.*;
import java.math.BigDecimal;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import static es.alxarafe.alixar.sales.application.SalesErrorCode.*;

/** Pure preparation against a supplied snapshot; no lookup, lock, write, clock or audit. */
public final class PrepareProposalDraftReplacement {
    public Decision assess(Proposal current, ReplaceProposalDraftCommand command) {
        checkVersionAndState(current.version(), current.state(), command.expectedVersion());
        if (sameContents(current, command)) { return new NoOp(current); }
        if (current.version() == Long.MAX_VALUE) { throw rejected(SALES_VERSION_EXHAUSTED); }
        return new Change(current, command);
    }

    /** Allows a locked header to be checked before loading its lines. */
    public static void checkVersionAndState(long version, String state, long expectedVersion) {
        if (expectedVersion != version) { throw rejected(SALES_VERSION_CONFLICT); }
        if (!ProposalLimits.DRAFT.equals(state)) { throw rejected(PROPOSAL_INVALID_STATE); }
    }

    private boolean sameContents(Proposal current, ReplaceProposalDraftCommand command) {
        if (current.thirdPartyId() != command.thirdPartyId() || !current.currency().equals(command.currency())
            || current.lines().size() != command.lines().size()) { return false; }
        for (int i = 0; i < current.lines().size(); i++) {
            var stored = current.lines().get(i);
            var submitted = command.lines().get(i);
            if (!stored.description().equals(submitted.description())
                || stored.quantity().compareTo(submitted.quantity()) != 0
                || stored.unitNetPrice().compareTo(submitted.unitNetPrice()) != 0
                || stored.vatRate().compareTo(submitted.vatRate()) != 0) { return false; }
        }
        return true;
    }

    public sealed interface Decision permits NoOp, Change { }
    public record NoOp(Proposal unchanged) implements Decision { }

    /** The future transactional caller checks target eligibility before calling prepare(). */
    public static final class Change implements Decision {
        private final Proposal current;
        private final ReplaceProposalDraftCommand command;
        private Change(Proposal current, ReplaceProposalDraftCommand command) {
            this.current = current;
            this.command = command;
        }
        public long thirdPartyId() { return command.thirdPartyId(); }
        public Prepared prepare() {
            if (!MonetaryPolicy.IDENTIFIER.equals(current.monetaryPolicyId())) {
                throw rejected(SALES_MONETARY_POLICY_UNAVAILABLE);
            }
            MonetaryPolicy policy = MonetaryPolicy.EUR_V1;
            List<Line> lines = new ArrayList<>();
            Amounts totals = Amounts.zero();
            for (var input : command.lines()) {
                Amounts amounts = policy.calculate(input.quantity(), input.unitNetPrice(), input.vatRate());
                totals = totals.plus(amounts);
                policy.checkAmounts(totals);
                lines.add(new Line(input.description(), input.quantity(), input.unitNetPrice(), input.vatRate(), amounts));
            }
            return new Prepared(current.id(), command.thirdPartyId(), command.currency(), current.state(),
                current.version() + 1, current.monetaryPolicyId(), lines, totals, current.createdAt(), current.updatedAt());
        }
    }

    /** All lines are new content, without identities. List order determines persistence positions. */
    public record Line(String description, BigDecimal quantity, BigDecimal unitNetPrice, BigDecimal vatRate,
        Amounts amounts) { }

    /** previousUpdatedAt is an input to later timestamp selection, never a newly chosen timestamp. */
    public record Prepared(long id, long thirdPartyId, String currency, String state, long version,
        String monetaryPolicyId, List<Line> lines, Amounts totals, Instant createdAt, Instant previousUpdatedAt) {
        public Prepared { lines = List.copyOf(lines); }
    }

    private static DraftReplacementRejectedException rejected(SalesErrorCode code) {
        return new DraftReplacementRejectedException(code);
    }
}
