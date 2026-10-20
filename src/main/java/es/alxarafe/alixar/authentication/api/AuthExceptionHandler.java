package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.authentication.application.ApiTokenNotFoundException;
import es.alxarafe.alixar.authentication.application.AuthenticationErrorCode;
import es.alxarafe.alixar.authentication.application.InvalidApiTokenExpirationException;
import es.alxarafe.alixar.authentication.application.InvalidCredentialsException;
import es.alxarafe.alixar.authentication.application.InvalidCurrentPasswordException;
import es.alxarafe.alixar.authentication.application.InvalidPasswordException;
import es.alxarafe.alixar.authentication.application.InvalidResetTokenException;
import es.alxarafe.alixar.authentication.application.UsernameAlreadyExistsException;
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

@RestControllerAdvice(assignableTypes = {AuthController.class, UserController.class, ApiTokenController.class})
class AuthExceptionHandler {

    private static final URI INVALID_CREDENTIALS_TYPE =
        URI.create("urn:alixar:error:authentication-invalid-credentials");
    private static final URI INVALID_API_TOKEN_EXPIRATION_TYPE =
        URI.create("urn:alixar:error:authentication-invalid-api-token-expiration");
    private static final URI API_TOKEN_NOT_FOUND_TYPE =
        URI.create("urn:alixar:error:authentication-api-token-not-found");
    private static final URI INVALID_RESET_TOKEN_TYPE =
        URI.create("urn:alixar:error:authentication-invalid-reset-token");
    private static final URI INVALID_PASSWORD_TYPE =
        URI.create("urn:alixar:error:authentication-invalid-password");
    private static final URI INVALID_CURRENT_PASSWORD_TYPE =
        URI.create("urn:alixar:error:authentication-invalid-current-password");
    private static final URI USERNAME_ALREADY_EXISTS_TYPE =
        URI.create("urn:alixar:error:authentication-username-already-exists");

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

    @ExceptionHandler(InvalidCredentialsException.class)
    ProblemDetail handleInvalidCredentials(Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.UNAUTHORIZED,
            messageSource.getMessage("authentication.invalidCredentials", null, locale)
        );
        problem.setType(INVALID_CREDENTIALS_TYPE);
        problem.setTitle(messageSource.getMessage("authentication.invalidCredentials.title", null, locale));
        problem.setProperty("code", AuthenticationErrorCode.AUTH_INVALID_CREDENTIALS.name());
        return problem;
    }

    @ExceptionHandler(InvalidResetTokenException.class)
    ProblemDetail handleInvalidResetToken(Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.BAD_REQUEST,
            messageSource.getMessage("authentication.invalidResetToken", null, locale)
        );
        problem.setType(INVALID_RESET_TOKEN_TYPE);
        problem.setTitle(messageSource.getMessage("authentication.invalidResetToken.title", null, locale));
        problem.setProperty("code", AuthenticationErrorCode.AUTH_INVALID_RESET_TOKEN.name());
        return problem;
    }

    @ExceptionHandler(InvalidPasswordException.class)
    ProblemDetail handleInvalidPassword(Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.BAD_REQUEST,
            messageSource.getMessage("authentication.invalidPassword", null, locale)
        );
        problem.setType(INVALID_PASSWORD_TYPE);
        problem.setTitle(messageSource.getMessage("authentication.invalidPassword.title", null, locale));
        problem.setProperty("code", AuthenticationErrorCode.AUTH_INVALID_PASSWORD.name());
        return problem;
    }

    @ExceptionHandler(InvalidCurrentPasswordException.class)
    ProblemDetail handleInvalidCurrentPassword(Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.BAD_REQUEST,
            messageSource.getMessage("authentication.invalidCurrentPassword", null, locale)
        );
        problem.setType(INVALID_CURRENT_PASSWORD_TYPE);
        problem.setTitle(messageSource.getMessage("authentication.invalidCurrentPassword.title", null, locale));
        problem.setProperty("code", AuthenticationErrorCode.AUTH_INVALID_CURRENT_PASSWORD.name());
        return problem;
    }

    @ExceptionHandler(UsernameAlreadyExistsException.class)
    ProblemDetail handleUsernameAlreadyExists(Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.CONFLICT,
            messageSource.getMessage("authentication.usernameAlreadyExists", null, locale)
        );
        problem.setType(USERNAME_ALREADY_EXISTS_TYPE);
        problem.setTitle(messageSource.getMessage("authentication.usernameAlreadyExists.title", null, locale));
        problem.setProperty("code", AuthenticationErrorCode.AUTH_USERNAME_ALREADY_EXISTS.name());
        return problem;
    }

    @ExceptionHandler(InvalidApiTokenExpirationException.class)
    ProblemDetail handleInvalidApiTokenExpiration(Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.BAD_REQUEST,
            messageSource.getMessage("authentication.invalidApiTokenExpiration", null, locale)
        );
        problem.setType(INVALID_API_TOKEN_EXPIRATION_TYPE);
        problem.setTitle(messageSource.getMessage("authentication.invalidApiTokenExpiration.title", null, locale));
        problem.setProperty("code", AuthenticationErrorCode.AUTH_INVALID_API_TOKEN_EXPIRATION.name());
        return problem;
    }

    @ExceptionHandler(ApiTokenNotFoundException.class)
    ProblemDetail handleApiTokenNotFound(Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.NOT_FOUND,
            messageSource.getMessage("authentication.apiTokenNotFound", null, locale)
        );
        problem.setType(API_TOKEN_NOT_FOUND_TYPE);
        problem.setTitle(messageSource.getMessage("authentication.apiTokenNotFound.title", null, locale));
        problem.setProperty("code", AuthenticationErrorCode.AUTH_API_TOKEN_NOT_FOUND.name());
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
