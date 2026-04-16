<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class ProductLotLegacyMapper extends AbstractLegacyMapper
{
    public function toLegacy(mixed $domainEntity): array
    {
        return [
            'id' => $domainEntity->id,
            'fk_product' => $domainEntity->productId,
            'batch' => $domainEntity->batchNumber,
            'eatby' => $domainEntity->eatByDate ? strtotime($domainEntity->eatByDate->format('Y-m-d')) : null,
            'sellby' => $domainEntity->sellByDate ? strtotime($domainEntity->sellByDate->format('Y-m-d')) : null,
            'status' => $domainEntity->status === 'active' ? 1 : 0,
        ];
    }

    public function toDomain(array $legacyData): array
    {
        return [
            'product_id' => (int) ($legacyData['fk_product'] ?? 0),
            'batch_number' => $legacyData['batch'] ?? '',
            'eatby_date' => isset($legacyData['eatby']) ? date('Y-m-d', $legacyData['eatby']) : null,
            'sellby_date' => isset($legacyData['sellby']) ? date('Y-m-d', $legacyData['sellby']) : null,
            'status' => ($legacyData['status'] ?? 1) ? 'active' : 'disabled',
        ];
    }
}
