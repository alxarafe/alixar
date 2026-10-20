package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.authentication.application.ListRolesUseCase;
import es.alxarafe.alixar.authentication.application.RoleDefinition;
import java.util.List;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(AdminUserEndpoints.ROLES_BASE_PATH)
class AdminRoleController {

    private final ListRolesUseCase listRoles;

    AdminRoleController(ListRolesUseCase listRoles) {
        this.listRoles = listRoles;
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    List<AdminRoleResponse> list() {
        return listRoles.execute().stream()
            .map(this::toResponse)
            .toList();
    }

    private AdminRoleResponse toResponse(RoleDefinition role) {
        return new AdminRoleResponse(role.code(), role.name(), role.permissionCodes());
    }
}
