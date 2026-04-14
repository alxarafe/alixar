<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class ReceptionLegacyMapper extends AbstractLegacyMapper
{
    protected array $mapping = [
        'rowid'              => 'id',
        'ref'                => 'ref',
        'ref_ext'            => 'refExt',
        'fk_soc'             => 'thirdPartyId',
        'fk_statut'          => 'status',
        'date_creation'      => ['target' => 'dateCreation', 'cast' => 'timestamp_to_date'],
        'date_delivery'      => ['target' => 'dateDelivery', 'cast' => 'timestamp_to_date'],
        'tracking_number'    => 'trackingNumber',
        'tracking_url'       => 'trackingUrl',
        'weight'             => 'weight',
        'weight_units'       => 'weightUnits',
        'size_w'             => 'sizeW',
        'size_h'             => 'sizeH',
        'size_s'             => 'sizeS',
        'size_units'         => 'sizeUnits',
        'note_private'       => 'notePrivate',
        'note_public'        => 'notePublic',
        'fk_projet'          => 'projectId',
        'fk_shipping_method' => 'shippingMethodId',
    ];
}
