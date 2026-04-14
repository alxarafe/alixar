<?php

declare(strict_types=1);

namespace Core\Domain\Auth;

/**
 * Core User entity — represents an authenticated identity in the system.
 *
 * This is a pure domain object with no infrastructure dependencies.
 * The User does not know about "companies" or "tenants" — those concepts
 * live in dedicated plugins.
 */
final class User
{
    /**
     * @param int[]    $roleIds   IDs of assigned roles
     * @param string[] $permissions Computed permission keys (e.g., 'core.user.read')
     */
    public function __construct(
        private ?int $id,
        private string $username,
        private string $email,
        private string $passwordHash,
        private ?string $firstName = null,
        private ?string $lastName = null,
        private string $language = 'en',
        private string $timezone = 'UTC',
        private bool $isActive = true,
        private bool $isSuperadmin = false,
        private ?\DateTimeImmutable $lastLoginAt = null,
        private ?\DateTimeImmutable $createdAt = null,
        private ?\DateTimeImmutable $updatedAt = null,
        private array $roleIds = [],
        private array $permissions = [],
    ) {
    }

    // ── Factory ──────────────────────────────────────────────

    /**
     * Create a new user for registration.
     */
    public static function register(
        string $username,
        string $email,
        string $plainPassword,
        ?string $firstName = null,
        ?string $lastName = null,
        string $language = 'en',
        string $timezone = 'UTC',
    ): self {
        return new self(
            id: null,
            username: $username,
            email: $email,
            passwordHash: password_hash($plainPassword, PASSWORD_BCRYPT),
            firstName: $firstName,
            lastName: $lastName,
            language: $language,
            timezone: $timezone,
        );
    }

    /**
     * Reconstitute from persistence.
     *
     * @param array<string, mixed> $data
     * @param int[]    $roleIds
     * @param string[] $permissions
     */
    public static function fromArray(array $data, array $roleIds = [], array $permissions = []): self
    {
        return new self(
            id: (int) $data['id'],
            username: $data['username'],
            email: $data['email'],
            passwordHash: $data['password_hash'],
            firstName: $data['first_name'] ?? null,
            lastName: $data['last_name'] ?? null,
            language: $data['language'] ?? 'en',
            timezone: $data['timezone'] ?? 'UTC',
            isActive: (bool) ($data['is_active'] ?? true),
            isSuperadmin: (bool) ($data['is_superadmin'] ?? false),
            lastLoginAt: isset($data['last_login_at'])
                ? new \DateTimeImmutable($data['last_login_at'])
                : null,
            createdAt: isset($data['created_at'])
                ? new \DateTimeImmutable($data['created_at'])
                : null,
            updatedAt: isset($data['updated_at'])
                ? new \DateTimeImmutable($data['updated_at'])
                : null,
            roleIds: $roleIds,
            permissions: $permissions,
        );
    }

    // ── Domain Logic ─────────────────────────────────────────

    /**
     * Verify a plain-text password against the stored hash.
     */
    public function verifyPassword(string $plainPassword): bool
    {
        return password_verify($plainPassword, $this->passwordHash);
    }

    /**
     * Change the user's password.
     */
    public function changePassword(string $newPlainPassword): void
    {
        $this->passwordHash = password_hash($newPlainPassword, PASSWORD_BCRYPT);
    }

    /**
     * Change the user's preferred language.
     */
    public function changeLanguage(string $language): void
    {
        $this->language = $language;
    }

    /**
     * Change the user's timezone.
     */
    public function changeTimezone(string $timezone): void
    {
        $this->timezone = $timezone;
    }

    /**
     * Record that the user has logged in.
     */
    public function recordLogin(): void
    {
        $this->lastLoginAt = new \DateTimeImmutable('now', new \DateTimeZone('UTC'));
    }

    /**
     * Activate the user account.
     */
    public function activate(): void
    {
        $this->isActive = true;
    }

    /**
     * Deactivate the user account.
     */
    public function deactivate(): void
    {
        $this->isActive = false;
    }

    // ── Accessors ────────────────────────────────────────────

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUsername(): string
    {
        return $this->username;
    }

    public function getEmail(): string
    {
        return $this->email;
    }

    public function getPasswordHash(): string
    {
        return $this->passwordHash;
    }

    public function getFirstName(): ?string
    {
        return $this->firstName;
    }

    public function getLastName(): ?string
    {
        return $this->lastName;
    }

    public function getFullName(): string
    {
        return trim(($this->firstName ?? '') . ' ' . ($this->lastName ?? ''));
    }

    public function getLanguage(): string
    {
        return $this->language;
    }

    public function getTimezone(): string
    {
        return $this->timezone;
    }

    public function isActive(): bool
    {
        return $this->isActive;
    }

    public function isSuperadmin(): bool
    {
        return $this->isSuperadmin;
    }

    public function getLastLoginAt(): ?\DateTimeImmutable
    {
        return $this->lastLoginAt;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->createdAt;
    }

    public function getUpdatedAt(): ?\DateTimeImmutable
    {
        return $this->updatedAt;
    }

    /**
     * @return int[]
     */
    public function getRoleIds(): array
    {
        return $this->roleIds;
    }

    /**
     * @return string[]
     */
    public function getPermissions(): array
    {
        return $this->permissions;
    }

    /**
     * Set computed permissions (loaded from DB via roles).
     *
     * @param string[] $permissions
     */
    public function setPermissions(array $permissions): void
    {
        $this->permissions = $permissions;
    }

    /**
     * Set role IDs.
     *
     * @param int[] $roleIds
     */
    public function setRoleIds(array $roleIds): void
    {
        $this->roleIds = $roleIds;
    }

    // ── Serialization ────────────────────────────────────────

    /**
     * Convert to array for API responses (no sensitive data).
     *
     * @return array<string, mixed>
     */
    public function toPublicArray(): array
    {
        return [
            'id'            => $this->id,
            'username'      => $this->username,
            'email'         => $this->email,
            'first_name'    => $this->firstName,
            'last_name'     => $this->lastName,
            'full_name'     => $this->getFullName(),
            'language'      => $this->language,
            'timezone'      => $this->timezone,
            'is_active'     => $this->isActive,
            'is_superadmin' => $this->isSuperadmin,
            'last_login_at' => $this->lastLoginAt?->format('Y-m-d\TH:i:s\Z'),
            'created_at'    => $this->createdAt?->format('Y-m-d\TH:i:s\Z'),
            'roles'         => $this->roleIds,
        ];
    }

    /**
     * Convert to array for persistence.
     *
     * @return array<string, mixed>
     */
    public function toPersistenceArray(): array
    {
        return [
            'username'      => $this->username,
            'email'         => $this->email,
            'password_hash' => $this->passwordHash,
            'first_name'    => $this->firstName,
            'last_name'     => $this->lastName,
            'language'      => $this->language,
            'timezone'      => $this->timezone,
            'is_active'     => $this->isActive ? 1 : 0,
            'is_superadmin' => $this->isSuperadmin ? 1 : 0,
            'last_login_at' => $this->lastLoginAt?->format('Y-m-d H:i:s'),
        ];
    }
}
