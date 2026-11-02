package es.alxarafe.alixar.contact.api;

import es.alxarafe.alixar.audit.application.AuditErrorCode;
import es.alxarafe.alixar.audit.application.AuditUnavailableException;
import es.alxarafe.alixar.contact.application.ContactNotFoundException;
import es.alxarafe.alixar.contact.application.InvalidContactDataException;
import es.alxarafe.alixar.contact.application.InvalidThirdPartyReferenceException;
import es.alxarafe.alixar.core.application.ErrorCode;
import java.net.URI;
import java.util.Locale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

@ControllerAdvice(assignableTypes = ContactController.class)
public class ContactExceptionHandler {

    private static final String FIELD_NAMESPACE = "field.contact.";
    private static final URI VALIDATION_REQUIRED_TYPE =
        URI.create("urn:alixar:error:validation-required");
    private static final URI VALIDATION_INVALID_TYPE =
        URI.create("urn:alixar:error:validation-invalid");
    private static final URI CONTACT_NOT_FOUND_TYPE =
        URI.create("urn:alixar:error:contact-not-found");
    private static final URI CONTACT_INVALID_THIRD_PARTY_REFERENCE_TYPE =
        URI.create("urn:alixar:error:contact-invalid-third-party-reference");
    private static final URI AUDIT_UNAVAILABLE_TYPE =
        URI.create("urn:alixar:error:audit-unavailable");

    private MessageSource messageSource;

    @Autowired(required = false)
    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    @ExceptionHandler(ContactNotFoundException.class)
    ProblemDetail handleContactNotFound(ContactNotFoundException ex, Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.NOT_FOUND,
            getMessage("contact.notFound", locale)
        );
        problem.setType(CONTACT_NOT_FOUND_TYPE);
        problem.setTitle(getMessage("contact.notFound.title", locale));
        problem.setProperty("code", ex.errorCode().name());
        return problem;
    }

    @ExceptionHandler(InvalidContactDataException.class)
    ProblemDetail handleInvalidContactData(InvalidContactDataException ex, Locale locale) {
        String fieldLabel = fieldLabel(ex.field(), locale);
        boolean required = ex.errorCode() == ErrorCode.VALIDATION_REQUIRED;
        String messageKey = required ? "validation.required" : "validation.invalid";
        String titleKey = required ? "validation.required.title" : "validation.invalid.title";

        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.BAD_REQUEST,
            messageSource.getMessage(messageKey, new Object[]{fieldLabel}, locale)
        );
        problem.setType(required ? VALIDATION_REQUIRED_TYPE : VALIDATION_INVALID_TYPE);
        problem.setTitle(getMessage(titleKey, locale));
        problem.setProperty("code", ex.errorCode().name());
        problem.setProperty("field", ex.field());
        return problem;
    }

    @ExceptionHandler(InvalidThirdPartyReferenceException.class)
    ProblemDetail handleInvalidThirdPartyReference(InvalidThirdPartyReferenceException ex, Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.UNPROCESSABLE_ENTITY,
            getMessage("contact.invalidThirdPartyReference", locale)
        );
        problem.setType(CONTACT_INVALID_THIRD_PARTY_REFERENCE_TYPE);
        problem.setTitle(getMessage("contact.invalidThirdPartyReference.title", locale));
        problem.setProperty("code", ex.errorCode().name());
        return problem;
    }

    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    ProblemDetail handleTypeMismatch(MethodArgumentTypeMismatchException ex, Locale locale) {
        String fieldLabel = fieldLabel(ex.getName(), locale);
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.BAD_REQUEST,
            messageSource.getMessage("validation.invalid", new Object[]{fieldLabel}, locale)
        );
        problem.setType(VALIDATION_INVALID_TYPE);
        problem.setTitle(getMessage("validation.invalid.title", locale));
        problem.setProperty("code", ErrorCode.VALIDATION_INVALID.name());
        problem.setProperty("field", ex.getName());
        return problem;
    }

    @ExceptionHandler(AuditUnavailableException.class)
    ProblemDetail handleAuditUnavailable(Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.SERVICE_UNAVAILABLE,
            getMessage("audit.unavailable", locale)
        );
        problem.setType(AUDIT_UNAVAILABLE_TYPE);
        problem.setTitle(getMessage("audit.unavailable.title", locale));
        problem.setProperty("code", AuditErrorCode.AUDIT_UNAVAILABLE.name());
        return problem;
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    ProblemDetail handleMethodArgumentNotValid(MethodArgumentNotValidException ex, Locale locale) {
        FieldError fieldError = ex.getBindingResult().getFieldError();
        String field = fieldError != null ? fieldError.getField() : "unknown";

        String fieldLabel = fieldLabel(field, locale);
        String detail = messageSource != null
            ? messageSource.getMessage("validation.required", new Object[]{fieldLabel}, locale)
            : "Validation failed for field: " + field;

        ProblemDetail problem = ProblemDetail.forStatusAndDetail(HttpStatus.BAD_REQUEST, detail);
        problem.setType(VALIDATION_REQUIRED_TYPE);
        problem.setTitle(getMessage("validation.required.title", locale));
        problem.setProperty("code", ErrorCode.VALIDATION_REQUIRED.name());
        problem.setProperty("field", field);
        return problem;
    }

    private String fieldLabel(String field, Locale locale) {
        if (messageSource == null) {
            return field;
        }
        String label = messageSource.getMessage(FIELD_NAMESPACE + field, null, null, locale);
        return label != null ? label : field;
    }

    private String getMessage(String code, Locale locale) {
        return messageSource.getMessage(code, null, locale);
    }
}
