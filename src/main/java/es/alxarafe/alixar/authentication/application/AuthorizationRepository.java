package es.alxarafe.alixar.authentication.application;

import java.util.List;
import java.util.Set;
import java.util.UUID;

/**
 * Role-based authorization persistence port.
 *
 * <p>Permissions belong exclusively to roles. There is intentionally no
 * operation that grants, revokes or denies a permission for an individual
 * user. Effective permissions are the union of the permissions of the user's
 * roles.</p>
 */
public interface AuthorizationRepository {

    Set<String> findEffectivePermissionCodes(UUID userId);

    Set<String> findPermissionCodesByRole(String roleCode);

    List<String> findRoleCodesForUser(UUID userId);

    List<RoleDefinition> findAllRoles();

    List<PermissionDefinition> findAllPermissions();

    void assignRoleToUser(UUID userId, String roleCode);

    void removeRoleFromUser(UUID userId, String roleCode);

    void grantPermissionToRole(String roleCode, String permissionCode);

    void revokePermissionFromRole(String roleCode, String permissionCode);
}
