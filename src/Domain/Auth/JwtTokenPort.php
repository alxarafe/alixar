<?php

declare(strict_types=1);

namespace Core\Domain\Auth;

/**
 * Port (driven) — Contract for JWT token generation and verification.
 *
 * The domain defines WHAT it needs (tokens), not HOW they are implemented.
 * The infrastructure adapter (JwtTokenAdapter) uses firebase/php-jwt or similar.
 */
interface JwtTokenPort
{
    /**
     * Generate a signed JWT for a user.
     *
     * @param User $user The authenticated user
     * @return array{token: string, expires_at: int, jti: string}
     */
    public function generate(User $user): array;

    /**
     * Verify and decode a JWT token.
     *
     * @param string $token The raw JWT string
     * @return array{user_id: int, username: string, jti: string, exp: int}
     * @throws \RuntimeException if the token is invalid, expired, or tampered
     */
    public function verify(string $token): array;

    /**
     * Revoke a token by adding its JTI to the blacklist.
     *
     * @param string $jti       JWT ID
     * @param int    $userId    User who owned the token
     * @param int    $expiresAt Token expiration timestamp (for auto-cleanup)
     */
    public function revoke(string $jti, int $userId, int $expiresAt): void;

    /**
     * Check if a token JTI has been revoked.
     */
    public function isRevoked(string $jti): bool;
}
