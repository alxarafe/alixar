package es.alxarafe.alixar.sales.infrastructure;

import es.alxarafe.alixar.audit.application.*;
import es.alxarafe.alixar.audit.domain.*;
import es.alxarafe.alixar.audit.infrastructure.CachedAuditPolicyProvider;
import es.alxarafe.alixar.authentication.api.AuthenticationEndpoints;
import es.alxarafe.alixar.authentication.application.*;
import es.alxarafe.alixar.authentication.domain.ApiToken;
import es.alxarafe.alixar.authentication.domain.User;
import es.alxarafe.alixar.sales.api.ProposalEndpoints;
import es.alxarafe.alixar.sales.domain.*;
import jakarta.servlet.http.Cookie;
import java.sql.SQLException;
import java.time.Instant;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import org.jooq.*;
import org.jooq.impl.DefaultExecuteListener;
import org.jooq.impl.DefaultExecuteListenerProvider;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.*;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import tools.jackson.databind.json.JsonMapper;
import static org.assertj.core.api.Assertions.*;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/** MockMvc exercises real security, controller, audited facade and PostgreSQL; no deployed HTTP server. */
@SpringBootTest(properties = "spring.autoconfigure.exclude=")
class ProposalDraftHttpIT {
    private static final String CSRF_COOKIE = "XSRF-TOKEN", CSRF_HEADER = "X-XSRF-TOKEN";
    private static final String PASSWORD = "proposal-http-fixture-password";
    private static final String ORIGINAL_LINE = "{\"description\":\"original\",\"quantity\":2,\"unitNetPrice\":10.005,\"vatRate\":21}";
    private static final String NEW_LINE = "{\"description\":\"replacement\",\"quantity\":3,\"unitNetPrice\":20,\"vatRate\":21}";
    private static final String EVENT_INSERT_SQL = "insert into \"audit_event\"";
    @Autowired WebApplicationContext context;
    @Autowired DSLContext dsl;
    @Autowired JsonMapper mapper;
    @Autowired TransactionalProposalService proposals;
    @Autowired UserRepository users;
    @Autowired AuthorizationRepository authorization;
    @Autowired PasswordHasher passwords;
    @Autowired ApiTokenRepository tokens;
    @Autowired TokenHasher tokenHasher;
    @Autowired CachedAuditPolicyProvider policy;
    private final List<Long> parties = new ArrayList<>();
    private UUID userId;
    private String username, role;
    private MockMvc mvc;
    private MockHttpSession session;
    private Cookie csrf;
    private ExecuteListenerProvider[] listeners;

    @BeforeEach void setup() throws Exception {
        listeners = dsl.configuration().executeListenerProviders();
        mode(AuditMode.OFF);
        resetAudit();
        mvc = MockMvcBuilders.webAppContextSetup(context).apply(springSecurity()).build();
        userId = UUID.randomUUID();
        username = "proposal-http-" + userId;
        role = "proposal-http-" + UUID.randomUUID();
        Instant now = Instant.now();
        users.create(new User(userId, username, userId + "@example.test", passwords.hash(PASSWORD), true, 0, now, now));
        authorization.createRole(new RoleDefinition(UUID.randomUUID(), role, "COM-02 HTTP fixture", false, List.of(PermissionCodes.PROPOSALS_MANAGE)));
        authorization.assignRoleToUser(userId, role);
        Cookie loginCsrf = mvc.perform(get("/health")).andReturn().getResponse().getCookie(CSRF_COOKIE);
        session = (MockHttpSession) mvc.perform(post(AuthenticationEndpoints.LOGIN_PATH).cookie(loginCsrf)
            .header(CSRF_HEADER, loginCsrf.getValue()).contentType(MediaType.APPLICATION_JSON)
            .content("{\"identifier\":\"" + username + "\",\"password\":\"" + PASSWORD + "\"}"))
            .andExpect(status().isOk()).andReturn().getRequest().getSession(false);
        csrf = mvc.perform(get("/health").session(session)).andReturn().getResponse().getCookie(CSRF_COOKIE);
    }
    @AfterEach void cleanup() {
        dsl.configuration().set(listeners);
        mode(AuditMode.OFF);
        for (long target : parties) {
            dsl.execute("delete from sales_proposal_line where proposal_id in (select id from sales_proposal where third_party_id=?)", target);
            dsl.execute("delete from sales_proposal where third_party_id=?", target);
            dsl.execute("delete from third_party where id=?", target);
        }
        if (userId != null) { dsl.execute("delete from authentication_user where id=?", userId); }
        if (role != null) { authorization.deleteRole(role); }
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
    private long party() {
        long id = dsl.fetchOne("insert into third_party(name,active,customer,prospect,supplier) values ('COM-02 HTTP fixture',true,true,false,false) returning id")
            .get(0, Long.class);
        parties.add(id);
        return id;
    }
    private Proposal draft() throws Exception {
        long target = party();
        var response = mvc.perform(post(ProposalEndpoints.BASE_PATH).session(session).cookie(csrf).header(CSRF_HEADER, csrf.getValue())
            .contentType(MediaType.APPLICATION_JSON).content("{\"thirdPartyId\":" + target + ",\"currency\":\"EUR\",\"lines\":[" + ORIGINAL_LINE + "]}"))
            .andExpect(status().isCreated()).andExpect(jsonPath("$.length()").value(1)).andReturn().getResponse();
        return proposals.get(mapper.readTree(response.getContentAsString()).get("id").longValue());
    }
    private String path(long id) { return ProposalEndpoints.BASE_PATH + "/" + id + ProposalEndpoints.DRAFT_SUFFIX; }
    private String body(long version, long target, String lines) {
        return "{\"expectedVersion\":" + version + ",\"thirdPartyId\":" + target + ",\"currency\":\"EUR\",\"lines\":[" + lines + "]}";
    }
    private MockHttpServletRequestBuilder write(long id, String body) {
        return put(path(id)).session(session).cookie(csrf).header(CSRF_HEADER, csrf.getValue())
            .contentType(MediaType.APPLICATION_JSON).content(body);
    }
    private ResultActions success(long id, long version, String body) throws Exception {
        return mvc.perform(write(id, body)).andExpect(status().isOk()).andExpect(jsonPath("$.length()").value(2))
            .andExpect(jsonPath("$.id").value(id)).andExpect(jsonPath("$.version").value(version))
            .andExpect(header().doesNotExist(HttpHeaders.LOCATION)).andExpect(header().doesNotExist(HttpHeaders.ETAG));
    }
    private ResultActions failure(long id, String body, int status, String code) throws Exception {
        return mvc.perform(write(id, body)).andExpect(status().is(status))
            .andExpect(content().contentTypeCompatibleWith(MediaType.APPLICATION_PROBLEM_JSON)).andExpect(jsonPath("$.code").value(code))
            .andExpect(jsonPath("$.currentVersion").doesNotExist()).andExpect(jsonPath("$.lines").doesNotExist())
            .andExpect(jsonPath("$.id").doesNotExist());
    }
    private int updateEvents() {
        return dsl.fetchOne("select count(*) from audit_event where action=?", AuditAction.PROPOSAL_UPDATED.name()).get(0, int.class);
    }
    private void eventActor(long id, AuditAuthenticationType type) {
        var event = dsl.fetchOne("select actor_user_id,actor_username,authentication_type,resource_type,result from audit_event where action=? and resource_id=?",
            AuditAction.PROPOSAL_UPDATED.name(), Long.toString(id));
        assertThat(event.get("actor_user_id", UUID.class)).isEqualTo(userId);
        assertThat(event.get("actor_username", String.class)).isEqualTo(username);
        assertThat(event.get("authentication_type", String.class)).isEqualTo(type.name());
        assertThat(event.get("resource_type", String.class)).isEqualTo(AuditResourceType.PROPOSAL.name());
        assertThat(event.get("result", String.class)).isEqualTo(AuditResult.SUCCESS.name());
    }
    @Test void sessionPutReplacesChangesThirdPartyNoOpsConflictsClearsAndRefillsAtomically() throws Exception {
        Proposal original = draft();
        long target = party();
        mode(AuditMode.BASIC);
        success(original.id(), 2, body(1, target, NEW_LINE));
        Proposal current = proposals.get(original.id());
        assertThat(current.thirdPartyId()).isEqualTo(target);
        assertThat(current.createdAt()).isEqualTo(original.createdAt());
        assertThat(current.monetaryPolicyId()).isEqualTo(original.monetaryPolicyId());
        assertThat(current.updatedAt()).isAfterOrEqualTo(original.updatedAt());
        assertThat(current.lines()).extracting(ProposalLine::id)
            .doesNotContainAnyElementsOf(original.lines().stream().map(ProposalLine::id).toList());
        assertThat(current.lines().getFirst().position()).isEqualTo(1);
        assertThat(current.totals().grossAmount()).isEqualByComparingTo("72.60");
        assertThat(updateEvents()).isEqualTo(1);
        eventActor(original.id(), AuditAuthenticationType.SESSION);
        String equivalent = NEW_LINE.replace("replacement", " replacement ").replace("\"quantity\":3", "\"quantity\":3.000000")
            .replace("\"unitNetPrice\":20", "\"unitNetPrice\":20.000000").replace("\"vatRate\":21", "\"vatRate\":21.0000");
        success(original.id(), 2, body(2, target, equivalent));
        assertThat(proposals.get(original.id())).isEqualTo(current);
        failure(original.id(), body(1, target, equivalent), 409, "SALES_VERSION_CONFLICT");
        assertThat(updateEvents()).isEqualTo(1);
        mvc.perform(get(ProposalEndpoints.BASE_PATH + "/" + original.id()).session(session)).andExpect(status().isForbidden());
        success(original.id(), 3, body(2, target, ""));
        Proposal empty = proposals.get(original.id());
        assertThat(empty.lines()).isEmpty();
        assertThat(empty.totals()).isEqualTo(Amounts.zero());
        success(original.id(), 4, body(3, target, ORIGINAL_LINE));
        assertThat(updateEvents()).isEqualTo(3);
    }
    @Test void realPatUsesTheSameManagePermissionAndSelectiveAuditWithoutCsrf() throws Exception {
        Proposal p = draft();
        Instant now = Instant.now();
        String raw = "alx_pat_test-" + UUID.randomUUID();
        tokens.create(new ApiToken(UUID.randomUUID(), userId, "COM-02 HTTP PAT", 0, now, now.plusSeconds(3600), null, null), tokenHasher.hash(raw));
        mode(AuditMode.SELECTIVE);
        mvc.perform(put(path(p.id())).header(HttpHeaders.AUTHORIZATION, "Bearer " + raw).contentType(MediaType.APPLICATION_JSON)
            .content(body(1, p.thirdPartyId(), NEW_LINE))).andExpect(status().isOk()).andExpect(jsonPath("$.length()").value(2))
            .andExpect(jsonPath("$.id").value(p.id())).andExpect(jsonPath("$.version").value(2));
        assertThat(updateEvents()).isEqualTo(1);
        eventActor(p.id(), AuditAuthenticationType.PAT);
        mvc.perform(get(ProposalEndpoints.BASE_PATH + "/" + p.id()).header(HttpHeaders.AUTHORIZATION, "Bearer " + raw))
            .andExpect(status().isForbidden());
        authorization.replaceRolePermissions(role, List.of(PermissionCodes.PROPOSALS_READ));
        mvc.perform(put(path(p.id())).header(HttpHeaders.AUTHORIZATION, "Bearer " + raw).contentType(MediaType.APPLICATION_JSON).content("["))
            .andExpect(status().isForbidden());
        mvc.perform(get(ProposalEndpoints.BASE_PATH + "/" + p.id()).header(HttpHeaders.AUTHORIZATION, "Bearer " + raw))
            .andExpect(status().isOk()).andExpect(jsonPath("$.version").value(2)).andExpect(jsonPath("$.lines[0].description").value("replacement"))
            .andExpect(jsonPath("$.orderIds").isEmpty()).andExpect(jsonPath("$.monetaryPolicyId").doesNotExist());
        assertThat(updateEvents()).isEqualTo(1);
    }
    @Test void noOpPreservesHistoricalAmountsAndPolicyWithInactivePartyAndMaximumVersion() throws Exception {
        Proposal p = draft();
        dsl.execute("update third_party set active=false,customer=false,prospect=false where id=?", p.thirdPartyId());
        dsl.execute("update sales_proposal set version=?,monetary_policy_id=? where id=?", Long.MAX_VALUE, "UNAVAILABLE-POLICY-FIXTURE", p.id());
        dsl.execute("update sales_proposal_line set net_amount=1,tax_amount=2,gross_amount=3 where proposal_id=?", p.id());
        Proposal historical = proposals.get(p.id());
        mode(AuditMode.BASIC);
        success(p.id(), Long.MAX_VALUE, body(Long.MAX_VALUE, p.thirdPartyId(), ORIGINAL_LINE));
        assertThat(proposals.get(p.id())).isEqualTo(historical);
        failure(p.id(), body(Long.MAX_VALUE - 1, p.thirdPartyId(), ORIGINAL_LINE), 409, "SALES_VERSION_CONFLICT");
        failure(p.id(), body(Long.MAX_VALUE, p.thirdPartyId(), NEW_LINE), 409, "SALES_VERSION_EXHAUSTED");
        assertThat(proposals.get(p.id())).isEqualTo(historical);
        assertThat(updateEvents()).isZero();
    }
    @Test void structuralThenVersionThenCapacityEligibilityPolicyAndCalculatedErrorsKeepApprovedPrecedence() throws Exception {
        Proposal p = draft();
        mode(AuditMode.BASIC);
        String overflow = NEW_LINE.replace("\"quantity\":3", "\"quantity\":9999999999999").replace("\"unitNetPrice\":20", "\"unitNetPrice\":9999999999999");
        failure(p.id(), body(2, p.thirdPartyId(), NEW_LINE).replace("\"EUR\"", "\"USD\""), 400, "VALIDATION_INVALID");
        failure(p.id(), body(1, p.thirdPartyId(), overflow), 400, "VALIDATION_INVALID");
        assertThat(proposals.get(p.id())).isEqualTo(p);
        dsl.execute("update sales_proposal set monetary_policy_id=? where id=?", "UNAVAILABLE-POLICY-FIXTURE", p.id());
        failure(p.id(), body(1, p.thirdPartyId(), overflow), 409, "SALES_MONETARY_POLICY_UNAVAILABLE");
        dsl.execute("update third_party set active=false where id=?", p.thirdPartyId());
        failure(p.id(), body(2, p.thirdPartyId(), overflow), 409, "SALES_VERSION_CONFLICT");
        failure(p.id(), body(1, p.thirdPartyId(), overflow), 422, "SALES_INVALID_THIRD_PARTY");
        dsl.execute("update sales_proposal set version=? where id=?", Long.MAX_VALUE, p.id());
        failure(p.id(), body(Long.MAX_VALUE, p.thirdPartyId(), overflow), 409, "SALES_VERSION_EXHAUSTED");
        failure(Long.MAX_VALUE, body(1, p.thirdPartyId(), NEW_LINE), 404, "PROPOSAL_NOT_FOUND");
        assertThat(updateEvents()).isZero();
    }
    @Test void failedRequiredAuditReturns503AndRestoresTheEntireAggregateAndChain() throws Exception {
        Proposal p = draft();
        long target = party();
        for (AuditMode mode : List.of(AuditMode.BASIC, AuditMode.SELECTIVE)) {
            mode(mode);
            var head = dsl.fetchOne("select last_sequence,last_hash,updated_at from audit_chain_head where chain_id=?", AuditChain.DEFAULT_CHAIN_ID);
            AtomicInteger attempted = new AtomicInteger();
            var instrumented = Arrays.copyOf(listeners, listeners.length + 1);
            instrumented[listeners.length] = new DefaultExecuteListenerProvider(new DefaultExecuteListener() {
                @Override public void executeStart(ExecuteContext ctx) {
                    if (ctx.sql().startsWith(EVENT_INSERT_SQL)) {
                        attempted.incrementAndGet();
                        int index = ctx.query().getBindValues().indexOf(AuditAction.PROPOSAL_UPDATED.name());
                        assertThat(index).isNotNegative();
                        try { ctx.statement().setString(index + 1, ""); }
                        catch (SQLException ex) { throw new AssertionError(ex); }
                    }
                }
            });
            dsl.configuration().set(instrumented);
            failure(p.id(), body(1, target, NEW_LINE), 503, "AUDIT_UNAVAILABLE");
            dsl.configuration().set(listeners);
            assertThat(attempted.get()).isEqualTo(1);
            assertThat(proposals.get(p.id())).isEqualTo(p);
            assertThat(updateEvents()).isZero();
            assertThat(dsl.fetchOne("select last_sequence,last_hash,updated_at from audit_chain_head where chain_id=?", AuditChain.DEFAULT_CHAIN_ID))
                .isEqualTo(head);
        }
    }
    @Test void exactDecimalInputAndOffModeReachRealPersistenceWithoutAnyUpdateEvent() throws Exception {
        Proposal p = draft();
        String precise = NEW_LINE.replace("\"quantity\":3", "\"quantity\":0.000001")
            .replace("\"unitNetPrice\":20", "\"unitNetPrice\":1234567890123.123456");
        success(p.id(), 2, body(1, p.thirdPartyId(), precise));
        Proposal current = proposals.get(p.id());
        assertThat(current.lines().getFirst().unitNetPrice()).isEqualByComparingTo("1234567890123.123456");
        assertThat(current.lines().getFirst().quantity()).isEqualByComparingTo("0.000001");
        assertThat(updateEvents()).isZero();
    }
}
