package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.authentication.application.AdminUser;
import es.alxarafe.alixar.authentication.application.AdminUserPage;
import es.alxarafe.alixar.authentication.application.AdminUserSearchQuery;
import es.alxarafe.alixar.authentication.application.GetAdminUserUseCase;
import es.alxarafe.alixar.authentication.application.ListAdminUsersUseCase;
import es.alxarafe.alixar.authentication.infrastructure.TransactionalAdminUserService;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.util.List;
import java.util.UUID;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(AdminUserEndpoints.BASE_PATH)
class AdminUserController {

    private final ListAdminUsersUseCase listAdminUsers;
    private final GetAdminUserUseCase getAdminUser;
    private final TransactionalAdminUserService adminUserService;

    AdminUserController(
        ListAdminUsersUseCase listAdminUsers,
        GetAdminUserUseCase getAdminUser,
        TransactionalAdminUserService adminUserService
    ) {
        this.listAdminUsers = listAdminUsers;
        this.getAdminUser = getAdminUser;
        this.adminUserService = adminUserService;
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

    @PostMapping(
        consumes = MediaType.APPLICATION_JSON_VALUE,
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    @ResponseStatus(HttpStatus.CREATED)
    AdminUserResponse create(@Valid @RequestBody CreateAdminUserRequest request) {
        return toResponse(adminUserService.create(
            request.username(),
            request.email(),
            request.password(),
            request.roleCodes()
        ));
    }

    @PatchMapping(
        value = AdminUserEndpoints.USER_RELATIVE_PATH,
        consumes = MediaType.APPLICATION_JSON_VALUE,
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    AdminUserResponse updateUsername(
        @PathVariable(AdminUserEndpoints.ID_PATH_VARIABLE) UUID id,
        @Valid @RequestBody UpdateAdminUsernameRequest request
    ) {
        return toResponse(adminUserService.updateUsername(id, request.username()));
    }

    @PatchMapping(
        value = AdminUserEndpoints.ENABLED_RELATIVE_PATH,
        consumes = MediaType.APPLICATION_JSON_VALUE,
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    AdminUserResponse updateEnabled(
        @PathVariable(AdminUserEndpoints.ID_PATH_VARIABLE) UUID id,
        @Valid @RequestBody UpdateEnabledRequest request
    ) {
        return toResponse(adminUserService.setEnabled(id, request.enabled()));
    }

    @PostMapping(
        value = AdminUserEndpoints.PASSWORD_RESET_RELATIVE_PATH,
        consumes = MediaType.APPLICATION_JSON_VALUE
    )
    @ResponseStatus(HttpStatus.NO_CONTENT)
    void resetPassword(
        @PathVariable(AdminUserEndpoints.ID_PATH_VARIABLE) UUID id,
        @Valid @RequestBody ResetPasswordRequest request
    ) {
        adminUserService.resetPassword(id, request.newPassword());
    }

    @PutMapping(
        value = AdminUserEndpoints.ROLES_RELATIVE_PATH,
        consumes = MediaType.APPLICATION_JSON_VALUE,
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    AdminUserResponse replaceRoles(
        @PathVariable(AdminUserEndpoints.ID_PATH_VARIABLE) UUID id,
        @Valid @RequestBody ReplaceRolesRequest request
    ) {
        return toResponse(adminUserService.replaceRoles(id, request.roleCodes()));
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

    record CreateAdminUserRequest(
        @NotBlank(message = "{validation.required}") String username,
        @NotBlank(message = "{validation.required}") @Email(message = "{validation.email}") String email,
        @NotBlank(message = "{validation.required}") String password,
        List<String> roleCodes
    ) {
    }

    record UpdateAdminUsernameRequest(
        @NotBlank(message = "{validation.required}") String username
    ) {
    }

    record UpdateEnabledRequest(
        @NotNull(message = "{validation.required}") Boolean enabled
    ) {
    }

    record ResetPasswordRequest(
        @NotBlank(message = "{validation.required}") String newPassword
    ) {
    }

    record ReplaceRolesRequest(
        @NotNull(message = "{validation.required}") List<String> roleCodes
    ) {
    }
}
