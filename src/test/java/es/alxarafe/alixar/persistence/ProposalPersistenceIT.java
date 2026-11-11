package es.alxarafe.alixar.persistence;

import es.alxarafe.alixar.sales.application.*;
import es.alxarafe.alixar.sales.domain.*;
import es.alxarafe.alixar.sales.infrastructure.TransactionalProposalService;
import es.alxarafe.alixar.audit.application.*;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.infrastructure.CachedAuditPolicyProvider;
import es.alxarafe.alixar.thirdparty.application.ThirdPartyDeleteConflictException;
import es.alxarafe.alixar.thirdparty.infrastructure.TransactionalThirdPartyService;
import java.math.BigDecimal;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.LockSupport;
import java.time.Duration;
import org.jooq.DSLContext;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;
import static org.assertj.core.api.Assertions.*;

// Selected explicitly by bin/check, against its isolated real PostgreSQL database.
@SpringBootTest(properties = "spring.autoconfigure.exclude=")
@Import(PersistenceIT.FixedAuditActorConfiguration.class)
class ProposalPersistenceIT {
    private static final int TIMEOUT_SECONDS = 10;
    private static final String PROPOSAL = "sales_proposal";
    private static final String LINE = "sales_proposal_line";
    @Autowired DSLContext dsl;
    @Autowired TransactionalProposalService proposals;
    @Autowired CreateProposalUseCase create;
    @Autowired GetProposalUseCase get;
    @Autowired TransactionalThirdPartyService thirdParties;
    @Autowired PlatformTransactionManager transactions;
    @Autowired CachedAuditPolicyProvider auditPolicy;
    private final List<Long> parties = new ArrayList<>();
    @BeforeEach void before() { mode(AuditMode.OFF); resetAudit(); }
    @AfterEach void cleanup() {
        mode(AuditMode.OFF);
        for (long id : parties) {
            dsl.execute("delete from sales_proposal_line where proposal_id in (select id from sales_proposal where third_party_id = ?)", id);
            dsl.execute("delete from sales_proposal where third_party_id = ?", id);
            dsl.execute("delete from third_party where id = ?", id);
        }
        resetAudit();
    }
    private long party(boolean active, boolean customer, boolean prospect, boolean supplier) {
        long id = dsl.fetchOne("insert into third_party(name, active, customer, prospect, supplier) values ('COM-01 fixture', ?, ?, ?, ?) returning id",
            active, customer, prospect, supplier).get("id", Long.class);
        parties.add(id);
        return id;
    }
    private CreateProposalCommand command(long id) {
        return new CreateProposalCommand(id, MonetaryPolicy.CURRENCY, List.of(
            new CreateProposalCommand.Line(" service ", new BigDecimal("2"), new BigDecimal("10.005"), new BigDecimal("21")),
            new CreateProposalCommand.Line("precise", new BigDecimal("0.000001"), new BigDecimal("1234567890123.123456"), new BigDecimal("0.0001"))));
    }
    private void mode(AuditMode mode) {
        dsl.execute("update audit_configuration set mode = ?, updated_at = current_timestamp", mode.name());
        auditPolicy.reload();
    }
    private void resetAudit() {
        dsl.execute("insert into audit_chain_head(chain_id,last_sequence,last_hash) values (?,0,?) on conflict do nothing",
            AuditChain.DEFAULT_CHAIN_ID, AuditChain.GENESIS_HASH);
        dsl.execute("delete from audit_event");
        dsl.execute("update audit_chain_head set last_sequence=0,last_hash=? where chain_id=?", AuditChain.GENESIS_HASH, AuditChain.DEFAULT_CHAIN_ID);
    }
    private int count(String table) { return dsl.fetchOne("select count(*) from " + table).get(0, int.class); }
    @Test void getKeepsOneSnapshotWhenReplacementCommitsBetweenHeaderAndLines() throws Exception {
        long id = proposals.create(command(party(true, true, false, false)));
        Proposal original = proposals.get(id);
        assertThat(org.springframework.aop.support.AopUtils.isAopProxy(proposals)).isTrue();
        var providers = dsl.configuration().executeListenerProviders();
        CountDownLatch headerRead = new CountDownLatch(1), replacementCommitted = new CountDownLatch(1);
        var readerThread = new java.util.concurrent.atomic.AtomicReference<Thread>();
        AtomicInteger readerPid = new AtomicInteger(), writerPid = new AtomicInteger();
        var listener = new org.jooq.impl.DefaultExecuteListener() {
            @Override public void fetchEnd(org.jooq.ExecuteContext context) {
                if (Thread.currentThread() != readerThread.get()
                    || !context.sql().contains("from \"" + PROPOSAL + "\"")) { return; }
                // Inspect the very JDBC connection used by the actual header query.
                try (var statement = context.connection().createStatement();
                     var result = statement.executeQuery(
                         "select pg_backend_pid(), current_setting('transaction_isolation'), current_setting('transaction_read_only')")) {
                    assertThat(result.next()).isTrue();
                    readerPid.set(result.getInt(1));
                    assertThat(result.getString(2)).isEqualTo("repeatable read");
                    assertThat(result.getString(3)).isEqualTo("on");
                } catch (java.sql.SQLException ex) { throw new AssertionError(ex); }
                assertThat(org.springframework.transaction.support.TransactionSynchronizationManager.isActualTransactionActive()).isTrue();
                headerRead.countDown();
                await(replacementCommitted);
            }
        };
        var instrumented = Arrays.copyOf(providers, providers.length + 1);
        instrumented[providers.length] = new org.jooq.impl.DefaultExecuteListenerProvider(listener);
        dsl.configuration().set(instrumented);
        try (var executor = Executors.newVirtualThreadPerTaskExecutor()) {
            Future<Proposal> reading = executor.submit(() -> {
                readerThread.set(Thread.currentThread());
                try { return proposals.get(id); }
                finally { readerThread.set(null); }
            });
            try {
                await(headerRead);
                // Fixture SQL simulates an atomic replacement; no PUT implementation is needed.
                long replacementLine = new TransactionTemplate(transactions).execute(status -> {
                    writerPid.set(dsl.fetchOne("select pg_backend_pid()").get(0, int.class));
                    dsl.execute("update sales_proposal set version=version+1, updated_at=updated_at + interval '1 second' where id=?", id);
                    dsl.execute("delete from sales_proposal_line where proposal_id=?", id);
                    return dsl.fetchOne("insert into sales_proposal_line(proposal_id,position,description,quantity,unit_net_price,vat_rate,net_amount,tax_amount,gross_amount) values (?,1,'replacement',3,20,21,60,12.60,72.60) returning id", id)
                        .get(0, Long.class);
                });
                assertThat(writerPid.get()).isNotEqualTo(readerPid.get());
                replacementCommitted.countDown();
                assertThat(reading.get(TIMEOUT_SECONDS, TimeUnit.SECONDS)).isEqualTo(original);
                Proposal current = proposals.get(id);
                assertThat(current.id()).isEqualTo(original.id());
                assertThat(current.thirdPartyId()).isEqualTo(original.thirdPartyId());
                assertThat(current.version()).isEqualTo(original.version() + 1);
                assertThat(current.createdAt()).isEqualTo(original.createdAt());
                assertThat(current.updatedAt()).isEqualTo(original.updatedAt().plusSeconds(1));
                assertThat(current.lines()).hasSize(1);
                assertThat(current.lines().getFirst().id()).isEqualTo(replacementLine);
                assertThat(original.lines()).extracting(ProposalLine::id).doesNotContain(replacementLine);
                assertThat(current.totals().netAmount()).isEqualByComparingTo("60");
                assertThat(current.totals().taxAmount()).isEqualByComparingTo("12.60");
                assertThat(current.totals().grossAmount()).isEqualByComparingTo("72.60");
            } finally { replacementCommitted.countDown(); }
        } finally { dsl.configuration().set(providers); }
    }
    @Test void snapshotsAndPolicyRoundtripWithoutRecalculation() {
        long thirdParty = party(true, true, false, true);
        long id = proposals.create(command(thirdParty));
        Proposal stored = proposals.get(id);
        assertThat(stored.state()).isEqualTo(ProposalLimits.DRAFT);
        assertThat(stored.version()).isEqualTo(ProposalLimits.INITIAL_VERSION);
        assertThat(stored.createdAt()).isEqualTo(stored.updatedAt());
        assertThat(stored.monetaryPolicyId()).isEqualTo(MonetaryPolicy.IDENTIFIER);
        assertThat(stored.lines()).hasSize(2);
        assertThat(stored.lines().getFirst().position()).isEqualTo(1);
        assertThat(stored.lines().getFirst().id()).isPositive().isNotEqualTo(stored.lines().getLast().id());
        assertThat(stored.lines().getFirst().description()).isEqualTo("service");
        assertThat(stored.lines().getFirst().amounts().grossAmount()).isEqualByComparingTo("24.21");
        assertThat(stored.lines().getLast().unitNetPrice()).isEqualByComparingTo("1234567890123.123456");
        assertThat(stored.lines().getLast().vatRate()).isEqualByComparingTo("0.0001");
        // Simulate a historical policy which is no longer the currently selected one.
        String historicPolicy = "EUR-HISTORICAL-FIXTURE-v0";
        dsl.execute("update sales_proposal set monetary_policy_id=? where id=?", historicPolicy, id);
        dsl.execute("update third_party set active=false,customer=false,prospect=false where id=?", thirdParty);
        Proposal reread = proposals.get(id);
        assertThat(reread.monetaryPolicyId()).isEqualTo(historicPolicy);
        assertThat(reread.lines()).isEqualTo(stored.lines());
        assertThat(reread.totals()).isEqualTo(stored.totals());
        assertThat(count("audit_event")).isZero();
    }
    @Test void emptyDraftAndAllThirdPartyFlagCombinations() {
        for (boolean active : List.of(false, true)) for (boolean customer : List.of(false, true))
        for (boolean prospect : List.of(false, true)) for (boolean supplier : List.of(false, true)) {
            long id = party(active, customer, prospect, supplier);
            var command = new CreateProposalCommand(id, MonetaryPolicy.CURRENCY, List.of());
            if (active && (customer || prospect)) {
                Proposal stored = proposals.get(proposals.create(command));
                assertThat(stored.lines()).isEmpty();
                assertThat(stored.totals()).isEqualTo(Amounts.zero());
            } else {
                assertThatThrownBy(() -> proposals.create(command)).isInstanceOf(InvalidSalesThirdPartyException.class);
            }
            var flags = dsl.fetchOne("select active,customer,prospect,supplier from third_party where id=?", id);
            assertThat(flags.get("active", Boolean.class)).isEqualTo(active);
            assertThat(flags.get("customer", Boolean.class)).isEqualTo(customer);
            assertThat(flags.get("prospect", Boolean.class)).isEqualTo(prospect);
            assertThat(flags.get("supplier", Boolean.class)).isEqualTo(supplier);
        }
        assertThatThrownBy(() -> proposals.create(command(Long.MAX_VALUE))).isInstanceOf(InvalidSalesThirdPartyException.class);
    }
    @Test void databaseConstraintsAndDeleteConflictMapping() {
        long thirdParty = party(true, false, true, false);
        long id = proposals.create(command(thirdParty));
        long lineId = proposals.get(id).lines().getFirst().id();
        for (String set : List.of("quantity=0", "unit_net_price=-1", "vat_rate=101", "description=''",
            "description=' outside '", "position=0", "position=1001", "gross_amount=-1", "net_amount=null",
            "proposal_id=" + Long.MAX_VALUE, "description=repeat('x',2001)", "unit_net_price=10000000000000")) {
            assertThatThrownBy(() -> dsl.execute("update sales_proposal_line set " + set + " where id=?", lineId))
                .isInstanceOf(DataIntegrityViolationException.class);
        }
        for (String set : List.of("state='VALIDATED'", "currency='USD'", "version=0", "monetary_policy_id=''", "third_party_id=" + Long.MAX_VALUE)) {
            assertThatThrownBy(() -> dsl.execute("update sales_proposal set " + set + " where id=?", id))
                .isInstanceOf(DataIntegrityViolationException.class);
        }
        assertThatThrownBy(() -> dsl.execute("update sales_proposal_line set position=1 where proposal_id=? and id<>?", id, lineId))
            .isInstanceOf(DataIntegrityViolationException.class);
        assertThatThrownBy(() -> dsl.execute("delete from sales_proposal where id=?", id)).isInstanceOf(DataIntegrityViolationException.class);
        assertThatThrownBy(() -> thirdParties.delete(thirdParty)).isInstanceOf(ThirdPartyDeleteConflictException.class);
        assertThat(proposals.get(id).lines()).hasSize(2);
    }
    @Test void grantsAreInitiallyOnlyForSystemAdmin() {
        var grants = dsl.fetch("select r.code,p.permission_code from authentication_role_permission p join authentication_role r on r.id=p.role_id where p.permission_code in ('proposals.manage','proposals.read')");
        assertThat(grants).hasSize(2);
        assertThat(grants.getValues("code", String.class)).containsOnly("system-admin");
        assertThat(grants.getValues("permission_code", String.class)).containsExactlyInAnyOrder("proposals.manage", "proposals.read");
    }
    @Test void requiredAuditCommitsAtomicallyAndOffStaysOff() {
        long thirdParty = party(true, true, false, false);
        for (AuditMode mode : AuditMode.values()) {
            mode(mode);
            int before = count("audit_event");
            long id = proposals.create(command(thirdParty));
            assertThat(count("audit_event")).isEqualTo(before + (mode == AuditMode.OFF ? 0 : 1));
            if (mode != AuditMode.OFF) {
                var event = dsl.fetchOne("select action,resource_type,resource_id,result,actor_user_id from audit_event where resource_id=? and action='PROPOSAL_CREATED'", Long.toString(id));
                assertThat(event.get("resource_type", String.class)).isEqualTo(AuditResourceType.PROPOSAL.name());
                assertThat(event.get("result", String.class)).isEqualTo("SUCCESS");
                assertThat(event.get("actor_user_id", UUID.class)).isNotNull();
            }
            proposals.get(id);
            assertThat(count("audit_event")).isEqualTo(before + (mode == AuditMode.OFF ? 0 : 1));
        }
    }
    @Test void auditFailureRollsBackHeaderLinesAndSuccessEvent() {
        long thirdParty = party(true, true, false, false);
        for (AuditMode mode : List.of(AuditMode.BASIC, AuditMode.SELECTIVE)) {
            resetAudit();
            mode(mode);
            int headers = count(PROPOSAL), lines = count(LINE);
            dsl.execute("delete from audit_chain_head where chain_id=?", AuditChain.DEFAULT_CHAIN_ID);
            assertThatThrownBy(() -> proposals.create(command(thirdParty))).isInstanceOf(AuditUnavailableException.class);
            assertThat(count(PROPOSAL)).isEqualTo(headers);
            assertThat(count(LINE)).isEqualTo(lines);
            assertThat(count("audit_event")).isZero();
        }
    }
    @Test void successfulAuditCannotSurviveItsBusinessTransactionRollback() {
        long thirdParty = party(true, true, false, false);
        mode(AuditMode.BASIC);
        int headers = count(PROPOSAL), lines = count(LINE);
        assertThatThrownBy(() -> new TransactionTemplate(transactions).execute(status -> {
            proposals.create(command(thirdParty));
            assertThat(count("audit_event")).isEqualTo(1);
            throw new IllegalStateException("Controlled failure after successful append");
        })).isInstanceOf(IllegalStateException.class);
        assertThat(count(PROPOSAL)).isEqualTo(headers);
        assertThat(count(LINE)).isEqualTo(lines);
        assertThat(count("audit_event")).isZero();
    }
    @Test void lineInsertFailureRollsBackHeaderAndAudit() {
        long thirdParty = party(true, true, false, false);
        mode(AuditMode.BASIC);
        int headers = count(PROPOSAL), lines = count(LINE);
        var brokenRepository = new es.alxarafe.alixar.sales.infrastructure.persistence.JooqProposalRepository(dsl);
        var invalid = new Proposal(0, thirdParty, MonetaryPolicy.CURRENCY, ProposalLimits.DRAFT, ProposalLimits.INITIAL_VERSION,
            MonetaryPolicy.IDENTIFIER, List.of(new ProposalLine(0, 1, "valid first line", BigDecimal.ONE, BigDecimal.ONE,
                BigDecimal.ZERO, new Amounts(BigDecimal.ONE, BigDecimal.ZERO, BigDecimal.ONE)),
                new ProposalLine(0, 0, "bad position", BigDecimal.ONE, BigDecimal.ONE,
                BigDecimal.ZERO, new Amounts(BigDecimal.ONE, BigDecimal.ZERO, BigDecimal.ONE))), Amounts.zero(), java.time.Instant.now(), java.time.Instant.now());
        assertThatThrownBy(() -> new TransactionTemplate(transactions).execute(status -> brokenRepository.create(invalid)))
            .isInstanceOf(DataIntegrityViolationException.class);
        assertThat(count(PROPOSAL)).isEqualTo(headers);
        assertThat(count(LINE)).isEqualTo(lines);
        assertThat(count("audit_event")).isZero();
    }
    @Test void sharedCreationLockBlocksDeactivationAndDeleteUntilCommit() throws Exception {
        for (boolean delete : List.of(false, true)) {
            long thirdParty = party(true, true, false, false);
            try (var executor = Executors.newVirtualThreadPerTaskExecutor()) {
                CountDownLatch created = new CountDownLatch(1), release = new CountDownLatch(1), started = new CountDownLatch(1);
                AtomicInteger pid = new AtomicInteger();
                Future<Long> creation = executor.submit(() -> new TransactionTemplate(transactions).execute(status -> {
                    long id = proposals.create(command(thirdParty));
                    created.countDown();
                    await(release);
                    return id;
                }));
                try {
                    await(created);
                    Future<?> mutation = executor.submit(() -> new TransactionTemplate(transactions).execute(status -> {
                        pid.set(dsl.fetchOne("select pg_backend_pid()").get(0, int.class));
                        started.countDown();
                        if (delete) { thirdParties.delete(thirdParty); }
                        else { dsl.execute("update third_party set active=false where id=?", thirdParty); }
                        return null;
                    }));
                    await(started);
                    awaitBlocked(pid.get());
                    assertThat(mutation.isDone()).isFalse();
                    release.countDown();
                    long proposalId = creation.get(TIMEOUT_SECONDS, TimeUnit.SECONDS);
                    if (delete) {
                        assertThatThrownBy(() -> mutation.get(TIMEOUT_SECONDS, TimeUnit.SECONDS))
                            .isInstanceOf(ExecutionException.class).hasCauseInstanceOf(ThirdPartyDeleteConflictException.class);
                    } else { mutation.get(TIMEOUT_SECONDS, TimeUnit.SECONDS); }
                    assertThat(proposals.get(proposalId).thirdPartyId()).isEqualTo(thirdParty);
                } finally { release.countDown(); }
            }
        }
    }
    @Test void creationWaitsForEarlierReclassificationOrDeleteAndRejects() throws Exception {
        for (boolean delete : List.of(false, true)) {
            long thirdParty = party(true, true, false, false);
            try (var executor = Executors.newVirtualThreadPerTaskExecutor()) {
                CountDownLatch changed = new CountDownLatch(1), release = new CountDownLatch(1), started = new CountDownLatch(1);
                AtomicInteger pid = new AtomicInteger();
                Future<?> mutation = executor.submit(() -> new TransactionTemplate(transactions).execute(status -> {
                    if (delete) { thirdParties.delete(thirdParty); }
                    else { dsl.execute("update third_party set customer=false,prospect=false where id=?", thirdParty); }
                    changed.countDown();
                    await(release);
                    return null;
                }));
                try {
                    await(changed);
                    Future<?> creation = executor.submit(() -> new TransactionTemplate(transactions).execute(status -> {
                        pid.set(dsl.fetchOne("select pg_backend_pid()").get(0, int.class));
                        started.countDown();
                        return proposals.create(command(thirdParty));
                    }));
                    await(started);
                    awaitBlocked(pid.get());
                    release.countDown();
                    mutation.get(TIMEOUT_SECONDS, TimeUnit.SECONDS);
                    assertThatThrownBy(() -> creation.get(TIMEOUT_SECONDS, TimeUnit.SECONDS))
                        .isInstanceOf(ExecutionException.class).hasCauseInstanceOf(InvalidSalesThirdPartyException.class);
                } finally { release.countDown(); }
            }
        }
    }
    private static void await(CountDownLatch latch) {
        try { assertThat(latch.await(TIMEOUT_SECONDS, TimeUnit.SECONDS)).isTrue(); }
        catch (InterruptedException ex) { Thread.currentThread().interrupt(); throw new AssertionError(ex); }
    }
    private void awaitBlocked(int pid) {
        long deadline = System.nanoTime() + Duration.ofSeconds(TIMEOUT_SECONDS).toNanos();
        while (System.nanoTime() < deadline) {
            if (Boolean.TRUE.equals(dsl.fetchOne("select cardinality(pg_blocking_pids(?)) > 0", pid).get(0, Boolean.class))) { return; }
            LockSupport.parkNanos(Duration.ofMillis(10).toNanos());
        }
        fail("Expected PostgreSQL to observe a blocked competing transaction");
    }
}
