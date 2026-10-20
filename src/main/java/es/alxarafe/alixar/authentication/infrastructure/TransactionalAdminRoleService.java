package es.alxarafe.alixar.authentication.infrastructure;

import es.alxarafe.alixar.authentication.application.CreateRoleUseCase;
import es.alxarafe.alixar.authentication.application.RoleDefinition;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

public class TransactionalAdminRoleService {

    private final CreateRoleUseCase createRoleUseCase;

    public TransactionalAdminRoleService(CreateRoleUseCase createRoleUseCase) {
        this.createRoleUseCase = createRoleUseCase;
    }

    @Transactional
    public RoleDefinition create(String code, String name, List<String> permissionCodes) {
        return createRoleUseCase.execute(code, name, permissionCodes);
    }
}
