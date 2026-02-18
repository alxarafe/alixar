<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ReceptionDetailBatchExtrafields
 * Represents table receptiondet_batch_extrafields
 */
class ReceptionDetailBatchExtrafields extends Model
{
    protected $table = 'receptiondet_batch_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
