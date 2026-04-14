<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class EventLegacyMapper extends AbstractLegacyMapper
{
    public function __construct()
    {
        $this->mapping = [
            'id' => 'id',
            'ref' => 'ref',
            'title' => 'title',
            'type_code' => 'typeCode',
            'datep' => 'dateStart', // datep is date of event in dolibarr
            'datef' => 'dateEnd',
            'percentage' => 'percentage',
            'note' => 'note',
            'socid' => 'thirdPartyId',
            'contactid' => 'contactId',
            'projectid' => 'projectId',
            'usertodo' => 'assignedUserId',
            'userauthor' => 'authorUserId',
            'datec' => 'createdAt',
            'tms' => 'updatedAt'
        ];
    }
}
