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

namespace Dolibarr\Code\Ecm\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class EcmFile
 *
 * @property int $rowid
 * @property string|null $ref
 * @property string $label
 * @property string|null $share
 * @property string|null $share_pass
 * @property int $entity
 * @property string $filepath
 * @property string $filename
 * @property string|null $src_object_type
 * @property int|null $src_object_id
 * @property string|null $fullpath_orig
 * @property string|null $description
 * @property string|null $keywords
 * @property string|null $cover
 * @property int|null $position
 * @property string|null $gen_or_uploaded
 * @property string|null $extraparams
 * @property Carbon|null $date_c
 * @property Carbon|null $tms
 * @property int|null $fk_user_c
 * @property int|null $fk_user_m
 * @property string|null $note_private
 * @property string|null $note_public
 * @property string|null $acl
 */
class EcmFile extends Model
{
    public $timestamps = false;
    protected $table = 'ecm_files';
    protected $casts = [
        'entity' => 'int',
        'src_object_id' => 'int',
        'position' => 'int',
        'date_c' => 'datetime',
        'tms' => 'datetime',
        'fk_user_c' => 'int',
        'fk_user_m' => 'int'
    ];

    protected $fillable = [
        'ref',
        'label',
        'share',
        'share_pass',
        'entity',
        'filepath',
        'filename',
        'src_object_type',
        'src_object_id',
        'fullpath_orig',
        'description',
        'keywords',
        'cover',
        'position',
        'gen_or_uploaded',
        'extraparams',
        'date_c',
        'tms',
        'fk_user_c',
        'fk_user_m',
        'note_private',
        'note_public',
        'acl'
    ];
}
