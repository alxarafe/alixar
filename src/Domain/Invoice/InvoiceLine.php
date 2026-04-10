<?php

declare(strict_types=1);

namespace App\Domain\Invoice;

/**
 * InvoiceLine — Línea de factura.
 *
 * Tabla: `facturedet`. Entidad embebida (Aggregate child).
 * Los totales se calculan: total_ht = qty * subprice * (1 - remise_percent/100)
 */
class InvoiceLine
{
    private ?int $id;
    private int $invoiceId;
    private ?int $productId;
    private ?string $label;
    private ?string $description;
    private float $qty;
    private float $subprice;      // Precio unitario HT
    private float $vatRate;       // tva_tx (ej: 21.00)
    private float $discountPercent;

    // Calculated totals
    private float $totalHt;
    private float $totalVat;
    private float $totalTtc;

    private int $rang;

    public function __construct(
        int $invoiceId,
        float $qty,
        float $subprice,
        float $vatRate = 21.00,
        ?string $description = null,
        ?string $label = null,
        ?int $productId = null,
        float $discountPercent = 0.0,
        int $rang = 0,
        ?int $id = null,
    ) {
        $this->id = $id;
        $this->invoiceId = $invoiceId;
        $this->productId = $productId;
        $this->label = $label;
        $this->description = $description;
        $this->qty = $qty;
        $this->subprice = $subprice;
        $this->vatRate = $vatRate;
        $this->discountPercent = $discountPercent;
        $this->rang = $rang;

        $this->recalculate();
    }

    /**
     * Recalculate totals from quantity, price, discount, and VAT.
     * This is a critical business rule — must match Dolibarr's calcul_price_total.
     */
    public function recalculate(): void
    {
        $discountFactor = 1.0 - ($this->discountPercent / 100.0);
        $this->totalHt = round($this->qty * $this->subprice * $discountFactor, 2);
        $this->totalVat = round($this->totalHt * ($this->vatRate / 100.0), 2);
        $this->totalTtc = round($this->totalHt + $this->totalVat, 2);
    }

    /**
     * @param array<string, mixed> $data Row from `facturedet`.
     */
    public static function fromArray(array $data): self
    {
        $line = new self(
            invoiceId: (int) $data['fk_facture'],
            qty: (float) ($data['qty'] ?? 0),
            subprice: (float) ($data['subprice'] ?? 0),
            vatRate: (float) ($data['tva_tx'] ?? 0),
            description: $data['description'] ?? null,
            label: $data['label'] ?? null,
            productId: isset($data['fk_product']) && $data['fk_product'] ? (int) $data['fk_product'] : null,
            discountPercent: (float) ($data['remise_percent'] ?? 0),
            rang: (int) ($data['rang'] ?? 0),
            id: isset($data['rowid']) ? (int) $data['rowid'] : null,
        );

        // Override calculated with stored values
        if (isset($data['total_ht'])) { $line->totalHt = (float) $data['total_ht']; }
        if (isset($data['total_tva'])) { $line->totalVat = (float) $data['total_tva']; }
        if (isset($data['total_ttc'])) { $line->totalTtc = (float) $data['total_ttc']; }

        return $line;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'rowid' => $this->id,
            'fk_facture' => $this->invoiceId,
            'fk_product' => $this->productId,
            'label' => $this->label,
            'description' => $this->description,
            'qty' => $this->qty,
            'subprice' => $this->subprice,
            'tva_tx' => $this->vatRate,
            'remise_percent' => $this->discountPercent,
            'total_ht' => $this->totalHt,
            'total_tva' => $this->totalVat,
            'total_ttc' => $this->totalTtc,
            'rang' => $this->rang,
        ];
    }

    /** @return array<string, mixed> */
    public function toApiArray(): array
    {
        $data = $this->toArray();
        $data['id'] = $data['rowid'];
        return $data;
    }

    public function getId(): ?int { return $this->id; }
    public function getInvoiceId(): int { return $this->invoiceId; }
    public function getTotalHt(): float { return $this->totalHt; }
    public function getTotalVat(): float { return $this->totalVat; }
    public function getTotalTtc(): float { return $this->totalTtc; }

    public function setId(int $id): void { $this->id = $id; }

    public function updateFrom(array $data): void
    {
        if (isset($data['qty'])) { $this->qty = (float) $data['qty']; }
        if (isset($data['subprice'])) { $this->subprice = (float) $data['subprice']; }
        if (isset($data['tva_tx'])) { $this->vatRate = (float) $data['tva_tx']; }
        if (isset($data['remise_percent'])) { $this->discountPercent = (float) $data['remise_percent']; }
        if (array_key_exists('label', $data)) { $this->label = $data['label']; }
        if (array_key_exists('description', $data)) { $this->description = $data['description']; }
        if (array_key_exists('fk_product', $data)) { $this->productId = $data['fk_product'] ? (int) $data['fk_product'] : null; }
        if (isset($data['rang'])) { $this->rang = (int) $data['rang']; }

        $this->recalculate();
    }
}
