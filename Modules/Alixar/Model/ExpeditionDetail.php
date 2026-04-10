<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ExpeditionDetail
 * Represents table expeditiondet (Líneas de envío)
 */
class ExpeditionDetail extends Model
{
    protected $table = 'expeditiondet';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_expedition',
        'fk_origin_line',
        'fk_entrepot',
        'qty',
        'rang',
    ];
}
