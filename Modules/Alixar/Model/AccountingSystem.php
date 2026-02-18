<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class AccountingSystem
 * Represents table accounting_system
 */
class AccountingSystem extends Model
{
    protected $table = 'accounting_system';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_country',
        'pcg_version',
        'label',
        'active',
        'date_creation',
        'fk_user_author',
    ];
}
