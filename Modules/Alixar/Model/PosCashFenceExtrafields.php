<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class PosCashFenceExtrafields
 * Represents table pos_cash_fence_extrafields
 */
class PosCashFenceExtrafields extends Model
{
    protected $table = 'pos_cash_fence_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
