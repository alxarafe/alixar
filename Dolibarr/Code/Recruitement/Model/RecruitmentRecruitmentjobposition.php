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

namespace Dolibarr\Code\Recruitement\Model;

use Carbon\Carbon;
use Dolibarr\Code\Hrm\Model\Establishment;
use Dolibarr\Code\User\Model\User;
use Dolibarr\Core\Base\Model;

/**
 * Class RecruitmentRecruitmentjobposition
 *
 * @property int $rowid
 * @property string $ref
 * @property int $entity
 * @property string $label
 * @property int $qty
 * @property int|null $fk_soc
 * @property int|null $fk_project
 * @property int|null $fk_user_recruiter
 * @property string|null $email_recruiter
 * @property int|null $fk_user_supervisor
 * @property int|null $fk_establishment
 * @property Carbon|null $date_planned
 * @property string|null $remuneration_suggested
 * @property string|null $description
 * @property string|null $note_public
 * @property string|null $note_private
 * @property Carbon $date_creation
 * @property Carbon|null $tms
 * @property int $fk_user_creat
 * @property int|null $fk_user_modif
 * @property string|null $last_main_doc
 * @property string|null $import_key
 * @property string|null $model_pdf
 * @property int $status
 *
 * @property Establishment|null $establishment
 * @property User|null $user
 */
class RecruitmentRecruitmentjobposition extends Model
{
    public $timestamps = false;
    protected $table = 'recruitment_recruitmentjobposition';
    protected $casts = [
        'entity' => 'int',
        'qty' => 'int',
        'fk_soc' => 'int',
        'fk_project' => 'int',
        'fk_user_recruiter' => 'int',
        'fk_user_supervisor' => 'int',
        'fk_establishment' => 'int',
        'date_planned' => 'datetime',
        'date_creation' => 'datetime',
        'tms' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'status' => 'int'
    ];

    protected $fillable = [
        'ref',
        'entity',
        'label',
        'qty',
        'fk_soc',
        'fk_project',
        'fk_user_recruiter',
        'email_recruiter',
        'fk_user_supervisor',
        'fk_establishment',
        'date_planned',
        'remuneration_suggested',
        'description',
        'note_public',
        'note_private',
        'date_creation',
        'tms',
        'fk_user_creat',
        'fk_user_modif',
        'last_main_doc',
        'import_key',
        'model_pdf',
        'status'
    ];

    public function establishment()
    {
        return $this->belongsTo(Establishment::class, 'fk_establishment');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user_supervisor');
    }
}
