package es.alxarafe.alixar.authentication.application;

public interface PasswordResetNotifier {

    void notify(String email, String token, String resetUrl);
}