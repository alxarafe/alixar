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

namespace Dolibarr\Core\Model;

use Dolibarr\Core\Base\Model;

/**
 * Class CInvoiceSubtype
 *
 * @property int $rowid
 * @property int $entity
 * @property int $fk_country
 * @property string $code
 * @property string|null $label
 * @property int $active
 */
class CInvoiceSubtype extends Model
{
    public $timestamps = false;
    protected $table = 'c_invoice_subtype';
    protected $casts = [
        'entity' => 'int',
        'fk_country' => 'int',
        'active' => 'int'
    ];

    protected $fillable = [
        'entity',
        'fk_country',
        'code',
        'label',
        'active'
    ];
}
