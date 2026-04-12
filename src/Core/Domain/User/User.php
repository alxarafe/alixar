<?php

declare(strict_types=1);

namespace Core\Domain\User;

class User
{
    public function __construct(
        private ?int $id = null,
        private ?string $login = null,
        private ?string $email = null,
        private ?string $firstname = null,
        private ?string $lastname = null,
    ) {
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'login' => $this->login,
            'email' => $this->email,
            'firstname' => $this->firstname,
            'lastname' => $this->lastname,
        ];
    }
}
