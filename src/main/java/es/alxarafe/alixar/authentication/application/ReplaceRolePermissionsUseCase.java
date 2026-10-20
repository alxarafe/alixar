package es.alxarafe.alixar.authentication.application;

import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.stream.Collectors;

public class ReplaceRolePermissionsUseCase {

    private final AuthorizationRepository authorizationRepository;

    public ReplaceRolePermissionsUseCase(AuthorizationRepository authorizationRepository) {
        this.authorizationRepository = authorizationRepository;
    }

    public RoleDefinition execute(String roleCode, List<String> permissionCodes) {
        RoleDefinition role = authorizationRepository.findRoleByCode(roleCode)
            .orElseThrow(() -> new RoleNotFoundException(roleCode));
        if (role.builtIn()) {
            throw new BuiltInRoleImmutableException(roleCode);
        }

        List<String> normalizedPermissionCodes = normalizePermissionCodes(permissionCodes);
        Set<String> knownPermissionCodes = authorizationRepository.findAllPermissions().stream()
            .map(PermissionDefinition::code)
            .collect(Collectors.toSet());
        for (String permissionCode : normalizedPermissionCodes) {
            if (!knownPermissionCodes.contains(permissionCode)) {
                throw new PermissionNotFoundException(permissionCode);
            }
        }

        authorizationRepository.replaceRolePermissions(roleCode, normalizedPermissionCodes);
        return new RoleDefinition(roleCode, role.name(), false, normalizedPermissionCodes);
    }

    private List<String> normalizePermissionCodes(List<String> permissionCodes) {
        if (permissionCodes == null) {
            return List.of();
        }
        return permissionCodes.stream()
            .map(permissionCode -> permissionCode == null
                ? ""
                : permissionCode.strip().toLowerCase(Locale.ROOT))
            .distinct()
            .sorted()
            .toList();
    }
}
