package es.alxarafe.alixar.sales;

import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig.*;
import es.alxarafe.alixar.authentication.api.AuthenticationEndpoints;
import es.alxarafe.alixar.authentication.application.*;
import es.alxarafe.alixar.authentication.domain.*;
import es.alxarafe.alixar.audit.AuditModeTestSupport;
import es.alxarafe.alixar.audit.application.AuditUnavailableException;
import es.alxarafe.alixar.sales.api.ProposalEndpoints;
import es.alxarafe.alixar.sales.application.*;
import es.alxarafe.alixar.sales.domain.*;
import es.alxarafe.alixar.sales.infrastructure.TransactionalProposalService;
import jakarta.servlet.http.Cookie;
import java.time.Instant;
import java.util.*;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.*;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import static org.assertj.core.api.Assertions.*;
import static org.mockito.Mockito.*;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/** HTTP/security/JSON boundary only; real persistence and audit have separate PostgreSQL tests. */
@Import(AuthenticationTestConfig.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class ProposalDraftControllerTest {
    private static final UUID USER = UUID.fromString("378f3b35-3e80-4778-9633-cecd42f7b508");
    private static final String USERNAME = "draft-controller-fixture";
    private static final String PASSWORD = "draft-controller-password";
    private static final String CSRF_COOKIE = "XSRF-TOKEN", CSRF_HEADER = "X-XSRF-TOKEN";
    private static final String ITEM = ProposalEndpoints.BASE_PATH + "/42";
    private static final String PATH = ITEM + ProposalEndpoints.DRAFT_SUFFIX;
    private static final String EMPTY = "{\"expectedVersion\":1,\"thirdPartyId\":7,\"currency\":\"EUR\",\"lines\":[]}";
    private static final String LINE = "{\"description\":\" service \",\"quantity\":2,\"unitNetPrice\":10.005,\"vatRate\":21}";
    @Autowired WebApplicationContext context;
    @Autowired UserRepository users;
    @Autowired AuthorizationRepository authorization;
    @Autowired PasswordHasher passwords;
    @Autowired ApiTokenRepository tokens;
    @Autowired TokenHasher tokenHasher;
    @Autowired AuditModeTestSupport auditMode;
    @MockitoBean TransactionalProposalService service;
    private MockMvc mvc;
    private MockHttpSession session;
    private Cookie csrf;
    @BeforeEach void setup() {
        auditMode.reset();
        mvc = MockMvcBuilders.webAppContextSetup(context).apply(springSecurity()).build();
        Instant now = Instant.now();
        ((TestUserRepository) users).replaceWith(new User(USER, USERNAME, "draft@example.test", passwords.hash(PASSWORD), true, 0, now, now));
        ((TestAuthorizationRepository) authorization).reset();
        authorization.assignRoleToUser(USER, RoleCodes.SYSTEM_ADMIN);
        grant(PermissionCodes.PROPOSALS_MANAGE);
        ((TestApiTokenRepository) tokens).replaceWith();
        when(service.replaceDraft(anyLong(), any())).thenReturn(2L);
    }
    @AfterEach void cleanup() { auditMode.reset(); }
    private void grant(String... permissions) { authorization.replaceRolePermissions(RoleCodes.SYSTEM_ADMIN, List.of(permissions)); }
    private void login() throws Exception {
        if (session != null) { return; }
        Cookie token = mvc.perform(get("/health")).andReturn().getResponse().getCookie(CSRF_COOKIE);
        session = (MockHttpSession) mvc.perform(post(AuthenticationEndpoints.LOGIN_PATH).cookie(token)
            .header(CSRF_HEADER, token.getValue()).contentType(MediaType.APPLICATION_JSON)
            .content("{\"identifier\":\"" + USERNAME + "\",\"password\":\"" + PASSWORD + "\"}"))
            .andExpect(status().isOk()).andReturn().getRequest().getSession(false);
        csrf = mvc.perform(get("/health").session(session)).andReturn().getResponse().getCookie(CSRF_COOKIE);
    }
    private MockHttpServletRequestBuilder write(String body) throws Exception {
        login();
        return put(PATH).session(session).cookie(csrf).header(CSRF_HEADER, csrf.getValue())
            .contentType(MediaType.APPLICATION_JSON).content(body);
    }
    private String withLine(String line) { return EMPTY.replace("[]", "[" + line + "]"); }
    private String bearer() {
        String raw = "alx_pat_test-" + UUID.randomUUID();
        Instant now = Instant.now();
        tokens.create(new ApiToken(UUID.randomUUID(), USER, "draft-controller", 0, now, now.plusSeconds(3600), null, null), tokenHasher.hash(raw));
        return "Bearer " + raw;
    }
    private ResultActions invalid(String body) throws Exception {
        return mvc.perform(write(body)).andExpect(status().isBadRequest())
            .andExpect(content().contentTypeCompatibleWith(MediaType.APPLICATION_PROBLEM_JSON))
            .andExpect(jsonPath("$.code").value("VALIDATION_INVALID"))
            .andExpect(jsonPath("$.type").value("urn:alixar:error:validation-invalid"));
    }
    @Test void manageOnlyReturnsExactlyIdAndVersionWithoutLocationOrEtag() throws Exception {
        mvc.perform(write(withLine(LINE))).andExpect(status().isOk())
            .andExpect(content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON))
            .andExpect(jsonPath("$.length()").value(2)).andExpect(jsonPath("$.id").value(42))
            .andExpect(jsonPath("$.version").value(2)).andExpect(header().doesNotExist(HttpHeaders.LOCATION))
            .andExpect(header().doesNotExist(HttpHeaders.ETAG));
        var command = org.mockito.ArgumentCaptor.forClass(ReplaceProposalDraftCommand.class);
        verify(service).replaceDraft(eq(42L), command.capture());
        assertThat(command.getValue().lines().getFirst().description()).isEqualTo("service");
        mvc.perform(get(ITEM).session(session)).andExpect(status().isForbidden());
        verify(service, never()).get(anyLong());
    }
    @Test void noOpResponseIsTheSameMinimalShapeWithTheUnchangedVersion() throws Exception {
        when(service.replaceDraft(anyLong(), any())).thenReturn(1L);
        mvc.perform(write(EMPTY)).andExpect(status().isOk()).andExpect(jsonPath("$.length()").value(2))
            .andExpect(jsonPath("$.id").value(42)).andExpect(jsonPath("$.version").value(1));
    }
    @Test void authenticationCsrfAndAuthorizationPrecedeParsingAndBusinessAccess() throws Exception {
        Cookie anonymousCsrf = mvc.perform(get("/health")).andReturn().getResponse().getCookie(CSRF_COOKIE);
        mvc.perform(put(PATH).cookie(anonymousCsrf).header(CSRF_HEADER, anonymousCsrf.getValue())
            .contentType(MediaType.APPLICATION_JSON).content("["))
            .andExpect(status().isUnauthorized());
        login();
        mvc.perform(put(PATH).session(session).contentType(MediaType.APPLICATION_JSON).content("["))
            .andExpect(status().isForbidden());
        mvc.perform(put(PATH).session(session).cookie(csrf).header(CSRF_HEADER, "wrong-fixture-token")
            .contentType(MediaType.APPLICATION_JSON).content("["))
            .andExpect(status().isForbidden());
        grant(PermissionCodes.PROPOSALS_READ);
        mvc.perform(write("[")).andExpect(status().isForbidden());
        mvc.perform(put(PATH).header(HttpHeaders.AUTHORIZATION, bearer()).contentType(MediaType.APPLICATION_JSON).content("["))
            .andExpect(status().isForbidden());
        mvc.perform(put(PATH).header(HttpHeaders.AUTHORIZATION, "Bearer alx_pat_test-invalid")
            .contentType(MediaType.APPLICATION_JSON).content(EMPTY)).andExpect(status().isUnauthorized());
        verifyNoInteractions(service);
    }
    @Test void bearerWithManageOnlyCanPutWithoutCsrfButCannotReadTheDocument() throws Exception {
        String bearer = bearer();
        mvc.perform(put(PATH).header(HttpHeaders.AUTHORIZATION, bearer).contentType(MediaType.APPLICATION_JSON).content(EMPTY))
            .andExpect(status().isOk()).andExpect(jsonPath("$.length()").value(2));
        mvc.perform(get(ITEM).header(HttpHeaders.AUTHORIZATION, bearer)).andExpect(status().isForbidden());
        verify(service).replaceDraft(eq(42L), any());
        verify(service, never()).get(anyLong());
    }
    @Test void everyMissingOrNullMemberUsesInvalidRatherThanCom01RequiredCode() throws Exception {
        invalid("{}");
        for (String field : List.of("expectedVersion", "thirdPartyId", "currency", "lines")) {
            String value = switch (field) { case "expectedVersion" -> "1"; case "thirdPartyId" -> "7"; case "currency" -> "\"EUR\""; default -> "[]"; };
            invalid(EMPTY.replace("\"" + field + "\":" + value, "\"" + field + "\":null"));
            invalid(EMPTY.replaceFirst("\"" + field + "\":" + java.util.regex.Pattern.quote(value) + ",?", "").replace(",}", "}"));
        }
        for (String field : List.of("description", "quantity", "unitNetPrice", "vatRate")) {
            String value = switch (field) { case "description" -> "\" service \""; case "quantity" -> "2"; case "unitNetPrice" -> "10.005"; default -> "21"; };
            invalid(withLine(LINE.replace("\"" + field + "\":" + value, "\"" + field + "\":null")));
            invalid(withLine(LINE.replaceFirst("\"" + field + "\":" + java.util.regex.Pattern.quote(value) + ",?", "").replace(",}", "}")));
        }
        verifyNoInteractions(service);
    }
    @Test void integerFieldsAndPathRejectCoercionOverflowAndNonpositiveValues() throws Exception {
        for (String value : List.of("0", "-1", "1.0", "1.1", "1e0", "9223372036854775808", "\"1\"", "true", "{}", "[]")) {
            invalid(EMPTY.replace("\"expectedVersion\":1", "\"expectedVersion\":" + value));
            invalid(EMPTY.replace("\"thirdPartyId\":7", "\"thirdPartyId\":" + value));
        }
        login();
        for (String id : List.of("0", "-1", "+1", "abc", "1.0", "1e0", "9223372036854775808")) {
            mvc.perform(put(ProposalEndpoints.BASE_PATH + "/" + id + ProposalEndpoints.DRAFT_SUFFIX)
                .session(session).cookie(csrf).header(CSRF_HEADER, csrf.getValue()).contentType(MediaType.APPLICATION_JSON).content(EMPTY))
                .andExpect(status().isBadRequest()).andExpect(jsonPath("$.code").value("VALIDATION_INVALID"));
        }
        verifyNoInteractions(service);
    }
    @Test void strictJsonRejectsMalformedTrailingDuplicateAndProtectedProperties() throws Exception {
        for (String body : List.of("", " ", "[", "[]", "null", "true", EMPTY + EMPTY,
            EMPTY.replace("{", "{\"expectedVersion\":2,"), withLine(LINE.replace("{", "{\"quantity\":1,")),
            EMPTY.replace("[]", "{}"), EMPTY.replace("[]", "[null]"), EMPTY.replace("[]", "[1]"),
            withLine(LINE.replace("\" service \"", "false")), withLine(LINE.replace("\"quantity\":2", "\"quantity\":\"2\"")))) {
            invalid(body);
        }
        for (String field : List.of("id", "version", "state", "monetaryPolicyId", "totals", "createdAt", "updatedAt", "orderIds", "links", "unknown")) {
            invalid(EMPTY.replace("{", "{\"" + field + "\":null,"));
        }
        for (String field : List.of("id", "position", "amounts", "netAmount", "taxAmount", "grossAmount", "convertedOrderId", "unknown")) {
            invalid(withLine(LINE.replace("{", "{\"" + field + "\":null,")));
        }
        verifyNoInteractions(service);
    }
    @Test void boundsScalesCurrencyAndDescriptionLimitsRejectBeforeBusinessAccess() throws Exception {
        for (String value : List.of("\"USD\"", "\"eur\"", "\" EUR \"", "false", "7")) {
            invalid(EMPTY.replace("\"EUR\"", value));
        }
        for (String input : List.of(LINE.replace(" service ", " "), LINE.replace(" service ", "😀".repeat(ProposalLimits.MAX_DESCRIPTION_CODE_POINTS + 1)),
            LINE.replace("\"quantity\":2", "\"quantity\":0"), LINE.replace("\"quantity\":2", "\"quantity\":2.0000000"),
            LINE.replace("\"quantity\":2", "\"quantity\":10000000000000"), LINE.replace("10.005", "10000000000000"),
            LINE.replace("10.005", "-1"), LINE.replace("10.005", "0.0000001"), LINE.replace("21}", "100.0001}"),
            LINE.replace("21}", "21.00000}"), LINE.replace("21}", "-1}"))) { invalid(withLine(input)); }
        invalid(EMPTY.replace("[]", "[" + String.join(",", Collections.nCopies(ProposalLimits.MAX_LINES + 1, LINE)) + "]"));
        verifyNoInteractions(service);
    }
    @Test void inclusiveLimitsExactDecimalPrecisionAndUnicodeReachTheServiceWithoutArithmetic() throws Exception {
        String input = LINE.replace(" service ", "😀".repeat(ProposalLimits.MAX_DESCRIPTION_CODE_POINTS))
            .replace("\"quantity\":2", "\"quantity\":9999999999999.999999").replace("10.005", "1234567890123.123456").replace("21}", "100.0000}");
        mvc.perform(write(withLine(input))).andExpect(status().isOk());
        var command = org.mockito.ArgumentCaptor.forClass(ReplaceProposalDraftCommand.class);
        verify(service).replaceDraft(eq(42L), command.capture());
        assertThat(command.getValue().lines().getFirst().unitNetPrice()).isEqualTo(new java.math.BigDecimal("1234567890123.123456"));
        assertThat(command.getValue().lines().getFirst().quantity()).isEqualTo(new java.math.BigDecimal("9999999999999.999999"));
        mvc.perform(write(EMPTY.replace("[]", "[" + String.join(",", Collections.nCopies(ProposalLimits.MAX_LINES, LINE)) + "]")))
            .andExpect(status().isOk());
        mvc.perform(write(EMPTY.replace("\"expectedVersion\":1", "\"expectedVersion\":" + Long.MAX_VALUE)
            .replace("\"thirdPartyId\":7", "\"thirdPartyId\":" + Long.MAX_VALUE))).andExpect(status().isOk());
    }
    @Test void structuralValidationPrecedesAnOtherwiseStaleCommandAndComputedOverflowMapsToInvalid() throws Exception {
        doThrow(new DraftReplacementRejectedException(SalesErrorCode.SALES_VERSION_CONFLICT)).when(service).replaceDraft(anyLong(), any());
        invalid(withLine(LINE.replace("10.005", "0.0000001")));
        verifyNoInteractions(service);
        doThrow(new InvalidProposalException(ProposalFields.TOTALS, false)).when(service).replaceDraft(anyLong(), any());
        invalid(withLine(LINE)).andExpect(jsonPath("$.field").value(ProposalFields.TOTALS));
    }
    @Test void allBusinessErrorsAreLocalizedWithoutExposingDocumentOrCurrentVersion() throws Exception {
        var errors = List.of(
            new Failure(new ProposalNotFoundException(), 404, "PROPOSAL_NOT_FOUND", "The proposal was not found.", "No se ha encontrado el presupuesto."),
            new Failure(new DraftReplacementRejectedException(SalesErrorCode.SALES_VERSION_CONFLICT), 409, "SALES_VERSION_CONFLICT", "The expected version does not match the proposal.", "La versión esperada no coincide con la del presupuesto."),
            new Failure(new DraftReplacementRejectedException(SalesErrorCode.SALES_VERSION_EXHAUSTED), 409, "SALES_VERSION_EXHAUSTED", "The proposal version cannot be incremented.", "No se puede incrementar la versión del presupuesto."),
            new Failure(new DraftReplacementRejectedException(SalesErrorCode.PROPOSAL_INVALID_STATE), 409, "PROPOSAL_INVALID_STATE", "The proposal must be a draft.", "El presupuesto debe estar en borrador."),
            new Failure(new DraftReplacementRejectedException(SalesErrorCode.SALES_MONETARY_POLICY_UNAVAILABLE), 409, "SALES_MONETARY_POLICY_UNAVAILABLE", "The stored monetary policy is unavailable for modification.", "La política monetaria almacenada no está disponible para modificar el presupuesto."),
            new Failure(new InvalidSalesThirdPartyException(), 422, "SALES_INVALID_THIRD_PARTY", "The third party must exist, be active and be a customer or prospect.", "El tercero debe existir, estar activo y ser cliente o cliente potencial."));
        for (var error : errors) {
            doThrow(error.exception()).when(service).replaceDraft(anyLong(), any());
            for (String language : List.of("en", "es")) {
                mvc.perform(write(EMPTY).header(HttpHeaders.ACCEPT_LANGUAGE, language)).andExpect(status().is(error.status()))
                    .andExpect(content().contentTypeCompatibleWith(MediaType.APPLICATION_PROBLEM_JSON))
                    .andExpect(jsonPath("$.code").value(error.code())).andExpect(jsonPath("$.detail").value(language.equals("es") ? error.es() : error.en()))
                    .andExpect(jsonPath("$.currentVersion").doesNotExist()).andExpect(jsonPath("$.id").doesNotExist())
                    .andExpect(jsonPath("$.lines").doesNotExist()).andExpect(jsonPath("$.totals").doesNotExist());
            }
        }
    }
    @Test void validationAndAuditErrorsUseExistingLocalizedProblemDetails() throws Exception {
        invalid(EMPTY.replace("\"expectedVersion\":1", "\"expectedVersion\":null")).andExpect(jsonPath("$.field").value(ProposalFields.EXPECTED_VERSION));
        mvc.perform(write("{}").header(HttpHeaders.ACCEPT_LANGUAGE, "es")).andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.code").value("VALIDATION_INVALID")).andExpect(jsonPath("$.detail").value("El campo Versión esperada no es válido."));
        doThrow(new AuditUnavailableException()).when(service).replaceDraft(anyLong(), any());
        mvc.perform(write(EMPTY).header(HttpHeaders.ACCEPT_LANGUAGE, "es")).andExpect(status().isServiceUnavailable())
            .andExpect(jsonPath("$.code").value("AUDIT_UNAVAILABLE")).andExpect(jsonPath("$.type").value("urn:alixar:error:audit-unavailable"))
            .andExpect(jsonPath("$.id").doesNotExist());
    }
    private record Failure(RuntimeException exception, int status, String code, String en, String es) { }
}
