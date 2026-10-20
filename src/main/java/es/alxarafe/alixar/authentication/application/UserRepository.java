package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.User;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface UserRepository {

    Optional<User> findByIdentifier(String identifier);

    Optional<User> findByUsername(String username);

    Optional<User> findByEmail(String email);

    Optional<User> findById(UUID id);

    List<User> search(String query, Boolean enabled, long offset, int limit);

    long count(String query, Boolean enabled);

    void create(User user);

    void updateUsername(UUID userId, String newUsername);

    void updateEnabledAndCredentialsVersion(UUID userId, boolean enabled, long newCredentialsVersion);

    void updatePasswordAndCredentialsVersion(UUID userId, String newPasswordHash, long newCredentialsVersion);
}
