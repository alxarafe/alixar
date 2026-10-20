package es.alxarafe.alixar.authentication.infrastructure.security;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.security.web.util.matcher.RequestMatcher;

/**
 * Matches requests that present an opaque API token as a Bearer credential.
 * Such requests authenticate with an explicit header, so they do not rely on
 * the session cookie and are exempt from session CSRF protection.
 */
public class BearerTokenRequestMatcher implements RequestMatcher {

    @Override
    public boolean matches(HttpServletRequest request) {
        String header = request.getHeader(ApiTokenAuthenticationFilter.AUTHORIZATION_HEADER);
        return header != null && header.startsWith(ApiTokenAuthenticationFilter.BEARER_PREFIX);
    }
}
