<?php

declare(strict_types=1);

namespace Plugin\Finance\Domain\Payment;

use DateTimeImmutable;
use RuntimeException;

/**
 * Payment — Entidad de Dominio para Pagos de Facturas.
 */
class Payment
{
    private ?int $id;
    private string $ref;
    private float $amount;
    
    private string $paymentType; // CHQ, VIR, CB...
    private ?string $num; // Numero de cheque, trasanccion, etc.
    private ?string $note;

    private int $invoiceId;
    private ?int $bankAccountId; // fk_bank

    private DateTimeImmutable $date; // Fecha del pago
    private DateTimeImmutable $createdAt;
    private ?DateTimeImmutable $updatedAt;

    public function __construct(
        string $ref,
        float $amount,
        string $paymentType,
        int $invoiceId,
        ?int $id = null
    ) {
        $this->ref = $ref;
        $this->amount = $amount;
        $this->paymentType = $paymentType;
        $this->invoiceId = $invoiceId;
        $this->id = $id;
        
        $this->num = null;
        $this->note = null;
        $this->bankAccountId = null;
        
        $this->date = new DateTimeImmutable();
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
        if (isset($data['amount'])) $this->amount = (float)$data['amount'];
        if (isset($data['paymentType'])) $this->paymentType = $data['paymentType'];
        if (isset($data['num'])) $this->num = $data['num'];
        if (isset($data['note'])) $this->note = $data['note'];
        if (isset($data['invoiceId'])) $this->invoiceId = (int)$data['invoiceId'];
        if (isset($data['bankAccountId'])) $this->bankAccountId = (int)$data['bankAccountId'];
        
        if (isset($data['date'])) {
            $this->date = is_numeric($data['date']) ? (new DateTimeImmutable())->setTimestamp((int)$data['date']) : new DateTimeImmutable($data['date']);
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
        if (!isset($data['ref']) || !isset($data['amount']) || !isset($data['paymentType']) || !isset($data['invoiceId'])) {
            throw new RuntimeException("Faltan campos obligatorios para hidratar Payment (ref, amount, paymentType, invoiceId).");
        }

        $payment = new self(
            ref: $data['ref'],
            amount: (float)$data['amount'],
            paymentType: $data['paymentType'],
            invoiceId: (int)$data['invoiceId'],
            id: isset($data['id']) ? (int) $data['id'] : null
        );

        $payment->updateFrom($data);

        return $payment;
    }

    /**
     * @return array<string, mixed>
     */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'ref' => $this->ref,
            'amount' => $this->amount,
            'paymentType' => $this->paymentType,
            'num' => $this->num,
            'note' => $this->note,
            'invoiceId' => $this->invoiceId,
            'bankAccountId' => $this->bankAccountId,
            'date' => $this->date->format('Y-m-d H:i:s'),
            'createdAt' => $this->createdAt->format('Y-m-d H:i:s'),
            'updatedAt' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
