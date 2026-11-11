package es.alxarafe.alixar.sales.infrastructure;

import es.alxarafe.alixar.audit.application.*;
import es.alxarafe.alixar.audit.domain.*;
import es.alxarafe.alixar.audit.infrastructure.CachedAuditPolicyProvider;
import es.alxarafe.alixar.audit.infrastructure.TransactionalAuditService;
import es.alxarafe.alixar.authentication.infrastructure.security.ApiTokenAuthenticationFilter;
import es.alxarafe.alixar.authentication.infrastructure.security.AuthenticatedUserPrincipal;
import es.alxarafe.alixar.authentication.infrastructure.security.SecurityContextAuditActorResolver;
import es.alxarafe.alixar.sales.application.*;
import es.alxarafe.alixar.sales.domain.*;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.*;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Supplier;
import org.jooq.*;
import org.jooq.impl.DefaultExecuteListener;
import org.jooq.impl.DefaultExecuteListenerProvider;
import org.junit.jupiter.api.*;
import org.springframework.aop.support.AopUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.transaction.*;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import static es.alxarafe.alixar.sales.application.SalesErrorCode.*;
import static org.assertj.core.api.Assertions.*;
import static org.mockito.Mockito.*;

/** Uses the real facade, authenticated-context resolver, audit trail and PostgreSQL repositories. */
@SpringBootTest(properties = "spring.autoconfigure.exclude=")
class ProposalDraftAuditIT {
    private static final String ROOT_UPDATE_SQL = "update \"sales_proposal\"";
    private static final String EVENT_INSERT_SQL = "insert into \"audit_event\"";
    private static final String CHAIN_LOCK_SQL = "from \"audit_chain_head\"";
    private static final String CHAIN_UPDATE_SQL = "update \"audit_chain_head\"";
    private static final UUID SESSION_USER = UUID.fromString("231d7d2a-0809-44ca-92de-7f43c30b3663");
    private static final UUID PAT_USER = UUID.fromString("3fcc5d97-2be1-46ac-ae30-1717d6bd44af");
    private static final Instant CREATED = Instant.parse("2026-11-11T08:00:00Z");
    @Autowired DSLContext dsl;
    @Autowired ProposalRepository repository;
    @Autowired EligibleThirdParty thirdParty;
    @Autowired TransactionalProposalService proposals;
    @Autowired AuditActorResolver actors;
    @Autowired AuditTrail audit;
    @Autowired CachedAuditPolicyProvider policy;
    @Autowired TransactionalAuditService auditService;
    @Autowired PlatformTransactionManager transactions;
    private final List<Long> parties = new ArrayList<>();
    private ExecuteListenerProvider[] listeners;

    @BeforeEach void before() {
        listeners = dsl.configuration().executeListenerProviders();
        clearAuthentication();
        mode(AuditMode.OFF);
        resetAudit();
    }
    @AfterEach void cleanup() {
        dsl.configuration().set(listeners);
        clearAuthentication();
        mode(AuditMode.OFF);
        for (long id : parties) {
            dsl.execute("delete from sales_proposal_line where proposal_id in (select id from sales_proposal where third_party_id=?)", id);
            dsl.execute("delete from sales_proposal where third_party_id=?", id);
            dsl.execute("delete from third_party where id=?", id);
        }
        resetAudit();
    }
    private void mode(AuditMode mode) {
        dsl.execute("update audit_configuration set mode=?,updated_at=current_timestamp", mode.name());
        policy.reload();
    }
    private void resetAudit() {
        dsl.execute("delete from audit_event");
        dsl.execute("insert into audit_chain_head(chain_id,last_sequence,last_hash) values (?,0,?) on conflict do nothing",
            AuditChain.DEFAULT_CHAIN_ID, AuditChain.GENESIS_HASH);
        dsl.execute("update audit_chain_head set last_sequence=0,last_hash=? where chain_id=?", AuditChain.GENESIS_HASH, AuditChain.DEFAULT_CHAIN_ID);
    }
    private void authenticate(AuditAuthenticationType type) {
        UUID id = type == AuditAuthenticationType.PAT ? PAT_USER : SESSION_USER;
        String username = type == AuditAuthenticationType.PAT ? "proposal-pat-fixture" : "proposal-session-fixture";
        var principal = new AuthenticatedUserPrincipal(id, username, "proposal@example.test", 0);
        var security = SecurityContextHolder.createEmptyContext();
        security.setAuthentication(UsernamePasswordAuthenticationToken.authenticated(principal, null, List.of()));
        SecurityContextHolder.setContext(security);
        var request = new MockHttpServletRequest();
        if (type == AuditAuthenticationType.PAT) { request.setAttribute(ApiTokenAuthenticationFilter.PAT_REQUEST_ATTRIBUTE, true); }
        RequestContextHolder.setRequestAttributes(new ServletRequestAttributes(request));
    }
    private void clearAuthentication() {
        SecurityContextHolder.clearContext();
        RequestContextHolder.resetRequestAttributes();
    }
    private long party() {
        long id = dsl.fetchOne("insert into third_party(name,active,customer,prospect,supplier) values ('COM-02 audit fixture',true,true,false,false) returning id")
            .get(0, Long.class);
        parties.add(id);
        return id;
    }
    private CreateProposalCommand.Line line(String text, String quantity, String price, String vat) {
        return new CreateProposalCommand.Line(text, new BigDecimal(quantity), new BigDecimal(price), new BigDecimal(vat));
    }
    private List<CreateProposalCommand.Line> inputs() { return List.of(line("original", "2", "10.005", "21")); }
    private Proposal draft() {
        long target = party();
        var create = new CreateProposalUseCase(repository, thirdParty, Clock.fixed(CREATED, ZoneOffset.UTC));
        long id = tx(() -> create.execute(new CreateProposalCommand(target, MonetaryPolicy.CURRENCY, inputs())));
        return proposals.get(id);
    }
    private ReplaceProposalDraftCommand command(Proposal p, long target) {
        return new ReplaceProposalDraftCommand(p.version(), target, p.currency(), List.of(
            line("replacement first", "3", "20", "21"), line("replacement second", "1", "0.005", "0")));
    }
    private ReplaceProposalDraftCommand noOp(Proposal p) {
        return new ReplaceProposalDraftCommand(p.version(), p.thirdPartyId(), p.currency(), inputs());
    }
    private <T> T tx(Supplier<T> body) {
        var transaction = new TransactionTemplate(transactions);
        transaction.setIsolationLevel(TransactionDefinition.ISOLATION_READ_COMMITTED);
        return transaction.execute(status -> body.get());
    }
    private int events() { return dsl.fetchOne("select count(*) from audit_event").get(0, int.class); }
    private org.jooq.Record head() {
        return dsl.fetchOne("select last_sequence,last_hash,updated_at from audit_chain_head where chain_id=?", AuditChain.DEFAULT_CHAIN_ID);
    }
    private void listen(ExecuteListener listener) {
        var providers = Arrays.copyOf(listeners, listeners.length + 1);
        providers[listeners.length] = new DefaultExecuteListenerProvider(listener);
        dsl.configuration().set(providers);
    }
    private void reject(Runnable action, SalesErrorCode code) {
        assertThatThrownBy(action::run).isInstanceOfSatisfying(DraftReplacementRejectedException.class,
            ex -> assertThat(ex.code()).isEqualTo(code));
    }

    @Test void offAllowsModificationWithoutActorOrAuditEvent() {
        Proposal p = draft();
        long target = party();
        var head = head();
        var result = proposals.replaceDraft(p.id(), command(p, target));
        assertThat(result).isEqualTo(p.version() + 1);
        assertThat(proposals.get(p.id()).thirdPartyId()).isEqualTo(target);
        assertThat(events()).isZero();
        assertThat(head()).isEqualTo(head);
    }
    @Test void basicAndSelectiveAppendExactlyOneEventWithTheRealSessionOrPatActor() {
        assertThat(actors).isInstanceOf(SecurityContextAuditActorResolver.class);
        assertThat(AopUtils.isAopProxy(proposals)).isTrue();
        for (AuditMode mode : List.of(AuditMode.BASIC, AuditMode.SELECTIVE)) {
            for (AuditAuthenticationType type : List.of(AuditAuthenticationType.SESSION, AuditAuthenticationType.PAT)) {
                Proposal p = draft();
                long target = party();
                resetAudit();
                mode(mode);
                // Current SELECTIVE rules govern reads only; PROPOSAL has no configurable read rule.
                assertThat(policy.currentPolicy().readPolicy().levelFor(AuditResourceType.PROPOSAL)).isEqualTo(AuditReadLevel.NONE);
                authenticate(type);
                var actor = actors.resolveCurrentActor().orElseThrow();
                var result = proposals.replaceDraft(p.id(), command(p, target));
                assertThat(result).isEqualTo(p.version() + 1);
                assertThat(events()).isEqualTo(1);
                var event = dsl.fetchOne("select action,resource_type,resource_id,result,actor_user_id,actor_username,authentication_type from audit_event");
                assertThat(event.get("action", String.class)).isEqualTo(AuditAction.PROPOSAL_UPDATED.name());
                assertThat(event.get("resource_type", String.class)).isEqualTo(AuditResourceType.PROPOSAL.name());
                assertThat(event.get("resource_id", String.class)).isEqualTo(Long.toString(p.id()));
                assertThat(event.get("result", String.class)).isEqualTo(AuditResult.SUCCESS.name());
                assertThat(event.get("actor_user_id", UUID.class)).isEqualTo(actor.userId());
                assertThat(event.get("actor_username", String.class)).isEqualTo(actor.username());
                assertThat(event.get("authentication_type", String.class)).isEqualTo(type.name());
                assertThat(proposals.get(p.id()).thirdPartyId()).isEqualTo(target);
                assertThat(auditService.verify(AuditChain.DEFAULT_CHAIN_ID).valid()).isTrue();
                assertThat(head().get("last_sequence", Long.class)).isEqualTo(1);
            }
        }
    }
    @Test void noOpNeverInvokesRequiredAuditEvenWithUnavailableActorAndChain() {
        Proposal p = draft();
        dsl.execute("update sales_proposal set monetary_policy_id=?,version=? where id=?", "UNAVAILABLE-POLICY-FIXTURE", Long.MAX_VALUE, p.id());
        dsl.execute("update third_party set active=false,customer=false,prospect=false where id=?", p.thirdPartyId());
        Proposal historical = proposals.get(p.id());
        dsl.execute("delete from audit_chain_head where chain_id=?", AuditChain.DEFAULT_CHAIN_ID);
        for (AuditMode mode : List.of(AuditMode.BASIC, AuditMode.SELECTIVE)) {
            mode(mode);
            assertThat(actors.resolveCurrentActor()).isEmpty();
            assertThat(proposals.replaceDraft(p.id(), noOp(historical)))
                .isEqualTo(Long.MAX_VALUE);
            assertThat(proposals.get(p.id())).isEqualTo(historical);
            assertThat(events()).isZero();
        }
    }
    @Test void rejectedInputsAndBusinessFailuresNeverAppendModificationAudit() {
        Proposal p = draft();
        mode(AuditMode.BASIC);
        authenticate(AuditAuthenticationType.SESSION);
        var head = head();
        reject(() -> proposals.replaceDraft(p.id(), new ReplaceProposalDraftCommand(p.version() + 1,
            p.thirdPartyId(), p.currency(), inputs())), SALES_VERSION_CONFLICT);
        assertThatThrownBy(() -> proposals.replaceDraft(0, noOp(p))).isInstanceOf(InvalidProposalException.class);
        assertThatThrownBy(() -> proposals.replaceDraft(p.id(), null)).isInstanceOf(InvalidProposalException.class);
        assertThatThrownBy(() -> proposals.replaceDraft(Long.MAX_VALUE, noOp(p))).isInstanceOf(ProposalNotFoundException.class);
        var overflow = new ReplaceProposalDraftCommand(p.version(), p.thirdPartyId(), p.currency(),
            List.of(line("overflow", "9999999999999", "9999999999999", "0")));
        assertThatThrownBy(() -> proposals.replaceDraft(p.id(), overflow)).isInstanceOf(InvalidProposalException.class);
        dsl.execute("update third_party set active=false where id=?", p.thirdPartyId());
        assertThatThrownBy(() -> proposals.replaceDraft(p.id(), command(p, p.thirdPartyId())))
            .isInstanceOf(InvalidSalesThirdPartyException.class);
        dsl.execute("update third_party set active=true where id=?", p.thirdPartyId());
        dsl.execute("update sales_proposal set monetary_policy_id=? where id=?", "UNAVAILABLE-POLICY-FIXTURE", p.id());
        reject(() -> proposals.replaceDraft(p.id(), command(p, p.thirdPartyId())), SALES_MONETARY_POLICY_UNAVAILABLE);
        dsl.execute("update sales_proposal set version=? where id=?", Long.MAX_VALUE, p.id());
        Proposal max = proposals.get(p.id());
        reject(() -> proposals.replaceDraft(p.id(), command(max, p.thirdPartyId())), SALES_VERSION_EXHAUSTED);
        assertThat(proposals.get(p.id())).isEqualTo(max);
        assertThat(events()).isZero();
        assertThat(head()).isEqualTo(head);
    }
    @Test void actualAuditInsertConstraintFailureRestoresTheEntireProposalAndChain() {
        for (AuditMode mode : List.of(AuditMode.BASIC, AuditMode.SELECTIVE)) {
            Proposal p = draft();
            long target = party();
            mode(mode);
            authenticate(AuditAuthenticationType.PAT);
            var head = head();
            AtomicInteger attempted = new AtomicInteger();
            listen(new DefaultExecuteListener() {
                @Override public void executeStart(ExecuteContext ctx) {
                    if (ctx.sql().startsWith(EVENT_INSERT_SQL)) {
                        attempted.incrementAndGet();
                        int actionIndex = ctx.query().getBindValues().indexOf(AuditAction.PROPOSAL_UPDATED.name());
                        assertThat(actionIndex).isNotNegative();
                        try {
                            // PostgreSQL's existing nonblank-action CHECK rejects the real INSERT.
                            ctx.statement().setString(actionIndex + 1, "");
                        } catch (SQLException ex) { throw new AssertionError(ex); }
                    }
                }
            });
            assertThatThrownBy(() -> proposals.replaceDraft(p.id(), command(p, target))).isInstanceOf(AuditUnavailableException.class);
            dsl.configuration().set(listeners);
            assertThat(attempted.get()).isEqualTo(1);
            assertThat(proposals.get(p.id())).isEqualTo(p);
            assertThat(events()).isZero();
            assertThat(head()).isEqualTo(head);
        }
    }
    @Test void missingRequiredActorRollsBackTheReplacement() {
        Proposal p = draft();
        long target = party();
        mode(AuditMode.BASIC);
        var head = head();
        assertThatThrownBy(() -> proposals.replaceDraft(p.id(), command(p, target))).isInstanceOf(AuditUnavailableException.class);
        assertThat(proposals.get(p.id())).isEqualTo(p);
        assertThat(events()).isZero();
        assertThat(head()).isEqualTo(head);
    }
    @Test void constructedNonDraftSnapshotRejectsBeforeAuditWithoutRelaxingV14() {
        Proposal p = draft();
        mode(AuditMode.BASIC);
        var snapshot = new Proposal(p.id(), p.thirdPartyId(), p.currency(), "NON_DRAFT_FIXTURE", p.version(),
            p.monetaryPolicyId(), p.lines(), p.totals(), p.createdAt(), p.updatedAt());
        // V14 cannot persist this state: use a constructed snapshot for this guard only.
        ProposalRepository fixture = mock(ProposalRepository.class);
        when(fixture.lockAndFindById(p.id(), p.version())).thenReturn(snapshot);
        var guarded = new TransactionalProposalService(null, null, audit,
            () -> new InternalProposalDraftReplacement(fixture, thirdParty, Clock.systemUTC(), transactions));
        reject(() -> tx(() -> guarded.replaceDraft(p.id(), noOp(p))), PROPOSAL_INVALID_STATE);
        assertThat(actors.resolveCurrentActor()).isEmpty();
        assertThat(events()).isZero();
        assertThat(proposals.get(p.id())).isEqualTo(p);
    }
    @Test void exceptionAfterSuccessfulAppendRollsBackModificationEventAndChain() {
        Proposal p = draft();
        long target = party();
        mode(AuditMode.BASIC);
        authenticate(AuditAuthenticationType.SESSION);
        var head = head();
        assertThatThrownBy(() -> tx(() -> {
            proposals.replaceDraft(p.id(), command(p, target));
            assertThat(events()).isEqualTo(1);
            assertThat(repository.findById(p.id()).version()).isEqualTo(p.version() + 1);
            throw new InjectedFailure();
        })).isInstanceOf(InjectedFailure.class);
        assertThat(proposals.get(p.id())).isEqualTo(p);
        assertThat(events()).isZero();
        assertThat(head()).isEqualTo(head);
    }
    @Test void failureInsideAuditAfterEventInsertionRollsEverythingBack() {
        Proposal p = draft();
        long target = party();
        mode(AuditMode.SELECTIVE);
        authenticate(AuditAuthenticationType.PAT);
        var head = head();
        AtomicInteger inserted = new AtomicInteger();
        listen(new DefaultExecuteListener() {
            @Override public void executeEnd(ExecuteContext ctx) {
                if (ctx.sql().startsWith(EVENT_INSERT_SQL)) { inserted.incrementAndGet(); }
                if (ctx.sql().startsWith(CHAIN_UPDATE_SQL)) { throw new InjectedFailure(); }
            }
        });
        assertThatThrownBy(() -> proposals.replaceDraft(p.id(), command(p, target))).isInstanceOf(AuditUnavailableException.class);
        dsl.configuration().set(listeners);
        assertThat(inserted.get()).isEqualTo(1);
        assertThat(proposals.get(p.id())).isEqualTo(p);
        assertThat(events()).isZero();
        assertThat(head()).isEqualTo(head);
    }
    @Test void nonAuditPersistenceFailureIsNeverRelabeledAsAuditUnavailable() {
        Proposal p = draft();
        mode(AuditMode.BASIC);
        authenticate(AuditAuthenticationType.SESSION);
        listen(new DefaultExecuteListener() {
            @Override public void executeEnd(ExecuteContext ctx) {
                if (ctx.sql().startsWith(ROOT_UPDATE_SQL)) { throw new InjectedFailure(); }
            }
        });
        assertThatThrownBy(() -> proposals.replaceDraft(p.id(), command(p, p.thirdPartyId()))).isInstanceOf(InjectedFailure.class);
        dsl.configuration().set(listeners);
        assertThat(proposals.get(p.id())).isEqualTo(p);
        assertThat(events()).isZero();
    }
    @Test void mutationAndAuditUseTheSamePostgresTransactionAndAuditLocksComeLast() {
        Proposal p = draft();
        long target = party();
        mode(AuditMode.BASIC);
        authenticate(AuditAuthenticationType.SESSION);
        List<Step> steps = new ArrayList<>();
        listen(new DefaultExecuteListener() {
            @Override public void executeStart(ExecuteContext ctx) {
                try (var statement = ctx.connection().createStatement();
                     var result = statement.executeQuery("select pg_backend_pid(),pg_current_xact_id()::text,current_setting('transaction_isolation')")) {
                    assertThat(result.next()).isTrue();
                    steps.add(new Step(ctx.sql(), result.getInt(1), result.getString(2), result.getString(3)));
                } catch (SQLException ex) { throw new AssertionError(ex); }
            }
        });
        proposals.replaceDraft(p.id(), command(p, target));
        dsl.configuration().set(listeners);
        assertThat(steps).extracting(Step::pid).containsOnly(steps.getFirst().pid());
        assertThat(steps).extracting(Step::transaction).containsOnly(steps.getFirst().transaction());
        assertThat(steps).extracting(Step::isolation).containsOnly("read committed");
        assertThat(steps.getFirst().sql()).startsWith("select \"id\" from \"third_party\"").endsWith("for share");
        assertThat(steps.get(1).sql()).contains("from \"sales_proposal\"").endsWith("for update");
        int rootUpdate = index(steps, ROOT_UPDATE_SQL), chainLock = -1;
        for (int i = 0; i < steps.size(); i++) {
            if (steps.get(i).sql().contains(CHAIN_LOCK_SQL) && steps.get(i).sql().endsWith("for update")) { chainLock = i; }
        }
        assertThat(chainLock).isGreaterThan(rootUpdate);
        assertThat(index(steps, EVENT_INSERT_SQL)).isGreaterThan(chainLock);
        assertThat(index(steps, CHAIN_UPDATE_SQL)).isGreaterThan(index(steps, EVENT_INSERT_SQL));
        assertThat(events()).isEqualTo(1);
    }
    private int index(List<Step> steps, String prefix) {
        for (int i = 0; i < steps.size(); i++) { if (steps.get(i).sql().startsWith(prefix)) { return i; } }
        throw new AssertionError("Expected SQL step was not observed");
    }
    private record Step(String sql, int pid, String transaction, String isolation) { }
    private static final class InjectedFailure extends RuntimeException { }
}
