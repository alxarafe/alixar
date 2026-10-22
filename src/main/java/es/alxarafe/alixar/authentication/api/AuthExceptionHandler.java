package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.audit.application.AuditErrorCode;
import es.alxarafe.alixar.audit.application.AuditUnavailableException;
import es.alxarafe.alixar.authentication.application.AdministrationErrorCode;
import es.alxarafe.alixar.authentication.application.ApiTokenNotFoundException;
import es.alxarafe.alixar.authentication.application.AuthenticationErrorCode;
import es.alxarafe.alixar.authentication.application.BuiltInRoleImmutableException;
import es.alxarafe.alixar.authentication.application.EmailAlreadyExistsException;
import es.alxarafe.alixar.authentication.application.InvalidApiTokenExpirationException;
import es.alxarafe.alixar.authentication.application.InvalidCredentialsException;
import es.alxarafe.alixar.authentication.application.InvalidCurrentPasswordException;
import es.alxarafe.alixar.authentication.application.InvalidPaginationException;
import es.alxarafe.alixar.authentication.application.InvalidPasswordException;
import es.alxarafe.alixar.authentication.application.InvalidResetTokenException;
import es.alxarafe.alixar.authentication.application.InvalidRoleCodeException;
import es.alxarafe.alixar.authentication.application.InvalidRoleNameException;
import es.alxarafe.alixar.authentication.application.PermissionNotFoundException;
import es.alxarafe.alixar.authentication.application.RoleAlreadyExistsException;
import es.alxarafe.alixar.authentication.application.RoleInUseException;
import es.alxarafe.alixar.authentication.application.RoleNotFoundException;
import es.alxarafe.alixar.authentication.application.UserNotFoundException;
import es.alxarafe.alixar.authentication.application.UsernameAlreadyExistsException;
import es.alxarafe.alixar.core.application.ErrorCode;
import java.net.URI;
import java.util.Locale;
import org.springframework.context.MessageSource;
import org.springframework.core.MethodParameter;
import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice(assignableTypes = {
    AuthController.class,
    UserController.class,
    ApiTokenController.class,
    AdminUserController.class,
    AdminRoleController.class,
    AdminPermissionController.class
})
class AuthExceptionHandler {

    private static final String ROLE_CODE_FIELD = "code";
    private static final String ROLE_NAME_FIELD = "name";

    private static final String AUTHENTICATION_FIELD_NAMESPACE = "field.authentication.";
    private static final String ROLE_FIELD_NAMESPACE = "field.administration.";

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
    private static final URI ADMIN_USER_NOT_FOUND_TYPE =
        URI.create("urn:alixar:error:administration-user-not-found");
    private static final URI ADMIN_ROLE_NOT_FOUND_TYPE =
        URI.create("urn:alixar:error:administration-role-not-found");
    private static final URI ADMIN_ROLE_ALREADY_EXISTS_TYPE =
        URI.create("urn:alixar:error:administration-role-already-exists");
    private static final URI ADMIN_PERMISSION_NOT_FOUND_TYPE =
        URI.create("urn:alixar:error:administration-permission-not-found");
    private static final URI ADMIN_INVALID_ROLE_CODE_TYPE =
        URI.create("urn:alixar:error:administration-invalid-role-code");
    private static final URI ADMIN_INVALID_ROLE_NAME_TYPE =
        URI.create("urn:alixar:error:administration-invalid-role-name");
    private static final URI ADMIN_BUILT_IN_ROLE_IMMUTABLE_TYPE =
        URI.create("urn:alixar:error:administration-built-in-role-immutable");
    private static final URI ADMIN_ROLE_IN_USE_TYPE =
        URI.create("urn:alixar:error:administration-role-in-use");
    private static final URI ADMIN_EMAIL_ALREADY_EXISTS_TYPE =
        URI.create("urn:alixar:error:administration-email-already-exists");
    private static final URI ADMIN_INVALID_PAGINATION_TYPE =
        URI.create("urn:alixar:error:administration-invalid-pagination");
    private static final URI AUDIT_UNAVAILABLE_TYPE =
        URI.create("urn:alixar:error:audit-unavailable");

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

    @ExceptionHandler(UserNotFoundException.class)
    ProblemDetail handleUserNotFound(Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.NOT_FOUND,
            messageSource.getMessage("administration.userNotFound", null, locale)
        );
        problem.setType(ADMIN_USER_NOT_FOUND_TYPE);
        problem.setTitle(messageSource.getMessage("administration.userNotFound.title", null, locale));
        problem.setProperty("code", AdministrationErrorCode.ADMIN_USER_NOT_FOUND.name());
        return problem;
    }

    @ExceptionHandler(EmailAlreadyExistsException.class)
    ProblemDetail handleEmailAlreadyExists(Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.CONFLICT,
            messageSource.getMessage("administration.emailAlreadyExists", null, locale)
        );
        problem.setType(ADMIN_EMAIL_ALREADY_EXISTS_TYPE);
        problem.setTitle(messageSource.getMessage("administration.emailAlreadyExists.title", null, locale));
        problem.setProperty("code", AdministrationErrorCode.ADMIN_EMAIL_ALREADY_EXISTS.name());
        return problem;
    }

    @ExceptionHandler(RoleNotFoundException.class)
    ProblemDetail handleRoleNotFound(Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.NOT_FOUND,
            messageSource.getMessage("administration.roleNotFound", null, locale)
        );
        problem.setType(ADMIN_ROLE_NOT_FOUND_TYPE);
        problem.setTitle(messageSource.getMessage("administration.roleNotFound.title", null, locale));
        problem.setProperty("code", AdministrationErrorCode.ADMIN_ROLE_NOT_FOUND.name());
        return problem;
    }

    @ExceptionHandler(RoleAlreadyExistsException.class)
    ProblemDetail handleRoleAlreadyExists(Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.CONFLICT,
            messageSource.getMessage("administration.roleAlreadyExists", null, locale)
        );
        problem.setType(ADMIN_ROLE_ALREADY_EXISTS_TYPE);
        problem.setTitle(messageSource.getMessage("administration.roleAlreadyExists.title", null, locale));
        problem.setProperty("code", AdministrationErrorCode.ADMIN_ROLE_ALREADY_EXISTS.name());
        return problem;
    }

    @ExceptionHandler(PermissionNotFoundException.class)
    ProblemDetail handlePermissionNotFound(Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.NOT_FOUND,
            messageSource.getMessage("administration.permissionNotFound", null, locale)
        );
        problem.setType(ADMIN_PERMISSION_NOT_FOUND_TYPE);
        problem.setTitle(messageSource.getMessage("administration.permissionNotFound.title", null, locale));
        problem.setProperty("code", AdministrationErrorCode.ADMIN_PERMISSION_NOT_FOUND.name());
        return problem;
    }

    @ExceptionHandler(InvalidRoleCodeException.class)
    ProblemDetail handleInvalidRoleCode(Locale locale) {
        String fieldLabel = messageSource.getMessage("field.administration." + ROLE_CODE_FIELD, null, locale);
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.BAD_REQUEST,
            messageSource.getMessage("administration.invalidRoleCode", new Object[]{fieldLabel}, locale)
        );
        problem.setType(ADMIN_INVALID_ROLE_CODE_TYPE);
        problem.setTitle(messageSource.getMessage("administration.invalidRoleCode.title", null, locale));
        problem.setProperty("code", AdministrationErrorCode.ADMIN_INVALID_ROLE_CODE.name());
        problem.setProperty("field", ROLE_CODE_FIELD);
        return problem;
    }

    @ExceptionHandler(InvalidRoleNameException.class)
    ProblemDetail handleInvalidRoleName(Locale locale) {
        String fieldLabel = messageSource.getMessage("field.administration." + ROLE_NAME_FIELD, null, locale);
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.BAD_REQUEST,
            messageSource.getMessage("administration.invalidRoleName", new Object[]{fieldLabel}, locale)
        );
        problem.setType(ADMIN_INVALID_ROLE_NAME_TYPE);
        problem.setTitle(messageSource.getMessage("administration.invalidRoleName.title", null, locale));
        problem.setProperty("code", AdministrationErrorCode.ADMIN_INVALID_ROLE_NAME.name());
        problem.setProperty("field", ROLE_NAME_FIELD);
        return problem;
    }

    @ExceptionHandler(BuiltInRoleImmutableException.class)
    ProblemDetail handleBuiltInRoleImmutable(Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.CONFLICT,
            messageSource.getMessage("administration.builtInRoleImmutable", null, locale)
        );
        problem.setType(ADMIN_BUILT_IN_ROLE_IMMUTABLE_TYPE);
        problem.setTitle(messageSource.getMessage(
            "administration.builtInRoleImmutable.title",
            null,
            locale
        ));
        problem.setProperty("code", AdministrationErrorCode.ADMIN_BUILT_IN_ROLE_IMMUTABLE.name());
        return problem;
    }

    @ExceptionHandler(RoleInUseException.class)
    ProblemDetail handleRoleInUse(Locale locale) {
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
            HttpStatus.CONFLICT,
            messageSource.getMessage("administration.roleInUse", null, locale)
        );
        problem.setType(ADMIN_ROLE_IN_USE_TYPE);
        problem.setTitle(messageSource.getMessage("administration.roleInUse.title", null, locale));
        problem.setProperty("code", AdministrationErrorCode.ADMIN_ROLE_IN_USE.name());
        return problem;
    }

    @ExceptionHandler(InvalidPaginationException.class)
    ProblemDetail handleInvalidPagination(InvalidPaginationException exception, Locale locale) {
        String field = exception.field();
        String fieldLabel = messageSource.getMessage("field.administration." + field, null, locale);
        String detail = messageSource.getMessage(
            "administration.invalidPagination",
            new Object[]{fieldLabel},
            locale
        );

        ProblemDetail problem = ProblemDetail.forStatusAndDetail(HttpStatus.BAD_REQUEST, detail);
        problem.setType(ADMIN_INVALID_PAGINATION_TYPE);
        problem.setTitle(messageSource.getMessage("administration.invalidPagination.title", null, locale));
        problem.setProperty("code", AdministrationErrorCode.ADMIN_INVALID_PAGINATION.name());
        problem.setProperty("field", field);
        return problem;
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    ProblemDetail handleInvalidRequest(MethodArgumentNotValidException exception, Locale locale) {
        FieldError fieldError = exception.getBindingResult().getFieldError();
        String field = fieldError != null ? fieldError.getField() : "unknown";
        MethodParameter parameter = exception.getParameter();
        String fieldNamespace = parameter != null
            && AdminRoleController.class.equals(parameter.getContainingClass())
            ? ROLE_FIELD_NAMESPACE
            : AUTHENTICATION_FIELD_NAMESPACE;
        String fieldLabel = messageSource.getMessage(fieldNamespace + field, null, locale);
        String messageKey = fieldError != null && "Email".equals(fieldError.getCode())
            ? "validation.email"
            : "validation.required";
        String detail = messageSource.getMessage(messageKey, new Object[]{fieldLabel}, locale);

        ProblemDetail problem = ProblemDetail.forStatusAndDetail(HttpStatus.BAD_REQUEST, detail);
        problem.setType(URI.create("urn:alixar:error:validation-required"));
        problem.setTitle(messageSource.getMessage("validation.required.title", null, locale));
        problem.setProperty("code", ErrorCode.VALIDATION_REQUIRED.name());
        problem.setProperty("field", field);
        return problem;
    }
}
