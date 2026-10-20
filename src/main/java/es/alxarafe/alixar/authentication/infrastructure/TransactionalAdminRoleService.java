package es.alxarafe.alixar.authentication.infrastructure;

import es.alxarafe.alixar.authentication.application.CreateRoleUseCase;
import es.alxarafe.alixar.authentication.application.DeleteRoleUseCase;
import es.alxarafe.alixar.authentication.application.ReplaceRolePermissionsUseCase;
import es.alxarafe.alixar.authentication.application.RoleDefinition;
import es.alxarafe.alixar.authentication.application.UpdateRoleNameUseCase;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

public class TransactionalAdminRoleService {

    private final CreateRoleUseCase createRoleUseCase;
    private final UpdateRoleNameUseCase updateRoleNameUseCase;
    private final ReplaceRolePermissionsUseCase replaceRolePermissionsUseCase;
    private final DeleteRoleUseCase deleteRoleUseCase;

    public TransactionalAdminRoleService(
        CreateRoleUseCase createRoleUseCase,
        UpdateRoleNameUseCase updateRoleNameUseCase,
        ReplaceRolePermissionsUseCase replaceRolePermissionsUseCase,
        DeleteRoleUseCase deleteRoleUseCase
    ) {
        this.createRoleUseCase = createRoleUseCase;
        this.updateRoleNameUseCase = updateRoleNameUseCase;
        this.replaceRolePermissionsUseCase = replaceRolePermissionsUseCase;
        this.deleteRoleUseCase = deleteRoleUseCase;
    }

    @Transactional
    public RoleDefinition create(String code, String name, List<String> permissionCodes) {
        return createRoleUseCase.execute(code, name, permissionCodes);
    }

    @Transactional
    public RoleDefinition updateName(String code, String name) {
        return updateRoleNameUseCase.execute(code, name);
    }

    @Transactional
    public RoleDefinition replacePermissions(String code, List<String> permissionCodes) {
        return replaceRolePermissionsUseCase.execute(code, permissionCodes);
    }

    @Transactional
    public void delete(String code) {
        deleteRoleUseCase.execute(code);
    }
}
