package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.User;
import java.util.List;

public class ListAdminUsersUseCase {

    private final UserRepository userRepository;
    private final AuthorizationRepository authorizationRepository;

    public ListAdminUsersUseCase(
        UserRepository userRepository,
        AuthorizationRepository authorizationRepository
    ) {
        this.userRepository = userRepository;
        this.authorizationRepository = authorizationRepository;
    }

    public AdminUserPage execute(AdminUserSearchQuery query) {
        long total = userRepository.count(query.query(), query.enabled());
        long offset = query.offset();

        if (offset >= total) {
            return new AdminUserPage(List.of(), query.page(), query.size(), total);
        }

        List<AdminUser> items = userRepository.search(query.query(), query.enabled(), offset, query.size())
            .stream()
            .map(this::toAdminUser)
            .toList();

        return new AdminUserPage(items, query.page(), query.size(), total);
    }

    private AdminUser toAdminUser(User user) {
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
