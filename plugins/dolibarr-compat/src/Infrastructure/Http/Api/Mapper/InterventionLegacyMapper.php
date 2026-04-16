<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class InterventionLegacyMapper extends AbstractLegacyMapper
{
    protected array $mapping = [
        'rowid'         => 'id',
        'ref'           => 'ref',
        'ref_ext'       => 'refExt',
        'fk_soc'        => 'thirdPartyId',
        'fk_statut'     => 'status',
        'title'         => 'title',
        'date_creation' => ['target' => 'dateCreation', 'cast' => 'timestamp_to_date'],
        'date_valid'    => ['target' => 'dateValid', 'cast' => 'timestamp_to_date'],
        'datei'         => ['target' => 'dateStart', 'cast' => 'timestamp_to_date'], // dolibarr inter uses datei for start
        'datee'         => ['target' => 'dateEnd', 'cast' => 'timestamp_to_date'],   // and datee for end
        'description'   => 'description',
        'note_private'  => 'notePrivate',
        'note_public'   => 'notePublic',
        'fk_projet'     => 'projectId',
    ];
}
