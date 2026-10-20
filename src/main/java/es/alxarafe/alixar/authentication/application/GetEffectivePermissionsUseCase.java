package es.alxarafe.alixar.authentication.application;

import java.util.Set;
import java.util.UUID;

public class GetEffectivePermissionsUseCase {

    private final AuthorizationRepository authorizationRepository;

    public GetEffectivePermissionsUseCase(AuthorizationRepository authorizationRepository) {
        this.authorizationRepository = authorizationRepository;
    }

    public Set<String> execute(UUID userId) {
        return authorizationRepository.findEffectivePermissionCodes(userId);
    }
}
