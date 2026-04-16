<?php

declare(strict_types=1);

namespace Plugin\Trading\Domain\Invoice;

use DateTimeImmutable;

/**
 * Invoice — Aggregate root. Cabecera + líneas.
 *
 * Tabla: `facture` (cabecera) + `facturedet` (líneas).
 * Los totales de la cabecera son la SUMA de los totales de las líneas.
 *
 * Lifecycle: Draft(0) → Validated(1) → Closed/Paid(2) | Abandoned(3)
 */
class Invoice
{
    private ?int $id;
    private ?string $ref;
    private int $thirdPartyId;   // fk_soc (obligatorio)
    private InvoiceType $type;
    private InvoiceStatus $status;
    private bool $paid;          // paye

    // Dates
    private DateTimeImmutable $date;          // datef
    private ?DateTimeImmutable $dateDue;      // date_lim_reglement

    // Totals (calculated from lines)
    private float $totalHt;
    private float $totalVat;
    private float $totalTtc;

    // Payment terms
    private int $paymentTerms;   // fk_cond_reglement
    private ?int $paymentMode;   // fk_mode_reglement

    // Notes
    private ?string $notePrivate;
    private ?string $notePublic;

    // Metadata
    private int $entity;
    private DateTimeImmutable $createdAt;

    /** @var InvoiceLine[] */
    private array $lines = [];

    public function __construct(
        int $thirdPartyId,
        ?DateTimeImmutable $date = null,
        InvoiceType $type = InvoiceType::Standard,
        ?int $id = null,
    ) {
        $this->id = $id;
        $this->ref = null;
        $this->thirdPartyId = $thirdPartyId;
        $this->type = $type;
        $this->status = InvoiceStatus::Draft;
        $this->paid = false;
        $this->date = $date ?? new DateTimeImmutable();
        $this->dateDue = null;
        $this->totalHt = 0.0;
        $this->totalVat = 0.0;
        $this->totalTtc = 0.0;
        $this->paymentTerms = 1;
        $this->paymentMode = null;
        $this->notePrivate = null;
        $this->notePublic = null;
        $this->entity = 1;
        $this->createdAt = new DateTimeImmutable();
    }

    // ── Business Logic ───────────────────────────────────

    public function addLine(InvoiceLine $line): void
    {
        $this->lines[] = $line;
        $this->recalculateTotals();
    }

    /**
     * Recalculate header totals from lines.
     * This is THE critical rule: header = SUM(lines).
     */
    public function recalculateTotals(): void
    {
        $this->totalHt = 0.0;
        $this->totalVat = 0.0;
        $this->totalTtc = 0.0;

        foreach ($this->lines as $line) {
            $this->totalHt += $line->getTotalHt();
            $this->totalVat += $line->getTotalVat();
            $this->totalTtc += $line->getTotalTtc();
        }

        $this->totalHt = round($this->totalHt, 2);
        $this->totalVat = round($this->totalVat, 2);
        $this->totalTtc = round($this->totalTtc, 2);
    }

    public function validate(string $ref): void
    {
        if (!$this->status->canTransitionTo(InvoiceStatus::Validated)) {
            throw new \DomainException("No se puede validar una factura en estado {$this->status->label()}.");
        }
        $this->status = InvoiceStatus::Validated;
        $this->ref = $ref;
    }

    public function setPaid(): void
    {
        if (!$this->status->canTransitionTo(InvoiceStatus::Closed)) {
            throw new \DomainException("No se puede pagar una factura en estado {$this->status->label()}.");
        }
        $this->status = InvoiceStatus::Closed;
        $this->paid = true;
    }

    public function setDraft(): void
    {
        if (!$this->status->canTransitionTo(InvoiceStatus::Draft)) {
            throw new \DomainException("No se puede volver a borrador desde estado {$this->status->label()}.");
        }
        $this->status = InvoiceStatus::Draft;
        $this->paid = false;
    }

    public function isDraft(): bool
    {
        return $this->status === InvoiceStatus::Draft;
    }
    public function isValidated(): bool
    {
        return $this->status === InvoiceStatus::Validated;
    }
    public function isPaid(): bool
    {
        return $this->paid;
    }

    // ── Hydration ────────────────────────────────────────

    /**
     * @param array<string, mixed> $data
     * @param InvoiceLine[] $lines
     */
    public static function fromArray(array $data, array $lines = []): self
    {
        $parsedDate = null;
        if (!empty($data['date'])) {
            $parsedDate = $data['date'] instanceof DateTimeImmutable ? $data['date'] : (is_numeric($data['date']) ? (new DateTimeImmutable())->setTimestamp((int)$data['date']) : new DateTimeImmutable($data['date']));
        }

        $inv = new self(
            thirdPartyId: isset($data['thirdPartyId']) ? (int) $data['thirdPartyId'] : 0,
            date: $parsedDate,
            type: InvoiceType::from((int) ($data['type'] ?? 0)),
            id: isset($data['id']) ? (int) $data['id'] : null,
        );

        $inv->ref = ($data['ref'] === '(PROV)') ? null : ($data['ref'] ?? null);
        $inv->status = InvoiceStatus::from((int) ($data['status'] ?? 0));
        $inv->paid = (bool) ($data['isPaid'] ?? false);
        $inv->entity = (int) ($data['entity'] ?? 1);

        $inv->totalHt = (float) ($data['totalHt'] ?? 0);
        $inv->totalVat = (float) ($data['totalVat'] ?? 0);
        $inv->totalTtc = (float) ($data['totalTtc'] ?? 0);

        $inv->paymentTerms = (int) ($data['paymentTerms'] ?? 1);
        $inv->paymentMode = isset($data['paymentMode']) ? (int) $data['paymentMode'] : null;

        if (!empty($data['dateDue'])) {
            $inv->dateDue = $data['dateDue'] instanceof DateTimeImmutable ? $data['dateDue'] : (is_numeric($data['dateDue']) ? (new DateTimeImmutable())->setTimestamp((int)$data['dateDue']) : new DateTimeImmutable($data['dateDue']));
        }

        $inv->notePrivate = $data['notePrivate'] ?? null;
        $inv->notePublic = $data['notePublic'] ?? null;

        if (!empty($data['createdAt'])) {
            $inv->createdAt = $data['createdAt'] instanceof DateTimeImmutable ? $data['createdAt'] : (is_numeric($data['createdAt']) ? (new DateTimeImmutable())->setTimestamp((int)$data['createdAt']) : new DateTimeImmutable($data['createdAt']));
        }

        $inv->lines = $lines;

        return $inv;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'ref' => $this->ref ?? ($this->id ? "(PROV{$this->id})" : "(PROV)"),
            'entity' => $this->entity,
            'type' => $this->type->value,
            'thirdPartyId' => $this->thirdPartyId,
            'date' => $this->date->format('Y-m-d'),
            'dateDue' => $this->dateDue?->format('Y-m-d'),
            'status' => $this->status->value,
            'isPaid' => $this->paid ? 1 : 0,
            'totalHt' => $this->totalHt,
            'totalVat' => $this->totalVat,
            'totalTtc' => $this->totalTtc,
            'paymentTerms' => $this->paymentTerms,
            'paymentMode' => $this->paymentMode,
            'notePrivate' => $this->notePrivate,
            'notePublic' => $this->notePublic,
            'createdAt' => $this->createdAt->format('Y-m-d H:i:s'),
        ];
    }

    // ── Getters ──────────────────────────────────────────

    public function getId(): ?int
    {
        return $this->id;
    }
    public function getRef(): ?string
    {
        return $this->ref;
    }
    public function getThirdPartyId(): int
    {
        return $this->thirdPartyId;
    }
    public function getStatus(): InvoiceStatus
    {
        return $this->status;
    }
    public function getTotalHt(): float
    {
        return $this->totalHt;
    }
    public function getTotalVat(): float
    {
        return $this->totalVat;
    }
    public function getTotalTtc(): float
    {
        return $this->totalTtc;
    }
    /** @return InvoiceLine[] */
    public function getLines(): array
    {
        return $this->lines;
    }

    public function setId(int $id): void
    {
        $this->id = $id;
    }
    public function setLines(array $lines): void
    {
        $this->lines = $lines;
        $this->recalculateTotals();
    }

    public function updateFrom(array $data): void
    {
        if (isset($data['thirdPartyId'])) {
            $this->thirdPartyId = (int) $data['thirdPartyId'];
        }
        if (isset($data['type'])) {
            $this->type = InvoiceType::from((int) $data['type']);
        }
        if (isset($data['date'])) {
            $this->date = is_numeric($data['date']) ? (new DateTimeImmutable())->setTimestamp((int)$data['date']) : new DateTimeImmutable($data['date']);
        }
        if (isset($data['dateDue'])) {
            $this->dateDue = is_numeric($data['dateDue']) ? (new DateTimeImmutable())->setTimestamp((int)$data['dateDue']) : new DateTimeImmutable($data['dateDue']);
        }
        if (isset($data['paymentTerms'])) {
            $this->paymentTerms = (int) $data['paymentTerms'];
        }
        if (isset($data['paymentMode'])) {
            $this->paymentMode = (int) $data['paymentMode'];
        }
        if (array_key_exists('notePrivate', $data)) {
            $this->notePrivate = $data['notePrivate'];
        }
        if (array_key_exists('notePublic', $data)) {
            $this->notePublic = $data['notePublic'];
        }
    }
}
