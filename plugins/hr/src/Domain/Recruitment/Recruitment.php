<?php

declare(strict_types=1);

namespace Plugin\Hr\Domain\Recruitment;

class Recruitment
{
    private function __construct(
        public readonly ?int $id,
        public readonly string $ref,
        public readonly string $positionId,
        public readonly string $candidateFirstName,
        public readonly string $candidateLastName,
        public readonly string $candidateEmail,
        public readonly string $status = 'new',
        public readonly ?string $notes = null,
        public readonly ?\DateTimeImmutable $createdAt = null,
        public readonly ?\DateTimeImmutable $updatedAt = null
    ) {
}

    public static function create(
        string $ref,
        string $positionId,
        string $candidateFirstName,
        string $candidateLastName,
        string $candidateEmail,
        string $status = 'new',
        ?string $notes = null
    ): self {
        return new self(
            null,
            $ref,
            $positionId,
            $candidateFirstName,
            $candidateLastName,
            $candidateEmail,
            $status,
            $notes
        );
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            $data['ref'],
            $data['position_id'],
            $data['candidate_first_name'],
            $data['candidate_last_name'],
            $data['candidate_email'],
            $data['status'] ?? 'new',
            $data['notes'] ?? null,
            isset($data['created_at']) ? new \DateTimeImmutable($data['created_at']) : null,
            isset($data['updated_at']) ? new \DateTimeImmutable($data['updated_at']) : null
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'ref' => $this->ref,
            'position_id' => $this->positionId,
            'candidate_first_name' => $this->candidateFirstName,
            'candidate_last_name' => $this->candidateLastName,
            'candidate_email' => $this->candidateEmail,
            'status' => $this->status,
            'notes' => $this->notes,
            'created_at' => $this->createdAt?->format('Y-m-d H:i:s'),
            'updated_at' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
