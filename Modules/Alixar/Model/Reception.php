<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Reception
 * Represents table reception
 */
class Reception extends Model
{
    protected $table = 'reception';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'entity',
        'fk_soc',
        'fk_projet',
        'ref_ext',
        'ref_supplier',
        'date_creation',
        'fk_user_author',
        'fk_user_modif',
        'date_valid',
        'fk_user_valid',
        'date_delivery',
        'date_reception',
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
        'note_private',
        'note_public',
        'model_pdf',
        'fk_incoterms',
        'location_incoterms',
        'import_key',
        'extraparams',
    ];
}
