package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.authentication.application.AdminUser;
import es.alxarafe.alixar.authentication.application.AdminUserPage;
import es.alxarafe.alixar.authentication.application.AdminUserSearchQuery;
import es.alxarafe.alixar.authentication.application.GetAdminUserUseCase;
import es.alxarafe.alixar.authentication.application.ListAdminUsersUseCase;
import java.util.UUID;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(AdminUserEndpoints.BASE_PATH)
class AdminUserController {

    private final ListAdminUsersUseCase listAdminUsers;
    private final GetAdminUserUseCase getAdminUser;

    AdminUserController(
        ListAdminUsersUseCase listAdminUsers,
        GetAdminUserUseCase getAdminUser
    ) {
        this.listAdminUsers = listAdminUsers;
        this.getAdminUser = getAdminUser;
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    AdminUserPageResponse list(
        @RequestParam(name = AdminUserEndpoints.PAGE_PARAM, required = false) Integer page,
        @RequestParam(name = AdminUserEndpoints.SIZE_PARAM, required = false) Integer size,
        @RequestParam(name = AdminUserEndpoints.QUERY_PARAM, required = false) String query,
        @RequestParam(name = AdminUserEndpoints.ENABLED_PARAM, required = false) Boolean enabled
    ) {
        AdminUserPage result = listAdminUsers.execute(AdminUserSearchQuery.of(page, size, query, enabled));
        return new AdminUserPageResponse(
            result.items().stream().map(this::toResponse).toList(),
            result.page(),
            result.size(),
            result.total()
        );
    }

    @GetMapping(value = AdminUserEndpoints.USER_RELATIVE_PATH, produces = MediaType.APPLICATION_JSON_VALUE)
    AdminUserResponse get(@PathVariable(AdminUserEndpoints.ID_PATH_VARIABLE) UUID id) {
        return toResponse(getAdminUser.execute(id));
    }

    private AdminUserResponse toResponse(AdminUser user) {
        return new AdminUserResponse(
            user.id(),
            user.username(),
            user.email(),
            user.enabled(),
            user.createdAt(),
            user.updatedAt(),
            user.roleCodes()
        );
    }
}
