<?php

declare(strict_types=1);

namespace Core\Infrastructure\Auth;

use Core\Domain\Auth\AuthenticationException;
use Core\Domain\Auth\JwtTokenPort;
use Core\Domain\Auth\User;
use Firebase\JWT\ExpiredException;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

/**
 * JWT token adapter using firebase/php-jwt v7.
 *
 * Implements the JwtTokenPort contract from the domain layer.
 * Uses HS256 (HMAC-SHA256) with a shared secret key.
 */
final class JwtTokenAdapter implements JwtTokenPort
{
    private const ALGORITHM = 'HS256';

    /**
     * @param string $secretKey  The HMAC secret key (min 256 bits / 32 bytes)
     * @param int    $ttl        Token time-to-live in seconds (default: 1 hour)
     * @param string $issuer     JWT issuer claim
     */
    public function __construct(
        private readonly string $secretKey,
        private readonly \PDO $pdo,
        private readonly int $ttl = 3600,
        private readonly string $issuer = 'alixar',
    ) {
        if (strlen($secretKey) < 32) {
            throw new \InvalidArgumentException(
                'JWT secret key must be at least 32 characters long.'
            );
        }
    }

    /**
     * @inheritDoc
     */
    #[\Override]
    public function generate(User $user): array
    {
        $now = time();
        $exp = $now + $this->ttl;
        $jti = bin2hex(random_bytes(16)); // Unique token identifier

        $payload = [
            'iss'      => $this->issuer,
            'iat'      => $now,
            'exp'      => $exp,
            'jti'      => $jti,
            'sub'      => $user->getId(),
            'username' => $user->getUsername(),
        ];

        $token = JWT::encode($payload, $this->secretKey, self::ALGORITHM);

        return [
            'token'      => $token,
            'expires_at' => $exp,
            'jti'        => $jti,
        ];
    }

    /**
     * @inheritDoc
     */
    #[\Override]
    public function verify(string $token): array
    {
        try {
            $decoded = JWT::decode($token, new Key($this->secretKey, self::ALGORITHM));

            return [
                'user_id'  => (int) $decoded->sub,
                'username' => $decoded->username,
                'jti'      => $decoded->jti,
                'exp'      => (int) $decoded->exp,
            ];
        } catch (ExpiredException) {
            throw AuthenticationException::tokenExpired();
        } catch (\Throwable) {
            throw AuthenticationException::tokenInvalid();
        }
    }

    /**
     * @inheritDoc
     */
    #[\Override]
    public function revoke(string $jti, int $userId, int $expiresAt): void
    {
        $stmt = $this->pdo->prepare('
            INSERT IGNORE INTO jwt_blacklist (jti, user_id, expires_at)
            VALUES (:jti, :user_id, :expires_at)
        ');
        $stmt->execute([
            'jti'        => $jti,
            'user_id'    => $userId,
            'expires_at' => date('Y-m-d H:i:s', $expiresAt),
        ]);
    }

    /**
     * @inheritDoc
     */
    #[\Override]
    public function isRevoked(string $jti): bool
    {
        $stmt = $this->pdo->prepare('SELECT COUNT(*) FROM jwt_blacklist WHERE jti = :jti');
        $stmt->execute(['jti' => $jti]);

        return (int) $stmt->fetchColumn() > 0;
    }
}
