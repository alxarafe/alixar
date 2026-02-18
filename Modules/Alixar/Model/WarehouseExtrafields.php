<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class WarehouseExtrafields
 * Represents table entrepot_extrafields
 */
class WarehouseExtrafields extends Model
{
    protected $table = 'entrepot_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
