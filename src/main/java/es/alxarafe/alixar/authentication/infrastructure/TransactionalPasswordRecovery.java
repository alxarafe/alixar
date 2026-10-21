package es.alxarafe.alixar.authentication.infrastructure;

import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditActor;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditTrail;
import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import es.alxarafe.alixar.authentication.application.ForgotPasswordUseCase;
import es.alxarafe.alixar.authentication.application.ResetPasswordResult;
import es.alxarafe.alixar.authentication.application.ResetPasswordUseCase;
import org.springframework.transaction.annotation.Transactional;

public class TransactionalPasswordRecovery {

    private final ForgotPasswordUseCase forgotPasswordUseCase;
    private final ResetPasswordUseCase resetPasswordUseCase;
    private final AuditTrail auditTrail;

    public TransactionalPasswordRecovery(
        ForgotPasswordUseCase forgotPasswordUseCase,
        ResetPasswordUseCase resetPasswordUseCase,
        AuditTrail auditTrail
    ) {
        this.forgotPasswordUseCase = forgotPasswordUseCase;
        this.resetPasswordUseCase = resetPasswordUseCase;
        this.auditTrail = auditTrail;
    }

    @Transactional
    public void forgotPassword(String email) {
        forgotPasswordUseCase.execute(email);
    }

    @Transactional
    public void resetPassword(String rawToken, String newPassword) {
        ResetPasswordResult result = resetPasswordUseCase.execute(rawToken, newPassword);
        auditTrail.recordSuccess(
            new AuditActor(result.userId(), result.username(), AuditAuthenticationType.RECOVERY_TOKEN),
            AuditAction.PASSWORD_RESET_COMPLETED,
            AuditResourceType.USER,
            result.userId().toString()
        );
    }
}
