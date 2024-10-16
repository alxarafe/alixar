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

namespace Dolibarr\Code\Mrp\Model;

use Carbon\Carbon;
use Dolibarr\Code\User\Model\User;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class MrpMo
 *
 * @property int $rowid
 * @property int $entity
 * @property string $ref
 * @property int|null $mrptype
 * @property string|null $label
 * @property float $qty
 * @property int|null $fk_warehouse
 * @property int|null $fk_soc
 * @property string|null $note_public
 * @property string|null $note_private
 * @property Carbon $date_creation
 * @property Carbon|null $date_valid
 * @property Carbon|null $tms
 * @property int $fk_user_creat
 * @property int|null $fk_user_modif
 * @property int|null $fk_user_valid
 * @property string|null $import_key
 * @property string|null $model_pdf
 * @property int $status
 * @property int $fk_product
 * @property Carbon|null $date_start_planned
 * @property Carbon|null $date_end_planned
 * @property int|null $fk_bom
 * @property int|null $fk_project
 * @property string|null $last_main_doc
 * @property int|null $fk_parent_line
 *
 * @property User $user
 * @property Collection|MrpProduction[] $mrp_productions
 */
class MrpMo extends Model
{
    public $timestamps = false;
    protected $table = 'mrp_mo';
    protected $casts = [
        'entity' => 'int',
        'mrptype' => 'int',
        'qty' => 'float',
        'fk_warehouse' => 'int',
        'fk_soc' => 'int',
        'date_creation' => 'datetime',
        'date_valid' => 'datetime',
        'tms' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'fk_user_valid' => 'int',
        'status' => 'int',
        'fk_product' => 'int',
        'date_start_planned' => 'datetime',
        'date_end_planned' => 'datetime',
        'fk_bom' => 'int',
        'fk_project' => 'int',
        'fk_parent_line' => 'int'
    ];

    protected $fillable = [
        'entity',
        'ref',
        'mrptype',
        'label',
        'qty',
        'fk_warehouse',
        'fk_soc',
        'note_public',
        'note_private',
        'date_creation',
        'date_valid',
        'tms',
        'fk_user_creat',
        'fk_user_modif',
        'fk_user_valid',
        'import_key',
        'model_pdf',
        'status',
        'fk_product',
        'date_start_planned',
        'date_end_planned',
        'fk_bom',
        'fk_project',
        'last_main_doc',
        'fk_parent_line'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user_creat');
    }

    public function mrp_productions()
    {
        return $this->hasMany(MrpProduction::class, 'fk_mo');
    }
}
