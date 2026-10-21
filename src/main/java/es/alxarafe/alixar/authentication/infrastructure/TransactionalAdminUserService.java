package es.alxarafe.alixar.authentication.infrastructure;

import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditTrail;
import es.alxarafe.alixar.authentication.application.AdminUser;
import es.alxarafe.alixar.authentication.application.CreateAdminUserUseCase;
import es.alxarafe.alixar.authentication.application.ReplaceAdminUserRolesUseCase;
import es.alxarafe.alixar.authentication.application.ResetAdminUserPasswordUseCase;
import es.alxarafe.alixar.authentication.application.SetAdminUserEnabledResult;
import es.alxarafe.alixar.authentication.application.SetAdminUserEnabledUseCase;
import es.alxarafe.alixar.authentication.application.UpdateAdminUsernameUseCase;
import java.util.List;
import java.util.UUID;
import org.springframework.transaction.annotation.Transactional;

public class TransactionalAdminUserService {

    private final CreateAdminUserUseCase createAdminUserUseCase;
    private final UpdateAdminUsernameUseCase updateAdminUsernameUseCase;
    private final SetAdminUserEnabledUseCase setAdminUserEnabledUseCase;
    private final ResetAdminUserPasswordUseCase resetAdminUserPasswordUseCase;
    private final ReplaceAdminUserRolesUseCase replaceAdminUserRolesUseCase;
    private final AuditTrail auditTrail;

    public TransactionalAdminUserService(
        CreateAdminUserUseCase createAdminUserUseCase,
        UpdateAdminUsernameUseCase updateAdminUsernameUseCase,
        SetAdminUserEnabledUseCase setAdminUserEnabledUseCase,
        ResetAdminUserPasswordUseCase resetAdminUserPasswordUseCase,
        ReplaceAdminUserRolesUseCase replaceAdminUserRolesUseCase,
        AuditTrail auditTrail
    ) {
        this.createAdminUserUseCase = createAdminUserUseCase;
        this.updateAdminUsernameUseCase = updateAdminUsernameUseCase;
        this.setAdminUserEnabledUseCase = setAdminUserEnabledUseCase;
        this.resetAdminUserPasswordUseCase = resetAdminUserPasswordUseCase;
        this.replaceAdminUserRolesUseCase = replaceAdminUserRolesUseCase;
        this.auditTrail = auditTrail;
    }

    @Transactional
    public AdminUser create(String username, String email, String password, List<String> roleCodes) {
        return createAdminUserUseCase.execute(username, email, password, roleCodes);
    }

    @Transactional
    public AdminUser updateUsername(UUID userId, String newUsername) {
        return updateAdminUsernameUseCase.execute(userId, newUsername);
    }

    @Transactional
    public AdminUser setEnabled(UUID userId, boolean enabled) {
        SetAdminUserEnabledResult result = setAdminUserEnabledUseCase.execute(userId, enabled);
        if (result.changed()) {
            auditTrail.recordSuccess(
                result.user().enabled() ? AuditAction.USER_ENABLED : AuditAction.USER_DISABLED,
                AuditResourceType.USER,
                userId.toString()
            );
        }
        return result.user();
    }

    @Transactional
    public void resetPassword(UUID userId, String newPassword) {
        resetAdminUserPasswordUseCase.execute(userId, newPassword);
    }

    @Transactional
    public AdminUser replaceRoles(UUID userId, List<String> roleCodes) {
        return replaceAdminUserRolesUseCase.execute(userId, roleCodes);
    }
}
