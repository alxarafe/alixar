package es.alxarafe.alixar.authentication.application;

import java.util.List;

public class ListPermissionsUseCase {

    private final AuthorizationRepository authorizationRepository;

    public ListPermissionsUseCase(AuthorizationRepository authorizationRepository) {
        this.authorizationRepository = authorizationRepository;
    }

    public List<PermissionDefinition> execute() {
        return authorizationRepository.findAllPermissions();
    }
}
