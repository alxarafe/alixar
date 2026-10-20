package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.User;
import java.time.Instant;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

public class CreateAdminUserUseCase {

    private final UserRepository userRepository;
    private final AuthorizationRepository authorizationRepository;
    private final PasswordHasher passwordHasher;

    public CreateAdminUserUseCase(
        UserRepository userRepository,
        AuthorizationRepository authorizationRepository,
        PasswordHasher passwordHasher
    ) {
        this.userRepository = userRepository;
        this.authorizationRepository = authorizationRepository;
        this.passwordHasher = passwordHasher;
    }

    public AdminUser execute(String username, String email, String password, List<String> roleCodes) {
        PasswordPolicy.ensureValid(password);

        String normalizedUsername = normalize(username);
        String normalizedEmail = normalize(email);
        List<String> normalizedRoleCodes = normalizeRoleCodes(roleCodes);

        userRepository.findByUsername(normalizedUsername)
            .ifPresent(existing -> {
                throw new UsernameAlreadyExistsException();
            });
        userRepository.findByEmail(normalizedEmail)
            .ifPresent(existing -> {
                throw new EmailAlreadyExistsException();
            });

        Set<String> knownRoleCodes = authorizationRepository.findAllRoles().stream()
            .map(RoleDefinition::code)
            .collect(Collectors.toSet());
        for (String roleCode : normalizedRoleCodes) {
            if (!knownRoleCodes.contains(roleCode)) {
                throw new RoleNotFoundException(roleCode);
            }
        }

        Instant now = Instant.now();
        User user = new User(
            UUID.randomUUID(),
            normalizedUsername,
            normalizedEmail,
            passwordHasher.hash(password),
            false,
            0,
            now,
            now
        );

        userRepository.create(user);
        for (String roleCode : normalizedRoleCodes) {
            authorizationRepository.assignRoleToUser(user.id(), roleCode);
        }

        return new AdminUser(
            user.id(),
            user.username(),
            user.email(),
            user.enabled(),
            user.createdAt(),
            user.updatedAt(),
            authorizationRepository.findRoleCodesForUser(user.id())
        );
    }

    private String normalize(String value) {
        return value.strip().toLowerCase(Locale.ROOT);
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
