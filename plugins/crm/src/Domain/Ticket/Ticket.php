<?php

declare(strict_types=1);

namespace Plugin\Crm\Domain\Ticket;

class Ticket
{
    private function __construct(
        public readonly ?int $id,
        public readonly string $ref,
        public readonly string $trackId,
        public readonly ?int $thirdPartyId,
        public readonly ?int $contactId,
        public readonly string $subject,
        public readonly string $description,
        public readonly string $type = 'question',
        public readonly string $severity = 'medium',
        public readonly string $status = 'open',
        public readonly ?\DateTimeImmutable $dateOpened = null,
        public readonly ?\DateTimeImmutable $dateClosed = null,
        public readonly ?\DateTimeImmutable $createdAt = null,
        public readonly ?\DateTimeImmutable $updatedAt = null
    ) {
}

    public static function create(
        string $ref,
        string $trackId,
        ?int $thirdPartyId,
        ?int $contactId,
        string $subject,
        string $description,
        string $type = 'question',
        string $severity = 'medium'
    ): self {
        return new self(
            null,
            $ref,
            $trackId,
            $thirdPartyId,
            $contactId,
            $subject,
            $description,
            $type,
            $severity,
            'open',
            new \DateTimeImmutable()
        );
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            $data['ref'],
            $data['track_id'],
            isset($data['third_party_id']) ? (int) $data['third_party_id'] : null,
            isset($data['contact_id']) ? (int) $data['contact_id'] : null,
            $data['subject'],
            $data['description'],
            $data['type'] ?? 'question',
            $data['severity'] ?? 'medium',
            $data['status'] ?? 'open',
            isset($data['date_opened']) ? new \DateTimeImmutable($data['date_opened']) : null,
            isset($data['date_closed']) ? new \DateTimeImmutable($data['date_closed']) : null,
            isset($data['created_at']) ? new \DateTimeImmutable($data['created_at']) : null,
            isset($data['updated_at']) ? new \DateTimeImmutable($data['updated_at']) : null
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'ref' => $this->ref,
            'track_id' => $this->trackId,
            'third_party_id' => $this->thirdPartyId,
            'contact_id' => $this->contactId,
            'subject' => $this->subject,
            'description' => $this->description,
            'type' => $this->type,
            'severity' => $this->severity,
            'status' => $this->status,
            'date_opened' => $this->dateOpened?->format('Y-m-d H:i:s'),
            'date_closed' => $this->dateClosed?->format('Y-m-d H:i:s'),
            'created_at' => $this->createdAt?->format('Y-m-d H:i:s'),
            'updated_at' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
