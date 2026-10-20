package es.alxarafe.alixar.authentication.infrastructure.security;

import es.alxarafe.alixar.authentication.application.GetEffectivePermissionsUseCase;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

/**
 * Replaces the authenticated principal's authorities with the permissions that
 * the user currently holds through its roles.
 *
 * <p>This runs on every authenticated request, for both session and Bearer
 * authentication, after identity and credential-version validation and before
 * Spring Security authorizes the request. Role changes therefore take effect on
 * the next request without logging out, revoking API tokens or changing
 * {@code credentials_version}.</p>
 */
public class EffectivePermissionsFilter extends OncePerRequestFilter {

    private final GetEffectivePermissionsUseCase getEffectivePermissions;

    public EffectivePermissionsFilter(GetEffectivePermissionsUseCase getEffectivePermissions) {
        this.getEffectivePermissions = getEffectivePermissions;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
        throws ServletException, IOException {

        Authentication current = SecurityContextHolder.getContext().getAuthentication();

        if (current != null
            && current.isAuthenticated()
            && current.getPrincipal() instanceof AuthenticatedUserPrincipal principal) {
            List<GrantedAuthority> authorities = getEffectivePermissions.execute(principal.id()).stream()
                .<GrantedAuthority>map(SimpleGrantedAuthority::new)
                .toList();

            Authentication authenticated = UsernamePasswordAuthenticationToken.authenticated(
                principal,
                current.getCredentials(),
                authorities
            );

            SecurityContext context = SecurityContextHolder.createEmptyContext();
            context.setAuthentication(authenticated);
            SecurityContextHolder.setContext(context);
        }

        filterChain.doFilter(request, response);
    }
}
