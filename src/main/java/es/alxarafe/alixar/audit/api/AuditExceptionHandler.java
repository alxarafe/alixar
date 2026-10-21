package es.alxarafe.alixar.audit.api;

import es.alxarafe.alixar.audit.application.AuditErrorCode;
import es.alxarafe.alixar.audit.application.InvalidAuditQueryException;
import java.net.URI;
import java.util.Locale;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

@RestControllerAdvice(assignableTypes = AdminAuditEventController.class)
class AuditExceptionHandler {

    private static final String FIELD_NAMESPACE = "field.audit.";
    private static final URI INVALID_QUERY_TYPE =
        URI.create("urn:alixar:error:audit-invalid-query");

    private final MessageSource messageSource;

    AuditExceptionHandler(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    @ExceptionHandler(InvalidAuditQueryException.class)
    ProblemDetail handleInvalidQuery(InvalidAuditQueryException exception, Locale locale) {
        return invalidQuery(exception.parameter(), locale);
    }

    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    ProblemDetail handleTypeMismatch(MethodArgumentTypeMismatchException exception, Locale locale) {
        return invalidQuery(exception.getName(), locale);
    }

    private ProblemDetail invalidQuery(String parameter, Locale locale) {
        String fieldLabel = messageSource.getMessage(FIELD_NAMESPACE + parameter, null, locale);
        String detail = messageSource.getMessage(
            "audit.invalidQuery",
            new Object[]{fieldLabel},
            locale
        );

        ProblemDetail problem = ProblemDetail.forStatusAndDetail(HttpStatus.BAD_REQUEST, detail);
        problem.setType(INVALID_QUERY_TYPE);
        problem.setTitle(messageSource.getMessage("audit.invalidQuery.title", null, locale));
        problem.setProperty("code", AuditErrorCode.AUDIT_INVALID_QUERY.name());
        problem.setProperty("field", parameter);
        return problem;
    }
}
