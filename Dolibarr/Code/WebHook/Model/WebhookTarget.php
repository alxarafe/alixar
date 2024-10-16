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

namespace Dolibarr\Code\WebHook\Model;

use Carbon\Carbon;
use Dolibarr\Code\User\Model\User;
use Dolibarr\Core\Base\Model;

/**
 * Class WebhookTarget
 *
 * @property int $rowid
 * @property string $ref
 * @property string|null $label
 * @property string|null $description
 * @property string|null $note_public
 * @property string|null $note_private
 * @property Carbon $date_creation
 * @property Carbon|null $tms
 * @property int $fk_user_creat
 * @property int|null $fk_user_modif
 * @property string|null $import_key
 * @property int $status
 * @property string $url
 * @property string|null $connection_method
 * @property string|null $connection_data
 * @property string|null $trigger_codes
 *
 * @property User $user
 */
class WebhookTarget extends Model
{
    public $timestamps = false;
    protected $table = 'webhook_target';
    protected $casts = [
        'date_creation' => 'datetime',
        'tms' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'status' => 'int'
    ];

    protected $fillable = [
        'ref',
        'label',
        'description',
        'note_public',
        'note_private',
        'date_creation',
        'tms',
        'fk_user_creat',
        'fk_user_modif',
        'import_key',
        'status',
        'url',
        'connection_method',
        'connection_data',
        'trigger_codes'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user_creat');
    }
}
