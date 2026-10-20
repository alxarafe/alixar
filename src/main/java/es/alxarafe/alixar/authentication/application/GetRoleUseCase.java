package es.alxarafe.alixar.authentication.application;

public class GetRoleUseCase {

    private final AuthorizationRepository authorizationRepository;

    public GetRoleUseCase(AuthorizationRepository authorizationRepository) {
        this.authorizationRepository = authorizationRepository;
    }

    public RoleDefinition execute(String roleCode) {
        return authorizationRepository.findRoleByCode(roleCode)
            .orElseThrow(() -> new RoleNotFoundException(roleCode));
    }
}
