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

namespace Dolibarr\Code\KnowledgeManagement\Model;

use Carbon\Carbon;
use Dolibarr\Code\User\Model\User;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class KnowledgemanagementKnowledgerecord
 *
 * @property int $rowid
 * @property int $entity
 * @property string $ref
 * @property Carbon $date_creation
 * @property Carbon|null $tms
 * @property string|null $last_main_doc
 * @property string|null $lang
 * @property int $fk_user_creat
 * @property int|null $fk_user_modif
 * @property int|null $fk_user_valid
 * @property string|null $import_key
 * @property string|null $model_pdf
 * @property string $question
 * @property string|null $answer
 * @property string|null $url
 * @property int|null $fk_ticket
 * @property int|null $fk_c_ticket_category
 * @property int $status
 *
 * @property User $user
 * @property Collection|CategorieKnowledgemanagement[] $categorie_knowledgemanagements
 */
class KnowledgemanagementKnowledgerecord extends Model
{
    public $timestamps = false;
    protected $table = 'knowledgemanagement_knowledgerecord';
    protected $casts = [
        'entity' => 'int',
        'date_creation' => 'datetime',
        'tms' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'fk_user_valid' => 'int',
        'fk_ticket' => 'int',
        'fk_c_ticket_category' => 'int',
        'status' => 'int'
    ];

    protected $fillable = [
        'entity',
        'ref',
        'date_creation',
        'tms',
        'last_main_doc',
        'lang',
        'fk_user_creat',
        'fk_user_modif',
        'fk_user_valid',
        'import_key',
        'model_pdf',
        'question',
        'answer',
        'url',
        'fk_ticket',
        'fk_c_ticket_category',
        'status'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user_creat');
    }

    public function categorie_knowledgemanagements()
    {
        return $this->hasMany(CategorieKnowledgemanagement::class, 'fk_knowledgemanagement');
    }
}
