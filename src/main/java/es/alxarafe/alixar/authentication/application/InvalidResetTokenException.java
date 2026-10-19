package es.alxarafe.alixar.authentication.application;

public class InvalidResetTokenException extends RuntimeException {

    public InvalidResetTokenException() {
        super("Invalid or expired reset token");
    }
}