<?php

declare(strict_types=1);

namespace Plugin\Trading\Domain\SupplierProposal;

class SupplierProposal
{
    /**
     * @param SupplierProposalLine[] $lines
     */
    private function __construct(
        public readonly ?int $id,
        public readonly string $ref,
        public readonly int $thirdPartyId,
        public readonly \DateTimeImmutable $dateProposal,
        public readonly ?\DateTimeImmutable $dateValidity = null,
        public readonly string $status = 'draft',
        public readonly ?string $notePublic = null,
        public readonly ?string $notePrivate = null,
        public readonly float $totalHt = 0.0,
        public readonly float $totalVat = 0.0,
        public readonly float $totalTtc = 0.0,
        public readonly array $lines = [],
        public readonly ?\DateTimeImmutable $createdAt = null,
        public readonly ?\DateTimeImmutable $updatedAt = null
    ) {
}

    public static function create(
        string $ref,
        int $thirdPartyId,
        \DateTimeImmutable $dateProposal,
        ?\DateTimeImmutable $dateValidity = null,
        string $status = 'draft',
        ?string $notePublic = null,
        ?string $notePrivate = null,
        array $lines = []
    ): self {
        return new self(
            null,
            $ref,
            $thirdPartyId,
            $dateProposal,
            $dateValidity,
            $status,
            $notePublic,
            $notePrivate,
            0.0, 0.0, 0.0,
            $lines
        );
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            $data['ref'],
            (int) $data['third_party_id'],
            new \DateTimeImmutable($data['date_proposal']),
            isset($data['date_validity']) ? new \DateTimeImmutable($data['date_validity']) : null,
            $data['status'] ?? 'draft',
            $data['note_public'] ?? null,
            $data['note_private'] ?? null,
            (float) ($data['total_ht'] ?? 0),
            (float) ($data['total_vat'] ?? 0),
            (float) ($data['total_ttc'] ?? 0),
            $data['lines'] ?? [],
            isset($data['created_at']) ? new \DateTimeImmutable($data['created_at']) : null,
            isset($data['updated_at']) ? new \DateTimeImmutable($data['updated_at']) : null
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'ref' => $this->ref,
            'third_party_id' => $this->thirdPartyId,
            'date_proposal' => $this->dateProposal->format('Y-m-d H:i:s'),
            'date_validity' => $this->dateValidity?->format('Y-m-d H:i:s'),
            'status' => $this->status,
            'note_public' => $this->notePublic,
            'note_private' => $this->notePrivate,
            'total_ht' => $this->totalHt,
            'total_vat' => $this->totalVat,
            'total_ttc' => $this->totalTtc,
            'created_at' => $this->createdAt?->format('Y-m-d H:i:s'),
            'updated_at' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
