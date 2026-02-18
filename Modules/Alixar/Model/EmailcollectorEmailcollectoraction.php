<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class EmailcollectorEmailcollectoraction
 * Represents table emailcollector_emailcollectoraction
 */
class EmailcollectorEmailcollectoraction extends Model
{
    protected $table = 'emailcollector_emailcollectoraction';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_emailcollector',
        'type',
        'actionparam',
        'date_creation',
        'fk_user_creat',
        'fk_user_modif',
        'position',
        'import_key',
        'status',
    ];
}
