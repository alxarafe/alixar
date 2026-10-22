package es.alxarafe.alixar.authentication.infrastructure.security;

import es.alxarafe.alixar.audit.application.AuditActor;
import es.alxarafe.alixar.audit.application.AuditActorResolver;
import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import jakarta.servlet.http.HttpServletRequest;
import java.util.Objects;
import java.util.Optional;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * Resolves the audit actor from the current Spring Security context.
 *
 * <p>The authentication mechanism is read from a request attribute set by the
 * Personal Access Token filter. No audit-specific data is added to the
 * serialized user principal.</p>
 */
public class SecurityContextAuditActorResolver implements AuditActorResolver {

    @Override
    public Optional<AuditActor> resolveCurrentActor() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(RequestContextHolder.getRequestAttributes() instanceof ServletRequestAttributes attributes)) {
            return Optional.empty();
        }
        return resolve(authentication, attributes.getRequest());
    }

    public Optional<AuditActor> resolve(
        Authentication authentication,
        HttpServletRequest request
    ) {
        Objects.requireNonNull(request, "request");
        if (authentication == null
            || !authentication.isAuthenticated()
            || !(authentication.getPrincipal() instanceof AuthenticatedUserPrincipal principal)) {
            return Optional.empty();
        }

        boolean personalAccessToken = Boolean.TRUE.equals(
            request.getAttribute(ApiTokenAuthenticationFilter.PAT_REQUEST_ATTRIBUTE)
        );

        return Optional.of(new AuditActor(
            principal.id(),
            principal.username(),
            personalAccessToken ? AuditAuthenticationType.PAT : AuditAuthenticationType.SESSION
        ));
    }
}
