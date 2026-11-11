package es.alxarafe.alixar.sales;

import es.alxarafe.alixar.sales.application.*;
import es.alxarafe.alixar.sales.domain.*;
import java.math.BigDecimal;
import java.time.Clock;
import java.time.Instant;
import java.time.ZoneOffset;
import java.util.Collections;
import java.util.List;
import org.junit.jupiter.api.Test;
import static org.assertj.core.api.Assertions.*;
import static org.mockito.Mockito.*;
import static org.mockito.ArgumentMatchers.any;

class ProposalCalculationTest {
    private final ProposalRepository repository = mock(ProposalRepository.class);
    private final EligibleThirdParty eligible = eligibility(true);
    private final Clock clock = Clock.fixed(Instant.parse("2026-11-10T12:00:00Z"), ZoneOffset.UTC);
    private final CreateProposalUseCase create = new CreateProposalUseCase(repository, eligible, clock);
    private static EligibleThirdParty eligibility(boolean value) {
        EligibleThirdParty eligible = mock(EligibleThirdParty.class);
        when(eligible.lockAndCheck(anyLong())).thenReturn(value);
        return eligible;
    }
    private CreateProposalCommand.Line line(String description, String quantity, String price, String vat) {
        return new CreateProposalCommand.Line(description, new BigDecimal(quantity), new BigDecimal(price), new BigDecimal(vat));
    }
    private Proposal draft(List<CreateProposalCommand.Line> lines) {
        var captured = org.mockito.ArgumentCaptor.forClass(Proposal.class);
        create.execute(new CreateProposalCommand(1L, MonetaryPolicy.CURRENCY, lines));
        verify(repository).create(captured.capture());
        return captured.getValue();
    }
    @Test void roundsNetBeforeTaxAndSumsRoundedLines() {
        Proposal proposal = draft(List.of(line(" service ", "2", "10.005", "21"), line("second", "1", "0.005", "0")));
        assertThat(proposal.lines().getFirst().amounts()).isEqualTo(new Amounts(new BigDecimal("20.01"), new BigDecimal("4.20"), new BigDecimal("24.21")));
        assertThat(proposal.totals().netAmount()).isEqualByComparingTo("20.02");
        assertThat(proposal.lines().getFirst().description()).isEqualTo("service");
        assertThat(proposal.createdAt()).isEqualTo(proposal.updatedAt()).isEqualTo(clock.instant());
        assertThat(proposal.monetaryPolicyId()).isEqualTo(MonetaryPolicy.IDENTIFIER);
        assertThat(proposal.version()).isEqualTo(ProposalLimits.INITIAL_VERSION);
    }
    @Test void roundingIsPerLineRatherThanOnTheAggregate() {
        Proposal proposal = draft(List.of(line("a", "1", "0.005", "0"), line("b", "1", "0.005", "0")));
        assertThat(proposal.totals().netAmount()).isEqualTo(new BigDecimal("0.02"));
    }
    @Test void taxHalfTieRoundsUpAfterNetRounding() {
        Amounts amounts = MonetaryPolicy.EUR_V1.calculate(new BigDecimal("1"), new BigDecimal("0.10"), new BigDecimal("5"));
        assertThat(amounts.taxAmount()).isEqualTo(new BigDecimal("0.01"));
        assertThat(amounts.grossAmount()).isEqualTo(new BigDecimal("0.11"));
    }
    @Test void emptyDraftHasScaledZeroTotals() {
        assertThat(draft(List.of()).totals()).isEqualTo(Amounts.zero());
    }
    @Test void unicodeLimitCountsCodePointsRatherThanUtf16Units() {
        String description = "😀".repeat(ProposalLimits.MAX_DESCRIPTION_CODE_POINTS);
        assertThat(draft(List.of(line(description, "1", "0", "100"))).lines().getFirst().description()).isEqualTo(description);
    }
    @Test void maximumLinesIsInclusive() {
        assertThat(draft(Collections.nCopies(ProposalLimits.MAX_LINES, line("service", "1", "0", "0"))).lines())
            .hasSize(ProposalLimits.MAX_LINES);
    }
    @Test void rejectsMalformedValuesBeforePersistence() {
        List<CreateProposalCommand.Line> invalid = List.of(line(" ", "1", "1", "0"),
            line("a", "0", "1", "0"), line("a", "1", "-1", "0"), line("a", "1", "1", "100.0001"),
            line("a", "1.0000001", "1", "0"), line("a", "1", "0.0000001", "0"),
            line("a", "1", "1", "1.00001"), line("a", "10000000000000", "1", "0"),
            line("a", "1", "1", "-1"), line("a", "9999999999999", "9999999999999", "0"),
            line("a".repeat(ProposalLimits.MAX_DESCRIPTION_CODE_POINTS + 1), "1", "1", "0"));
        for (var line : invalid) {
            assertThatThrownBy(() -> create.execute(new CreateProposalCommand(1L, MonetaryPolicy.CURRENCY, List.of(line))))
                .isInstanceOf(InvalidProposalException.class);
        }
        assertThatThrownBy(() -> create.execute(new CreateProposalCommand(1L, MonetaryPolicy.CURRENCY,
            Collections.nCopies(ProposalLimits.MAX_LINES + 1, line("a", "1", "1", "0")))))
            .isInstanceOf(InvalidProposalException.class);
        verify(repository, never()).create(any());
    }
    @Test void aggregateOverflowRejectsEvenWhenIndividualLinesFit() {
        var line = line("a", "10000000", "9000000000", "0");
        assertThatThrownBy(() -> create.execute(new CreateProposalCommand(1L, MonetaryPolicy.CURRENCY, List.of(line, line))))
            .isInstanceOf(InvalidProposalException.class);
        verifyNoInteractions(repository);
    }
    @Test void requiredFieldsCurrencyAndEligibilityAreEnforced() {
        assertThatThrownBy(() -> create.execute(new CreateProposalCommand(null, MonetaryPolicy.CURRENCY, List.of())))
            .isInstanceOf(InvalidProposalException.class);
        assertThatThrownBy(() -> create.execute(new CreateProposalCommand(1L, null, List.of())))
            .isInstanceOf(InvalidProposalException.class);
        assertThatThrownBy(() -> create.execute(new CreateProposalCommand(1L, "USD", List.of())))
            .isInstanceOf(UnsupportedCurrencyException.class);
        assertThatThrownBy(() -> create.execute(new CreateProposalCommand(1L, MonetaryPolicy.CURRENCY, null)))
            .isInstanceOf(InvalidProposalException.class);
        assertThatThrownBy(() -> new CreateProposalUseCase(repository, eligibility(false), clock)
            .execute(new CreateProposalCommand(1L, MonetaryPolicy.CURRENCY, List.of())))
            .isInstanceOf(InvalidSalesThirdPartyException.class);
        verifyNoInteractions(repository);
    }
}
