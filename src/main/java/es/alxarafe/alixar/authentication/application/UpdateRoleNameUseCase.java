package es.alxarafe.alixar.authentication.application;

public class UpdateRoleNameUseCase {

    private final AuthorizationRepository authorizationRepository;

    public UpdateRoleNameUseCase(AuthorizationRepository authorizationRepository) {
        this.authorizationRepository = authorizationRepository;
    }

    public UpdateRoleNameResult execute(String roleCode, String name) {
        RoleDefinition role = authorizationRepository.findRoleByCode(roleCode)
            .orElseThrow(() -> new RoleNotFoundException(roleCode));
        if (role.builtIn()) {
            throw new BuiltInRoleImmutableException(roleCode);
        }

        String normalizedName = normalizeName(name);
        authorizationRepository.updateRoleName(roleCode, normalizedName);
        return new UpdateRoleNameResult(
            new RoleDefinition(role.id(), roleCode, normalizedName, false, role.permissionCodes()),
            !role.name().equals(normalizedName)
        );
    }

    private String normalizeName(String name) {
        String normalized = name == null ? "" : name.strip();
        if (normalized.isEmpty()) {
            throw new InvalidRoleNameException();
        }
        return normalized;
    }
}
