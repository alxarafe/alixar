<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CStcommcontact
 * Represents table c_stcommcontact
 */
class CStcommcontact extends Model
{
    protected $table = 'c_stcommcontact';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'id',
        'code',
        'libelle',
        'picto',
        'active',
    ];
}
