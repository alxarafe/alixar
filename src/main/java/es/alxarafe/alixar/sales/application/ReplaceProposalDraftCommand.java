package es.alxarafe.alixar.sales.application;

import es.alxarafe.alixar.sales.domain.*;
import java.util.ArrayList;
import java.util.List;
import static es.alxarafe.alixar.sales.domain.ProposalFields.*;

/** Validated, immutable editable input. Construction never calculates monetary amounts. */
public record ReplaceProposalDraftCommand(Long expectedVersion, Long thirdPartyId, String currency,
    List<CreateProposalCommand.Line> lines) {
    public ReplaceProposalDraftCommand {
        if (expectedVersion == null) { throw new InvalidProposalException(EXPECTED_VERSION, true); }
        if (expectedVersion <= 0) { throw new InvalidProposalException(EXPECTED_VERSION, false); }
        if (thirdPartyId == null) { throw new InvalidProposalException(THIRD_PARTY_ID, true); }
        if (thirdPartyId <= 0) { throw new InvalidProposalException(THIRD_PARTY_ID, false); }
        if (currency == null) { throw new InvalidProposalException(CURRENCY, true); }
        if (!MonetaryPolicy.CURRENCY.equals(currency)) { throw new InvalidProposalException(CURRENCY, false); }
        if (lines == null) { throw new InvalidProposalException(LINES, true); }
        if (lines.size() > ProposalLimits.MAX_LINES) { throw new InvalidProposalException(LINES, false); }
        List<CreateProposalCommand.Line> normalized = new ArrayList<>();
        for (var line : lines) {
            if (line == null) { throw new InvalidProposalException(LINES, false); }
            String description = ProposalLimits.normalizeDescription(line.description());
            MonetaryPolicy.checkInputs(line.quantity(), line.unitNetPrice(), line.vatRate());
            normalized.add(new CreateProposalCommand.Line(description, line.quantity(), line.unitNetPrice(), line.vatRate()));
        }
        lines = List.copyOf(normalized);
    }
}
