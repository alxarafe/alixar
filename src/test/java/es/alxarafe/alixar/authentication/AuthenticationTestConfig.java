package es.alxarafe.alixar.authentication;

import es.alxarafe.alixar.authentication.application.PasswordResetTokenRepository;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.domain.PasswordResetToken;
import es.alxarafe.alixar.authentication.domain.User;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Optional;
import java.util.UUID;
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

    public static class TestUserRepository implements UserRepository {

        private final List<User> users = new ArrayList<>();

        public void replaceWith(User... replacementUsers) {
            users.clear();
            users.addAll(List.of(replacementUsers));
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
}
