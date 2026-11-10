package es.alxarafe.alixar.sales;

import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig.*;
import es.alxarafe.alixar.authentication.api.AuthenticationEndpoints;
import es.alxarafe.alixar.authentication.application.*;
import es.alxarafe.alixar.authentication.domain.*;
import es.alxarafe.alixar.audit.AuditModeTestSupport;
import es.alxarafe.alixar.audit.InMemoryAuditEventRepository;
import es.alxarafe.alixar.audit.application.*;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.sales.application.*;
import es.alxarafe.alixar.sales.domain.*;
import es.alxarafe.alixar.sales.api.ProposalEndpoints;
import java.time.Instant;
import java.util.List;
import java.util.UUID;
import java.util.Collections;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.*;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import jakarta.servlet.http.Cookie;
import static org.mockito.Mockito.*;
import static org.mockito.ArgumentMatchers.any;
import static org.assertj.core.api.Assertions.*;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@Import(AuthenticationTestConfig.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class ProposalControllerTest {
    private static final UUID USER = UUID.fromString("4e044d53-944c-46bf-ab66-cd3a56e23190");
    private static final String USERNAME = "proposal-test";
    private static final String PASSWORD = "proposal-test-password";
    private static final String CSRF_COOKIE = "XSRF-TOKEN";
    private static final String CSRF_HEADER = "X-XSRF-TOKEN";
    private static final String EMPTY = "{\"thirdPartyId\":1,\"currency\":\"EUR\",\"lines\":[]}";
    private static final String LINE = "{\"description\":\" service \",\"quantity\":2,\"unitNetPrice\":10.005,\"vatRate\":21}";
    @Autowired WebApplicationContext context;
    @Autowired ProposalRepository repository;
    @Autowired EligibleThirdParty eligible;
    @Autowired UserRepository users;
    @Autowired AuthorizationRepository authorization;
    @Autowired PasswordHasher passwords;
    @Autowired ApiTokenRepository tokens;
    @Autowired TokenHasher tokenHasher;
    @Autowired AuditModeTestSupport auditMode;
    @Autowired InMemoryAuditEventRepository events;
    private MockMvc mvc;
    @BeforeEach void setup() {
        reset(repository, eligible);
        auditMode.reset();
        events.seedChain(AuditChain.DEFAULT_CHAIN_ID);
        mvc = MockMvcBuilders.webAppContextSetup(context).apply(springSecurity()).build();
        Instant now = Instant.now();
        ((TestUserRepository) users).replaceWith(new User(USER, USERNAME, "proposal@example.test",
            passwords.hash(PASSWORD), true, 0, now, now));
        ((TestAuthorizationRepository) authorization).reset();
        authorization.assignRoleToUser(USER, RoleCodes.SYSTEM_ADMIN);
        grant(PermissionCodes.PROPOSALS_MANAGE, PermissionCodes.PROPOSALS_READ);
        ((TestApiTokenRepository) tokens).replaceWith();
        when(eligible.lockAndCheck(1L)).thenReturn(true);
        when(repository.create(any())).thenReturn(42L);
    }
    @AfterEach void cleanup() { auditMode.reset(); }
    private void grant(String... permissions) { authorization.replaceRolePermissions(RoleCodes.SYSTEM_ADMIN, List.of(permissions)); }
    private Cookie csrf() throws Exception { return mvc.perform(get("/health")).andReturn().getResponse().getCookie(CSRF_COOKIE); }
    private MockHttpSession session() throws Exception {
        Cookie csrf = csrf();
        return (MockHttpSession) mvc.perform(post(AuthenticationEndpoints.LOGIN_PATH).cookie(csrf)
            .header(CSRF_HEADER, csrf.getValue()).contentType(MediaType.APPLICATION_JSON)
            .content("{\"identifier\":\"" + USERNAME + "\",\"password\":\"" + PASSWORD + "\"}"))
            .andExpect(status().isOk()).andReturn().getRequest().getSession(false);
    }
    private MockHttpServletRequestBuilder write(String body) throws Exception {
        Cookie csrf = csrf();
        return post(ProposalEndpoints.BASE_PATH).session(session()).cookie(csrf).header(CSRF_HEADER, csrf.getValue())
            .contentType(MediaType.APPLICATION_JSON).content(body);
    }
    private String body(String line) { return EMPTY.replace("[]", "[" + line + "]"); }
    @Test void createsWithoutThirdPartyReadOrProposalRead() throws Exception {
        grant(PermissionCodes.PROPOSALS_MANAGE);
        mvc.perform(write(EMPTY)).andExpect(status().isCreated()).andExpect(header().string("Location", "/api/proposals/42"))
            .andExpect(content().json("{\"id\":42}"));
        verify(eligible).lockAndCheck(1L);
        mvc.perform(get("/api/proposals/42").session(session())).andExpect(status().isForbidden());
        verify(repository, never()).findById(anyLong());
    }
    @Test void exactJsonDecimalAndReadContract() throws Exception {
        var captured = org.mockito.ArgumentCaptor.forClass(Proposal.class);
        mvc.perform(write(body(LINE.replace("10.005", "1234567890123.123456"))))
            .andExpect(status().isCreated());
        verify(repository).create(captured.capture());
        Proposal draft = captured.getValue();
        assertThat(draft.lines().getFirst().unitNetPrice()).isEqualByComparingTo("1234567890123.123456");
        when(repository.findById(42L)).thenReturn(new Proposal(42, draft.thirdPartyId(), draft.currency(), draft.state(),
            draft.version(), draft.monetaryPolicyId(), draft.lines(), draft.totals(), draft.createdAt(), draft.updatedAt()));
        mvc.perform(get("/api/proposals/42").session(session())).andExpect(status().isOk())
            .andExpect(jsonPath("$.state").value(ProposalLimits.DRAFT)).andExpect(jsonPath("$.version").value(1))
            .andExpect(jsonPath("$.lines[0].description").value("service"))
            .andExpect(jsonPath("$.lines[0].convertedOrderId").value(org.hamcrest.Matchers.nullValue()))
            .andExpect(jsonPath("$.orderIds").isEmpty()).andExpect(jsonPath("$.monetaryPolicyId").doesNotExist());
    }
    @Test void authenticationAuthorizationAndCsrfPrecedeLookup() throws Exception {
        mvc.perform(get("/api/proposals/42")).andExpect(status().isUnauthorized());
        mvc.perform(post(ProposalEndpoints.BASE_PATH).session(session()).contentType(MediaType.APPLICATION_JSON).content(EMPTY))
            .andExpect(status().isForbidden());
        grant(PermissionCodes.PROPOSALS_READ);
        mvc.perform(write(EMPTY)).andExpect(status().isForbidden());
        verifyNoInteractions(repository, eligible);
    }
    @Test void bearerUsesSamePermissionsWithoutCsrf() throws Exception {
        String token = "alx_pat_test-" + UUID.randomUUID();
        Instant now = Instant.now();
        tokens.create(new ApiToken(UUID.randomUUID(), USER, "proposal-test", 0, now, now.plusSeconds(3600), null, null), tokenHasher.hash(token));
        grant(PermissionCodes.PROPOSALS_MANAGE);
        mvc.perform(post(ProposalEndpoints.BASE_PATH).header("Authorization", "Bearer " + token)
            .contentType(MediaType.APPLICATION_JSON).content(EMPTY)).andExpect(status().isCreated());
        mvc.perform(get("/api/proposals/42").header("Authorization", "Bearer " + token)).andExpect(status().isForbidden());
        grant(PermissionCodes.PROPOSALS_READ);
        when(repository.findById(42L)).thenThrow(new ProposalNotFoundException());
        mvc.perform(get("/api/proposals/42").header("Authorization", "Bearer " + token)).andExpect(status().isNotFound());
    }
    @Test void requiredUnknownProtectedAndMalformedValues() throws Exception {
        for (String body : List.of("{}", EMPTY.replace("\"lines\":[]", "\"lines\":null"), body(LINE.replace("\"vatRate\":21", "\"vatRate\":null")))) {
            mvc.perform(write(body)).andExpect(status().isBadRequest()).andExpect(jsonPath("$.code").value("VALIDATION_REQUIRED"));
        }
        for (String body : List.of(EMPTY.replace("1,", "9223372036854775808,"), EMPTY.replace("1,", "1.1,"),
            EMPTY.replace("1,", "\"1\","), EMPTY.replace("[]", "{}"), EMPTY.replace("[]", "[null]"),
            EMPTY.replace("{", "{\"state\":\"DRAFT\","), body(LINE.replace("2,", "1.0000000,")),
            body(LINE.replace("10.005", "0.0000001")), body(LINE.replace("21}", "21.00000}")),
            body(LINE.replace("\" service \"", "false")), body(LINE.replace("{", "{\"id\":1,")), "[", "[]", EMPTY + EMPTY)) {
            mvc.perform(write(body)).andExpect(status().isBadRequest()).andExpect(jsonPath("$.code").value("VALIDATION_INVALID"));
        }
        verifyNoInteractions(repository, eligible);
    }
    @Test void limitsAreEnforcedAtHttpBoundary() throws Exception {
        mvc.perform(write(body(LINE.replace(" service ", "x".repeat(ProposalLimits.MAX_DESCRIPTION_CODE_POINTS + 1)))))
            .andExpect(status().isBadRequest());
        mvc.perform(write(EMPTY.replace("[]", "[" + String.join(",", Collections.nCopies(ProposalLimits.MAX_LINES + 1, LINE)) + "]")))
            .andExpect(status().isBadRequest());
        verifyNoInteractions(repository, eligible);
    }
    @Test void errorsAreLocalizedAndPreserveStableCodes() throws Exception {
        mvc.perform(write(EMPTY.replace("\"EUR\"", "\"USD\"")).header("Accept-Language", "es"))
            .andExpect(status().isUnprocessableEntity()).andExpect(jsonPath("$.code").value("SALES_UNSUPPORTED_CURRENCY"))
            .andExpect(jsonPath("$.detail").value("Solo se admite EUR."));
        mvc.perform(write("{}").header("Accept-Language", "es")).andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.detail").value("El campo Tercero es obligatorio."));
        when(eligible.lockAndCheck(1L)).thenReturn(false);
        mvc.perform(write(EMPTY)).andExpect(status().isUnprocessableEntity()).andExpect(jsonPath("$.code").value("SALES_INVALID_THIRD_PARTY"));
        when(repository.findById(42L)).thenThrow(new ProposalNotFoundException());
        mvc.perform(get("/api/proposals/42").session(session())).andExpect(status().isNotFound())
            .andExpect(jsonPath("$.code").value("PROPOSAL_NOT_FOUND"));
        for (String id : List.of("0", "-1", "abc", "9223372036854775808")) {
            mvc.perform(get("/api/proposals/" + id).session(session())).andExpect(status().isBadRequest());
        }
    }
    @Test void auditUnavailableUsesExistingProblemDetailWithoutPayload() throws Exception {
        when(repository.create(any())).thenThrow(new AuditUnavailableException());
        mvc.perform(write(EMPTY)).andExpect(status().isServiceUnavailable())
            .andExpect(jsonPath("$.code").value(AuditErrorCode.AUDIT_UNAVAILABLE.name()))
            .andExpect(jsonPath("$.type").value("urn:alixar:error:audit-unavailable"))
            .andExpect(jsonPath("$.id").doesNotExist());
    }
    @Test void auditModesAndActorAreReused() throws Exception {
        for (AuditMode mode : AuditMode.values()) {
            auditMode.setMode(mode);
            mvc.perform(write(EMPTY)).andExpect(status().isCreated());
        }
        var proposalEvents = events.events(AuditChain.DEFAULT_CHAIN_ID).stream()
            .filter(event -> event.action().equals(AuditAction.PROPOSAL_CREATED.name())).toList();
        assertThat(proposalEvents).hasSize(2);
        assertThat(proposalEvents).allSatisfy(event -> {
            assertThat(event.resourceType()).isEqualTo(AuditResourceType.PROPOSAL.name());
            assertThat(event.resourceId()).isEqualTo("42");
            assertThat(event.actorUserId()).isEqualTo(USER);
        });
    }
}
