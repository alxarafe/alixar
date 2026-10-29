package es.alxarafe.alixar.thirdparty.api;

import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.BODY;

import es.alxarafe.alixar.audit.application.AuditErrorCode;
import es.alxarafe.alixar.audit.application.AuditUnavailableException;
import es.alxarafe.alixar.core.application.ErrorCode;
import es.alxarafe.alixar.thirdparty.application.InvalidThirdPartyDataException;
import es.alxarafe.alixar.thirdparty.application.ThirdPartyNotFoundException;
import java.net.URI;
import java.util.Locale;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

@RestControllerAdvice(assignableTypes = ThirdPartyController.class)
class ThirdPartyExceptionHandler {

    private static final String FIELD_NAMESPACE = "field.thirdparty.";
    private static final URI VALIDATION_REQUIRED_TYPE =
        URI.create("urn:alixar:error:validation-required");
    private static final URI VALIDATION_INVALID_TYPE =
        URI.create("urn:alixar:error:validation-invalid");
    private static final URI THIRD_PARTY_NOT_FOUND_TYPE =
        URI.create("urn:alixar:error:third-party-not-found");
    private static final URI AUDIT_UNAVAILABLE_TYPE =
        URI.create("urn:alixar:error:audit-unavailable");

    private final MessageSource messageSource;

    ThirdPartyExceptionHandler(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    @ExceptionHandler(ThirdPartyNotFoundException.class)
    ProblemDetail handleNotFound(ThirdPartyNotFoundException exception, Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.NOT_FOUND,
            messageSource.getMessage("thirdparty.notFound", null, locale)
        );
        problem.setType(THIRD_PARTY_NOT_FOUND_TYPE);
        problem.setTitle(messageSource.getMessage("thirdparty.notFound.title", null, locale));
        problem.setProperty("code", exception.errorCode().name());
        return problem;
    }

    @ExceptionHandler(InvalidThirdPartyDataException.class)
    ProblemDetail handleInvalidData(InvalidThirdPartyDataException exception, Locale locale) {
        String fieldLabel = fieldLabel(exception.field(), locale);
        boolean required = exception.errorCode() == ErrorCode.VALIDATION_REQUIRED;
        String messageKey = required ? "validation.required" : "validation.invalid";
        String titleKey = required ? "validation.required.title" : "validation.invalid.title";

        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.BAD_REQUEST,
            messageSource.getMessage(messageKey, new Object[]{fieldLabel}, locale)
        );
        problem.setType(required ? VALIDATION_REQUIRED_TYPE : VALIDATION_INVALID_TYPE);
        problem.setTitle(messageSource.getMessage(titleKey, null, locale));
        problem.setProperty("code", exception.errorCode().name());
        problem.setProperty("field", exception.field());
        return problem;
    }

    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    ProblemDetail handleTypeMismatch(
        MethodArgumentTypeMismatchException exception,
        Locale locale
    ) {
        return invalid(exception.getName(), locale);
    }

    @ExceptionHandler(HttpMessageNotReadableException.class)
    ProblemDetail handleUnreadableBody(Locale locale) {
        return invalid(BODY, locale);
    }

    @ExceptionHandler(AuditUnavailableException.class)
    ProblemDetail handleAuditUnavailable(Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.SERVICE_UNAVAILABLE,
            messageSource.getMessage("audit.unavailable", null, locale)
        );
        problem.setType(AUDIT_UNAVAILABLE_TYPE);
        problem.setTitle(messageSource.getMessage("audit.unavailable.title", null, locale));
        problem.setProperty("code", AuditErrorCode.AUDIT_UNAVAILABLE.name());
        return problem;
    }

    private ProblemDetail invalid(String field, Locale locale) {
        String fieldLabel = fieldLabel(field, locale);
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.BAD_REQUEST,
            messageSource.getMessage("validation.invalid", new Object[]{fieldLabel}, locale)
        );
        problem.setType(VALIDATION_INVALID_TYPE);
        problem.setTitle(messageSource.getMessage("validation.invalid.title", null, locale));
        problem.setProperty("code", ErrorCode.VALIDATION_INVALID.name());
        problem.setProperty("field", field);
        return problem;
    }

    private String fieldLabel(String field, Locale locale) {
        String label = messageSource.getMessage(
            FIELD_NAMESPACE + field,
            null,
            null,
            locale
        );
        return label != null ? label : field;
    }
}
