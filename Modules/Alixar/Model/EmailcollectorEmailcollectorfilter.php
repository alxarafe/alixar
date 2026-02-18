<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class EmailcollectorEmailcollectorfilter
 * Represents table emailcollector_emailcollectorfilter
 */
class EmailcollectorEmailcollectorfilter extends Model
{
    protected $table = 'emailcollector_emailcollectorfilter';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_emailcollector',
        'type',
        'rulevalue',
        'date_creation',
        'fk_user_creat',
        'fk_user_modif',
        'import_key',
        'status',
    ];
}
