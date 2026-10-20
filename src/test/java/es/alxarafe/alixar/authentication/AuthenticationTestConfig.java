package es.alxarafe.alixar.authentication;

import es.alxarafe.alixar.authentication.application.ApiTokenRepository;
import es.alxarafe.alixar.authentication.application.AuthorizationRepository;
import es.alxarafe.alixar.authentication.application.PasswordResetTokenRepository;
import es.alxarafe.alixar.authentication.application.PermissionCodes;
import es.alxarafe.alixar.authentication.application.PermissionDefinition;
import es.alxarafe.alixar.authentication.application.RoleAlreadyExistsException;
import es.alxarafe.alixar.authentication.application.RoleCodes;
import es.alxarafe.alixar.authentication.application.RoleDefinition;
import es.alxarafe.alixar.authentication.application.RoleNotFoundException;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.domain.ApiToken;
import es.alxarafe.alixar.authentication.domain.PasswordResetToken;
import es.alxarafe.alixar.authentication.domain.User;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;

@TestConfiguration
public class AuthenticationTestConfig {

    @Bean
    @Primary
    public UserRepository testUserRepository() {
        return new TestUserRepository();
    }

    @Bean
    @Primary
    public PasswordResetTokenRepository testPasswordResetTokenRepository() {
        return new TestPasswordResetTokenRepository();
    }

    @Bean
    @Primary
    public ApiTokenRepository testApiTokenRepository() {
        return new TestApiTokenRepository();
    }

    @Bean
    @Primary
    public AuthorizationRepository testAuthorizationRepository() {
        return new TestAuthorizationRepository();
    }

    public static class TestUserRepository implements UserRepository {

        private final List<User> users = new ArrayList<>();

        public void replaceWith(User... replacementUsers) {
            users.clear();
            users.addAll(List.of(replacementUsers));
        }

        public List<User> all() {
            return List.copyOf(users);
        }

        @Override
        public Optional<User> findByIdentifier(String identifier) {
            String normalized = normalize(identifier);
            List<User> matches = users.stream()
                .filter(user -> normalize(user.username()).equals(normalized)
                    || normalize(user.email()).equals(normalized))
                .limit(2)
                .toList();
            return matches.size() == 1 ? Optional.of(matches.getFirst()) : Optional.empty();
        }

        @Override
        public Optional<User> findByUsername(String username) {
            return find(user -> normalize(user.username()).equals(normalize(username)));
        }

        @Override
        public Optional<User> findByEmail(String email) {
            return find(user -> normalize(user.email()).equals(normalize(email)));
        }

        @Override
        public Optional<User> findById(UUID id) {
            return users.stream().filter(u -> u.id().equals(id)).findFirst();
        }

        @Override
        public List<User> search(String query, Boolean enabled, long offset, int limit) {
            return users.stream()
                .filter(user -> enabled == null || user.enabled() == enabled)
                .filter(user -> matchesQuery(user, query))
                .sorted(Comparator.comparing(User::username).thenComparing(User::id))
                .skip(offset)
                .limit(limit)
                .toList();
        }

        @Override
        public long count(String query, Boolean enabled) {
            return users.stream()
                .filter(user -> enabled == null || user.enabled() == enabled)
                .filter(user -> matchesQuery(user, query))
                .count();
        }

        @Override
        public void create(User user) {
            users.add(user);
        }

        @Override
        public void updateUsername(UUID userId, String newUsername) {
            users.stream()
                .filter(u -> u.id().equals(userId))
                .findFirst()
                .ifPresent(u -> {
                    int index = users.indexOf(u);
                    users.set(index, new User(
                        u.id(),
                        newUsername,
                        u.email(),
                        u.passwordHash(),
                        u.enabled(),
                        u.credentialsVersion(),
                        u.createdAt(),
                        Instant.now()
                    ));
                });
        }

        @Override
        public void updateEnabledAndCredentialsVersion(UUID userId, boolean enabled, long newCredentialsVersion) {
            users.stream()
                .filter(u -> u.id().equals(userId))
                .findFirst()
                .ifPresent(u -> {
                    int index = users.indexOf(u);
                    users.set(index, new User(
                        u.id(),
                        u.username(),
                        u.email(),
                        u.passwordHash(),
                        enabled,
                        newCredentialsVersion,
                        u.createdAt(),
                        Instant.now()
                    ));
                });
        }

        @Override
        public void updatePasswordAndCredentialsVersion(UUID userId, String newPasswordHash, long newCredentialsVersion) {
            users.stream()
                .filter(u -> u.id().equals(userId))
                .findFirst()
                .ifPresent(u -> {
                    int index = users.indexOf(u);
                    users.set(index, new User(
                        u.id(),
                        u.username(),
                        u.email(),
                        newPasswordHash,
                        u.enabled(),
                        newCredentialsVersion,
                        u.createdAt(),
                        Instant.now()
                    ));
                });
        }

        private Optional<User> find(java.util.function.Predicate<User> predicate) {
            return users.stream().filter(predicate).findFirst();
        }

        private boolean matchesQuery(User user, String query) {
            return query == null
                || normalize(user.username()).contains(query)
                || normalize(user.email()).contains(query);
        }

        private String normalize(String value) {
            return value.strip().toLowerCase(Locale.ROOT);
        }
    }

    public static class TestPasswordResetTokenRepository implements PasswordResetTokenRepository {

        private final List<PasswordResetToken> tokens = new ArrayList<>();

        public void replaceWith(PasswordResetToken... replacementTokens) {
            tokens.clear();
            tokens.addAll(List.of(replacementTokens));
        }

        public List<PasswordResetToken> all() {
            return List.copyOf(tokens);
        }

        @Override
        public Optional<PasswordResetToken> findByTokenHash(String tokenHash) {
            return tokens.stream()
                .filter(t -> t.tokenHash().equals(tokenHash))
                .findFirst();
        }

        @Override
        public void create(PasswordResetToken token) {
            tokens.add(token);
        }

        @Override
        public void markAsUsed(UUID tokenId, Instant usedAt) {
            tokens.stream()
                .filter(t -> t.id().equals(tokenId))
                .findFirst()
                .ifPresent(t -> {
                    int index = tokens.indexOf(t);
                    tokens.set(index, new PasswordResetToken(
                        t.id(),
                        t.userId(),
                        t.tokenHash(),
                        t.expiresAt(),
                        usedAt,
                        t.createdAt()
                    ));
                });
        }

        @Override
        public void invalidatePendingTokensForUser(UUID userId) {
            tokens.stream()
                .filter(t -> t.userId().equals(userId) && t.usedAt() == null)
                .forEach(t -> {
                    int index = tokens.indexOf(t);
                    tokens.set(index, new PasswordResetToken(
                        t.id(),
                        t.userId(),
                        t.tokenHash(),
                        t.expiresAt(),
                        Instant.now(),
                        t.createdAt()
                    ));
                });
        }
    }

    public static class TestAuthorizationRepository implements AuthorizationRepository {

        private final Map<String, String> roleNames = new HashMap<>();
        private final Map<String, Boolean> roleBuiltIn = new HashMap<>();
        private final Map<String, Set<String>> rolePermissions = new HashMap<>();
        private final Map<UUID, Set<String>> userRoles = new HashMap<>();

        public TestAuthorizationRepository() {
            reset();
        }

        public void reset() {
            roleNames.clear();
            roleBuiltIn.clear();
            rolePermissions.clear();
            userRoles.clear();
            roleNames.put(RoleCodes.SYSTEM_ADMIN, "System administrator");
            roleBuiltIn.put(RoleCodes.SYSTEM_ADMIN, true);
            rolePermissions.put(
                RoleCodes.SYSTEM_ADMIN,
                new LinkedHashSet<>(Set.of(
                    PermissionCodes.USERS_MANAGE,
                    PermissionCodes.ROLES_MANAGE
                ))
            );
        }

        public int userRoleCount() {
            return userRoles.values().stream().mapToInt(Set::size).sum();
        }

        public Set<String> findRoleCodesByUser(UUID userId) {
            return Set.copyOf(userRoles.getOrDefault(userId, Set.of()));
        }

        @Override
        public Set<String> findEffectivePermissionCodes(UUID userId) {
            return userRoles.getOrDefault(userId, Set.of()).stream()
                .flatMap(role -> rolePermissions.getOrDefault(role, Set.of()).stream())
                .collect(Collectors.toCollection(LinkedHashSet::new));
        }

        @Override
        public Set<String> findPermissionCodesByRole(String roleCode) {
            return Set.copyOf(rolePermissions.getOrDefault(roleCode, Set.of()));
        }

        @Override
        public List<String> findRoleCodesForUser(UUID userId) {
            return userRoles.getOrDefault(userId, Set.of()).stream()
                .sorted()
                .toList();
        }

        @Override
        public List<RoleDefinition> findAllRoles() {
            return roleNames.entrySet().stream()
                .sorted(Map.Entry.comparingByKey())
                .map(entry -> new RoleDefinition(
                    entry.getKey(),
                    entry.getValue(),
                    roleBuiltIn.getOrDefault(entry.getKey(), false),
                    rolePermissions.getOrDefault(entry.getKey(), Set.of()).stream()
                        .sorted()
                        .toList()
                ))
                .toList();
        }

        @Override
        public Optional<RoleDefinition> findRoleByCode(String roleCode) {
            if (!roleNames.containsKey(roleCode)) {
                return Optional.empty();
            }
            return Optional.of(new RoleDefinition(
                roleCode,
                roleNames.get(roleCode),
                roleBuiltIn.getOrDefault(roleCode, false),
                rolePermissions.getOrDefault(roleCode, Set.of()).stream()
                    .sorted()
                    .toList()
            ));
        }

        @Override
        public List<PermissionDefinition> findAllPermissions() {
            return List.of(
                new PermissionDefinition(
                    PermissionCodes.ROLES_MANAGE,
                    "Manage roles and their permission assignments"
                ),
                new PermissionDefinition(PermissionCodes.USERS_MANAGE, "Manage users")
            );
        }

        @Override
        public void createRole(RoleDefinition role) {
            if (roleNames.containsKey(role.code())) {
                throw new RoleAlreadyExistsException();
            }
            roleNames.put(role.code(), role.name());
            roleBuiltIn.put(role.code(), role.builtIn());
            rolePermissions.put(role.code(), new LinkedHashSet<>(role.permissionCodes()));
        }

        @Override
        public void assignRoleToUser(UUID userId, String roleCode) {
            if (!rolePermissions.containsKey(roleCode)) {
                throw new RoleNotFoundException(roleCode);
            }
            userRoles.computeIfAbsent(userId, key -> new LinkedHashSet<>()).add(roleCode);
        }

        @Override
        public void removeRoleFromUser(UUID userId, String roleCode) {
            Set<String> roles = userRoles.get(userId);
            if (roles != null) {
                roles.remove(roleCode);
            }
        }

        @Override
        public void grantPermissionToRole(String roleCode, String permissionCode) {
            rolePermissions.computeIfAbsent(roleCode, key -> new LinkedHashSet<>()).add(permissionCode);
        }

        @Override
        public void revokePermissionFromRole(String roleCode, String permissionCode) {
            Set<String> permissions = rolePermissions.get(roleCode);
            if (permissions != null) {
                permissions.remove(permissionCode);
            }
        }
    }

    public static class TestApiTokenRepository implements ApiTokenRepository {

        private record StoredToken(ApiToken token, String tokenHash) {
        }

        private final List<StoredToken> tokens = new ArrayList<>();

        public void replaceWith() {
            tokens.clear();
        }

        public List<ApiToken> all() {
            return tokens.stream()
                .map(StoredToken::token)
                .toList();
        }

        @Override
        public void create(ApiToken token, String tokenHash) {
            tokens.add(new StoredToken(token, tokenHash));
        }

        @Override
        public Optional<ApiToken> findByTokenHash(String tokenHash) {
            return tokens.stream()
                .filter(stored -> stored.tokenHash().equals(tokenHash))
                .map(StoredToken::token)
                .findFirst();
        }

        @Override
        public List<ApiToken> findAllByUserId(UUID userId) {
            return tokens.stream()
                .map(StoredToken::token)
                .filter(token -> token.userId().equals(userId))
                .toList();
        }

        @Override
        public Optional<ApiToken> findByIdAndUserId(UUID id, UUID userId) {
            return tokens.stream()
                .map(StoredToken::token)
                .filter(token -> token.id().equals(id) && token.userId().equals(userId))
                .findFirst();
        }

        @Override
        public void revoke(UUID id, UUID userId, Instant revokedAt) {
            tokens.stream()
                .filter(stored -> stored.token().id().equals(id) && stored.token().userId().equals(userId))
                .findFirst()
                .ifPresent(stored -> replace(stored, new ApiToken(
                    stored.token().id(),
                    stored.token().userId(),
                    stored.token().name(),
                    stored.token().credentialsVersion(),
                    stored.token().createdAt(),
                    stored.token().expiresAt(),
                    stored.token().lastUsedAt(),
                    revokedAt
                )));
        }

        @Override
        public void updateLastUsedAt(UUID id, Instant lastUsedAt) {
            tokens.stream()
                .filter(stored -> stored.token().id().equals(id))
                .findFirst()
                .ifPresent(stored -> replace(stored, new ApiToken(
                    stored.token().id(),
                    stored.token().userId(),
                    stored.token().name(),
                    stored.token().credentialsVersion(),
                    stored.token().createdAt(),
                    stored.token().expiresAt(),
                    lastUsedAt,
                    stored.token().revokedAt()
                )));
        }

        private void replace(StoredToken stored, ApiToken replacement) {
            int index = tokens.indexOf(stored);
            tokens.set(index, new StoredToken(replacement, stored.tokenHash()));
        }
    }
}
