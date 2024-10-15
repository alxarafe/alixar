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
 * Class Prelevement
 *
 * @property int $rowid
 * @property int|null $fk_facture
 * @property int|null $fk_facture_fourn
 * @property int|null $fk_salary
 * @property int $fk_prelevement_lignes
 *
 * @property PrelevementLigne $prelevement_ligne
 */
class Prelevement extends Model
{
    public $timestamps = false;
    protected $table = 'prelevement';
    protected $casts = [
        'fk_facture' => 'int',
        'fk_facture_fourn' => 'int',
        'fk_salary' => 'int',
        'fk_prelevement_lignes' => 'int'
    ];

    protected $fillable = [
        'fk_facture',
        'fk_facture_fourn',
        'fk_salary',
        'fk_prelevement_lignes'
    ];

    public function prelevement_ligne()
    {
        return $this->belongsTo(PrelevementLigne::class, 'fk_prelevement_lignes');
    }
}
