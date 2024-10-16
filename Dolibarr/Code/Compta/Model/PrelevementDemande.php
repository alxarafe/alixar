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

namespace Dolibarr\Code\Compta\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class PrelevementDemande
 *
 * @property int $rowid
 * @property int $entity
 * @property int|null $fk_facture
 * @property int|null $fk_facture_fourn
 * @property int|null $fk_salary
 * @property string|null $sourcetype
 * @property float $amount
 * @property Carbon $date_demande
 * @property int|null $traite
 * @property Carbon|null $date_traite
 * @property int|null $fk_prelevement_bons
 * @property int $fk_user_demande
 * @property string|null $code_banque
 * @property string|null $code_guichet
 * @property string|null $number
 * @property string|null $cle_rib
 * @property string|null $type
 * @property string|null $ext_payment_id
 * @property string|null $ext_payment_site
 */
class PrelevementDemande extends Model
{
    public $timestamps = false;
    protected $table = 'prelevement_demande';
    protected $casts = [
        'entity' => 'int',
        'fk_facture' => 'int',
        'fk_facture_fourn' => 'int',
        'fk_salary' => 'int',
        'amount' => 'float',
        'date_demande' => 'datetime',
        'traite' => 'int',
        'date_traite' => 'datetime',
        'fk_prelevement_bons' => 'int',
        'fk_user_demande' => 'int'
    ];

    protected $fillable = [
        'entity',
        'fk_facture',
        'fk_facture_fourn',
        'fk_salary',
        'sourcetype',
        'amount',
        'date_demande',
        'traite',
        'date_traite',
        'fk_prelevement_bons',
        'fk_user_demande',
        'code_banque',
        'code_guichet',
        'number',
        'cle_rib',
        'type',
        'ext_payment_id',
        'ext_payment_site'
    ];
}
