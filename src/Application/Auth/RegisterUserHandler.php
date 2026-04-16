<?php

declare(strict_types=1);

namespace Core\Application\Auth;

use Core\Domain\Auth\User;
use Core\Domain\Auth\UserRepositoryInterface;

/**
 * Use case: Register a new user.
 *
 * Creates a user with the given credentials and optional profile data.
 * The user starts as a standard (non-superadmin) active account.
 */
final class RegisterUserHandler
{
    public function __construct(
        private readonly UserRepositoryInterface $userRepository,
    ) {
    }

    /**
     * @param array{
     *     username: string,
     *     email: string,
     *     password: string,
     *     first_name?: string,
     *     last_name?: string,
     *     language?: string,
     *     timezone?: string,
     *     role_ids?: int[]
     * } $data
     *
     * @return User|null The newly created user
     *
     * @throws \DomainException if username or email already exists
     */
    public function handle(array $data): User|null
    {
        // Check uniqueness
        if ($this->userRepository->findByUsername($data['username']) !== null) {
            throw new \DomainException("Username '{$data['username']}' is already taken.");
        }

        if ($this->userRepository->findByEmail($data['email']) !== null) {
            throw new \DomainException("Email '{$data['email']}' is already registered.");
        }

        // Create domain entity
        $user = User::register(
            username: $data['username'],
            email: $data['email'],
            plainPassword: $data['password'],
            firstName: $data['first_name'] ?? null,
            lastName: $data['last_name'] ?? null,
            language: $data['language'] ?? 'en',
            timezone: $data['timezone'] ?? 'UTC',
        );

        // Persist
        $user = $this->userRepository->save($user);

        // Assign roles if provided
        if (!empty($data['role_ids']) && $user->getId() !== null) {
            $this->userRepository->syncRoles($user->getId(), $data['role_ids']);
            $user = $this->userRepository->findById($user->getId());
        }

        return $user;
    }
}
