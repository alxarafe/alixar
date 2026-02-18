<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Warehouse
 * Represents table entrepot
 */
class Warehouse extends Model
{
    protected $table = 'entrepot';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'datec',
        'entity',
        'fk_project',
        'description',
        'lieu',
        'address',
        'zip',
        'town',
        'fk_departement',
        'fk_pays',
        'phone',
        'fax',
        'barcode',
        'fk_barcode_type',
        'warehouse_usage',
        'statut',
        'fk_user_author',
        'model_pdf',
        'import_key',
        'fk_parent',
    ];
}
