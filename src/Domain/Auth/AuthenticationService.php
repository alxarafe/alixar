<?php

declare(strict_types=1);

namespace Core\Domain\Auth;

/**
 * Domain service — Handles user authentication (login/verification).
 *
 * This service orchestrates the authentication flow using domain entities
 * and ports. It does NOT know about JWT, sessions, or HTTP — those are
 * infrastructure concerns handled by controllers and adapters.
 */
class AuthenticationService
{
    public function __construct(
        private readonly UserRepositoryInterface $userRepository,
    ) {
    }

    /**
     * Authenticate a user by username/email and password.
     *
     * @param string $identifier Username or email
     * @param string $password   Plain-text password
     * @return User The authenticated user with loaded roles/permissions
     * @throws AuthenticationException if credentials are invalid or account is inactive
     */
    public function authenticate(string $identifier, string $password): User
    {
        $user = $this->userRepository->findByUsernameOrEmail($identifier);

        if ($user === null) {
            throw AuthenticationException::invalidCredentials();
        }

        if (!$user->isActive()) {
            throw AuthenticationException::accountInactive();
        }

        if (!$user->verifyPassword($password)) {
            throw AuthenticationException::invalidCredentials();
        }

        // Record the login and persist
        $user->recordLogin();
        $this->userRepository->updateLastLogin($user->getId());

        return $user;
    }
}
