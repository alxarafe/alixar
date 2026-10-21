package es.alxarafe.alixar.authentication.infrastructure;

import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditTrail;
import es.alxarafe.alixar.authentication.application.CreateApiTokenUseCase;
import es.alxarafe.alixar.authentication.application.CreatedApiToken;
import es.alxarafe.alixar.authentication.application.RevokeApiTokenUseCase;
import java.time.Instant;
import java.util.UUID;
import org.springframework.transaction.annotation.Transactional;

public class TransactionalApiTokenService {

    private final CreateApiTokenUseCase createApiTokenUseCase;
    private final RevokeApiTokenUseCase revokeApiTokenUseCase;
    private final AuditTrail auditTrail;

    public TransactionalApiTokenService(
        CreateApiTokenUseCase createApiTokenUseCase,
        RevokeApiTokenUseCase revokeApiTokenUseCase,
        AuditTrail auditTrail
    ) {
        this.createApiTokenUseCase = createApiTokenUseCase;
        this.revokeApiTokenUseCase = revokeApiTokenUseCase;
        this.auditTrail = auditTrail;
    }

    @Transactional
    public CreatedApiToken create(UUID userId, String name, Instant expiresAt) {
        CreatedApiToken created = createApiTokenUseCase.execute(userId, name, expiresAt);
        auditTrail.recordSuccess(
            AuditAction.API_TOKEN_CREATED,
            AuditResourceType.API_TOKEN,
            created.token().id().toString()
        );
        return created;
    }

    @Transactional
    public void revoke(UUID userId, UUID tokenId) {
        if (revokeApiTokenUseCase.execute(userId, tokenId)) {
            auditTrail.recordSuccess(
                AuditAction.API_TOKEN_REVOKED,
                AuditResourceType.API_TOKEN,
                tokenId.toString()
            );
        }
    }
}
