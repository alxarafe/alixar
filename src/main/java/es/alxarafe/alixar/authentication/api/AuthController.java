package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.audit.application.AuditUnavailableException;
import es.alxarafe.alixar.audit.application.SecurityAuditTrail;
import es.alxarafe.alixar.authentication.application.InvalidCredentialsException;
import es.alxarafe.alixar.authentication.application.InvalidPasswordException;
import es.alxarafe.alixar.authentication.application.InvalidResetTokenException;
import es.alxarafe.alixar.authentication.application.PasswordResetNotifier;
import es.alxarafe.alixar.authentication.infrastructure.TransactionalPasswordRecovery;
import es.alxarafe.alixar.authentication.infrastructure.security.AuthenticatedUserPrincipal;
import es.alxarafe.alixar.authentication.infrastructure.security.SecurityContextAuditActorResolver;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextHolderStrategy;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.web.authentication.session.SessionAuthenticationStrategy;
import org.springframework.security.web.context.SecurityContextRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(AuthenticationEndpoints.BASE_PATH)
class AuthController {

    private final AuthenticationManager authenticationManager;
    private final SecurityContextRepository securityContextRepository;
    private final SessionAuthenticationStrategy sessionAuthenticationStrategy;
    private final TransactionalPasswordRecovery passwordRecovery;
    private final SecurityAuditTrail securityAuditTrail;
    private final SecurityContextAuditActorResolver auditActorResolver;
    private final SecurityContextHolderStrategy securityContextHolderStrategy =
        SecurityContextHolder.getContextHolderStrategy();

    AuthController(
        AuthenticationManager authenticationManager,
        SecurityContextRepository securityContextRepository,
        SessionAuthenticationStrategy sessionAuthenticationStrategy,
        TransactionalPasswordRecovery passwordRecovery,
        SecurityAuditTrail securityAuditTrail,
        SecurityContextAuditActorResolver auditActorResolver
    ) {
        this.authenticationManager = authenticationManager;
        this.securityContextRepository = securityContextRepository;
        this.sessionAuthenticationStrategy = sessionAuthenticationStrategy;
        this.passwordRecovery = passwordRecovery;
        this.securityAuditTrail = securityAuditTrail;
        this.auditActorResolver = auditActorResolver;
    }

    @PostMapping(
        value = AuthenticationEndpoints.LOGIN_RELATIVE_PATH,
        consumes = MediaType.APPLICATION_JSON_VALUE,
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    AuthenticatedUserResponse login(
        @Valid @RequestBody LoginRequest loginRequest,
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        Authentication authentication;
        try {
            authentication = authenticationManager.authenticate(
                UsernamePasswordAuthenticationToken.unauthenticated(
                    loginRequest.identifier(),
                    loginRequest.password()
                )
            );
        } catch (AuthenticationException exception) {
            securityAuditTrail.loginFailed();
            throw exception;
        }

        sessionAuthenticationStrategy.onAuthentication(authentication, request, response);

        var securityContext = securityContextHolderStrategy.createEmptyContext();
        securityContext.setAuthentication(authentication);
        securityContextHolderStrategy.setContext(securityContext);
        securityContextRepository.saveContext(securityContext, request, response);

        try {
            securityAuditTrail.loginSucceeded(
                auditActorResolver.resolve(authentication, request)
                    .orElseThrow(AuditUnavailableException::new)
            );
        } catch (AuditUnavailableException exception) {
            securityContextHolderStrategy.clearContext();
            securityContextRepository.saveContext(
                securityContextHolderStrategy.createEmptyContext(),
                request,
                response
            );
            if (request.getSession(false) != null) {
                request.getSession(false).invalidate();
            }
            throw exception;
        }

        return toResponse((AuthenticatedUserPrincipal) authentication.getPrincipal());
    }

    @GetMapping(value = AuthenticationEndpoints.ME_RELATIVE_PATH, produces = MediaType.APPLICATION_JSON_VALUE)
    AuthenticatedUserResponse me(@AuthenticationPrincipal AuthenticatedUserPrincipal principal) {
        return toResponse(principal);
    }

    @PostMapping(
        value = "/password/forgot",
        consumes = MediaType.APPLICATION_JSON_VALUE
    )
    @ResponseStatus(HttpStatus.ACCEPTED)
    public void forgotPassword(@Valid @RequestBody ForgotPasswordRequest request) {
        passwordRecovery.forgotPassword(request.email());
    }

    @PostMapping(
        value = "/password/reset",
        consumes = MediaType.APPLICATION_JSON_VALUE,
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    public void resetPassword(@Valid @RequestBody ResetPasswordRequest request) {
        passwordRecovery.resetPassword(request.token(), request.password());
    }

    private AuthenticatedUserResponse toResponse(AuthenticatedUserPrincipal principal) {
        return new AuthenticatedUserResponse(principal.id(), principal.username(), principal.email());
    }

    record LoginRequest(
        @NotBlank(message = "{validation.required}") String identifier,
        @NotBlank(message = "{validation.required}") String password
    ) {
    }

    record ForgotPasswordRequest(
        @NotBlank(message = "{validation.required}") String email
    ) {
    }

    record ResetPasswordRequest(
        @NotBlank(message = "{validation.required}") String token,
        @NotBlank(message = "{validation.required}") String password
    ) {
    }
}
