<?php

declare(strict_types=1);

namespace Plugin\Trading\Domain\Contract;

use DateTimeImmutable;
use RuntimeException;

class ContractLine
{
    private ?int $id;
    private int $contractId;
    private ?int $productId;
    private string $description;
    
    private float $qty;
    private float $subprice;
    private float $vatRate;
    
    private ?DateTimeImmutable $dateStart;
    private ?DateTimeImmutable $dateEnd;
    
    private int $status;

    public function __construct(
        int $contractId,
        string $description,
        float $qty,
        float $subprice,
        float $vatRate,
        ?int $id = null
    ) {
        $this->contractId = $contractId;
        $this->description = $description;
        $this->qty = $qty;
        $this->subprice = $subprice;
        $this->vatRate = $vatRate;
        $this->id = $id;
        
        $this->productId = null;
        $this->dateStart = null;
        $this->dateEnd = null;
        $this->status = 0;
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

    /**
     * @param array<string, mixed> $data
     */
    public function updateFrom(array $data): void
    {
        if (isset($data['contractId'])) $this->contractId = (int)$data['contractId'];
        if (isset($data['productId'])) $this->productId = (int)$data['productId'];
        if (isset($data['description'])) $this->description = $data['description'];
        if (isset($data['qty'])) $this->qty = (float)$data['qty'];
        if (isset($data['subprice'])) $this->subprice = (float)$data['subprice'];
        if (isset($data['vatRate'])) $this->vatRate = (float)$data['vatRate'];
        if (isset($data['status'])) $this->status = (int)$data['status'];
        
        if (isset($data['dateStart'])) {
            $this->dateStart = is_numeric($data['dateStart']) ? (new DateTimeImmutable())->setTimestamp((int)$data['dateStart']) : new DateTimeImmutable($data['dateStart']);
        }
        if (isset($data['dateEnd'])) {
            $this->dateEnd = is_numeric($data['dateEnd']) ? (new DateTimeImmutable())->setTimestamp((int)$data['dateEnd']) : new DateTimeImmutable($data['dateEnd']);
        }
    }

    /**
     * @param array<string, mixed> $data
     */
    public static function fromArray(array $data): self
    {
        if (!isset($data['contractId']) || !isset($data['description'])) {
            throw new RuntimeException("Faltan campos obligatorios para hidratar ContractLine (contractId, description).");
        }

        $line = new self(
            contractId: (int)$data['contractId'],
            description: $data['description'],
            qty: isset($data['qty']) ? (float)$data['qty'] : 1.0,
            subprice: isset($data['subprice']) ? (float)$data['subprice'] : 0.0,
            vatRate: isset($data['vatRate']) ? (float)$data['vatRate'] : 0.0,
            id: isset($data['id']) ? (int) $data['id'] : null
        );

        $line->updateFrom($data);

        return $line;
    }

    /**
     * @return array<string, mixed>
     */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'contractId' => $this->contractId,
            'productId' => $this->productId,
            'description' => $this->description,
            'qty' => $this->qty,
            'subprice' => $this->subprice,
            'vatRate' => $this->vatRate,
            'dateStart' => $this->dateStart?->format('Y-m-d H:i:s'),
            'dateEnd' => $this->dateEnd?->format('Y-m-d H:i:s'),
            'status' => $this->status,
        ];
    }
}
