package es.alxarafe.alixar.authentication.application;

import java.util.UUID;

public class RemoveRoleFromUserUseCase {

    private final AuthorizationRepository authorizationRepository;

    public RemoveRoleFromUserUseCase(AuthorizationRepository authorizationRepository) {
        this.authorizationRepository = authorizationRepository;
    }

    public void execute(UUID userId, String roleCode) {
        authorizationRepository.removeRoleFromUser(userId, roleCode);
    }
}
