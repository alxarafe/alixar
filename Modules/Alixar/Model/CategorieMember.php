<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CategorieMember
 * Represents table categorie_member
 */
class CategorieMember extends Model
{
    protected $table = 'categorie_member';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'fk_categorie',
        'fk_member',
    ];
}
