package es.alxarafe.alixar.sales.api;

import es.alxarafe.alixar.sales.application.*;
import es.alxarafe.alixar.sales.domain.*;
import es.alxarafe.alixar.audit.application.AuditUnavailableException;
import es.alxarafe.alixar.audit.application.AuditErrorCode;
import es.alxarafe.alixar.core.application.ErrorCode;
import java.net.URI;
import java.util.Locale;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpMethod;
import org.springframework.http.ProblemDetail;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

@ControllerAdvice(assignableTypes = ProposalController.class)
class ProposalExceptionHandler {
    private static final String CODE = "code";
    private static final String FIELD = "field";
    private static final String FIELD_NAMESPACE = "sales.field.";
    private final MessageSource messages;
    ProposalExceptionHandler(MessageSource messages) { this.messages = messages; }
    @ExceptionHandler(InvalidProposalException.class)
    ProblemDetail invalid(InvalidProposalException ex, Locale locale, HttpServletRequest request) {
        // PUT has one invalid-input code; COM-01 POST retains its separate required-field contract.
        boolean required = ex.required() && !HttpMethod.PUT.matches(request.getMethod());
        String key = required ? "validation.required" : "validation.invalid";
        String label = messages.getMessage(FIELD_NAMESPACE + ex.field(), null, ex.field(), locale);
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(HttpStatus.BAD_REQUEST,
            messages.getMessage(key, new Object[]{label}, locale));
        problem.setType(URI.create(required ? "urn:alixar:error:validation-required" : "urn:alixar:error:validation-invalid"));
        problem.setTitle(messages.getMessage(key + ".title", null, locale));
        problem.setProperty(CODE, (required ? ErrorCode.VALIDATION_REQUIRED : ErrorCode.VALIDATION_INVALID).name());
        problem.setProperty(FIELD, ex.field());
        return problem;
    }
    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    ProblemDetail typeMismatch(Locale locale, HttpServletRequest request) {
        return invalid(new InvalidProposalException(ProposalFields.ID, false), locale, request);
    }
    @ExceptionHandler(HttpMessageNotReadableException.class)
    ProblemDetail unreadable(Locale locale, HttpServletRequest request) {
        return invalid(new InvalidProposalException(ProposalFields.BODY, false), locale, request);
    }
    @ExceptionHandler(DraftReplacementRejectedException.class)
    ProblemDetail replacementRejected(DraftReplacementRejectedException ex, Locale locale) {
        return switch (ex.code()) {
            case SALES_VERSION_CONFLICT -> problem(HttpStatus.CONFLICT, ex.code().name(),
                "sales-version-conflict", "sales.versionConflict", locale);
            case SALES_VERSION_EXHAUSTED -> problem(HttpStatus.CONFLICT, ex.code().name(),
                "sales-version-exhausted", "sales.versionExhausted", locale);
            case PROPOSAL_INVALID_STATE -> problem(HttpStatus.CONFLICT, ex.code().name(),
                "proposal-invalid-state", "sales.proposal.invalidState", locale);
            case SALES_MONETARY_POLICY_UNAVAILABLE -> problem(HttpStatus.CONFLICT, ex.code().name(),
                "sales-monetary-policy-unavailable", "sales.monetaryPolicyUnavailable", locale);
            default -> throw ex;
        };
    }
    @ExceptionHandler(ProposalNotFoundException.class)
    ProblemDetail notFound(Locale locale) {
        return problem(HttpStatus.NOT_FOUND, SalesErrorCode.PROPOSAL_NOT_FOUND.name(), "proposal-not-found", "sales.proposal.notFound", locale);
    }
    @ExceptionHandler(InvalidSalesThirdPartyException.class)
    ProblemDetail thirdParty(Locale locale) {
        return problem(HttpStatus.UNPROCESSABLE_ENTITY, SalesErrorCode.SALES_INVALID_THIRD_PARTY.name(), "sales-invalid-third-party", "sales.invalidThirdParty", locale);
    }
    @ExceptionHandler(UnsupportedCurrencyException.class)
    ProblemDetail currency(Locale locale) {
        return problem(HttpStatus.UNPROCESSABLE_ENTITY, SalesErrorCode.SALES_UNSUPPORTED_CURRENCY.name(), "sales-unsupported-currency", "sales.unsupportedCurrency", locale);
    }
    @ExceptionHandler(AuditUnavailableException.class)
    ProblemDetail audit(Locale locale) {
        return problem(HttpStatus.SERVICE_UNAVAILABLE, AuditErrorCode.AUDIT_UNAVAILABLE.name(), "audit-unavailable", "audit.unavailable", locale);
    }
    private ProblemDetail problem(HttpStatus status, String code, String type, String key, Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(status, messages.getMessage(key, null, locale));
        problem.setTitle(messages.getMessage(key + ".title", null, locale));
        problem.setType(URI.create("urn:alixar:error:" + type));
        problem.setProperty(CODE, code);
        return problem;
    }
}
