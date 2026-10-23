package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.PreparedReadAudit;
import es.alxarafe.alixar.audit.application.ReadAuditKind;
import es.alxarafe.alixar.audit.application.ReadAuditRecorder;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class AuditedAdminReadService {

    private final ListAdminUsersUseCase listAdminUsers;
    private final GetAdminUserUseCase getAdminUser;
    private final ListRolesUseCase listRoles;
    private final GetRoleUseCase getRole;
    private final ReadAuditRecorder readAuditRecorder;

    public AuditedAdminReadService(
        ListAdminUsersUseCase listAdminUsers,
        GetAdminUserUseCase getAdminUser,
        ListRolesUseCase listRoles,
        GetRoleUseCase getRole,
        ReadAuditRecorder readAuditRecorder
    ) {
        this.listAdminUsers = listAdminUsers;
        this.getAdminUser = getAdminUser;
        this.listRoles = listRoles;
        this.getRole = getRole;
        this.readAuditRecorder = readAuditRecorder;
    }

    public AdminUserPage listUsers(AdminUserSearchQuery query) {
        Optional<PreparedReadAudit> audit = readAuditRecorder.prepare(
            AuditResourceType.USER,
            ReadAuditKind.QUERY
        );
        AdminUserPage result = listAdminUsers.execute(query);
        audit.ifPresent(prepared -> readAuditRecorder.record(prepared, null));
        return result;
    }

    public AdminUser getUser(UUID userId) {
        Optional<PreparedReadAudit> audit = readAuditRecorder.prepare(
            AuditResourceType.USER,
            ReadAuditKind.OBJECT
        );
        AdminUser result = getAdminUser.execute(userId);
        audit.ifPresent(prepared -> readAuditRecorder.record(prepared, result.id()));
        return result;
    }

    public List<RoleDefinition> listRoles() {
        Optional<PreparedReadAudit> audit = readAuditRecorder.prepare(
            AuditResourceType.ROLE,
            ReadAuditKind.QUERY
        );
        List<RoleDefinition> result = listRoles.execute();
        audit.ifPresent(prepared -> readAuditRecorder.record(prepared, null));
        return result;
    }

    public RoleDefinition getRole(String roleCode) {
        Optional<PreparedReadAudit> audit = readAuditRecorder.prepare(
            AuditResourceType.ROLE,
            ReadAuditKind.OBJECT
        );
        RoleDefinition result = getRole.execute(roleCode);
        audit.ifPresent(prepared -> readAuditRecorder.record(prepared, result.id()));
        return result;
    }
}
