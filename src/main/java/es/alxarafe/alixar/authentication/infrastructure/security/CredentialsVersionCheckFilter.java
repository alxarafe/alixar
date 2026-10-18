package es.alxarafe.alixar.authentication.infrastructure.security;

import es.alxarafe.alixar.authentication.application.UserRepository;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
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
            && authentication.getPrincipal() instanceof AuthenticatedUserPrincipal principal) {

            userRepository.findById(principal.id())
                .ifPresent(user -> {
                    if (user.credentialsVersion() != principal.credentialsVersion()) {
                        SecurityContextHolder.clearContext();
                        request.getSession().invalidate();
                    }
                });
        }

        filterChain.doFilter(request, response);
    }
}