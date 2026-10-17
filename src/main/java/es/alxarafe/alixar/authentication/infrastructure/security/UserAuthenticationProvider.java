package es.alxarafe.alixar.authentication.infrastructure.security;

import es.alxarafe.alixar.authentication.application.AuthenticateUserUseCase;
import es.alxarafe.alixar.authentication.application.InvalidCredentialsException;
import es.alxarafe.alixar.authentication.domain.User;
import java.util.List;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

public class UserAuthenticationProvider implements AuthenticationProvider {

    private final AuthenticateUserUseCase authenticateUser;

    public UserAuthenticationProvider(AuthenticateUserUseCase authenticateUser) {
        this.authenticateUser = authenticateUser;
    }

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        try {
            User user = authenticateUser.execute(authentication.getName(), authentication.getCredentials().toString());
            AuthenticatedUserPrincipal principal = new AuthenticatedUserPrincipal(
                user.id(), user.username(), user.email()
            );
            return UsernamePasswordAuthenticationToken.authenticated(principal, null, List.of());
        } catch (InvalidCredentialsException exception) {
            throw new BadCredentialsException("Invalid credentials", exception);
        }
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
    }
}
