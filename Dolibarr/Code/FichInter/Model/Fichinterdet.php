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

namespace Dolibarr\Code\FichInter\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class Fichinterdet
 *
 * @property int $rowid
 * @property int|null $fk_fichinter
 * @property int|null $fk_parent_line
 * @property Carbon|null $date
 * @property string|null $description
 * @property int|null $duree
 * @property int|null $rang
 *
 * @property Fichinter|null $fichinter
 */
class Fichinterdet extends Model
{
    public $timestamps = false;
    protected $table = 'fichinterdet';
    protected $casts = [
        'fk_fichinter' => 'int',
        'fk_parent_line' => 'int',
        'date' => 'datetime',
        'duree' => 'int',
        'rang' => 'int'
    ];

    protected $fillable = [
        'fk_fichinter',
        'fk_parent_line',
        'date',
        'description',
        'duree',
        'rang'
    ];

    public function fichinter()
    {
        return $this->belongsTo(Fichinter::class, 'fk_fichinter');
    }
}
