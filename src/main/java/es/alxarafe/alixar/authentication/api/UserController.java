package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.authentication.domain.User;
import es.alxarafe.alixar.authentication.infrastructure.TransactionalUserSelfService;
import es.alxarafe.alixar.authentication.infrastructure.security.AuthenticatedUserPrincipal;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextHolderStrategy;
import org.springframework.security.web.context.SecurityContextRepository;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(UserEndpoints.BASE_PATH)
class UserController {

    private final TransactionalUserSelfService userSelfService;
    private final SecurityContextRepository securityContextRepository;
    private final SecurityContextHolderStrategy securityContextHolderStrategy =
        SecurityContextHolder.getContextHolderStrategy();

    UserController(
        TransactionalUserSelfService userSelfService,
        SecurityContextRepository securityContextRepository
    ) {
        this.userSelfService = userSelfService;
        this.securityContextRepository = securityContextRepository;
    }

    @PatchMapping(
        value = UserEndpoints.ME_RELATIVE_PATH,
        consumes = MediaType.APPLICATION_JSON_VALUE,
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    AuthenticatedUserResponse updateUsername(
        @AuthenticationPrincipal AuthenticatedUserPrincipal principal,
        @Valid @RequestBody UpdateUsernameRequest request,
        HttpServletRequest httpRequest,
        HttpServletResponse httpResponse
    ) {
        User updated = userSelfService.changeUsername(principal.id(), request.username());
        AuthenticatedUserPrincipal updatedPrincipal = toPrincipal(updated);
        refreshCurrentSession(updatedPrincipal, httpRequest, httpResponse);
        return toResponse(updatedPrincipal);
    }

    @PostMapping(
        value = UserEndpoints.PASSWORD_RELATIVE_PATH,
        consumes = MediaType.APPLICATION_JSON_VALUE
    )
    @ResponseStatus(HttpStatus.NO_CONTENT)
    void changePassword(
        @AuthenticationPrincipal AuthenticatedUserPrincipal principal,
        @Valid @RequestBody ChangePasswordRequest request,
        HttpServletRequest httpRequest,
        HttpServletResponse httpResponse
    ) {
        User updated = userSelfService.changePassword(
            principal.id(),
            request.currentPassword(),
            request.newPassword()
        );
        refreshCurrentSession(toPrincipal(updated), httpRequest, httpResponse);
    }

    private void refreshCurrentSession(
        AuthenticatedUserPrincipal updatedPrincipal,
        HttpServletRequest httpRequest,
        HttpServletResponse httpResponse
    ) {
        Authentication current = securityContextHolderStrategy.getContext().getAuthentication();
        List<GrantedAuthority> authorities =
            current != null ? List.copyOf(current.getAuthorities()) : List.of();

        Authentication authentication = UsernamePasswordAuthenticationToken.authenticated(
            updatedPrincipal,
            null,
            authorities
        );

        var securityContext = securityContextHolderStrategy.createEmptyContext();
        securityContext.setAuthentication(authentication);
        securityContextHolderStrategy.setContext(securityContext);
        securityContextRepository.saveContext(securityContext, httpRequest, httpResponse);
    }

    private AuthenticatedUserPrincipal toPrincipal(User user) {
        return new AuthenticatedUserPrincipal(
            user.id(),
            user.username(),
            user.email(),
            user.credentialsVersion()
        );
    }

    private AuthenticatedUserResponse toResponse(AuthenticatedUserPrincipal principal) {
        return new AuthenticatedUserResponse(principal.id(), principal.username(), principal.email());
    }

    record UpdateUsernameRequest(
        @NotBlank(message = "{validation.required}") String username
    ) {
    }

    record ChangePasswordRequest(
        @NotBlank(message = "{validation.required}") String currentPassword,
        @NotBlank(message = "{validation.required}") String newPassword
    ) {
    }
}
