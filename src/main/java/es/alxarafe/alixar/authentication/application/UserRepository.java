package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.User;
import java.util.Optional;
import java.util.UUID;

public interface UserRepository {

    Optional<User> findByIdentifier(String identifier);

    Optional<User> findByUsername(String username);

    Optional<User> findByEmail(String email);

    Optional<User> findById(UUID id);

    void create(User user);

    void updateUsername(UUID userId, String newUsername);

    void updatePasswordAndCredentialsVersion(UUID userId, String newPasswordHash, long newCredentialsVersion);
}
