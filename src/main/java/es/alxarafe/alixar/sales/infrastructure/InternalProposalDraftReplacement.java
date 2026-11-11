package es.alxarafe.alixar.sales.infrastructure;

import es.alxarafe.alixar.sales.application.*;
import es.alxarafe.alixar.sales.application.PrepareProposalDraftReplacement.*;
import es.alxarafe.alixar.sales.domain.*;
import java.time.Clock;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.transaction.support.TransactionTemplate;

/** Internal persistence step; the public facade adds audit in the same enclosing transaction. */
final class InternalProposalDraftReplacement {
    private final ProposalRepository repository;
    private final EligibleThirdParty thirdParty;
    private final Clock clock;
    private final TransactionTemplate transaction;
    private final PrepareProposalDraftReplacement preparation = new PrepareProposalDraftReplacement();

    InternalProposalDraftReplacement(ProposalRepository repository, EligibleThirdParty thirdParty,
        Clock clock, PlatformTransactionManager transactions) {
        this.repository = repository;
        this.thirdParty = thirdParty;
        this.clock = clock;
        transaction = new TransactionTemplate(transactions);
        transaction.setPropagationBehavior(TransactionDefinition.PROPAGATION_MANDATORY);
    }

    Result replace(long id, ReplaceProposalDraftCommand command) {
        if (id <= 0) { throw new InvalidProposalException(ProposalFields.ID, false); }
        if (command == null) { throw new InvalidProposalException(ProposalFields.BODY, true); }
        // Commands have already validated/frozen every editable input without business access.
        return transaction.execute(status -> {
            if (TransactionSynchronizationManager.isCurrentTransactionReadOnly()
                || !Integer.valueOf(TransactionDefinition.ISOLATION_READ_COMMITTED)
                    .equals(TransactionSynchronizationManager.getCurrentTransactionIsolationLevel())) {
                throw new IllegalStateException("Draft replacement requires a writable READ COMMITTED transaction");
            }
            boolean targetExists = thirdParty.lockIdentifier(command.thirdPartyId());
            Proposal current = repository.lockAndFindById(id, command.expectedVersion());
            Decision decision = preparation.assess(current, command);
            if (decision instanceof NoOp) { return new Result(current.id(), current.version(), false); }
            Change change = (Change) decision;
            if (!targetExists || !thirdParty.isEligible(change.thirdPartyId())) {
                throw new InvalidSalesThirdPartyException();
            }
            Prepared prepared = change.prepare();
            Instant now = clock.instant().truncatedTo(ChronoUnit.MICROS);
            Instant updatedAt = now.isBefore(current.updatedAt()) ? current.updatedAt() : now;
            repository.replace(prepared, current.version(), updatedAt);
            return new Result(prepared.id(), prepared.version(), true);
        });
    }

    /** Internal change marker lets the facade append audit only for effective changes. */
    record Result(long id, long version, boolean changed) { }
}
