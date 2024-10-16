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

namespace Dolibarr\Code\Bom\Model;

use Carbon\Carbon;
use Dolibarr\Code\User\Model\User;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class BomBom
 *
 * @property int $rowid
 * @property int $entity
 * @property string $ref
 * @property int|null $bomtype
 * @property string|null $label
 * @property int|null $fk_product
 * @property string|null $description
 * @property string|null $note_public
 * @property string|null $note_private
 * @property int|null $fk_warehouse
 * @property float|null $qty
 * @property float|null $efficiency
 * @property float|null $duration
 * @property Carbon $date_creation
 * @property Carbon|null $date_valid
 * @property Carbon|null $tms
 * @property int $fk_user_creat
 * @property int|null $fk_user_modif
 * @property int|null $fk_user_valid
 * @property string|null $import_key
 * @property string|null $model_pdf
 * @property int $status
 *
 * @property User $user
 * @property Collection|BomBomline[] $bom_bomlines
 */
class BomBom extends Model
{
    public $timestamps = false;
    protected $table = 'bom_bom';
    protected $casts = [
        'entity' => 'int',
        'bomtype' => 'int',
        'fk_product' => 'int',
        'fk_warehouse' => 'int',
        'qty' => 'float',
        'efficiency' => 'float',
        'duration' => 'float',
        'date_creation' => 'datetime',
        'date_valid' => 'datetime',
        'tms' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'fk_user_valid' => 'int',
        'status' => 'int'
    ];

    protected $fillable = [
        'entity',
        'ref',
        'bomtype',
        'label',
        'fk_product',
        'description',
        'note_public',
        'note_private',
        'fk_warehouse',
        'qty',
        'efficiency',
        'duration',
        'date_creation',
        'date_valid',
        'tms',
        'fk_user_creat',
        'fk_user_modif',
        'fk_user_valid',
        'import_key',
        'model_pdf',
        'status'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user_creat');
    }

    public function bom_bomlines()
    {
        return $this->hasMany(BomBomline::class, 'fk_bom');
    }
}
