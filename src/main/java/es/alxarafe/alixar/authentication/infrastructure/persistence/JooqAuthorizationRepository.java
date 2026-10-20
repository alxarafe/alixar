package es.alxarafe.alixar.authentication.infrastructure.persistence;

import es.alxarafe.alixar.authentication.application.AuthorizationRepository;
import es.alxarafe.alixar.authentication.application.RoleNotFoundException;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.UUID;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.Record;
import org.jooq.Table;

import static org.jooq.impl.DSL.field;
import static org.jooq.impl.DSL.name;
import static org.jooq.impl.DSL.table;

public class JooqAuthorizationRepository implements AuthorizationRepository {

    private static final Table<Record> ROLE_TABLE = table(name("authentication_role"));
    private static final Table<Record> ROLE_PERMISSION_TABLE = table(name("authentication_role_permission"));
    private static final Table<Record> USER_ROLE_TABLE = table(name("authentication_user_role"));

    private static final Field<UUID> ROLE_ID = field(name("authentication_role", "id"), UUID.class);
    private static final Field<String> ROLE_CODE = field(name("authentication_role", "code"), String.class);
    private static final Field<UUID> ROLE_PERMISSION_ROLE_ID =
        field(name("authentication_role_permission", "role_id"), UUID.class);
    private static final Field<String> ROLE_PERMISSION_PERMISSION_CODE =
        field(name("authentication_role_permission", "permission_code"), String.class);
    private static final Field<UUID> USER_ROLE_USER_ID =
        field(name("authentication_user_role", "user_id"), UUID.class);
    private static final Field<UUID> USER_ROLE_ROLE_ID =
        field(name("authentication_user_role", "role_id"), UUID.class);

    private final DSLContext dsl;

    public JooqAuthorizationRepository(DSLContext dsl) {
        this.dsl = dsl;
    }

    @Override
    public Set<String> findEffectivePermissionCodes(UUID userId) {
        return new LinkedHashSet<>(dsl
            .selectDistinct(ROLE_PERMISSION_PERMISSION_CODE)
            .from(USER_ROLE_TABLE)
            .join(ROLE_PERMISSION_TABLE)
            .on(ROLE_PERMISSION_ROLE_ID.eq(USER_ROLE_ROLE_ID))
            .where(USER_ROLE_USER_ID.eq(userId))
            .orderBy(ROLE_PERMISSION_PERMISSION_CODE)
            .fetch(ROLE_PERMISSION_PERMISSION_CODE));
    }

    @Override
    public Set<String> findPermissionCodesByRole(String roleCode) {
        return new LinkedHashSet<>(dsl
            .select(ROLE_PERMISSION_PERMISSION_CODE)
            .from(ROLE_PERMISSION_TABLE)
            .where(ROLE_PERMISSION_ROLE_ID.eq(resolveRoleId(roleCode)))
            .orderBy(ROLE_PERMISSION_PERMISSION_CODE)
            .fetch(ROLE_PERMISSION_PERMISSION_CODE));
    }

    @Override
    public void assignRoleToUser(UUID userId, String roleCode) {
        dsl.insertInto(USER_ROLE_TABLE)
            .columns(USER_ROLE_USER_ID, USER_ROLE_ROLE_ID)
            .values(userId, resolveRoleId(roleCode))
            .onConflictDoNothing()
            .execute();
    }

    @Override
    public void removeRoleFromUser(UUID userId, String roleCode) {
        dsl.deleteFrom(USER_ROLE_TABLE)
            .where(USER_ROLE_USER_ID.eq(userId))
            .and(USER_ROLE_ROLE_ID.eq(resolveRoleId(roleCode)))
            .execute();
    }

    @Override
    public void grantPermissionToRole(String roleCode, String permissionCode) {
        dsl.insertInto(ROLE_PERMISSION_TABLE)
            .columns(ROLE_PERMISSION_ROLE_ID, ROLE_PERMISSION_PERMISSION_CODE)
            .values(resolveRoleId(roleCode), permissionCode)
            .onConflictDoNothing()
            .execute();
    }

    @Override
    public void revokePermissionFromRole(String roleCode, String permissionCode) {
        dsl.deleteFrom(ROLE_PERMISSION_TABLE)
            .where(ROLE_PERMISSION_ROLE_ID.eq(resolveRoleId(roleCode)))
            .and(ROLE_PERMISSION_PERMISSION_CODE.eq(permissionCode))
            .execute();
    }

    private UUID resolveRoleId(String roleCode) {
        UUID roleId = dsl.select(ROLE_ID)
            .from(ROLE_TABLE)
            .where(ROLE_CODE.eq(roleCode))
            .fetchOne(ROLE_ID);
        if (roleId == null) {
            throw new RoleNotFoundException(roleCode);
        }
        return roleId;
    }
}
