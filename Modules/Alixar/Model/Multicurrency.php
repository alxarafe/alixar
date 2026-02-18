<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Multicurrency
 * Represents table multicurrency
 */
class Multicurrency extends Model
{
    protected $table = 'multicurrency';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'date_create',
        'code',
        'name',
        'entity',
        'fk_user',
    ];
}
