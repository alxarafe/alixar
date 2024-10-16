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

namespace Dolibarr\Code\Holiday\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class Holiday
 *
 * @property int $rowid
 * @property string $ref
 * @property string|null $ref_ext
 * @property int $entity
 * @property int $fk_user
 * @property int|null $fk_user_create
 * @property int|null $fk_user_modif
 * @property int $fk_type
 * @property Carbon $date_create
 * @property string $description
 * @property Carbon $date_debut
 * @property Carbon $date_fin
 * @property int|null $halfday
 * @property float|null $nb_open_day
 * @property int $statut
 * @property int $fk_validator
 * @property Carbon|null $date_valid
 * @property int|null $fk_user_valid
 * @property Carbon|null $date_approval
 * @property int|null $fk_user_approve
 * @property Carbon|null $date_refuse
 * @property int|null $fk_user_refuse
 * @property Carbon|null $date_cancel
 * @property int|null $fk_user_cancel
 * @property string|null $detail_refuse
 * @property string|null $note_private
 * @property string|null $note_public
 * @property Carbon|null $tms
 * @property string|null $import_key
 * @property string|null $extraparams
 */
class Holiday extends Model
{
    public $timestamps = false;
    protected $table = 'holiday';
    protected $casts = [
        'entity' => 'int',
        'fk_user' => 'int',
        'fk_user_create' => 'int',
        'fk_user_modif' => 'int',
        'fk_type' => 'int',
        'date_create' => 'datetime',
        'date_debut' => 'datetime',
        'date_fin' => 'datetime',
        'halfday' => 'int',
        'nb_open_day' => 'float',
        'statut' => 'int',
        'fk_validator' => 'int',
        'date_valid' => 'datetime',
        'fk_user_valid' => 'int',
        'date_approval' => 'datetime',
        'fk_user_approve' => 'int',
        'date_refuse' => 'datetime',
        'fk_user_refuse' => 'int',
        'date_cancel' => 'datetime',
        'fk_user_cancel' => 'int',
        'tms' => 'datetime'
    ];

    protected $fillable = [
        'ref',
        'ref_ext',
        'entity',
        'fk_user',
        'fk_user_create',
        'fk_user_modif',
        'fk_type',
        'date_create',
        'description',
        'date_debut',
        'date_fin',
        'halfday',
        'nb_open_day',
        'statut',
        'fk_validator',
        'date_valid',
        'fk_user_valid',
        'date_approval',
        'fk_user_approve',
        'date_refuse',
        'fk_user_refuse',
        'date_cancel',
        'fk_user_cancel',
        'detail_refuse',
        'note_private',
        'note_public',
        'tms',
        'import_key',
        'extraparams'
    ];
}
