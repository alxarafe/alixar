package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.User;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

public class ReplaceAdminUserRolesUseCase {

    private final UserRepository userRepository;
    private final AuthorizationRepository authorizationRepository;

    public ReplaceAdminUserRolesUseCase(
        UserRepository userRepository,
        AuthorizationRepository authorizationRepository
    ) {
        this.userRepository = userRepository;
        this.authorizationRepository = authorizationRepository;
    }

    public AdminUser execute(UUID userId, List<String> roleCodes) {
        User user = userRepository.findById(userId)
            .orElseThrow(() -> new UserNotFoundException(userId));

        List<String> normalizedRoleCodes = normalizeRoleCodes(roleCodes);
        Set<String> knownRoleCodes = authorizationRepository.findAllRoles().stream()
            .map(RoleDefinition::code)
            .collect(Collectors.toSet());
        for (String roleCode : normalizedRoleCodes) {
            if (!knownRoleCodes.contains(roleCode)) {
                throw new RoleNotFoundException(roleCode);
            }
        }

        for (String currentRoleCode : authorizationRepository.findRoleCodesForUser(userId)) {
            authorizationRepository.removeRoleFromUser(userId, currentRoleCode);
        }
        for (String roleCode : normalizedRoleCodes) {
            authorizationRepository.assignRoleToUser(userId, roleCode);
        }

        return new AdminUser(
            user.id(),
            user.username(),
            user.email(),
            user.enabled(),
            user.createdAt(),
            user.updatedAt(),
            authorizationRepository.findRoleCodesForUser(userId)
        );
    }

    private List<String> normalizeRoleCodes(List<String> roleCodes) {
        if (roleCodes == null) {
            return List.of();
        }
        return roleCodes.stream()
            .map(roleCode -> roleCode == null ? "" : roleCode.strip())
            .distinct()
            .toList();
    }
}
