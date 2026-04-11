<?php

declare(strict_types=1);

namespace App\Domain\SupplierOrder;

use DateTimeImmutable;
use RuntimeException;

/**
 * SupplierOrder — Entidad de Dominio para Pedidos de Compra.
 */
class SupplierOrder
{
    private ?int $id;
    private int $thirdPartyId; // fk_soc
    private string $ref;
    private ?string $refSupplier;
    private ?string $refExt;
    
    private float $totalHt;
    private float $totalTva;
    private float $totalTtc;
    
    private int $status; // fk_statut
    
    private DateTimeImmutable $createdAt;
    private ?DateTimeImmutable $updatedAt;

    public function __construct(
        int $thirdPartyId,
        string $ref = '',
        ?int $id = null
    ) {
        $this->thirdPartyId = $thirdPartyId;
        $this->ref = $ref;
        $this->id = $id;
        
        $this->refSupplier = null;
        $this->refExt = null;
        
        $this->totalHt = 0.0;
        $this->totalTva = 0.0;
        $this->totalTtc = 0.0;
        $this->status = 0; 
        
        $this->createdAt = new DateTimeImmutable();
        $this->updatedAt = null;
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

    /**
     * @param array<string, mixed> $data
     */
    public function updateFrom(array $data): void
    {
        if (isset($data['thirdPartyId'])) $this->thirdPartyId = (int)$data['thirdPartyId'];
        if (isset($data['ref'])) $this->ref = $data['ref'];
        if (isset($data['refSupplier'])) $this->refSupplier = $data['refSupplier'];
        if (isset($data['refExt'])) $this->refExt = $data['refExt'];
        
        if (isset($data['totalHt'])) $this->totalHt = (float)$data['totalHt'];
        if (isset($data['totalTva'])) $this->totalTva = (float)$data['totalTva'];
        if (isset($data['totalTtc'])) $this->totalTtc = (float)$data['totalTtc'];
        if (isset($data['status'])) $this->status = (int)$data['status'];
        
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
        if (!isset($data['thirdPartyId']) && !isset($data['socid'])) {
            throw new RuntimeException("Falta campo obligatorio 'thirdPartyId' al hidratar SupplierOrder.");
        }

        $thirdPartyId = (int) ($data['thirdPartyId'] ?? $data['socid']);

        $order = new self(
            thirdPartyId: $thirdPartyId,
            ref: $data['ref'] ?? '',
            id: isset($data['id']) ? (int) $data['id'] : null
        );

        $order->updateFrom($data);

        return $order;
    }

    /**
     * @return array<string, mixed>
     */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'thirdPartyId' => $this->thirdPartyId,
            'ref' => $this->ref,
            'refSupplier' => $this->refSupplier,
            'refExt' => $this->refExt,
            'totalHt' => $this->totalHt,
            'totalTtc' => $this->totalTtc,
            'totalTva' => $this->totalTva,
            'status' => $this->status,
            'createdAt' => $this->createdAt->format('Y-m-d H:i:s'),
            'updatedAt' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
