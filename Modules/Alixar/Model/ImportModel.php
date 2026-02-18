<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ImportModel
 * Represents table import_model
 */
class ImportModel extends Model
{
    protected $table = 'import_model';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'fk_user',
        'label',
        'type',
        'field',
    ];
}
