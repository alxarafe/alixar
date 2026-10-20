package es.alxarafe.alixar.authentication.application;

import java.util.List;

public class ListRolesUseCase {

    private final AuthorizationRepository authorizationRepository;

    public ListRolesUseCase(AuthorizationRepository authorizationRepository) {
        this.authorizationRepository = authorizationRepository;
    }

    public List<RoleDefinition> execute() {
        return authorizationRepository.findAllRoles();
    }
}
