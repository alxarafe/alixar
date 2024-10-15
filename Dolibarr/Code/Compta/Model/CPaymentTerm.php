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

use Dolibarr\Core\Base\Model;

/**
 * Class CPaymentTerm
 *
 * @property int $rowid
 * @property int $entity
 * @property string|null $code
 * @property int|null $sortorder
 * @property int|null $active
 * @property string|null $libelle
 * @property string|null $libelle_facture
 * @property int|null $type_cdr
 * @property int|null $nbjour
 * @property int|null $decalage
 * @property string|null $deposit_percent
 * @property string|null $module
 * @property int $position
 */
class CPaymentTerm extends Model
{
    public $timestamps = false;
    protected $table = 'c_payment_term';
    protected $casts = [
        'entity' => 'int',
        'sortorder' => 'int',
        'active' => 'int',
        'type_cdr' => 'int',
        'nbjour' => 'int',
        'decalage' => 'int',
        'position' => 'int'
    ];

    protected $fillable = [
        'entity',
        'code',
        'sortorder',
        'active',
        'libelle',
        'libelle_facture',
        'type_cdr',
        'nbjour',
        'decalage',
        'deposit_percent',
        'module',
        'position'
    ];
}
