<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ThirdPartyPrices
 * Represents table societe_prices
 */
class ThirdPartyPrices extends Model
{
    protected $table = 'societe_prices';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_soc',
        'datec',
        'fk_user_author',
        'price_level',
    ];
}
