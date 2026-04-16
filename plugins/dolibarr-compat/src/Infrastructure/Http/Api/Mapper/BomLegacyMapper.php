<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class BomLegacyMapper extends AbstractLegacyMapper
{
    public function toLegacy(mixed $domainEntity): array
    {
        return [
            'id' => $domainEntity->id,
            'ref' => $domainEntity->ref,
            'label' => $domainEntity->label,
            'fk_product' => $domainEntity->productId,
            'qty' => $domainEntity->qty,
            'status' => $domainEntity->status === 'active' ? 1 : 0,
        ];
    }

    public function toDomain(array $legacyData): array
    {
        return [
            'ref' => $legacyData['ref'] ?? '',
            'label' => $legacyData['label'] ?? '',
            'product_id' => (int) ($legacyData['fk_product'] ?? 0),
            'qty' => (float) ($legacyData['qty'] ?? 1.0),
            'status' => ($legacyData['status'] ?? 0) ? 'active' : 'draft',
        ];
    }
}
