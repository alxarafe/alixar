<?php

declare(strict_types=1);

namespace App\Domain\Invoice;

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
    private ?DateTimeImmutable $date;         // datef
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
    private ?DateTimeImmutable $createdAt;

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

    public function isDraft(): bool { return $this->status === InvoiceStatus::Draft; }
    public function isValidated(): bool { return $this->status === InvoiceStatus::Validated; }
    public function isPaid(): bool { return $this->paid; }

    // ── Hydration ────────────────────────────────────────

    /**
     * @param array<string, mixed> $data
     * @param InvoiceLine[] $lines
     */
    public static function fromArray(array $data, array $lines = []): self
    {
        $inv = new self(
            thirdPartyId: (int) $data['fk_soc'],
            date: !empty($data['datef']) ? new DateTimeImmutable($data['datef']) : null,
            type: InvoiceType::from((int) ($data['type'] ?? 0)),
            id: isset($data['rowid']) ? (int) $data['rowid'] : null,
        );

        $inv->ref = $data['ref'] ?? null;
        $inv->status = InvoiceStatus::from((int) ($data['fk_statut'] ?? 0));
        $inv->paid = (bool) ($data['paye'] ?? false);
        $inv->entity = (int) ($data['entity'] ?? 1);

        $inv->totalHt = (float) ($data['total_ht'] ?? 0);
        $inv->totalVat = (float) ($data['total_tva'] ?? 0);
        $inv->totalTtc = (float) ($data['total_ttc'] ?? 0);

        $inv->paymentTerms = (int) ($data['fk_cond_reglement'] ?? 1);
        $inv->paymentMode = isset($data['fk_mode_reglement']) ? (int) $data['fk_mode_reglement'] : null;

        if (!empty($data['date_lim_reglement'])) {
            $inv->dateDue = new DateTimeImmutable($data['date_lim_reglement']);
        }

        $inv->notePrivate = $data['note_private'] ?? null;
        $inv->notePublic = $data['note_public'] ?? null;

        if (!empty($data['datec'])) {
            $inv->createdAt = new DateTimeImmutable($data['datec']);
        }

        $inv->lines = $lines;

        return $inv;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'rowid' => $this->id,
            'ref' => $this->ref ?? '(PROV)',
            'entity' => $this->entity,
            'type' => $this->type->value,
            'fk_soc' => $this->thirdPartyId,
            'datef' => $this->date?->format('Y-m-d'),
            'date_lim_reglement' => $this->dateDue?->format('Y-m-d'),
            'fk_statut' => $this->status->value,
            'paye' => $this->paid ? 1 : 0,
            'total_ht' => $this->totalHt,
            'total_tva' => $this->totalVat,
            'total_ttc' => $this->totalTtc,
            'fk_cond_reglement' => $this->paymentTerms,
            'fk_mode_reglement' => $this->paymentMode,
            'note_private' => $this->notePrivate,
            'note_public' => $this->notePublic,
        ];
    }

    /** @return array<string, mixed> */
    public function toApiArray(): array
    {
        $data = $this->toArray();
        $data['id'] = $data['rowid'];
        $data['lines'] = array_map(fn(InvoiceLine $l) => $l->toApiArray(), $this->lines);
        return $data;
    }

    // ── Getters ──────────────────────────────────────────

    public function getId(): ?int { return $this->id; }
    public function getRef(): ?string { return $this->ref; }
    public function getThirdPartyId(): int { return $this->thirdPartyId; }
    public function getStatus(): InvoiceStatus { return $this->status; }
    public function getTotalHt(): float { return $this->totalHt; }
    public function getTotalVat(): float { return $this->totalVat; }
    public function getTotalTtc(): float { return $this->totalTtc; }
    /** @return InvoiceLine[] */
    public function getLines(): array { return $this->lines; }

    public function setId(int $id): void { $this->id = $id; }
    public function setLines(array $lines): void
    {
        $this->lines = $lines;
        $this->recalculateTotals();
    }

    public function updateFrom(array $data): void
    {
        if (isset($data['fk_soc'])) { $this->thirdPartyId = (int) $data['fk_soc']; }
        if (isset($data['type'])) { $this->type = InvoiceType::from((int) $data['type']); }
        if (isset($data['datef'])) { $this->date = new DateTimeImmutable($data['datef']); }
        if (isset($data['date_lim_reglement'])) { $this->dateDue = new DateTimeImmutable($data['date_lim_reglement']); }
        if (isset($data['fk_cond_reglement'])) { $this->paymentTerms = (int) $data['fk_cond_reglement']; }
        if (isset($data['fk_mode_reglement'])) { $this->paymentMode = (int) $data['fk_mode_reglement']; }
        if (array_key_exists('note_private', $data)) { $this->notePrivate = $data['note_private']; }
        if (array_key_exists('note_public', $data)) { $this->notePublic = $data['note_public']; }
    }
}
