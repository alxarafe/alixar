package es.alxarafe.alixar.authentication.application;

public class UpdateRoleNameUseCase {

    private final AuthorizationRepository authorizationRepository;

    public UpdateRoleNameUseCase(AuthorizationRepository authorizationRepository) {
        this.authorizationRepository = authorizationRepository;
    }

    public RoleDefinition execute(String roleCode, String name) {
        RoleDefinition role = authorizationRepository.findRoleByCode(roleCode)
            .orElseThrow(() -> new RoleNotFoundException(roleCode));
        if (role.builtIn()) {
            throw new BuiltInRoleImmutableException(roleCode);
        }

        String normalizedName = normalizeName(name);
        authorizationRepository.updateRoleName(roleCode, normalizedName);
        return new RoleDefinition(roleCode, normalizedName, false, role.permissionCodes());
    }

    private String normalizeName(String name) {
        String normalized = name == null ? "" : name.strip();
        if (normalized.isEmpty()) {
            throw new InvalidRoleNameException();
        }
        return normalized;
    }
}
