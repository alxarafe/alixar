package es.alxarafe.alixar.authentication.infrastructure.security;

import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.domain.User;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Optional;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

public class CredentialsVersionCheckFilter extends OncePerRequestFilter {

    private final UserRepository userRepository;

    public CredentialsVersionCheckFilter(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
        throws ServletException, IOException {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null && authentication.isAuthenticated()
            && authentication.getPrincipal() instanceof AuthenticatedUserPrincipal principal
            && !isStillValid(principal)) {

            SecurityContextHolder.clearContext();
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
        }

        filterChain.doFilter(request, response);
    }

    private boolean isStillValid(AuthenticatedUserPrincipal principal) {
        Optional<User> user = userRepository.findById(principal.id());
        return user.map(current ->
            current.enabled() && current.credentialsVersion() == principal.credentialsVersion()
        ).orElse(false);
    }
}
