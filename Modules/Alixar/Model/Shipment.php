<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Shipment
 * Represents table expedition
 */
class Shipment extends Model
{
    protected $table = 'expedition';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'entity',
        'fk_soc',
        'fk_projet',
        'ref_ext',
        'ref_customer',
        'date_creation',
        'fk_user_author',
        'fk_user_modif',
        'date_valid',
        'fk_user_valid',
        'date_delivery',
        'date_expedition',
        'fk_address',
        'fk_shipping_method',
        'tracking_number',
        'fk_statut',
        'billed',
        'height',
        'width',
        'size_units',
        'size',
        'weight_units',
        'weight',
        'signed_status',
        'online_sign_ip',
        'online_sign_name',
        'note_private',
        'note_public',
        'model_pdf',
        'last_main_doc',
        'fk_incoterms',
        'location_incoterms',
        'import_key',
        'extraparams',
    ];
}
