<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CTransportMode
 * Represents table c_transport_mode
 */
class CTransportMode extends Model
{
    protected $table = 'c_transport_mode';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'code',
        'label',
        'active',
    ];
}
