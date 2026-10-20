package es.alxarafe.alixar.authentication.infrastructure.security;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.context.DeferredSecurityContext;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.web.context.HttpRequestResponseHolder;
import org.springframework.security.web.context.SecurityContextRepository;
import org.springframework.security.web.util.matcher.RequestMatcher;

/**
 * Prevents persisting the security context of an explicitly Bearer-authenticated
 * request into the HTTP session. Session-based flows keep the delegate behaviour.
 */
public class BearerAwareSecurityContextRepository implements SecurityContextRepository {

    private final SecurityContextRepository delegate;
    private final RequestMatcher bearerTokenRequestMatcher;

    public BearerAwareSecurityContextRepository(
        SecurityContextRepository delegate,
        RequestMatcher bearerTokenRequestMatcher
    ) {
        this.delegate = delegate;
        this.bearerTokenRequestMatcher = bearerTokenRequestMatcher;
    }

    @Override
    public SecurityContext loadContext(HttpRequestResponseHolder requestResponseHolder) {
        return delegate.loadContext(requestResponseHolder);
    }

    @Override
    public DeferredSecurityContext loadDeferredContext(HttpServletRequest request) {
        return delegate.loadDeferredContext(request);
    }

    @Override
    public void saveContext(SecurityContext context, HttpServletRequest request, HttpServletResponse response) {
        if (bearerTokenRequestMatcher.matches(request)) {
            return;
        }
        delegate.saveContext(context, request, response);
    }

    @Override
    public boolean containsContext(HttpServletRequest request) {
        return delegate.containsContext(request);
    }
}
