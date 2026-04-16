<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class ManufacturingOrderLegacyMapper extends AbstractLegacyMapper
{
    public function toLegacy(mixed $domainEntity): array
    {
        return [
            'id' => $domainEntity->id,
            'ref' => $domainEntity->ref,
            'label' => $domainEntity->label,
            'fk_bom' => $domainEntity->bomId,
            'qty' => $domainEntity->qtyToProduce,
            'status' => $domainEntity->status === 'produced' ? 2 : 1,
            'date_start' => $domainEntity->dateStart ? strtotime($domainEntity->dateStart->format('Y-m-d')) : null,
        ];
    }

    public function toDomain(array $legacyData): array
    {
        return [
            'ref' => $legacyData['ref'] ?? '',
            'label' => $legacyData['label'] ?? '',
            'bom_id' => (int) ($legacyData['fk_bom'] ?? 0),
            'qty_to_produce' => (float) ($legacyData['qty'] ?? 1.0),
            'status' => ($legacyData['status'] ?? 1) == 2 ? 'produced' : 'draft',
            'date_start' => isset($legacyData['date_start']) ? date('Y-m-d H:i:s', $legacyData['date_start']) : null,
        ];
    }
}
