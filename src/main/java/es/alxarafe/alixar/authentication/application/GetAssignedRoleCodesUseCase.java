package es.alxarafe.alixar.authentication.application;

import java.util.List;
import java.util.UUID;

public class GetAssignedRoleCodesUseCase {

    private final AuthorizationRepository authorizationRepository;

    public GetAssignedRoleCodesUseCase(AuthorizationRepository authorizationRepository) {
        this.authorizationRepository = authorizationRepository;
    }

    public List<String> execute(UUID userId) {
        return authorizationRepository.findRoleCodesForUser(userId);
    }
}
