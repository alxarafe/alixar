<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class BlockedlogAuthority
 * Represents table blockedlog_authority
 */
class BlockedlogAuthority extends Model
{
    protected $table = 'blockedlog_authority';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'blockchain',
        'signature',
    ];
}
