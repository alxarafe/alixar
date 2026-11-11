package es.alxarafe.alixar.sales.infrastructure;

import es.alxarafe.alixar.sales.application.*;
import es.alxarafe.alixar.sales.domain.*;
import java.math.BigDecimal;
import java.time.*;
import java.time.temporal.ChronoUnit;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.locks.LockSupport;
import java.util.function.Supplier;
import org.jooq.*;
import org.jooq.impl.DefaultExecuteListener;
import org.jooq.impl.DefaultExecuteListenerProvider;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.transaction.*;
import org.springframework.transaction.support.TransactionTemplate;
import static es.alxarafe.alixar.sales.application.SalesErrorCode.*;
import static org.assertj.core.api.Assertions.*;

/** Exercises the internal PostgreSQL persistence step; the audited facade is tested separately. */
@SpringBootTest(properties = "spring.autoconfigure.exclude=")
class ProposalDraftPersistenceIT {
    private static final int TIMEOUT_SECONDS = 10;
    private static final Duration BLOCK_POLL_INTERVAL = Duration.ofMillis(10);
    private static final String IDENTIFIER_SQL = "select \"id\" from \"third_party\"";
    private static final String ROOT_SQL = "from \"sales_proposal\"";
    private static final String DELETE_SQL = "delete from \"sales_proposal_line\"";
    private static final String INSERT_SQL = "insert into \"sales_proposal_line\"";
    private static final String UPDATE_SQL = "update \"sales_proposal\"";
    private static final Instant NOW = Instant.parse("2026-11-11T12:00:00.123456789Z");
    @Autowired DSLContext dsl;
    @Autowired ProposalRepository repository;
    @Autowired EligibleThirdParty thirdParty;
    @Autowired TransactionalProposalService proposals;
    @Autowired PlatformTransactionManager transactions;
    @Autowired ApplicationContext context;
    private final List<Long> parties = new ArrayList<>();
    private ExecuteListenerProvider[] listeners;

    @BeforeEach void before() { listeners = dsl.configuration().executeListenerProviders(); }
    @AfterEach void cleanup() {
        dsl.configuration().set(listeners);
        for (long id : parties) {
            dsl.execute("delete from sales_proposal_line where proposal_id in (select id from sales_proposal where third_party_id=?)", id);
            dsl.execute("delete from sales_proposal where third_party_id=?", id);
            dsl.execute("delete from third_party where id=?", id);
        }
    }
    private long party() {
        long id = dsl.fetchOne("insert into third_party(name,active,customer,prospect,supplier) values ('COM-02 fixture',true,true,false,false) returning id")
            .get(0, Long.class);
        parties.add(id);
        return id;
    }
    private CreateProposalCommand.Line line(String text, String quantity, String price, String vat) {
        return new CreateProposalCommand.Line(text, new BigDecimal(quantity), new BigDecimal(price), new BigDecimal(vat));
    }
    private List<CreateProposalCommand.Line> inputs() {
        return List.of(line("first", "2", "10.005", "21"), line("second", "1", "3", "0"));
    }
    private Proposal draft() {
        long target = party();
        var create = new CreateProposalUseCase(repository, thirdParty, Clock.fixed(NOW.minusSeconds(30), ZoneOffset.UTC));
        long id = tx(() -> create.execute(new CreateProposalCommand(target, MonetaryPolicy.CURRENCY, inputs())));
        return proposals.get(id);
    }
    private ReplaceProposalDraftCommand command(Proposal p, long target, List<CreateProposalCommand.Line> lines) {
        return new ReplaceProposalDraftCommand(p.version(), target, p.currency(), lines);
    }
    private ReplaceProposalDraftCommand noOp(Proposal p) { return command(p, p.thirdPartyId(), inputs()); }
    private ReplaceProposalDraftCommand edit(Proposal p) {
        return command(p, p.thirdPartyId(), List.of(line("replacement", "3", "20", "21")));
    }
    private InternalProposalDraftReplacement writer(Clock clock) {
        return new InternalProposalDraftReplacement(repository, thirdParty, clock, transactions);
    }
    private InternalProposalDraftReplacement writer() { return writer(Clock.fixed(NOW, ZoneOffset.UTC)); }
    private <T> T tx(Supplier<T> body) {
        var transaction = new TransactionTemplate(transactions);
        transaction.setIsolationLevel(TransactionDefinition.ISOLATION_READ_COMMITTED);
        return transaction.execute(status -> body.get());
    }
    private InternalProposalDraftReplacement.Result replace(Proposal p, ReplaceProposalDraftCommand command) {
        return tx(() -> writer().replace(p.id(), command));
    }
    private void listen(ExecuteListener listener) {
        var providers = Arrays.copyOf(listeners, listeners.length + 1);
        providers[listeners.length] = new DefaultExecuteListenerProvider(listener);
        dsl.configuration().set(providers);
    }
    private List<String> recordSql() {
        List<String> sql = new CopyOnWriteArrayList<>();
        listen(new DefaultExecuteListener() {
            @Override public void executeStart(ExecuteContext ctx) { sql.add(ctx.sql()); }
        });
        return sql;
    }
    private void reject(Runnable action, SalesErrorCode code) {
        assertThatThrownBy(action::run).isInstanceOfSatisfying(DraftReplacementRejectedException.class,
            ex -> assertThat(ex.code()).isEqualTo(code));
    }

    @Test void completeReplacementChangesEveryLineAndOnlyEditableHeaderFields() {
        Proposal original = draft();
        var sql = recordSql();
        var result = replace(original, edit(original));
        assertThat(result).isEqualTo(new InternalProposalDraftReplacement.Result(original.id(), original.version() + 1, true));
        assertThat(sql.get(0)).startsWith(IDENTIFIER_SQL).endsWith("for share");
        assertThat(sql.get(1)).contains(ROOT_SQL).endsWith("for update");
        assertThat(sql.get(2)).contains("from \"sales_proposal_line\"");
        assertThat(sql.get(3)).startsWith("select \"active\", \"customer\", \"prospect\"");
        assertThat(sql.get(4)).startsWith(DELETE_SQL);
        assertThat(sql.get(5)).startsWith(INSERT_SQL);
        assertThat(sql.get(6)).startsWith(UPDATE_SQL).contains("\"id\" = ?", "\"version\" = ?", "\"state\" = ?");
        dsl.configuration().set(listeners);
        Proposal current = proposals.get(original.id());
        assertThat(current.id()).isEqualTo(original.id());
        assertThat(current.state()).isEqualTo(original.state());
        assertThat(current.createdAt()).isEqualTo(original.createdAt());
        assertThat(current.monetaryPolicyId()).isEqualTo(original.monetaryPolicyId());
        assertThat(current.updatedAt()).isEqualTo(NOW.truncatedTo(ChronoUnit.MICROS));
        assertThat(current.lines()).hasSize(1);
        assertThat(current.lines().getFirst().position()).isEqualTo(1);
        assertThat(current.lines().getFirst().description()).isEqualTo("replacement");
        assertThat(current.lines().getFirst().id()).isNotIn(original.lines().stream().map(ProposalLine::id).toList());
        assertThat(current.totals()).isEqualTo(new Amounts(new BigDecimal("60.00"), new BigDecimal("12.60"), new BigDecimal("72.60")));
        assertThat(dsl.fetchOne("select count(*) from sales_proposal_line where id in (?,?)",
            original.lines().getFirst().id(), original.lines().getLast().id()).get(0, int.class)).isZero();
    }
    @Test void thirdPartyOnlyChangeRenewsAllIdentitiesAndAllowsLeavingAnInactiveParty() {
        Proposal original = draft();
        long target = party();
        dsl.execute("update third_party set active=false where id=?", original.thirdPartyId());
        replace(original, command(original, target, inputs()));
        Proposal current = proposals.get(original.id());
        assertThat(current.thirdPartyId()).isEqualTo(target);
        assertThat(current.lines()).extracting(ProposalLine::id)
            .doesNotContainAnyElementsOf(original.lines().stream().map(ProposalLine::id).toList());
        assertThat(current.lines()).extracting(ProposalLine::position).containsExactly(1, 2);
        assertThat(current.totals()).isEqualTo(original.totals());
        assertThat(current.createdAt()).isEqualTo(original.createdAt());
        assertThat(current.monetaryPolicyId()).isEqualTo(original.monetaryPolicyId());
    }
    @Test void clearAndRefillKeepRootAndAdvanceVersionOnceEach() {
        Proposal original = draft();
        replace(original, command(original, original.thirdPartyId(), List.of()));
        Proposal empty = proposals.get(original.id());
        assertThat(empty.lines()).isEmpty();
        assertThat(empty.totals()).isEqualTo(Amounts.zero());
        assertThat(empty.version()).isEqualTo(original.version() + 1);
        replace(empty, command(empty, empty.thirdPartyId(), inputs()));
        Proposal filled = proposals.get(original.id());
        assertThat(filled.version()).isEqualTo(original.version() + 2);
        assertThat(filled.lines()).extracting(ProposalLine::position).containsExactly(1, 2);
        assertThat(filled.totals()).isEqualTo(original.totals());
    }
    @Test void noOpHasNoDmlOrCommercialReadsAndPreservesHistoricSnapshots() {
        for (boolean inactive : List.of(true, false)) {
            Proposal original = draft();
            dsl.execute("update third_party set active=?,customer=false,prospect=false where id=?", !inactive, original.thirdPartyId());
            dsl.execute("update sales_proposal set monetary_policy_id=? where id=?", "UNAVAILABLE-POLICY-FIXTURE", original.id());
            dsl.execute("update sales_proposal_line set net_amount=1,tax_amount=2,gross_amount=3 where proposal_id=?", original.id());
            Proposal historical = proposals.get(original.id());
            var sql = recordSql();
            var normalized = List.of(line(" first ", "2.000000", "10.005000", "21.0000"), line("\tsecond\n", "1", "3", "0"));
            assertThat(replace(historical, command(historical, historical.thirdPartyId(), normalized)).changed()).isFalse();
            assertThat(sql).hasSize(3).allSatisfy(query -> {
                assertThat(query).startsWith("select ").doesNotContain("\"active\"", "\"customer\"", "\"prospect\"");
            });
            assertThat(sql.getFirst()).startsWith(IDENTIFIER_SQL).endsWith("for share");
            dsl.configuration().set(listeners);
            assertThat(proposals.get(original.id())).isEqualTo(historical);
        }
    }
    @Test void staleIdenticalInputConflictsBeforeLoadingLinesOrCheckingEligibility() {
        Proposal original = draft();
        var sql = recordSql();
        var stale = new ReplaceProposalDraftCommand(original.version() + 1, original.thirdPartyId(), original.currency(), inputs());
        reject(() -> replace(original, stale), SALES_VERSION_CONFLICT);
        assertThat(sql).hasSize(2);
        assertThat(sql.getFirst()).startsWith(IDENTIFIER_SQL);
        assertThat(sql.getLast()).contains(ROOT_SQL).endsWith("for update");
        dsl.configuration().set(listeners);
        assertThat(proposals.get(original.id())).isEqualTo(original);
    }
    @Test void structuralValidationAndExistencePrecedeBusinessChecks() {
        Proposal p = draft();
        var sql = recordSql();
        assertThatThrownBy(() -> tx(() -> writer().replace(0, noOp(p)))).isInstanceOf(InvalidProposalException.class);
        assertThatThrownBy(() -> tx(() -> writer().replace(p.id(), null))).isInstanceOf(InvalidProposalException.class);
        assertThatThrownBy(() -> new ReplaceProposalDraftCommand(0L, p.thirdPartyId(), p.currency(), inputs()))
            .isInstanceOf(InvalidProposalException.class);
        assertThat(sql).isEmpty();
        assertThatThrownBy(() -> tx(() -> writer().replace(Long.MAX_VALUE,
            command(p, Long.MAX_VALUE, inputs())))).isInstanceOf(ProposalNotFoundException.class);
        assertThat(sql).hasSize(2);
    }
    @Test void invalidEligibilityAndUnknownPolicyRejectBeforeAnyDml() {
        Proposal original = draft();
        dsl.execute("update third_party set active=false where id=?", original.thirdPartyId());
        dsl.execute("update sales_proposal set monetary_policy_id=? where id=?", "UNAVAILABLE-POLICY-FIXTURE", original.id());
        Proposal historical = proposals.get(original.id());
        var sql = recordSql();
        assertThatThrownBy(() -> replace(historical, edit(historical))).isInstanceOf(InvalidSalesThirdPartyException.class);
        assertThat(sql).hasSize(4).allSatisfy(query -> assertThat(query).startsWith("select "));
        dsl.configuration().set(listeners);
        long target = party();
        sql = recordSql();
        reject(() -> replace(historical, command(historical, target, inputs())), SALES_MONETARY_POLICY_UNAVAILABLE);
        assertThat(sql).hasSize(4).allSatisfy(query -> assertThat(query).startsWith("select "));
        dsl.configuration().set(listeners);
        assertThat(proposals.get(original.id())).isEqualTo(historical);
    }
    @Test void amountOverflowIsValidatedBeforeDeletingLines() {
        Proposal original = draft();
        var sql = recordSql();
        var overflow = List.of(line("overflow", "9999999999999", "9999999999999", "0"));
        assertThatThrownBy(() -> replace(original, command(original, original.thirdPartyId(), overflow)))
            .isInstanceOf(InvalidProposalException.class);
        assertThat(sql).hasSize(4).allSatisfy(query -> assertThat(query).startsWith("select "));
        dsl.configuration().set(listeners);
        assertThat(proposals.get(original.id())).isEqualTo(original);
    }
    @Test void maximumVersionNoOpSucceedsAndEffectiveExhaustionPrecedesEligibility() {
        Proposal original = draft();
        dsl.execute("update sales_proposal set version=?,monetary_policy_id=? where id=?",
            Long.MAX_VALUE, "UNAVAILABLE-POLICY-FIXTURE", original.id());
        dsl.execute("update third_party set active=false where id=?", original.thirdPartyId());
        Proposal max = proposals.get(original.id());
        assertThat(replace(max, noOp(max))).isEqualTo(new InternalProposalDraftReplacement.Result(max.id(), Long.MAX_VALUE, false));
        var sql = recordSql();
        reject(() -> replace(max, edit(max)), SALES_VERSION_EXHAUSTED);
        assertThat(sql).hasSize(3).allSatisfy(query -> assertThat(query).startsWith("select "));
        dsl.configuration().set(listeners);
        assertThat(proposals.get(max.id())).isEqualTo(max);
    }
    @Test void timestampsAreTruncatedAndNeverRegressEvenWhenVersionReachesMaximum() {
        Proposal original = draft();
        dsl.execute("update sales_proposal set version=? where id=?", Long.MAX_VALUE - 1, original.id());
        Proposal last = proposals.get(original.id());
        Clock backwards = Clock.fixed(last.updatedAt().minusSeconds(1), ZoneOffset.UTC);
        tx(() -> writer(backwards).replace(last.id(), edit(last)));
        Proposal max = proposals.get(original.id());
        assertThat(max.updatedAt()).isEqualTo(last.updatedAt());
        assertThat(max.createdAt()).isEqualTo(last.createdAt());
        assertThat(max.version()).isEqualTo(Long.MAX_VALUE);
    }
    @Test void internalStepCannotCreateItsOwnCommitOrBeInvokedAsAPublicBean() {
        Proposal original = draft();
        assertThat(context.getBeansOfType(InternalProposalDraftReplacement.class)).isEmpty();
        assertThatThrownBy(() -> writer().replace(original.id(), edit(original)))
            .isInstanceOf(IllegalTransactionStateException.class);
        var wrongIsolation = new TransactionTemplate(transactions);
        wrongIsolation.setIsolationLevel(TransactionDefinition.ISOLATION_REPEATABLE_READ);
        assertThatThrownBy(() -> wrongIsolation.execute(status -> writer().replace(original.id(), edit(original))))
            .isInstanceOf(IllegalStateException.class);
        wrongIsolation.setIsolationLevel(TransactionDefinition.ISOLATION_READ_COMMITTED);
        wrongIsolation.setReadOnly(true);
        assertThatThrownBy(() -> wrongIsolation.execute(status -> writer().replace(original.id(), edit(original))))
            .isInstanceOf(IllegalStateException.class);
        assertThat(proposals.get(original.id())).isEqualTo(original);
    }

    @Test void concurrentEffectiveReplacementsOfSameVersionHaveOneWinner() throws Exception {
        Proposal p = draft();
        race(p, edit(p), command(p, p.thirdPartyId(), List.of()), true, false);
    }
    @Test void differentTargetPartiesStillSerializeOnTheSameRoot() throws Exception {
        Proposal p = draft();
        long first = party(), second = party();
        race(p, command(p, first, inputs()), command(p, second, List.of()), true, false);
        assertThat(proposals.get(p.id()).thirdPartyId()).isEqualTo(first);
    }
    @Test void noOpThenEffectiveChangeCanBothSucceed() throws Exception {
        Proposal p = draft();
        race(p, noOp(p), edit(p), false, true);
    }
    @Test void effectiveChangeMakesWaitingIdenticalOldContentConflict() throws Exception {
        Proposal p = draft();
        race(p, edit(p), noOp(p), true, false);
    }
    @Test void concurrentNoOpsPreserveTheVersionAndIdentities() throws Exception {
        Proposal p = draft();
        race(p, noOp(p), noOp(p), false, false);
        assertThat(proposals.get(p.id())).isEqualTo(p);
    }
    private void race(Proposal original, ReplaceProposalDraftCommand firstCommand, ReplaceProposalDraftCommand secondCommand,
        boolean firstChanges, boolean secondChanges) throws Exception {
        CountDownLatch held = new CountDownLatch(1), release = new CountDownLatch(1), started = new CountDownLatch(1);
        AtomicInteger holderPid = new AtomicInteger(), waiterPid = new AtomicInteger();
        try (var executor = Executors.newVirtualThreadPerTaskExecutor()) {
            Future<InternalProposalDraftReplacement.Result> first = executor.submit(() -> tx(() -> {
                holderPid.set(pid());
                var result = writer().replace(original.id(), firstCommand);
                held.countDown();
                await(release);
                return result;
            }));
            try {
                await(held);
                Future<InternalProposalDraftReplacement.Result> second = executor.submit(() -> tx(() -> {
                    waiterPid.set(pid());
                    started.countDown();
                    return writer().replace(original.id(), secondCommand);
                }));
                await(started);
                assertThat(waiterPid.get()).isNotEqualTo(holderPid.get());
                awaitBlocked(waiterPid.get(), holderPid.get());
                assertThat(second.isDone()).isFalse();
                release.countDown();
                assertThat(first.get(TIMEOUT_SECONDS, TimeUnit.SECONDS).changed()).isEqualTo(firstChanges);
                if (firstChanges) {
                    assertThatThrownBy(() -> second.get(TIMEOUT_SECONDS, TimeUnit.SECONDS))
                        .isInstanceOfSatisfying(ExecutionException.class, ex -> {
                            assertThat(ex.getCause()).isInstanceOfSatisfying(DraftReplacementRejectedException.class,
                                rejected -> assertThat(rejected.code()).isEqualTo(SALES_VERSION_CONFLICT));
                        });
                } else { assertThat(second.get(TIMEOUT_SECONDS, TimeUnit.SECONDS).changed()).isEqualTo(secondChanges); }
                Proposal current = proposals.get(original.id());
                assertThat(current.version()).isEqualTo(original.version() + (firstChanges || secondChanges ? 1 : 0));
                var winner = firstChanges ? firstCommand : secondCommand;
                assertThat(current.thirdPartyId()).isEqualTo(winner.thirdPartyId());
                assertThat(current.lines()).extracting(ProposalLine::description)
                    .containsExactlyElementsOf(winner.lines().stream().map(CreateProposalCommand.Line::description).toList());
            } finally { release.countDown(); }
        }
    }

    @Test void earlierTargetReclassificationOrDeletionIsObservedAfterWaiting() throws Exception {
        for (boolean delete : List.of(false, true)) {
            Proposal p = draft();
            long target = party();
            CountDownLatch held = new CountDownLatch(1), release = new CountDownLatch(1), started = new CountDownLatch(1);
            AtomicInteger holderPid = new AtomicInteger(), waiterPid = new AtomicInteger();
            try (var executor = Executors.newVirtualThreadPerTaskExecutor()) {
                Future<?> mutation = executor.submit(() -> tx(() -> {
                    holderPid.set(pid());
                    if (delete) { dsl.execute("delete from third_party where id=?", target); }
                    else { dsl.execute("update third_party set customer=false,prospect=false where id=?", target); }
                    held.countDown();
                    await(release);
                    return null;
                }));
                try {
                    await(held);
                    Future<?> replacement = executor.submit(() -> tx(() -> {
                        waiterPid.set(pid());
                        started.countDown();
                        return writer().replace(p.id(), command(p, target, inputs()));
                    }));
                    await(started);
                    awaitBlocked(waiterPid.get(), holderPid.get());
                    release.countDown();
                    mutation.get(TIMEOUT_SECONDS, TimeUnit.SECONDS);
                    assertThatThrownBy(() -> replacement.get(TIMEOUT_SECONDS, TimeUnit.SECONDS))
                        .isInstanceOf(ExecutionException.class).hasCauseInstanceOf(InvalidSalesThirdPartyException.class);
                    assertThat(proposals.get(p.id())).isEqualTo(p);
                } finally { release.countDown(); }
            }
        }
    }
    @Test void identifierLockBlocksLaterTargetMutationUntilReplacementCommits() throws Exception {
        for (boolean delete : List.of(false, true)) {
            Proposal p = draft();
            long target = party();
            CountDownLatch locked = new CountDownLatch(1), release = new CountDownLatch(1), started = new CountDownLatch(1);
            AtomicInteger holderPid = new AtomicInteger(), waiterPid = new AtomicInteger();
            AtomicReference<Thread> replacing = new AtomicReference<>();
            listen(new DefaultExecuteListener() {
                @Override public void fetchEnd(ExecuteContext ctx) {
                    if (Thread.currentThread() == replacing.get() && ctx.sql().startsWith(IDENTIFIER_SQL)) {
                        locked.countDown();
                        await(release);
                    }
                }
            });
            try (var executor = Executors.newVirtualThreadPerTaskExecutor()) {
                Future<?> replacement = executor.submit(() -> tx(() -> {
                    replacing.set(Thread.currentThread());
                    holderPid.set(pid());
                    return writer().replace(p.id(), command(p, target, inputs()));
                }));
                try {
                    await(locked);
                    Future<?> mutation = executor.submit(() -> tx(() -> {
                        waiterPid.set(pid());
                        started.countDown();
                        if (delete) { return dsl.execute("delete from third_party where id=?", target); }
                        return dsl.execute("update third_party set active=false where id=?", target);
                    }));
                    await(started);
                    awaitBlocked(waiterPid.get(), holderPid.get());
                    release.countDown();
                    replacement.get(TIMEOUT_SECONDS, TimeUnit.SECONDS);
                    if (delete) {
                        assertThatThrownBy(() -> mutation.get(TIMEOUT_SECONDS, TimeUnit.SECONDS))
                            .isInstanceOf(ExecutionException.class).hasCauseInstanceOf(DataIntegrityViolationException.class);
                    } else { mutation.get(TIMEOUT_SECONDS, TimeUnit.SECONDS); }
                    assertThat(proposals.get(p.id()).thirdPartyId()).isEqualTo(target);
                } finally { release.countDown(); }
            } finally { dsl.configuration().set(listeners); }
        }
    }
    @Test void absentTargetInsertedWhileRootWaitsStillRejectsWithoutOutOfOrderLock() throws Exception {
        Proposal p = draft();
        long target = party();
        dsl.execute("delete from third_party where id=?", target);
        CountDownLatch held = new CountDownLatch(1), release = new CountDownLatch(1), started = new CountDownLatch(1);
        AtomicInteger holderPid = new AtomicInteger(), waiterPid = new AtomicInteger();
        try (var executor = Executors.newVirtualThreadPerTaskExecutor()) {
            Future<?> rootHolder = executor.submit(() -> tx(() -> {
                holderPid.set(pid());
                dsl.fetchOne("select id from sales_proposal where id=? for update", p.id());
                held.countDown();
                await(release);
                return null;
            }));
            try {
                await(held);
                Future<?> replacement = executor.submit(() -> tx(() -> {
                    waiterPid.set(pid());
                    started.countDown();
                    return writer().replace(p.id(), command(p, target, inputs()));
                }));
                await(started);
                awaitBlocked(waiterPid.get(), holderPid.get());
                dsl.execute("insert into third_party(id,name,active,customer,prospect,supplier) overriding system value values (?,'late target',true,true,false,false)", target);
                release.countDown();
                rootHolder.get(TIMEOUT_SECONDS, TimeUnit.SECONDS);
                assertThatThrownBy(() -> replacement.get(TIMEOUT_SECONDS, TimeUnit.SECONDS))
                    .isInstanceOf(ExecutionException.class).hasCauseInstanceOf(InvalidSalesThirdPartyException.class);
                assertThat(proposals.get(p.id())).isEqualTo(p);
            } finally { release.countDown(); }
        }
    }

    @Test void failuresAfterDeleteDuringInsertsAndAfterHeaderUpdateRestoreTheWholeAggregate() {
        for (String phase : List.of(DELETE_SQL, INSERT_SQL, UPDATE_SQL)) {
            Proposal p = draft();
            long target = party();
            AtomicInteger inserted = new AtomicInteger();
            listen(new DefaultExecuteListener() {
                @Override public void executeEnd(ExecuteContext ctx) {
                    if (ctx.sql().startsWith(phase) && (!phase.equals(INSERT_SQL) || inserted.incrementAndGet() == 2)) {
                        throw new InjectedFailure();
                    }
                }
            });
            assertThatThrownBy(() -> replace(p, command(p, target, inputs()))).isInstanceOf(InjectedFailure.class);
            dsl.configuration().set(listeners);
            assertThat(proposals.get(p.id())).isEqualTo(p);
        }
    }
    @Test void caughtInternalFailureStillMarksTheEnclosingTransactionForRollback() {
        Proposal p = draft();
        listen(new DefaultExecuteListener() {
            @Override public void executeEnd(ExecuteContext ctx) {
                if (ctx.sql().startsWith(DELETE_SQL)) { throw new InjectedFailure(); }
            }
        });
        assertThatThrownBy(() -> tx(() -> {
            try { writer().replace(p.id(), edit(p)); }
            catch (InjectedFailure expected) { /* Deliberately swallowed by the outer caller. */ }
            return null;
        })).isInstanceOf(UnexpectedRollbackException.class);
        dsl.configuration().set(listeners);
        assertThat(proposals.get(p.id())).isEqualTo(p);
    }
    @Test void failingOuterTransactionAlsoRollsBackASuccessfulInternalStep() {
        Proposal p = draft();
        assertThatThrownBy(() -> tx(() -> {
            writer().replace(p.id(), edit(p));
            throw new InjectedFailure();
        })).isInstanceOf(InjectedFailure.class);
        assertThat(proposals.get(p.id())).isEqualTo(p);
    }
    @Test void zeroRowsInGuardedHeaderUpdateAbortsAndRestoresReplacedLines() {
        Proposal p = draft();
        var change = (PrepareProposalDraftReplacement.Change) new PrepareProposalDraftReplacement().assess(p, edit(p));
        assertThatThrownBy(() -> tx(() -> {
            repository.lockAndFindById(p.id(), p.version());
            repository.replace(change.prepare(), p.version() + 1, NOW.truncatedTo(ChronoUnit.MICROS));
            return null;
        })).isInstanceOf(IllegalStateException.class);
        assertThat(proposals.get(p.id())).isEqualTo(p);
    }
    @Test void actualReplacementCommittedBetweenGetQueriesKeepsGetSnapshotCoherent() throws Exception {
        Proposal p = draft();
        CountDownLatch headerRead = new CountDownLatch(1), committed = new CountDownLatch(1);
        AtomicReference<Thread> reader = new AtomicReference<>();
        listen(new DefaultExecuteListener() {
            @Override public void fetchEnd(ExecuteContext ctx) {
                if (Thread.currentThread() == reader.get() && ctx.sql().contains(ROOT_SQL)) {
                    headerRead.countDown();
                    await(committed);
                }
            }
        });
        try (var executor = Executors.newVirtualThreadPerTaskExecutor()) {
            Future<Proposal> reading = executor.submit(() -> {
                reader.set(Thread.currentThread());
                return proposals.get(p.id());
            });
            try {
                await(headerRead);
                replace(p, edit(p));
                committed.countDown();
                assertThat(reading.get(TIMEOUT_SECONDS, TimeUnit.SECONDS)).isEqualTo(p);
                Proposal current = proposals.get(p.id());
                assertThat(current.version()).isEqualTo(p.version() + 1);
                assertThat(current.lines()).extracting(ProposalLine::description).containsExactly("replacement");
            } finally { committed.countDown(); }
        }
    }

    private int pid() { return dsl.fetchOne("select pg_backend_pid()").get(0, int.class); }
    private static void await(CountDownLatch latch) {
        try { assertThat(latch.await(TIMEOUT_SECONDS, TimeUnit.SECONDS)).isTrue(); }
        catch (InterruptedException ex) { Thread.currentThread().interrupt(); throw new AssertionError(ex); }
    }
    private void awaitBlocked(int waiter, int holder) {
        assertThat(waiter).isNotEqualTo(holder);
        long deadline = System.nanoTime() + Duration.ofSeconds(TIMEOUT_SECONDS).toNanos();
        while (System.nanoTime() < deadline) {
            if (Boolean.TRUE.equals(dsl.fetchOne("select ? = any(pg_blocking_pids(?))", holder, waiter).get(0, Boolean.class))) { return; }
            LockSupport.parkNanos(BLOCK_POLL_INTERVAL.toNanos());
        }
        fail("Expected PostgreSQL to report the specific holder blocking the competing connection");
    }
    private static final class InjectedFailure extends RuntimeException { }
}
