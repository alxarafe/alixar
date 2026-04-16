<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class SupplierProposalLegacyMapper extends AbstractLegacyMapper
{
    public function toLegacy(mixed $domainEntity): array
    {
        return [
            'id' => $domainEntity->id,
            'ref' => $domainEntity->ref,
            'socid' => $domainEntity->thirdPartyId,
            'date' => strtotime($domainEntity->dateProposal->format('Y-m-d')),
            'fin_validite' => $domainEntity->dateValidity ? strtotime($domainEntity->dateValidity->format('Y-m-d')) : null,
            'status' => $domainEntity->status,
            'note_public' => $domainEntity->notePublic,
            'note_private' => $domainEntity->notePrivate,
            'total_ht' => $domainEntity->totalHt,
            'total_tva' => $domainEntity->totalVat,
            'total_ttc' => $domainEntity->totalTtc,
            'lines' => array_map(fn($line) => $this->lineToLegacy($line), $domainEntity->lines)
        ];
    }

    private function lineToLegacy($line): array
    {
        return [
            'id' => $line->id,
            'fk_product' => $line->productId,
            'description' => $line->description,
            'qty' => $line->qty,
            'subprice' => $line->subPrice,
            'tva_tx' => $line->vatRate,
            'total_ht' => $line->totalHt,
            'total_tva' => $line->totalVat,
            'total_ttc' => $line->totalTtc,
        ];
    }

    public function toDomain(array $legacyData): array
    {
        return [
            'ref' => $legacyData['ref'] ?? '',
            'third_party_id' => (int) ($legacyData['socid'] ?? 0),
            'date_proposal' => isset($legacyData['date']) ? date('Y-m-d', $legacyData['date']) : date('Y-m-d'),
            'date_validity' => isset($legacyData['fin_validite']) ? date('Y-m-d', $legacyData['fin_validite']) : null,
            'status' => $legacyData['status'] ?? 'draft',
            'note_public' => $legacyData['note_public'] ?? null,
            'note_private' => $legacyData['note_private'] ?? null,
            'lines' => array_map(fn($line) => $this->lineToDomain($line), $legacyData['lines'] ?? [])
        ];
    }

    private function lineToDomain(array $line): array
    {
        return [
            'product_id' => isset($line['fk_product']) ? (int) $line['fk_product'] : null,
            'description' => $line['description'] ?? '',
            'qty' => (float) ($line['qty'] ?? 0),
            'subprice' => (float) ($line['subprice'] ?? 0),
            'vat_rate' => (float) ($line['tva_tx'] ?? 0),
        ];
    }
}
