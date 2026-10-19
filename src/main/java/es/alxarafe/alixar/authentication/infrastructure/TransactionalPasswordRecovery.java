package es.alxarafe.alixar.authentication.infrastructure;

import es.alxarafe.alixar.authentication.application.ForgotPasswordUseCase;
import es.alxarafe.alixar.authentication.application.ResetPasswordUseCase;
import org.springframework.transaction.annotation.Transactional;

public class TransactionalPasswordRecovery {

    private final ForgotPasswordUseCase forgotPasswordUseCase;
    private final ResetPasswordUseCase resetPasswordUseCase;

    public TransactionalPasswordRecovery(
        ForgotPasswordUseCase forgotPasswordUseCase,
        ResetPasswordUseCase resetPasswordUseCase
    ) {
        this.forgotPasswordUseCase = forgotPasswordUseCase;
        this.resetPasswordUseCase = resetPasswordUseCase;
    }

    @Transactional
    public void forgotPassword(String email) {
        forgotPasswordUseCase.execute(email);
    }

    @Transactional
    public void resetPassword(String rawToken, String newPassword) {
        resetPasswordUseCase.execute(rawToken, newPassword);
    }
}
