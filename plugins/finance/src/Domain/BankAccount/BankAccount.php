<?php

declare(strict_types=1);

namespace Plugin\Finance\Domain\BankAccount;

use DateTimeImmutable;
use RuntimeException;

/**
 * BankAccount — Entidad de Dominio para Cuentas Bancarias.
 */
class BankAccount
{
    private ?int $id;
    private string $ref;
    private string $label;
    
    private ?string $bank;
    private ?string $bic;
    private ?string $ibanPrefix;
    private string $currencyCode;
    
    private int $status; // clos
    private int $accountType; // courant (0 epargne, 1 curent/card/cheque, 2 cash)
    
    private DateTimeImmutable $createdAt; // datec
    private ?DateTimeImmutable $updatedAt; // tms

    public function __construct(
        string $ref,
        string $label,
        ?int $id = null
    ) {
        $this->ref = $ref;
        $this->label = $label;
        $this->id = $id;
        
        $this->bank = null;
        $this->bic = null;
        $this->ibanPrefix = null;
        $this->currencyCode = 'EUR';
        
        $this->status = 0; // 0 = oppened, 1 = closed (clos)
        $this->accountType = 1; // 1 = current
        
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
        if (isset($data['ref'])) $this->ref = $data['ref'];
        if (isset($data['label'])) $this->label = $data['label'];
        if (isset($data['bank'])) $this->bank = $data['bank'];
        if (isset($data['bic'])) $this->bic = $data['bic'];
        if (isset($data['ibanPrefix'])) $this->ibanPrefix = $data['ibanPrefix'];
        if (isset($data['currencyCode'])) $this->currencyCode = $data['currencyCode'];
        
        if (isset($data['status'])) $this->status = (int)$data['status'];
        if (isset($data['accountType'])) $this->accountType = (int)$data['accountType'];
        
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
        if (!isset($data['ref']) || !isset($data['label'])) {
            throw new RuntimeException("Faltan campos obligatorios 'ref' y/o 'label' al hidratar BankAccount.");
        }

        $account = new self(
            ref: $data['ref'],
            label: $data['label'],
            id: isset($data['id']) ? (int) $data['id'] : null
        );

        $account->updateFrom($data);

        return $account;
    }

    /**
     * @return array<string, mixed>
     */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'ref' => $this->ref,
            'label' => $this->label,
            'bank' => $this->bank,
            'bic' => $this->bic,
            'ibanPrefix' => $this->ibanPrefix,
            'currencyCode' => $this->currencyCode,
            'status' => $this->status,
            'accountType' => $this->accountType,
            'createdAt' => $this->createdAt->format('Y-m-d H:i:s'),
            'updatedAt' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
