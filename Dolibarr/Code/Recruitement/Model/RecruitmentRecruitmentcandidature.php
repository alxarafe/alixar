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
use Dolibarr\Code\User\Model\User;
use Dolibarr\Core\Base\Model;

/**
 * Class RecruitmentRecruitmentcandidature
 *
 * @property int $rowid
 * @property int $entity
 * @property string $ref
 * @property int|null $fk_recruitmentjobposition
 * @property string|null $description
 * @property string|null $note_public
 * @property string|null $note_private
 * @property Carbon $date_creation
 * @property Carbon|null $tms
 * @property int $fk_user_creat
 * @property int|null $fk_user_modif
 * @property int|null $fk_user
 * @property string|null $import_key
 * @property string|null $model_pdf
 * @property int $status
 * @property string|null $firstname
 * @property string|null $lastname
 * @property string|null $email
 * @property string|null $phone
 * @property Carbon|null $date_birth
 * @property int|null $remuneration_requested
 * @property int|null $remuneration_proposed
 * @property string|null $email_msgid
 * @property Carbon|null $email_date
 * @property int|null $fk_recruitment_origin
 *
 * @property User $user
 */
class RecruitmentRecruitmentcandidature extends Model
{
    public $timestamps = false;
    protected $table = 'recruitment_recruitmentcandidature';
    protected $casts = [
        'entity' => 'int',
        'fk_recruitmentjobposition' => 'int',
        'date_creation' => 'datetime',
        'tms' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'fk_user' => 'int',
        'status' => 'int',
        'date_birth' => 'datetime',
        'remuneration_requested' => 'int',
        'remuneration_proposed' => 'int',
        'email_date' => 'datetime',
        'fk_recruitment_origin' => 'int'
    ];

    protected $fillable = [
        'entity',
        'ref',
        'fk_recruitmentjobposition',
        'description',
        'note_public',
        'note_private',
        'date_creation',
        'tms',
        'fk_user_creat',
        'fk_user_modif',
        'fk_user',
        'import_key',
        'model_pdf',
        'status',
        'firstname',
        'lastname',
        'email',
        'phone',
        'date_birth',
        'remuneration_requested',
        'remuneration_proposed',
        'email_msgid',
        'email_date',
        'fk_recruitment_origin'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user_creat');
    }
}
