package es.alxarafe.alixar.authentication.infrastructure.security;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.session.SessionAuthenticationStrategy;
import org.springframework.security.web.util.matcher.RequestMatcher;

/**
 * Skips session fixation/token rotation for requests authenticated with an
 * explicit Bearer credential, because those requests must not create or depend
 * on an HTTP session. Session-based login keeps the configured behaviour.
 */
public class BearerAwareSessionAuthenticationStrategy implements SessionAuthenticationStrategy {

    private final SessionAuthenticationStrategy delegate;
    private final RequestMatcher bearerTokenRequestMatcher;

    public BearerAwareSessionAuthenticationStrategy(
        SessionAuthenticationStrategy delegate,
        RequestMatcher bearerTokenRequestMatcher
    ) {
        this.delegate = delegate;
        this.bearerTokenRequestMatcher = bearerTokenRequestMatcher;
    }

    @Override
    public void onAuthentication(
        Authentication authentication,
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        if (bearerTokenRequestMatcher.matches(request)) {
            return;
        }
        delegate.onAuthentication(authentication, request, response);
    }
}
