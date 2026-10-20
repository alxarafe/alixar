package es.alxarafe.alixar.authentication.infrastructure;

import es.alxarafe.alixar.authentication.application.AdminUser;
import es.alxarafe.alixar.authentication.application.CreateAdminUserUseCase;
import es.alxarafe.alixar.authentication.application.UpdateAdminUsernameUseCase;
import java.util.List;
import java.util.UUID;
import org.springframework.transaction.annotation.Transactional;

public class TransactionalAdminUserService {

    private final CreateAdminUserUseCase createAdminUserUseCase;
    private final UpdateAdminUsernameUseCase updateAdminUsernameUseCase;

    public TransactionalAdminUserService(
        CreateAdminUserUseCase createAdminUserUseCase,
        UpdateAdminUsernameUseCase updateAdminUsernameUseCase
    ) {
        this.createAdminUserUseCase = createAdminUserUseCase;
        this.updateAdminUsernameUseCase = updateAdminUsernameUseCase;
    }

    @Transactional
    public AdminUser create(String username, String email, String password, List<String> roleCodes) {
        return createAdminUserUseCase.execute(username, email, password, roleCodes);
    }

    @Transactional
    public AdminUser updateUsername(UUID userId, String newUsername) {
        return updateAdminUsernameUseCase.execute(userId, newUsername);
    }
}
