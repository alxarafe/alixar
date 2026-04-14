<?php

declare(strict_types=1);

namespace Plugin\Business\Domain\User;

final class Representative
{
    public function __construct(
        private int $id,
        private string $login,
        private string $email,
        private ?string $firstname,
        private ?string $lastname
    ) {
}

    public function getId(): int
    {
 return $this->id; 
}
    public function getLogin(): string
    {
 return $this->login; 
}
    public function getEmail(): string
    {
 return $this->email; 
}
    public function getFirstname(): ?string
    {
 return $this->firstname; 
}
    public function getLastname(): ?string
    {
 return $this->lastname; 
}

    public function getFullName(): string
    {
        return trim(($this->firstname ?? '') . ' ' . ($this->lastname ?? ''));
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'login' => $this->login,
            'email' => $this->email,
            'firstname' => $this->firstname,
            'lastname' => $this->lastname,
            'fullname' => $this->getFullName(),
        ];
    }
}
