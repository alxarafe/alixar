package es.alxarafe.alixar.authentication.infrastructure.security;

import es.alxarafe.alixar.audit.application.SecurityAuditTrail;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

/**
 * Audits successful logout without allowing audit failures to change the
 * logout outcome.
 */
public class AuditedLogoutSuccessHandler implements LogoutSuccessHandler {

    private static final Logger LOGGER =
        LoggerFactory.getLogger(AuditedLogoutSuccessHandler.class);

    private final LogoutSuccessHandler delegate;
    private final SecurityAuditTrail securityAuditTrail;
    private final SecurityContextAuditActorResolver actorResolver;

    public AuditedLogoutSuccessHandler(
        LogoutSuccessHandler delegate,
        SecurityAuditTrail securityAuditTrail,
        SecurityContextAuditActorResolver actorResolver
    ) {
        this.delegate = delegate;
        this.securityAuditTrail = securityAuditTrail;
        this.actorResolver = actorResolver;
    }

    @Override
    public void onLogoutSuccess(
        HttpServletRequest request,
        HttpServletResponse response,
        Authentication authentication
    ) throws IOException, ServletException {
        try {
            actorResolver.resolve(authentication, request)
                .ifPresent(securityAuditTrail::logout);
        } catch (RuntimeException exception) {
            LOGGER.warn("Could not append logout audit event; preserving logout outcome", exception);
        }
        delegate.onLogoutSuccess(request, response, authentication);
    }
}
