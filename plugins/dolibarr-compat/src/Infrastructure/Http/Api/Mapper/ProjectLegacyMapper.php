<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class ProjectLegacyMapper extends AbstractLegacyMapper
{
    public function __construct()
    {
        $this->mapping = [
            'id'             => 'id',
            'ref'            => 'ref',
            'ref_ext'        => 'refExt',
            'statut'         => 'status',
            'title'          => 'title',
            'socid'          => 'thirdPartyId',
            'date_c'         => 'createdAt',
            'date_m'         => 'updatedAt',
            'date_start_event' => 'dateStartEvent',
            'date_end_event'   => 'dateEndEvent'
        ];
    }
}
