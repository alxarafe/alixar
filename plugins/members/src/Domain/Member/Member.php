<?php

declare(strict_types=1);

namespace Plugin\Members\Domain\Member;

class Member
{
    private function __construct(
        public readonly ?int $id,
        public readonly string $ref,
        public readonly int $typeId,
        public readonly ?int $thirdPartyId,
        public readonly string $firstName,
        public readonly string $lastName,
        public readonly ?string $company = null,
        public readonly ?string $email = null,
        public readonly string $status = 'active',
        public readonly ?\DateTimeImmutable $dateStart = null,
        public readonly ?\DateTimeImmutable $dateEnd = null,
        public readonly ?\DateTimeImmutable $createdAt = null,
        public readonly ?\DateTimeImmutable $updatedAt = null
    ) {
}

    public static function create(
        string $ref,
        int $typeId,
        ?int $thirdPartyId,
        string $firstName,
        string $lastName,
        ?string $company = null,
        ?string $email = null,
        string $status = 'active',
        ?\DateTimeImmutable $dateStart = null,
        ?\DateTimeImmutable $dateEnd = null
    ): self {
        return new self(
            null,
            $ref,
            $typeId,
            $thirdPartyId,
            $firstName,
            $lastName,
            $company,
            $email,
            $status,
            $dateStart,
            $dateEnd
        );
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            $data['ref'],
            (int) $data['type_id'],
            isset($data['third_party_id']) ? (int) $data['third_party_id'] : null,
            $data['first_name'],
            $data['last_name'],
            $data['company'] ?? null,
            $data['email'] ?? null,
            $data['status'] ?? 'active',
            isset($data['date_start']) ? new \DateTimeImmutable($data['date_start']) : null,
            isset($data['date_end']) ? new \DateTimeImmutable($data['date_end']) : null,
            isset($data['created_at']) ? new \DateTimeImmutable($data['created_at']) : null,
            isset($data['updated_at']) ? new \DateTimeImmutable($data['updated_at']) : null
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'ref' => $this->ref,
            'type_id' => $this->typeId,
            'third_party_id' => $this->thirdPartyId,
            'first_name' => $this->firstName,
            'last_name' => $this->lastName,
            'company' => $this->company,
            'email' => $this->email,
            'status' => $this->status,
            'date_start' => $this->dateStart?->format('Y-m-d H:i:s'),
            'date_end' => $this->dateEnd?->format('Y-m-d H:i:s'),
            'created_at' => $this->createdAt?->format('Y-m-d H:i:s'),
            'updated_at' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
