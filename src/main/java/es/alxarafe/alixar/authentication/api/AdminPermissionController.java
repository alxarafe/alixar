package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.authentication.application.ListPermissionsUseCase;
import es.alxarafe.alixar.authentication.application.PermissionDefinition;
import java.util.List;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(AdminUserEndpoints.PERMISSIONS_BASE_PATH)
class AdminPermissionController {

    private final ListPermissionsUseCase listPermissions;

    AdminPermissionController(ListPermissionsUseCase listPermissions) {
        this.listPermissions = listPermissions;
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    List<AdminPermissionResponse> list() {
        return listPermissions.execute().stream()
            .map(this::toResponse)
            .toList();
    }

    private AdminPermissionResponse toResponse(PermissionDefinition permission) {
        return new AdminPermissionResponse(permission.code(), permission.description());
    }
}
