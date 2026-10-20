package es.alxarafe.alixar.authentication.infrastructure.persistence;

import es.alxarafe.alixar.authentication.application.AuthorizationRepository;
import es.alxarafe.alixar.authentication.application.RoleDefinition;
import es.alxarafe.alixar.authentication.application.RoleNotFoundException;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
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
    private static final Field<String> ROLE_NAME = field(name("authentication_role", "name"), String.class);
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
    public List<String> findRoleCodesForUser(UUID userId) {
        return dsl.select(ROLE_CODE)
            .from(USER_ROLE_TABLE)
            .join(ROLE_TABLE)
            .on(ROLE_ID.eq(USER_ROLE_ROLE_ID))
            .where(USER_ROLE_USER_ID.eq(userId))
            .orderBy(ROLE_CODE)
            .fetch(ROLE_CODE);
    }

    @Override
    public List<RoleDefinition> findAllRoles() {
        var records = dsl.select(ROLE_CODE, ROLE_NAME, ROLE_PERMISSION_PERMISSION_CODE)
            .from(ROLE_TABLE)
            .leftJoin(ROLE_PERMISSION_TABLE)
            .on(ROLE_PERMISSION_ROLE_ID.eq(ROLE_ID))
            .orderBy(ROLE_CODE, ROLE_PERMISSION_PERMISSION_CODE)
            .fetch();

        Map<String, String> names = new LinkedHashMap<>();
        Map<String, LinkedHashSet<String>> permissionCodes = new LinkedHashMap<>();

        for (Record record : records) {
            String roleCode = record.get(ROLE_CODE);
            names.putIfAbsent(roleCode, record.get(ROLE_NAME));
            LinkedHashSet<String> permissions = permissionCodes.computeIfAbsent(
                roleCode,
                key -> new LinkedHashSet<>()
            );
            String permissionCode = record.get(ROLE_PERMISSION_PERMISSION_CODE);
            if (permissionCode != null) {
                permissions.add(permissionCode);
            }
        }

        return names.entrySet().stream()
            .map(entry -> new RoleDefinition(
                entry.getKey(),
                entry.getValue(),
                List.copyOf(permissionCodes.get(entry.getKey()))
            ))
            .toList();
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
