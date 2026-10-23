package es.alxarafe.alixar.authentication.infrastructure;

import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditTrail;
import es.alxarafe.alixar.authentication.application.ChangePasswordUseCase;
import es.alxarafe.alixar.authentication.application.ChangeUsernameResult;
import es.alxarafe.alixar.authentication.application.ChangeUsernameUseCase;
import es.alxarafe.alixar.authentication.domain.User;
import java.util.UUID;
import org.springframework.transaction.annotation.Transactional;

public class TransactionalUserSelfService {

    private final ChangeUsernameUseCase changeUsernameUseCase;
    private final ChangePasswordUseCase changePasswordUseCase;
    private final AuditTrail auditTrail;

    public TransactionalUserSelfService(
        ChangeUsernameUseCase changeUsernameUseCase,
        ChangePasswordUseCase changePasswordUseCase,
        AuditTrail auditTrail
    ) {
        this.changeUsernameUseCase = changeUsernameUseCase;
        this.changePasswordUseCase = changePasswordUseCase;
        this.auditTrail = auditTrail;
    }

    @Transactional
    public User changeUsername(UUID userId, String newUsername) {
        ChangeUsernameResult result = changeUsernameUseCase.execute(userId, newUsername);
        if (result.changed()) {
            auditTrail.recordSuccess(
                AuditAction.USER_USERNAME_CHANGED,
                AuditResourceType.USER,
                userId.toString()
            );
        }
        return result.user();
    }

    @Transactional
    public User changePassword(UUID userId, String currentPassword, String newPassword) {
        User updated = changePasswordUseCase.execute(userId, currentPassword, newPassword);
        auditTrail.recordSuccess(
            AuditAction.USER_PASSWORD_CHANGED,
            AuditResourceType.USER,
            userId.toString()
        );
        return updated;
    }
}
