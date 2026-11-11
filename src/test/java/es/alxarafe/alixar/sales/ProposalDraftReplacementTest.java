package es.alxarafe.alixar.sales;

import es.alxarafe.alixar.sales.application.*;
import es.alxarafe.alixar.sales.application.PrepareProposalDraftReplacement.*;
import es.alxarafe.alixar.sales.domain.*;
import java.math.BigDecimal;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.jupiter.api.Test;
import static es.alxarafe.alixar.sales.application.SalesErrorCode.*;
import static org.assertj.core.api.Assertions.*;

class ProposalDraftReplacementTest {
    private final PrepareProposalDraftReplacement replacement = new PrepareProposalDraftReplacement();
    private final CreateProposalCommand.Line service = line("service", "2", "10.005", "21");

    private CreateProposalCommand.Line line(String text, String quantity, String price, String vat) {
        return new CreateProposalCommand.Line(text, new BigDecimal(quantity), new BigDecimal(price), new BigDecimal(vat));
    }
    private Proposal stored(List<CreateProposalCommand.Line> inputs) {
        List<ProposalLine> lines = new ArrayList<>();
        Amounts totals = Amounts.zero();
        for (var input : inputs) {
            Amounts amounts = MonetaryPolicy.EUR_V1.calculate(input.quantity(), input.unitNetPrice(), input.vatRate());
            totals = totals.plus(amounts);
            lines.add(new ProposalLine(100 + lines.size(), lines.size() + 1, input.description(), input.quantity(),
                input.unitNetPrice(), input.vatRate(), amounts));
        }
        return new Proposal(42, 7, MonetaryPolicy.CURRENCY, ProposalLimits.DRAFT, 3, MonetaryPolicy.IDENTIFIER,
            lines, totals, Instant.parse("2026-11-10T12:00:00Z"), Instant.parse("2026-11-11T08:00:00Z"));
    }
    private Proposal metadata(Proposal p, String state, long version, String policy) {
        return new Proposal(p.id(), p.thirdPartyId(), p.currency(), state, version, policy,
            p.lines(), p.totals(), p.createdAt(), p.updatedAt());
    }
    private ReplaceProposalDraftCommand command(Proposal p, List<CreateProposalCommand.Line> lines) {
        return new ReplaceProposalDraftCommand(p.version(), p.thirdPartyId(), p.currency(), lines);
    }
    private Change change(Proposal p, ReplaceProposalDraftCommand command) {
        return (Change) replacement.assess(p, command);
    }
    private void rejects(Runnable action, SalesErrorCode code) {
        assertThatThrownBy(action::run).isInstanceOfSatisfying(DraftReplacementRejectedException.class,
            ex -> assertThat(ex.code()).isEqualTo(code));
    }

    @Test void identicalContentReturnsTheExactUnchangedSnapshot() {
        Proposal p = stored(List.of(service));
        NoOp result = (NoOp) replacement.assess(p, command(p, List.of(service)));
        assertThat(result.unchanged()).isSameAs(p);
        assertThat(result.unchanged().lines().getFirst().id()).isEqualTo(100);
    }
    @Test void allowedDecimalScalesAreNumericallyEqual() {
        Proposal p = stored(List.of(service));
        var scaled = line("service", "2.000000", "10.005000", "21.0000");
        assertThat(replacement.assess(p, command(p, List.of(scaled)))).isEqualTo(new NoOp(p));
    }
    @Test void descriptionsUseTheSameStripNormalizationAsCreation() {
        Proposal p = stored(List.of(service));
        var spaced = line("\t\u2003service\u2003\n", "2", "10.005", "21");
        assertThat(replacement.assess(p, command(p, List.of(spaced)))).isEqualTo(new NoOp(p));
    }
    @Test void staleIdenticalInputConflictsBeforeNoOpAndBeforeState() {
        Proposal draft = stored(List.of(service));
        var stale = new ReplaceProposalDraftCommand(2L, draft.thirdPartyId(), draft.currency(), List.of(service));
        rejects(() -> replacement.assess(draft, stale), SALES_VERSION_CONFLICT);
        Proposal otherState = metadata(draft, "NON_DRAFT_FIXTURE", draft.version(), draft.monetaryPolicyId());
        rejects(() -> replacement.assess(otherState, stale), SALES_VERSION_CONFLICT);
        rejects(() -> replacement.assess(otherState, command(otherState, List.of(service))), PROPOSAL_INVALID_STATE);
    }
    @Test void thirdPartyOnlyChangePreparesEveryLineWithoutRetainingIdentities() {
        Proposal p = stored(List.of(service));
        var command = new ReplaceProposalDraftCommand(p.version(), 8L, p.currency(), List.of(service));
        Change change = change(p, command);
        assertThat(change.thirdPartyId()).isEqualTo(8);
        Prepared result = change.prepare();
        assertThat(result.id()).isEqualTo(p.id());
        assertThat(result.thirdPartyId()).isEqualTo(8);
        assertThat(result.currency()).isEqualTo(p.currency());
        assertThat(result.state()).isEqualTo(p.state());
        assertThat(result.version()).isEqualTo(p.version() + 1);
        assertThat(result.monetaryPolicyId()).isEqualTo(p.monetaryPolicyId());
        assertThat(result.createdAt()).isEqualTo(p.createdAt());
        assertThat(result.previousUpdatedAt()).isEqualTo(p.updatedAt());
        assertThat(result.lines()).containsExactly(new Line("service", service.quantity(), service.unitNetPrice(),
            service.vatRate(), p.lines().getFirst().amounts()));
        assertThat(result.totals()).isEqualTo(p.totals());
        assertThat(change.prepare()).isEqualTo(result); // Preparation is pure, not another version increment.
        assertThat(p.version()).isEqualTo(3);
        assertThat(p.thirdPartyId()).isEqualTo(7);
        assertThat(p.lines().getFirst().id()).isEqualTo(100);
    }
    @Test void changedPriceOrQuantityIsEffectiveEvenWithEqualRoundedTotals() {
        Proposal p = stored(List.of(line("service", "1", "0.001", "0")));
        for (var input : List.of(line("service", "1", "0.002", "0"), line("service", "2", "0.001", "0"))) {
            Prepared result = change(p, command(p, List.of(input))).prepare();
            assertThat(result.totals()).isEqualTo(p.totals());
            assertThat(result.version()).isEqualTo(4);
        }
    }
    @Test void changedDescriptionOrVatIsEffective() {
        Proposal p = stored(List.of(service));
        for (var input : List.of(line("other", "2", "10.005", "21"), line("service", "2", "10.005", "20"))) {
            assertThat(replacement.assess(p, command(p, List.of(input)))).isInstanceOf(Change.class);
        }
    }
    @Test void orderMattersButSwappingIdenticalTuplesIsUnobservable() {
        var second = line("second", "1", "3", "0");
        Proposal p = stored(List.of(service, second));
        Prepared result = change(p, command(p, List.of(second, service))).prepare();
        assertThat(result.lines()).extracting(Line::description).containsExactly("second", "service");
        assertThat(result.totals()).isEqualTo(p.totals());
        Proposal identical = stored(List.of(service, service));
        assertThat(replacement.assess(identical, command(identical, List.of(service, service))))
            .isEqualTo(new NoOp(identical));
    }
    @Test void clearAndRefillAreFullReplacementsAndEmptyToEmptyIsNoOp() {
        Proposal p = stored(List.of(service));
        Prepared cleared = change(p, command(p, List.of())).prepare();
        assertThat(cleared.lines()).isEmpty();
        assertThat(cleared.totals()).isEqualTo(Amounts.zero());
        Proposal empty = stored(List.of());
        assertThat(replacement.assess(empty, command(empty, List.of()))).isEqualTo(new NoOp(empty));
        assertThat(change(empty, command(empty, List.of(service))).prepare().lines()).hasSize(1);
    }
    @Test void unavailablePolicyAllowsNoOpButNeverFallsBackForAnyEffectiveChange() {
        Proposal p = stored(List.of(service));
        Proposal historical = metadata(p, p.state(), p.version(), "UNAVAILABLE-POLICY-FIXTURE");
        assertThat(replacement.assess(historical, command(historical, List.of(service))))
            .isEqualTo(new NoOp(historical));
        rejects(() -> change(historical, command(historical, List.of())).prepare(), SALES_MONETARY_POLICY_UNAVAILABLE);
        rejects(() -> change(historical, new ReplaceProposalDraftCommand(historical.version(), 8L,
            historical.currency(), List.of(service))).prepare(), SALES_MONETARY_POLICY_UNAVAILABLE);
    }
    @Test void maximumVersionNoOpSucceedsAndExhaustionPrecedesPolicyOrArithmetic() {
        Proposal p = stored(List.of(service));
        Proposal max = metadata(p, p.state(), Long.MAX_VALUE, "UNAVAILABLE-POLICY-FIXTURE");
        assertThat(replacement.assess(max, command(max, List.of(service)))).isEqualTo(new NoOp(max));
        var overflowing = line("overflow", "9999999999999", "9999999999999", "0");
        rejects(() -> replacement.assess(max, command(max, List.of(overflowing))), SALES_VERSION_EXHAUSTED);
        Proposal last = metadata(p, p.state(), Long.MAX_VALUE - 1, p.monetaryPolicyId());
        assertThat(change(last, command(last, List.of())).prepare().version()).isEqualTo(Long.MAX_VALUE);
    }
    @Test void noOpUsesStoredSnapshotsWithoutRecalculatingEvenIfInputsWouldOverflow() {
        var input = line("historic", "9999999999999", "9999999999999", "0");
        Proposal p = stored(List.of());
        var historicLine = new ProposalLine(77, 1, input.description(), input.quantity(), input.unitNetPrice(),
            input.vatRate(), Amounts.zero());
        Proposal historical = new Proposal(p.id(), p.thirdPartyId(), p.currency(), p.state(), p.version(),
            p.monetaryPolicyId(), List.of(historicLine), Amounts.zero(), p.createdAt(), p.updatedAt());
        assertThat(replacement.assess(historical, command(historical, List.of(input)))).isEqualTo(new NoOp(historical));
    }
    @Test void calculatedOverflowIsDeferredUntilPreparationAndAfterPolicyResolution() {
        Proposal p = stored(List.of());
        var overflow = line("overflow", "9999999999999", "9999999999999", "0");
        var command = command(p, List.of(overflow));
        Change change = change(p, command);
        assertThatThrownBy(change::prepare).isInstanceOf(InvalidProposalException.class);
        Proposal historical = metadata(p, p.state(), p.version(), "UNAVAILABLE-POLICY-FIXTURE");
        rejects(() -> change(historical, command).prepare(), SALES_MONETARY_POLICY_UNAVAILABLE);
        var fits = line("fits", "10000000", "9000000000", "0");
        assertThat(change(p, command(p, List.of(fits))).prepare().totals().netAmount())
            .isEqualByComparingTo("90000000000000000");
        assertThatThrownBy(() -> change(p, command(p, List.of(fits, fits))).prepare())
            .isInstanceOf(InvalidProposalException.class);
    }
    @Test void calculationsKeepCom01NetThenTaxAndPerLineHalfUpRules() {
        Proposal p = stored(List.of());
        Prepared result = change(p, command(p, List.of(service, line("tie", "1", "0.10", "5"),
            line("a", "1", "0.005", "0"), line("b", "1", "0.005", "0")))).prepare();
        assertThat(result.lines().getFirst().amounts()).isEqualTo(
            new Amounts(new BigDecimal("20.01"), new BigDecimal("4.20"), new BigDecimal("24.21")));
        assertThat(result.lines().get(1).amounts().taxAmount()).isEqualTo(new BigDecimal("0.01"));
        assertThat(result.totals()).isEqualTo(
            new Amounts(new BigDecimal("20.13"), new BigDecimal("4.21"), new BigDecimal("24.34")));
    }
    @Test void exactInputMaximaUnicodeAndMaximumLineCountAreAccepted() {
        Proposal p = stored(List.of());
        String text = "😀".repeat(ProposalLimits.MAX_DESCRIPTION_CODE_POINTS);
        var maximum = line(text, "9999999999999.999999", "0.000001", "100.0000");
        Prepared result = change(p, command(p, List.of(maximum))).prepare();
        assertThat(result.lines().getFirst().description()).isEqualTo(text);
        assertThat(result.totals().netAmount()).isEqualTo(new BigDecimal("10000000.00"));
        assertThat(change(p, command(p, List.of(line("price", "0.000001", "9999999999999.999999", "0"))))
            .prepare().totals().netAmount()).isEqualTo(new BigDecimal("10000000.00"));
        assertThat(change(p, command(p, Collections.nCopies(ProposalLimits.MAX_LINES, service))).prepare().lines())
            .hasSize(ProposalLimits.MAX_LINES);
    }
    @Test void structuralValidationRejectsBadBoundsScalesAndRequiredValuesBeforeAssessment() {
        Proposal p = stored(List.of());
        var invalid = List.of(line(" ", "1", "1", "0"), line("a", "0", "1", "0"),
            line("a", "1", "-1", "0"), line("a", "1", "1", "100.0001"),
            line("a", "1.0000001", "1", "0"), line("a", "1", "0.0000001", "0"),
            line("a", "1", "1", "1.00001"), line("a", "10000000000000", "1", "0"),
            line("a", "1", "10000000000000", "0"), line("a", "1", "1", "-1"),
            line("😀".repeat(ProposalLimits.MAX_DESCRIPTION_CODE_POINTS + 1), "1", "1", "0"),
            new CreateProposalCommand.Line(null, BigDecimal.ONE, BigDecimal.ONE, BigDecimal.ZERO),
            new CreateProposalCommand.Line("a", null, BigDecimal.ONE, BigDecimal.ZERO),
            new CreateProposalCommand.Line("a", BigDecimal.ONE, null, BigDecimal.ZERO),
            new CreateProposalCommand.Line("a", BigDecimal.ONE, BigDecimal.ONE, null));
        for (var input : invalid) {
            assertThatThrownBy(() -> command(p, List.of(input))).isInstanceOf(InvalidProposalException.class);
        }
        assertThatThrownBy(() -> command(p, Collections.nCopies(ProposalLimits.MAX_LINES + 1, service)))
            .isInstanceOf(InvalidProposalException.class);
        assertThatThrownBy(() -> command(p, Arrays.asList(service, null))).isInstanceOf(InvalidProposalException.class);
        assertThatThrownBy(() -> command(p, null)).isInstanceOf(InvalidProposalException.class);
        for (Long version : Arrays.asList(null, 0L, -1L)) {
            assertThatThrownBy(() -> new ReplaceProposalDraftCommand(version, 7L, MonetaryPolicy.CURRENCY, List.of()))
                .isInstanceOf(InvalidProposalException.class);
        }
        for (Long party : Arrays.asList(null, 0L, -1L)) {
            assertThatThrownBy(() -> new ReplaceProposalDraftCommand(3L, party, MonetaryPolicy.CURRENCY, List.of()))
                .isInstanceOf(InvalidProposalException.class);
        }
        for (String currency : Arrays.asList(null, "USD", "eur")) {
            assertThatThrownBy(() -> new ReplaceProposalDraftCommand(3L, 7L, currency, List.of()))
                .isInstanceOf(InvalidProposalException.class);
        }
    }
    @Test void excessiveScaleRejectsEvenWhenNumericallyIdenticalToStoredInput() {
        Proposal p = stored(List.of(service));
        assertThatThrownBy(() -> command(p, List.of(line("service", "2.0000000", "10.005", "21"))))
            .isInstanceOf(InvalidProposalException.class);
    }
    @Test void inputAndPreparedLinesCannotBeMutatedThroughCallerLists() {
        Proposal p = stored(List.of());
        var inputs = new ArrayList<>(List.of(service));
        var command = command(p, inputs);
        inputs.clear();
        Prepared result = change(p, command).prepare();
        assertThat(result.lines()).hasSize(1);
        assertThatThrownBy(() -> command.lines().clear()).isInstanceOf(UnsupportedOperationException.class);
        assertThatThrownBy(() -> result.lines().clear()).isInstanceOf(UnsupportedOperationException.class);
    }
}
