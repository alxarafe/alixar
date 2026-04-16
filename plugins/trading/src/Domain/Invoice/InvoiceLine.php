<?php

declare(strict_types=1);

namespace Plugin\Trading\Domain\Invoice;

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
     * @param array<string, mixed> $data Clean domain values.
     */
    public static function fromArray(array $data): self
    {
        $line = new self(
            invoiceId: isset($data['invoiceId']) ? (int) $data['invoiceId'] : 0, // Fallback if 0 on creation
            qty: (float) ($data['qty'] ?? 0),
            subprice: (float) ($data['subprice'] ?? 0),
            vatRate: (float) ($data['vatRate'] ?? 0),
            description: isset($data['description']) ? (string) $data['description'] : null,
            label: isset($data['label']) ? (string) $data['label'] : null,
            productId: isset($data['productId']) && $data['productId'] ? (int) $data['productId'] : null,
            discountPercent: (float) ($data['discountPercent'] ?? 0),
            rang: (int) ($data['rang'] ?? 0),
            id: isset($data['id']) ? (int) $data['id'] : null,
        );

        // Override calculated with stored values
        if (isset($data['totalHt'])) {
            $line->totalHt = (float) $data['totalHt'];
        }
        if (isset($data['totalVat'])) {
            $line->totalVat = (float) $data['totalVat'];
        }
        if (isset($data['totalTtc'])) {
            $line->totalTtc = (float) $data['totalTtc'];
        }

        return $line;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'invoiceId' => $this->invoiceId,
            'productId' => $this->productId,
            'label' => $this->label,
            'description' => $this->description,
            'qty' => $this->qty,
            'subprice' => $this->subprice,
            'vatRate' => $this->vatRate,
            'discountPercent' => $this->discountPercent,
            'totalHt' => $this->totalHt,
            'totalVat' => $this->totalVat,
            'totalTtc' => $this->totalTtc,
            'rang' => $this->rang,
        ];
    }

    public function getId(): ?int
    {
        return $this->id;
    }
    public function getInvoiceId(): int
    {
        return $this->invoiceId;
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

    public function setId(int $id): void
    {
        $this->id = $id;
    }

    public function updateFrom(array $data): void
    {
        if (isset($data['qty'])) {
            $this->qty = (float) $data['qty'];
        }
        if (isset($data['subprice'])) {
            $this->subprice = (float) $data['subprice'];
        }
        if (isset($data['vatRate'])) {
            $this->vatRate = (float) $data['vatRate'];
        }
        if (isset($data['discountPercent'])) {
            $this->discountPercent = (float) $data['discountPercent'];
        }
        if (array_key_exists('label', $data)) {
            $this->label = $data['label'] === null ? null : (string) $data['label'];
        }
        if (array_key_exists('description', $data)) {
            $this->description = $data['description'] === null ? null : (string) $data['description'];
        }
        if (array_key_exists('productId', $data)) {
            $this->productId = $data['productId'] ? (int) $data['productId'] : null;
        }
        if (isset($data['rang'])) {
            $this->rang = (int) $data['rang'];
        }

        $this->recalculate();
    }
}
