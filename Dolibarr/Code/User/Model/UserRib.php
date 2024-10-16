<?php

/* Copyright (C) 2024       Rafael San José         <rsanjose@alxarafe.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

namespace Dolibarr\Code\User\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class UserRib
 *
 * @property int $rowid
 * @property int $fk_user
 * @property int $entity
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property string|null $label
 * @property string|null $bank
 * @property string|null $code_banque
 * @property string|null $code_guichet
 * @property string|null $number
 * @property string|null $cle_rib
 * @property string|null $bic
 * @property string|null $bic_intermediate
 * @property string|null $iban_prefix
 * @property string|null $domiciliation
 * @property string|null $proprio
 * @property string|null $owner_address
 * @property int|null $state_id
 * @property int|null $fk_country
 * @property string|null $currency_code
 */
class UserRib extends Model
{
    public $timestamps = false;
    protected $table = 'user_rib';
    protected $casts = [
        'fk_user' => 'int',
        'entity' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime',
        'state_id' => 'int',
        'fk_country' => 'int'
    ];

    protected $fillable = [
        'fk_user',
        'entity',
        'datec',
        'tms',
        'label',
        'bank',
        'code_banque',
        'code_guichet',
        'number',
        'cle_rib',
        'bic',
        'bic_intermediate',
        'iban_prefix',
        'domiciliation',
        'proprio',
        'owner_address',
        'state_id',
        'fk_country',
        'currency_code'
    ];
}
