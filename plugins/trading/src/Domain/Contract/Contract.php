<?php

declare(strict_types=1);

namespace Plugin\Trading\Domain\Contract;

use DateTimeImmutable;
use RuntimeException;

class Contract
{
    private ?int $id;
    private string $ref;
    private int $thirdPartyId;
    private ?string $notePrivate;
    private ?string $notePublic;
    
    private int $status;
    
    private DateTimeImmutable $dateContract;
    private DateTimeImmutable $createdAt;
    private ?DateTimeImmutable $updatedAt;

    /** @var array<ContractLine> */
    private array $lines;

    public function __construct(
        string $ref,
        int $thirdPartyId,
        ?int $id = null
    ) {
        $this->ref = $ref;
        $this->thirdPartyId = $thirdPartyId;
        $this->id = $id;
        
        $this->status = 0;
        $this->notePrivate = null;
        $this->notePublic = null;
        
        $this->dateContract = new DateTimeImmutable();
        $this->createdAt = new DateTimeImmutable();
        $this->updatedAt = null;
        
        $this->lines = [];
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(int $id): self
    {
        $this->id = $id;
        return $this;
    }

    public function getRef(): string
    {
        return $this->ref;
    }

    public function addLine(ContractLine $line): void
    {
        $this->lines[] = $line;
    }

    /**
     * @return array<ContractLine>
     */
    public function getLines(): array
    {
        return $this->lines;
    }

    /**
     * @param array<string, mixed> $data
     */
    public function updateFrom(array $data): void
    {
        if (isset($data['ref'])) $this->ref = $data['ref'];
        if (isset($data['thirdPartyId'])) $this->thirdPartyId = (int)$data['thirdPartyId'];
        if (isset($data['status'])) $this->status = (int)$data['status'];
        if (isset($data['notePrivate'])) $this->notePrivate = $data['notePrivate'];
        if (isset($data['notePublic'])) $this->notePublic = $data['notePublic'];
        
        if (isset($data['dateContract'])) {
            $this->dateContract = is_numeric($data['dateContract']) ? (new DateTimeImmutable())->setTimestamp((int)$data['dateContract']) : new DateTimeImmutable($data['dateContract']);
        }
        if (isset($data['createdAt'])) {
            $this->createdAt = is_numeric($data['createdAt']) ? (new DateTimeImmutable())->setTimestamp((int)$data['createdAt']) : new DateTimeImmutable($data['createdAt']);
        }
        if (isset($data['updatedAt'])) {
            $this->updatedAt = is_numeric($data['updatedAt']) ? (new DateTimeImmutable())->setTimestamp((int)$data['updatedAt']) : new DateTimeImmutable($data['updatedAt']);
        }
        
        if ($this->id !== null) {
            $this->updatedAt = new DateTimeImmutable();
        }
    }

    /**
     * @param array<string, mixed> $data
     */
    public static function fromArray(array $data): self
    {
        if (!isset($data['ref']) || !isset($data['thirdPartyId'])) {
            throw new RuntimeException("Faltan campos obligatorios para hidratar Contract (ref, thirdPartyId).");
        }

        $contract = new self(
            ref: $data['ref'],
            thirdPartyId: (int)$data['thirdPartyId'],
            id: isset($data['id']) ? (int) $data['id'] : null
        );

        $contract->updateFrom($data);

        if (isset($data['lines']) && is_array($data['lines'])) {
            foreach ($data['lines'] as $lineData) {
                if (is_array($lineData)) {
                    $contract->addLine(ContractLine::fromArray($lineData));
                } elseif ($lineData instanceof ContractLine) {
                    $contract->addLine($lineData);
                }
            }
        }

        return $contract;
    }

    /**
     * @return array<string, mixed>
     */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'ref' => $this->ref,
            'thirdPartyId' => $this->thirdPartyId,
            'status' => $this->status,
            'notePrivate' => $this->notePrivate,
            'notePublic' => $this->notePublic,
            'dateContract' => $this->dateContract->format('Y-m-d H:i:s'),
            'createdAt' => $this->createdAt->format('Y-m-d H:i:s'),
            'updatedAt' => $this->updatedAt?->format('Y-m-d H:i:s'),
            'lines' => array_map(fn($line) => $line->toArray(), $this->lines),
        ];
    }
}
