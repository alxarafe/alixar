package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.authentication.application.GetRoleUseCase;
import es.alxarafe.alixar.authentication.application.ListRolesUseCase;
import es.alxarafe.alixar.authentication.application.RoleDefinition;
import es.alxarafe.alixar.authentication.infrastructure.TransactionalAdminRoleService;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import java.net.URI;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(AdminUserEndpoints.ROLES_BASE_PATH)
class AdminRoleController {

    private final ListRolesUseCase listRoles;
    private final GetRoleUseCase getRole;
    private final TransactionalAdminRoleService adminRoleService;

    AdminRoleController(
        ListRolesUseCase listRoles,
        GetRoleUseCase getRole,
        TransactionalAdminRoleService adminRoleService
    ) {
        this.listRoles = listRoles;
        this.getRole = getRole;
        this.adminRoleService = adminRoleService;
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    List<AdminRoleResponse> list() {
        return listRoles.execute().stream()
            .map(this::toResponse)
            .toList();
    }

    @GetMapping(
        value = AdminUserEndpoints.ROLE_RELATIVE_PATH,
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    AdminRoleResponse get(@PathVariable(AdminUserEndpoints.ROLE_CODE_PATH_VARIABLE) String code) {
        return toResponse(getRole.execute(code));
    }

    @PostMapping(
        consumes = MediaType.APPLICATION_JSON_VALUE,
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    ResponseEntity<AdminRoleResponse> create(@Valid @RequestBody CreateRoleRequest request) {
        AdminRoleResponse response = toResponse(adminRoleService.create(
            request.code(),
            request.name(),
            request.permissionCodes()
        ));
        return ResponseEntity.status(HttpStatus.CREATED)
            .location(URI.create(AdminUserEndpoints.ROLES_BASE_PATH + "/" + response.code()))
            .body(response);
    }

    private AdminRoleResponse toResponse(RoleDefinition role) {
        return new AdminRoleResponse(
            role.code(),
            role.name(),
            role.builtIn(),
            role.permissionCodes()
        );
    }

    record CreateRoleRequest(
        @NotBlank(message = "{validation.required}") String code,
        @NotBlank(message = "{validation.required}") String name,
        List<String> permissionCodes
    ) {
    }
}
