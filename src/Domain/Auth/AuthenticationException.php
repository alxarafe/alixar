<?php

declare(strict_types=1);

namespace Core\Domain\Auth;

/**
 * Authentication exception — thrown when login fails.
 */
final class AuthenticationException extends \DomainException
{
    public static function invalidCredentials(): self
    {
        return new self('Invalid username/email or password.', 401);
    }

    public static function accountInactive(): self
    {
        return new self('User account is inactive.', 403);
    }

    public static function tokenExpired(): self
    {
        return new self('Authentication token has expired.', 401);
    }

    public static function tokenInvalid(): self
    {
        return new self('Authentication token is invalid.', 401);
    }

    public static function tokenRevoked(): self
    {
        return new self('Authentication token has been revoked.', 401);
    }

    public static function unauthorized(): self
    {
        return new self('Authentication required.', 401);
    }
}
