package es.alxarafe.alixar.authentication.infrastructure;

import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditTrail;
import es.alxarafe.alixar.authentication.application.CreateRoleUseCase;
import es.alxarafe.alixar.authentication.application.DeleteRoleUseCase;
import es.alxarafe.alixar.authentication.application.ReplaceRolePermissionsResult;
import es.alxarafe.alixar.authentication.application.ReplaceRolePermissionsUseCase;
import es.alxarafe.alixar.authentication.application.RoleDefinition;
import es.alxarafe.alixar.authentication.application.UpdateRoleNameResult;
import es.alxarafe.alixar.authentication.application.UpdateRoleNameUseCase;
import java.util.List;
import java.util.UUID;
import org.springframework.transaction.annotation.Transactional;

public class TransactionalAdminRoleService {

    private final CreateRoleUseCase createRoleUseCase;
    private final UpdateRoleNameUseCase updateRoleNameUseCase;
    private final ReplaceRolePermissionsUseCase replaceRolePermissionsUseCase;
    private final DeleteRoleUseCase deleteRoleUseCase;
    private final AuditTrail auditTrail;

    public TransactionalAdminRoleService(
        CreateRoleUseCase createRoleUseCase,
        UpdateRoleNameUseCase updateRoleNameUseCase,
        ReplaceRolePermissionsUseCase replaceRolePermissionsUseCase,
        DeleteRoleUseCase deleteRoleUseCase,
        AuditTrail auditTrail
    ) {
        this.createRoleUseCase = createRoleUseCase;
        this.updateRoleNameUseCase = updateRoleNameUseCase;
        this.replaceRolePermissionsUseCase = replaceRolePermissionsUseCase;
        this.deleteRoleUseCase = deleteRoleUseCase;
        this.auditTrail = auditTrail;
    }

    @Transactional
    public RoleDefinition create(String code, String name, List<String> permissionCodes) {
        RoleDefinition role = createRoleUseCase.execute(code, name, permissionCodes);
        auditTrail.recordSuccess(
            AuditAction.ROLE_CREATED,
            AuditResourceType.ROLE,
            role.id().toString()
        );
        return role;
    }

    @Transactional
    public RoleDefinition updateName(String code, String name) {
        UpdateRoleNameResult result = updateRoleNameUseCase.execute(code, name);
        if (result.changed()) {
            auditTrail.recordSuccess(
                AuditAction.ROLE_RENAMED,
                AuditResourceType.ROLE,
                result.role().id().toString()
            );
        }
        return result.role();
    }

    @Transactional
    public RoleDefinition replacePermissions(String code, List<String> permissionCodes) {
        ReplaceRolePermissionsResult result = replaceRolePermissionsUseCase.execute(code, permissionCodes);
        if (result.changed()) {
            auditTrail.recordSuccess(
                AuditAction.ROLE_PERMISSIONS_REPLACED,
                AuditResourceType.ROLE,
                result.role().id().toString()
            );
        }
        return result.role();
    }

    @Transactional
    public void delete(String code) {
        UUID roleId = deleteRoleUseCase.execute(code);
        auditTrail.recordSuccess(
            AuditAction.ROLE_DELETED,
            AuditResourceType.ROLE,
            roleId.toString()
        );
    }
}
