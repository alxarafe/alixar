package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.User;
import java.util.Optional;

public interface UserRepository {

    Optional<User> findByIdentifier(String identifier);

    Optional<User> findByUsername(String username);

    Optional<User> findByEmail(String email);

    void create(User user);
}
