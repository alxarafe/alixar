package es.alxarafe.alixar.audit.api;

import es.alxarafe.alixar.audit.application.AuditErrorCode;
import es.alxarafe.alixar.audit.application.InvalidAuditModeException;
import es.alxarafe.alixar.audit.application.InvalidAuditReadPolicyException;
import es.alxarafe.alixar.audit.application.InvalidAuditQueryException;
import es.alxarafe.alixar.core.application.ErrorCode;
import jakarta.servlet.http.HttpServletRequest;
import java.net.URI;
import java.util.Locale;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

@RestControllerAdvice(assignableTypes = {
    AdminAuditEventController.class,
    AdminAuditConfigurationController.class,
    AdminAuditReadPolicyController.class
})
class AuditExceptionHandler {

    private static final String FIELD_NAMESPACE = "field.audit.";
    private static final URI INVALID_QUERY_TYPE =
        URI.create("urn:alixar:error:audit-invalid-query");
    private static final URI INVALID_MODE_TYPE =
        URI.create("urn:alixar:error:audit-invalid-mode");
    private static final URI INVALID_READ_POLICY_TYPE =
        URI.create("urn:alixar:error:audit-invalid-read-policy");
    private static final URI VALIDATION_REQUIRED_TYPE =
        URI.create("urn:alixar:error:validation-required");

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

    @ExceptionHandler(InvalidAuditModeException.class)
    ProblemDetail handleInvalidMode(Locale locale) {
        return invalidMode(locale);
    }

    @ExceptionHandler(InvalidAuditReadPolicyException.class)
    ProblemDetail handleInvalidReadPolicy(
        InvalidAuditReadPolicyException exception,
        Locale locale
    ) {
        return invalidReadPolicy(exception.field(), locale);
    }

    @ExceptionHandler(HttpMessageNotReadableException.class)
    ProblemDetail handleUnreadableBody(
        HttpMessageNotReadableException exception,
        HttpServletRequest request,
        Locale locale
    ) {
        if (AuditEndpoints.READ_POLICY_PATH.equals(request.getRequestURI())) {
            return invalidReadPolicy("rules", locale);
        }
        return invalidMode(locale);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    ProblemDetail handleInvalidRequest(MethodArgumentNotValidException exception, Locale locale) {
        FieldError fieldError = exception.getBindingResult().getFieldError();
        String field = fieldError != null ? fieldError.getField() : "unknown";
        String labelField = field.contains(".")
            ? field.substring(field.lastIndexOf('.') + 1)
            : field;
        String fieldLabel = messageSource.getMessage(
            FIELD_NAMESPACE + labelField,
            null,
            locale
        );
        String detail = messageSource.getMessage(
            "validation.required",
            new Object[]{fieldLabel},
            locale
        );

        ProblemDetail problem = ProblemDetail.forStatusAndDetail(HttpStatus.BAD_REQUEST, detail);
        problem.setType(VALIDATION_REQUIRED_TYPE);
        problem.setTitle(messageSource.getMessage("validation.required.title", null, locale));
        problem.setProperty("code", ErrorCode.VALIDATION_REQUIRED.name());
        problem.setProperty("field", field);
        return problem;
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

    private ProblemDetail invalidReadPolicy(String field, Locale locale) {
        String fieldLabel = messageSource.getMessage(FIELD_NAMESPACE + field, null, locale);
        String detail = messageSource.getMessage(
            "audit.invalidReadPolicy",
            new Object[]{fieldLabel},
            locale
        );

        ProblemDetail problem = ProblemDetail.forStatusAndDetail(HttpStatus.BAD_REQUEST, detail);
        problem.setType(INVALID_READ_POLICY_TYPE);
        problem.setTitle(messageSource.getMessage(
            "audit.invalidReadPolicy.title",
            null,
            locale
        ));
        problem.setProperty("code", AuditErrorCode.AUDIT_INVALID_READ_POLICY.name());
        problem.setProperty("field", field);
        return problem;
    }

    private ProblemDetail invalidMode(Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.BAD_REQUEST,
            messageSource.getMessage("audit.invalidMode", null, locale)
        );
        problem.setType(INVALID_MODE_TYPE);
        problem.setTitle(messageSource.getMessage("audit.invalidMode.title", null, locale));
        problem.setProperty("code", AuditErrorCode.AUDIT_INVALID_MODE.name());
        return problem;
    }
}
