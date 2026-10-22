package es.alxarafe.alixar.authentication.infrastructure.security;

import es.alxarafe.alixar.audit.application.SecurityAuditTrail;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.csrf.CsrfException;

/**
 * Audits authorization denials without changing the original access-denied
 * outcome.
 *
 * <p>CSRF rejections are not authorization denials and are never audited here.
 * Every auxiliary audit step is best-effort and isolated from the response.</p>
 */
public class AuditedAccessDeniedHandler implements AccessDeniedHandler {

    private static final Logger LOGGER =
        LoggerFactory.getLogger(AuditedAccessDeniedHandler.class);

    private final AccessDeniedHandler delegate;
    private final SecurityAuditTrail securityAuditTrail;
    private final SecurityContextAuditActorResolver actorResolver;
    private final HttpAuditResourceFamilyClassifier resourceClassifier;

    public AuditedAccessDeniedHandler(
        AccessDeniedHandler delegate,
        SecurityAuditTrail securityAuditTrail,
        SecurityContextAuditActorResolver actorResolver,
        HttpAuditResourceFamilyClassifier resourceClassifier
    ) {
        this.delegate = Objects.requireNonNull(delegate, "delegate");
        this.securityAuditTrail = Objects.requireNonNull(securityAuditTrail, "securityAuditTrail");
        this.actorResolver = Objects.requireNonNull(actorResolver, "actorResolver");
        this.resourceClassifier = Objects.requireNonNull(resourceClassifier, "resourceClassifier");
    }

    @Override
    public void handle(
        HttpServletRequest request,
        HttpServletResponse response,
        AccessDeniedException exception
    ) throws IOException, ServletException {
        try {
            if (!(exception instanceof CsrfException)) {
                audit(request);
            }
        } catch (RuntimeException auditFailure) {
            LOGGER.warn(
                "Could not append access-denied audit event; preserving access-denied outcome",
                auditFailure
            );
        }
        delegate.handle(request, response, exception);
    }

    private void audit(HttpServletRequest request) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        var actor = actorResolver.resolve(authentication, request);
        if (actor.isEmpty()) {
            return;
        }
        var resourceId = resourceClassifier.classify(request);
        if (resourceId.isEmpty()) {
            return;
        }
        securityAuditTrail.accessDenied(actor.get(), resourceId.get());
    }
}
