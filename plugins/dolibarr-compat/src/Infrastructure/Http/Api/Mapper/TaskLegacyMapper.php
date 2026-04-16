<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class TaskLegacyMapper extends AbstractLegacyMapper
{
    public function __construct()
    {
        $this->mapping = [
            'rowid' => 'id',
            'ref' => 'ref',
            'label' => 'label',
            'fk_projet' => 'projectId',
            'description' => 'description',
            'dateo' => 'dateStart',
            'datee' => 'dateEnd',
            'progress' => 'progress',
            'priority' => 'priority',
            'duration_effective' => 'duration',
            'fk_task_parent' => 'parentId',
            'datec' => 'createdAt',
            'tms' => 'updatedAt'
        ];
    }
}
