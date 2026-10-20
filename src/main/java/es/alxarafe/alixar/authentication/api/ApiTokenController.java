package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.authentication.application.CreatedApiToken;
import es.alxarafe.alixar.authentication.application.ListApiTokensUseCase;
import es.alxarafe.alixar.authentication.domain.ApiToken;
import es.alxarafe.alixar.authentication.infrastructure.TransactionalApiTokenService;
import es.alxarafe.alixar.authentication.infrastructure.security.AuthenticatedUserPrincipal;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.time.Instant;
import java.util.List;
import java.util.UUID;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(UserEndpoints.BASE_PATH)
class ApiTokenController {

    private final TransactionalApiTokenService apiTokenService;
    private final ListApiTokensUseCase listApiTokensUseCase;

    ApiTokenController(
        TransactionalApiTokenService apiTokenService,
        ListApiTokensUseCase listApiTokensUseCase
    ) {
        this.apiTokenService = apiTokenService;
        this.listApiTokensUseCase = listApiTokensUseCase;
    }

    @PostMapping(
        value = UserEndpoints.API_TOKENS_RELATIVE_PATH,
        consumes = MediaType.APPLICATION_JSON_VALUE,
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    @ResponseStatus(HttpStatus.CREATED)
    CreatedApiTokenResponse create(
        @AuthenticationPrincipal AuthenticatedUserPrincipal principal,
        @Valid @RequestBody CreateApiTokenRequest request
    ) {
        CreatedApiToken created = apiTokenService.create(principal.id(), request.name(), request.expiresAt());
        return new CreatedApiTokenResponse(
            created.token().id(),
            created.token().name(),
            created.token().createdAt(),
            created.token().expiresAt(),
            created.rawToken()
        );
    }

    @GetMapping(
        value = UserEndpoints.API_TOKENS_RELATIVE_PATH,
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    List<ApiTokenResponse> list(@AuthenticationPrincipal AuthenticatedUserPrincipal principal) {
        return listApiTokensUseCase.execute(principal.id()).stream()
            .map(ApiTokenController::toResponse)
            .toList();
    }

    @DeleteMapping(value = UserEndpoints.API_TOKENS_RELATIVE_PATH + "/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    void revoke(
        @AuthenticationPrincipal AuthenticatedUserPrincipal principal,
        @PathVariable("id") UUID id
    ) {
        apiTokenService.revoke(principal.id(), id);
    }

    private static ApiTokenResponse toResponse(ApiToken token) {
        return new ApiTokenResponse(
            token.id(),
            token.name(),
            token.createdAt(),
            token.expiresAt(),
            token.lastUsedAt(),
            token.revokedAt()
        );
    }

    record CreateApiTokenRequest(
        @NotBlank(message = "{validation.required}") String name,
        @NotNull(message = "{validation.required}") Instant expiresAt
    ) {
    }

    record CreatedApiTokenResponse(
        UUID id,
        String name,
        Instant createdAt,
        Instant expiresAt,
        String token
    ) {
    }

    record ApiTokenResponse(
        UUID id,
        String name,
        Instant createdAt,
        Instant expiresAt,
        Instant lastUsedAt,
        Instant revokedAt
    ) {
    }
}
