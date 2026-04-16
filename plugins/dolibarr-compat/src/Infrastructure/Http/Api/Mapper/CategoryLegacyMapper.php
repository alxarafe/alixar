<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class CategoryLegacyMapper extends AbstractLegacyMapper
{
    public function __construct()
    {
        $this->mapping = [
            'rowid' => 'id',
            'label' => 'label',
            'type' => 'type',
            'description' => 'description',
            'color' => 'color',
            'position' => 'position',
            'fk_parent' => 'parentId',
            'visible' => 'visible',
            'tms' => 'updatedAt'
        ];
    }
}
