package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.ApiToken;
import java.time.Instant;
import java.util.UUID;

public class RevokeApiTokenUseCase {

    private final ApiTokenRepository apiTokenRepository;

    public RevokeApiTokenUseCase(ApiTokenRepository apiTokenRepository) {
        this.apiTokenRepository = apiTokenRepository;
    }

    public void execute(UUID userId, UUID tokenId) {
        ApiToken token = apiTokenRepository.findByIdAndUserId(tokenId, userId)
            .orElseThrow(ApiTokenNotFoundException::new);

        if (token.isRevoked()) {
            return;
        }

        apiTokenRepository.revoke(tokenId, userId, Instant.now());
    }
}
