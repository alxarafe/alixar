package es.alxarafe.alixar.authentication.infrastructure;

import es.alxarafe.alixar.authentication.application.ChangePasswordUseCase;
import es.alxarafe.alixar.authentication.application.ChangeUsernameUseCase;
import es.alxarafe.alixar.authentication.domain.User;
import java.util.UUID;
import org.springframework.transaction.annotation.Transactional;

public class TransactionalUserSelfService {

    private final ChangeUsernameUseCase changeUsernameUseCase;
    private final ChangePasswordUseCase changePasswordUseCase;

    public TransactionalUserSelfService(
        ChangeUsernameUseCase changeUsernameUseCase,
        ChangePasswordUseCase changePasswordUseCase
    ) {
        this.changeUsernameUseCase = changeUsernameUseCase;
        this.changePasswordUseCase = changePasswordUseCase;
    }

    @Transactional
    public User changeUsername(UUID userId, String newUsername) {
        return changeUsernameUseCase.execute(userId, newUsername);
    }

    @Transactional
    public User changePassword(UUID userId, String currentPassword, String newPassword) {
        return changePasswordUseCase.execute(userId, currentPassword, newPassword);
    }
}
