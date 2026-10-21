package es.alxarafe.alixar.authentication.application;

import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.UUID;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

public class CreateRoleUseCase {

    private static final int ROLE_CODE_MAX_LENGTH = 100;
    private static final Pattern ROLE_CODE_SYNTAX = Pattern.compile("[a-z0-9]+(?:-[a-z0-9]+)*");

    private final AuthorizationRepository authorizationRepository;

    public CreateRoleUseCase(AuthorizationRepository authorizationRepository) {
        this.authorizationRepository = authorizationRepository;
    }

    public RoleDefinition execute(String code, String name, List<String> permissionCodes) {
        String normalizedCode = normalizeCode(code);
        String normalizedName = normalizeName(name);
        List<String> normalizedPermissionCodes = normalizePermissionCodes(permissionCodes);

        authorizationRepository.findRoleByCode(normalizedCode).ifPresent(existing -> {
            throw new RoleAlreadyExistsException();
        });

        Set<String> knownPermissionCodes = authorizationRepository.findAllPermissions().stream()
            .map(PermissionDefinition::code)
            .collect(Collectors.toSet());
        for (String permissionCode : normalizedPermissionCodes) {
            if (!knownPermissionCodes.contains(permissionCode)) {
                throw new PermissionNotFoundException(permissionCode);
            }
        }

        RoleDefinition role = new RoleDefinition(
            UUID.randomUUID(),
            normalizedCode,
            normalizedName,
            false,
            normalizedPermissionCodes
        );
        authorizationRepository.createRole(role);
        return role;
    }

    private String normalizeCode(String code) {
        String normalized = code == null ? "" : code.strip().toLowerCase(Locale.ROOT);
        if (normalized.length() > ROLE_CODE_MAX_LENGTH || !ROLE_CODE_SYNTAX.matcher(normalized).matches()) {
            throw new InvalidRoleCodeException();
        }
        return normalized;
    }

    private String normalizeName(String name) {
        String normalized = name == null ? "" : name.strip();
        if (normalized.isEmpty()) {
            throw new InvalidRoleNameException();
        }
        return normalized;
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
