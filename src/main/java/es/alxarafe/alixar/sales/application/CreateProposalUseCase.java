package es.alxarafe.alixar.sales.application;

import es.alxarafe.alixar.sales.domain.*;
import java.time.Clock;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import static es.alxarafe.alixar.sales.domain.ProposalFields.*;

public class CreateProposalUseCase {
    private final ProposalRepository repository;
    private final EligibleThirdParty thirdParty;
    private final Clock clock;
    public CreateProposalUseCase(ProposalRepository repository, EligibleThirdParty thirdParty, Clock clock) {
        this.repository = repository;
        this.thirdParty = thirdParty;
        this.clock = clock;
    }
    public long execute(CreateProposalCommand command) {
        if (command.thirdPartyId() == null) { throw new InvalidProposalException(THIRD_PARTY_ID, true); }
        if (command.thirdPartyId() <= 0) { throw new InvalidProposalException(THIRD_PARTY_ID, false); }
        if (command.currency() == null) { throw new InvalidProposalException(CURRENCY, true); }
        MonetaryPolicy policy = MonetaryPolicy.EUR_V1;
        policy.checkCurrency(command.currency());
        if (command.lines() == null) { throw new InvalidProposalException(LINES, true); }
        if (command.lines().size() > ProposalLimits.MAX_LINES) { throw new InvalidProposalException(LINES, false); }
        List<ProposalLine> lines = new ArrayList<>();
        Amounts totals = Amounts.zero();
        for (CreateProposalCommand.Line line : command.lines()) {
            if (line == null) { throw new InvalidProposalException(LINES, false); }
            if (line.description() == null || line.description().isBlank()) {
                throw new InvalidProposalException(DESCRIPTION, true);
            }
            String description = line.description().strip();
            if (description.codePointCount(0, description.length()) > ProposalLimits.MAX_DESCRIPTION_CODE_POINTS) {
                throw new InvalidProposalException(DESCRIPTION, false);
            }
            Amounts amounts = policy.calculate(line.quantity(), line.unitNetPrice(), line.vatRate());
            totals = totals.plus(amounts);
            policy.checkAmounts(totals);
            lines.add(new ProposalLine(0, lines.size() + 1, description,
                line.quantity(), line.unitNetPrice(), line.vatRate(), amounts));
        }
        if (!thirdParty.lockAndCheck(command.thirdPartyId())) { throw new InvalidSalesThirdPartyException(); }
        Instant now = clock.instant();
        return repository.create(new Proposal(0, command.thirdPartyId(), command.currency(),
            ProposalLimits.DRAFT, ProposalLimits.INITIAL_VERSION, policy.identifier(), lines, totals, now, now));
    }
}
