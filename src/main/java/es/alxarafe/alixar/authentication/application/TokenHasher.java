package es.alxarafe.alixar.authentication.application;

public interface TokenHasher {

    String hash(String token);

    boolean matches(String token, String tokenHash);
}