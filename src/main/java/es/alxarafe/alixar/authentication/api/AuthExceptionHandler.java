package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.authentication.application.AuthenticationErrorCode;
import es.alxarafe.alixar.core.application.ErrorCode;
import java.net.URI;
import java.util.Locale;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice(assignableTypes = AuthController.class)
class AuthExceptionHandler {

    private static final URI INVALID_CREDENTIALS_TYPE =
        URI.create("urn:alixar:error:authentication-invalid-credentials");

    private final MessageSource messageSource;

    AuthExceptionHandler(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    @ExceptionHandler(BadCredentialsException.class)
    ProblemDetail handleBadCredentials(Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.UNAUTHORIZED,
            messageSource.getMessage("authentication.invalidCredentials", null, locale)
        );
        problem.setType(INVALID_CREDENTIALS_TYPE);
        problem.setTitle(messageSource.getMessage("authentication.invalidCredentials.title", null, locale));
        problem.setProperty("code", AuthenticationErrorCode.AUTH_INVALID_CREDENTIALS.name());
        return problem;
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    ProblemDetail handleInvalidRequest(MethodArgumentNotValidException exception, Locale locale) {
        FieldError fieldError = exception.getBindingResult().getFieldError();
        String field = fieldError != null ? fieldError.getField() : "unknown";
        String fieldLabel = messageSource.getMessage("field.authentication." + field, null, locale);
        String detail = messageSource.getMessage("validation.required", new Object[]{fieldLabel}, locale);

        ProblemDetail problem = ProblemDetail.forStatusAndDetail(HttpStatus.BAD_REQUEST, detail);
        problem.setType(URI.create("urn:alixar:error:validation-required"));
        problem.setTitle(messageSource.getMessage("validation.required.title", null, locale));
        problem.setProperty("code", ErrorCode.VALIDATION_REQUIRED.name());
        problem.setProperty("field", field);
        return problem;
    }
}
