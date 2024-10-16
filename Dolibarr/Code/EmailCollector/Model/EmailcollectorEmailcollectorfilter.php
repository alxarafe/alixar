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

namespace Dolibarr\Code\EmailCollector\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class EmailcollectorEmailcollectorfilter
 *
 * @property int $rowid
 * @property int $fk_emailcollector
 * @property string $type
 * @property string|null $rulevalue
 * @property Carbon $date_creation
 * @property Carbon|null $tms
 * @property int $fk_user_creat
 * @property int|null $fk_user_modif
 * @property string|null $import_key
 * @property int $status
 *
 * @property EmailcollectorEmailcollector $emailcollector_emailcollector
 */
class EmailcollectorEmailcollectorfilter extends Model
{
    public $timestamps = false;
    protected $table = 'emailcollector_emailcollectorfilter';
    protected $casts = [
        'fk_emailcollector' => 'int',
        'date_creation' => 'datetime',
        'tms' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'status' => 'int'
    ];

    protected $fillable = [
        'fk_emailcollector',
        'type',
        'rulevalue',
        'date_creation',
        'tms',
        'fk_user_creat',
        'fk_user_modif',
        'import_key',
        'status'
    ];

    public function emailcollector_emailcollector()
    {
        return $this->belongsTo(EmailcollectorEmailcollector::class, 'fk_emailcollector');
    }
}
