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

namespace Dolibarr\Code\Website\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class Website
 *
 * @property int $rowid
 * @property string $type_container
 * @property int $entity
 * @property string $ref
 * @property string|null $description
 * @property string|null $maincolor
 * @property string|null $maincolorbis
 * @property string|null $lang
 * @property string|null $otherlang
 * @property int|null $status
 * @property int|null $fk_default_home
 * @property int|null $use_manifest
 * @property string|null $virtualhost
 * @property int|null $fk_user_creat
 * @property int|null $fk_user_modif
 * @property Carbon|null $date_creation
 * @property int|null $position
 * @property Carbon|null $lastaccess
 * @property int|null $lastpageid
 * @property int|null $pageviews_previous_month
 * @property int|null $pageviews_month
 * @property int|null $pageviews_total
 * @property Carbon|null $tms
 * @property string|null $import_key
 * @property string|null $name_template
 *
 * @property Collection|WebsitePage[] $website_pages
 */
class Website extends Model
{
    public $timestamps = false;
    protected $table = 'website';
    protected $casts = [
        'entity' => 'int',
        'status' => 'int',
        'fk_default_home' => 'int',
        'use_manifest' => 'int',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'date_creation' => 'datetime',
        'position' => 'int',
        'lastaccess' => 'datetime',
        'lastpageid' => 'int',
        'pageviews_previous_month' => 'int',
        'pageviews_month' => 'int',
        'pageviews_total' => 'int',
        'tms' => 'datetime'
    ];

    protected $fillable = [
        'type_container',
        'entity',
        'ref',
        'description',
        'maincolor',
        'maincolorbis',
        'lang',
        'otherlang',
        'status',
        'fk_default_home',
        'use_manifest',
        'virtualhost',
        'fk_user_creat',
        'fk_user_modif',
        'date_creation',
        'position',
        'lastaccess',
        'lastpageid',
        'pageviews_previous_month',
        'pageviews_month',
        'pageviews_total',
        'tms',
        'import_key',
        'name_template'
    ];

    public function website_pages()
    {
        return $this->hasMany(WebsitePage::class, 'fk_website');
    }
}
