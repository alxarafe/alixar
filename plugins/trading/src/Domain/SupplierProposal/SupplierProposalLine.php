<?php

declare(strict_types=1);

namespace Plugin\Trading\Domain\SupplierProposal;

class SupplierProposalLine
{
    private function __construct(
        public readonly ?int $id,
        public readonly int $proposalId,
        public readonly ?int $productId,
        public readonly string $description,
        public readonly float $qty,
        public readonly float $subPrice,
        public readonly float $vatRate,
        public readonly float $totalHt,
        public readonly float $totalVat,
        public readonly float $totalTtc
    ) {
}

    public static function create(
        int $proposalId,
        ?int $productId,
        string $description,
        float $qty,
        float $subPrice,
        float $vatRate
    ): self {
        $totalHt = $qty * $subPrice;
        $totalVat = $totalHt * ($vatRate / 100);
        $totalTtc = $totalHt + $totalVat;

        return new self(
            null,
            $proposalId,
            $productId,
            $description,
            $qty,
            $subPrice,
            $vatRate,
            $totalHt,
            $totalVat,
            $totalTtc
        );
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            (int) $data['proposal_id'],
            isset($data['product_id']) ? (int) $data['product_id'] : null,
            $data['description'],
            (float) $data['qty'],
            (float) $data['subprice'],
            (float) $data['vat_rate'],
            (float) $data['total_ht'],
            (float) $data['total_vat'],
            (float) $data['total_ttc']
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'proposal_id' => $this->proposalId,
            'product_id' => $this->productId,
            'description' => $this->description,
            'qty' => $this->qty,
            'subprice' => $this->subPrice,
            'vat_rate' => $this->vatRate,
            'total_ht' => $this->totalHt,
            'total_vat' => $this->totalVat,
            'total_ttc' => $this->totalTtc,
        ];
    }
}
