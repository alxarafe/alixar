package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.authentication.application.AuditedAdminReadService;
import es.alxarafe.alixar.authentication.application.RoleDefinition;
import es.alxarafe.alixar.authentication.infrastructure.TransactionalAdminRoleService;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.net.URI;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(AdminUserEndpoints.ROLES_BASE_PATH)
class AdminRoleController {

    private final AuditedAdminReadService adminReadService;
    private final TransactionalAdminRoleService adminRoleService;

    AdminRoleController(
        AuditedAdminReadService adminReadService,
        TransactionalAdminRoleService adminRoleService
    ) {
        this.adminReadService = adminReadService;
        this.adminRoleService = adminRoleService;
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    List<AdminRoleResponse> list() {
        return adminReadService.listRoles().stream()
            .map(this::toResponse)
            .toList();
    }

    @GetMapping(
        value = AdminUserEndpoints.ROLE_RELATIVE_PATH,
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    AdminRoleResponse get(@PathVariable(AdminUserEndpoints.ROLE_CODE_PATH_VARIABLE) String code) {
        return toResponse(adminReadService.getRole(code));
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

    @PatchMapping(
        value = AdminUserEndpoints.ROLE_RELATIVE_PATH,
        consumes = MediaType.APPLICATION_JSON_VALUE,
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    AdminRoleResponse updateName(
        @PathVariable(AdminUserEndpoints.ROLE_CODE_PATH_VARIABLE) String code,
        @Valid @RequestBody UpdateRoleNameRequest request
    ) {
        return toResponse(adminRoleService.updateName(code, request.name()));
    }

    @PutMapping(
        value = AdminUserEndpoints.ROLE_PERMISSIONS_RELATIVE_PATH,
        consumes = MediaType.APPLICATION_JSON_VALUE,
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    AdminRoleResponse replacePermissions(
        @PathVariable(AdminUserEndpoints.ROLE_CODE_PATH_VARIABLE) String code,
        @Valid @RequestBody ReplaceRolePermissionsRequest request
    ) {
        return toResponse(adminRoleService.replacePermissions(code, request.permissionCodes()));
    }

    @DeleteMapping(AdminUserEndpoints.ROLE_RELATIVE_PATH)
    ResponseEntity<Void> delete(
        @PathVariable(AdminUserEndpoints.ROLE_CODE_PATH_VARIABLE) String code
    ) {
        adminRoleService.delete(code);
        return ResponseEntity.noContent().build();
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

    record UpdateRoleNameRequest(
        @NotBlank(message = "{validation.required}") String name
    ) {
    }

    record ReplaceRolePermissionsRequest(
        @NotNull(message = "{validation.required}") List<String> permissionCodes
    ) {
    }
}
