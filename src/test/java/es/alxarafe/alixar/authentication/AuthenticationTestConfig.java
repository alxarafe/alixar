package es.alxarafe.alixar.authentication;

import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.domain.User;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Optional;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;

@TestConfiguration
public class AuthenticationTestConfig {

    @Bean
    @Primary
    public TestUserRepository testUserRepository() {
        return new TestUserRepository();
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
        public void create(User user) {
            users.add(user);
        }

        private Optional<User> find(java.util.function.Predicate<User> predicate) {
            return users.stream().filter(predicate).findFirst();
        }

        private String normalize(String value) {
            return value.strip().toLowerCase(Locale.ROOT);
        }
    }
}
