<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class OrderDetailExtrafields
 * Represents table commandedet_extrafields
 */
class OrderDetailExtrafields extends Model
{
    protected $table = 'commandedet_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
