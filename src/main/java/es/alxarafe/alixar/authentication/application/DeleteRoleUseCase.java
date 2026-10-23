package es.alxarafe.alixar.authentication.application;

import java.util.UUID;

public class DeleteRoleUseCase {

    private final AuthorizationRepository authorizationRepository;

    public DeleteRoleUseCase(AuthorizationRepository authorizationRepository) {
        this.authorizationRepository = authorizationRepository;
    }

    public UUID execute(String roleCode) {
        RoleDefinition role = authorizationRepository.findRoleByCode(roleCode)
            .orElseThrow(() -> new RoleNotFoundException(roleCode));
        if (role.builtIn()) {
            throw new BuiltInRoleImmutableException(roleCode);
        }

        authorizationRepository.deleteRole(roleCode);
        return role.id();
    }
}
