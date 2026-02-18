<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Delivery
 * Represents table delivery
 */
class Delivery extends Model
{
    protected $table = 'delivery';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'entity',
        'fk_soc',
        'ref_ext',
        'ref_customer',
        'date_creation',
        'fk_user_author',
        'date_valid',
        'fk_user_valid',
        'date_delivery',
        'fk_address',
        'fk_statut',
        'total_ht',
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
