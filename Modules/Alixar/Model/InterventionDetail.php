<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class InterventionDetail
 * Represents table fichinterdet
 */
class InterventionDetail extends Model
{
    protected $table = 'fichinterdet';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_fichinter',
        'fk_parent_line',
        'date',
        'description',
        'duree',
        'rang',
    ];
}
