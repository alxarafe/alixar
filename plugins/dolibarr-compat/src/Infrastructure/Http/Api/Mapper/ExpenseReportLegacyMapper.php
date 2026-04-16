<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class ExpenseReportLegacyMapper extends AbstractLegacyMapper
{
    /**
     * Map from legacy dolibarr keys to alixar clean keys
     */
    protected array $mapping = [
        'rowid'           => 'id',
        'ref'             => 'ref',
        'fk_user_author'  => 'userId',
        'fk_statut'       => 'status',
        'date_create'     => ['target' => 'dateCreation', 'cast' => 'timestamp_to_date'],
        'date_debut'      => ['target' => 'dateStart', 'cast' => 'timestamp_to_date'],
        'date_fin'        => ['target' => 'dateEnd', 'cast' => 'timestamp_to_date'],
        'note_private'    => 'notePrivate',
        'note_public'     => 'notePublic',
        'total_ht'        => 'amountTotal',
        'fk_projet'       => 'projectId',
        'fk_user_validator' => 'fkUserValidator',
    ];
}
