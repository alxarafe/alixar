package es.alxarafe.alixar.authentication.infrastructure;

import es.alxarafe.alixar.authentication.application.CreateApiTokenUseCase;
import es.alxarafe.alixar.authentication.application.CreatedApiToken;
import es.alxarafe.alixar.authentication.application.RevokeApiTokenUseCase;
import java.time.Instant;
import java.util.UUID;
import org.springframework.transaction.annotation.Transactional;

public class TransactionalApiTokenService {

    private final CreateApiTokenUseCase createApiTokenUseCase;
    private final RevokeApiTokenUseCase revokeApiTokenUseCase;

    public TransactionalApiTokenService(
        CreateApiTokenUseCase createApiTokenUseCase,
        RevokeApiTokenUseCase revokeApiTokenUseCase
    ) {
        this.createApiTokenUseCase = createApiTokenUseCase;
        this.revokeApiTokenUseCase = revokeApiTokenUseCase;
    }

    @Transactional
    public CreatedApiToken create(UUID userId, String name, Instant expiresAt) {
        return createApiTokenUseCase.execute(userId, name, expiresAt);
    }

    @Transactional
    public void revoke(UUID userId, UUID tokenId) {
        revokeApiTokenUseCase.execute(userId, tokenId);
    }
}
