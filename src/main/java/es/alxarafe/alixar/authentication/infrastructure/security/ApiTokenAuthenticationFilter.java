package es.alxarafe.alixar.authentication.infrastructure.security;

import es.alxarafe.alixar.authentication.application.ApiTokenRepository;
import es.alxarafe.alixar.authentication.application.ApiTokenAuthentication;
import es.alxarafe.alixar.authentication.application.AuthenticateApiTokenUseCase;
import es.alxarafe.alixar.authentication.domain.User;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.Instant;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

/**
 * Authenticates an API consumer that presents an opaque personal access token
 * as {@code Authorization: Bearer <token>}.
 *
 * <p>An explicitly presented Bearer credential takes precedence over any
 * session-based authentication. The resulting security context is not saved to
 * the HTTP session, so Bearer requests do not create server-side sessions.</p>
 */
public class ApiTokenAuthenticationFilter extends OncePerRequestFilter {

    public static final String AUTHORIZATION_HEADER = "Authorization";
    public static final String BEARER_PREFIX = "Bearer ";

    private static final Logger log = LoggerFactory.getLogger(ApiTokenAuthenticationFilter.class);

    private final AuthenticateApiTokenUseCase authenticateApiToken;
    private final ApiTokenRepository apiTokenRepository;

    public ApiTokenAuthenticationFilter(
        AuthenticateApiTokenUseCase authenticateApiToken,
        ApiTokenRepository apiTokenRepository
    ) {
        this.authenticateApiToken = authenticateApiToken;
        this.apiTokenRepository = apiTokenRepository;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
        throws ServletException, IOException {

        String authorization = request.getHeader(AUTHORIZATION_HEADER);
        if (authorization != null && authorization.startsWith(BEARER_PREFIX)) {
            String rawToken = authorization.substring(BEARER_PREFIX.length()).strip();
            Optional<ApiTokenAuthentication> authentication = authenticateApiToken.execute(rawToken);

            SecurityContext context = SecurityContextHolder.createEmptyContext();
            authentication.ifPresent(result -> {
                context.setAuthentication(toAuthentication(result.user()));
                SecurityContextHolder.setContext(context);
                updateLastUsedAt(result.tokenId());
            });
            if (authentication.isEmpty()) {
                SecurityContextHolder.clearContext();
            }
        }

        filterChain.doFilter(request, response);
    }

    private UsernamePasswordAuthenticationToken toAuthentication(User user) {
        AuthenticatedUserPrincipal principal = new AuthenticatedUserPrincipal(
            user.id(), user.username(), user.email(), user.credentialsVersion()
        );
        return UsernamePasswordAuthenticationToken.authenticated(principal, null, List.of());
    }

    private void updateLastUsedAt(UUID tokenId) {
        try {
            apiTokenRepository.updateLastUsedAt(tokenId, Instant.now());
        } catch (RuntimeException exception) {
            log.warn("Could not update API token last-used timestamp", exception);
        }
    }
}
