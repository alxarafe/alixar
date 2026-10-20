package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.User;
import java.util.UUID;

public class GetAdminUserUseCase {

    private final UserRepository userRepository;
    private final AuthorizationRepository authorizationRepository;

    public GetAdminUserUseCase(
        UserRepository userRepository,
        AuthorizationRepository authorizationRepository
    ) {
        this.userRepository = userRepository;
        this.authorizationRepository = authorizationRepository;
    }

    public AdminUser execute(UUID userId) {
        User user = userRepository.findById(userId)
            .orElseThrow(() -> new UserNotFoundException(userId));

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
}
