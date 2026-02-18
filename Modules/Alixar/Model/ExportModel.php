<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ExportModel
 * Represents table export_model
 */
class ExportModel extends Model
{
    protected $table = 'export_model';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'fk_user',
        'label',
        'type',
        'field',
        'filter',
    ];
}
