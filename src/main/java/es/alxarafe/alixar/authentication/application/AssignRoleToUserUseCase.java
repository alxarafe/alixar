package es.alxarafe.alixar.authentication.application;

import java.util.UUID;

public class AssignRoleToUserUseCase {

    private final AuthorizationRepository authorizationRepository;

    public AssignRoleToUserUseCase(AuthorizationRepository authorizationRepository) {
        this.authorizationRepository = authorizationRepository;
    }

    public void execute(UUID userId, String roleCode) {
        authorizationRepository.assignRoleToUser(userId, roleCode);
    }
}
