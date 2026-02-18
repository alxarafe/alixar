<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class BankAccountUrl
 * Represents table bank_url
 */
class BankAccountUrl extends Model
{
    protected $table = 'bank_url';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_bank',
        'url_id',
        'url',
        'label',
        'type',
    ];
}
