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

namespace Dolibarr\Code\Projet\Model;

use Carbon\Carbon;
use Dolibarr\Code\User\Model\User;
use Dolibarr\Core\Base\Model;

/**
 * Class ProjetTask
 *
 * @property int $rowid
 * @property string|null $ref
 * @property int $entity
 * @property int $fk_projet
 * @property int $fk_task_parent
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property Carbon|null $dateo
 * @property Carbon|null $datee
 * @property Carbon|null $datev
 * @property string $label
 * @property string|null $description
 * @property float|null $duration_effective
 * @property float|null $planned_workload
 * @property int|null $progress
 * @property int|null $priority
 * @property float|null $budget_amount
 * @property int|null $fk_user_creat
 * @property int|null $fk_user_modif
 * @property int|null $fk_user_valid
 * @property int $fk_statut
 * @property string|null $note_private
 * @property string|null $note_public
 * @property int|null $rang
 * @property string|null $model_pdf
 * @property string|null $import_key
 * @property int|null $billable
 *
 * @property Projet $projet
 * @property User|null $user
 */
class ProjetTask extends Model
{
    public $timestamps = false;
    protected $table = 'projet_task';
    protected $casts = [
        'entity' => 'int',
        'fk_projet' => 'int',
        'fk_task_parent' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime',
        'dateo' => 'datetime',
        'datee' => 'datetime',
        'datev' => 'datetime',
        'duration_effective' => 'float',
        'planned_workload' => 'float',
        'progress' => 'int',
        'priority' => 'int',
        'budget_amount' => 'float',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'fk_user_valid' => 'int',
        'fk_statut' => 'int',
        'rang' => 'int',
        'billable' => 'int'
    ];

    protected $fillable = [
        'ref',
        'entity',
        'fk_projet',
        'fk_task_parent',
        'datec',
        'tms',
        'dateo',
        'datee',
        'datev',
        'label',
        'description',
        'duration_effective',
        'planned_workload',
        'progress',
        'priority',
        'budget_amount',
        'fk_user_creat',
        'fk_user_modif',
        'fk_user_valid',
        'fk_statut',
        'note_private',
        'note_public',
        'rang',
        'model_pdf',
        'import_key',
        'billable'
    ];

    public function projet()
    {
        return $this->belongsTo(Projet::class, 'fk_projet');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user_valid');
    }
}
