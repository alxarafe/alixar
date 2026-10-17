package es.alxarafe.alixar.contact.api;

import es.alxarafe.alixar.contact.application.ContactNotFoundException;
import es.alxarafe.alixar.contact.application.InvalidContactDataException;
import es.alxarafe.alixar.contact.application.InvalidThirdPartyReferenceException;
import es.alxarafe.alixar.core.application.ErrorCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.net.URI;
import java.util.Locale;

@ControllerAdvice(assignableTypes = ContactController.class)
public class ContactExceptionHandler {

    private MessageSource messageSource;

    @Autowired(required = false)
    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    @ExceptionHandler(ContactNotFoundException.class)
    ProblemDetail handleContactNotFound(ContactNotFoundException ex, Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(HttpStatus.NOT_FOUND, getMessage("contact.notFound", locale));
        problem.setType(URI.create("urn:alixar:error:contact-not-found"));
        problem.setTitle(getMessage("contact.notFound.title", locale));
        problem.setProperty("code", ex.errorCode().name());
        return problem;
    }

    @ExceptionHandler(InvalidContactDataException.class)
    ProblemDetail handleInvalidContactData(InvalidContactDataException ex, Locale locale) {
        String fieldLabel = getMessage("field.contact." + ex.field(), locale);
        String detail = messageSource.getMessage("validation.required", new Object[]{fieldLabel}, locale);
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(HttpStatus.BAD_REQUEST, detail);
        problem.setType(URI.create("urn:alixar:error:validation-required"));
        problem.setTitle(getMessage("validation.required.title", locale));
        problem.setProperty("code", ex.errorCode().name());
        problem.setProperty("field", ex.field());
        return problem;
    }

    @ExceptionHandler(InvalidThirdPartyReferenceException.class)
    ProblemDetail handleInvalidThirdPartyReference(InvalidThirdPartyReferenceException ex, Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(HttpStatus.UNPROCESSABLE_ENTITY, getMessage("contact.invalidThirdPartyReference", locale));
        problem.setType(URI.create("urn:alixar:error:contact-invalid-third-party-reference"));
        problem.setTitle(getMessage("contact.invalidThirdPartyReference.title", locale));
        problem.setProperty("code", ex.errorCode().name());
        return problem;
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    ProblemDetail handleMethodArgumentNotValid(MethodArgumentNotValidException ex, Locale locale) {
        FieldError fieldError = ex.getBindingResult().getFieldError();
        String field = fieldError != null ? fieldError.getField() : "unknown";

        String fieldLabel = getMessage("field.contact." + field, locale);
        String detail = messageSource != null
            ? messageSource.getMessage("validation.required", new Object[]{fieldLabel}, locale)
            : "Validation failed for field: " + field;

        ProblemDetail problem = ProblemDetail.forStatusAndDetail(HttpStatus.BAD_REQUEST, detail);
        problem.setType(URI.create("urn:alixar:error:validation-required"));
        problem.setTitle(getMessage("validation.required.title", locale));
        problem.setProperty("code", ErrorCode.VALIDATION_REQUIRED.name());
        problem.setProperty("field", field);
        return problem;
    }

    private String getMessage(String code, Locale locale) {
        return messageSource.getMessage(code, null, locale);
    }
}
