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
use Dolibarr\Code\Categories\Model\Categorie;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class WebsitePage
 *
 * @property int $rowid
 * @property int $fk_website
 * @property string $type_container
 * @property string $pageurl
 * @property string|null $aliasalt
 * @property string|null $title
 * @property string|null $description
 * @property string|null $image
 * @property string|null $keywords
 * @property string|null $lang
 * @property int|null $fk_page
 * @property int|null $allowed_in_frames
 * @property string|null $htmlheader
 * @property string|null $content
 * @property int|null $status
 * @property string|null $grabbed_from
 * @property int|null $fk_user_creat
 * @property int|null $fk_user_modif
 * @property string|null $author_alias
 * @property Carbon|null $date_creation
 * @property Carbon|null $tms
 * @property string|null $import_key
 * @property string|null $object_type
 * @property string|null $fk_object
 *
 * @property Website $website
 * @property Collection|Categorie[] $categories
 */
class WebsitePage extends Model
{
    public $timestamps = false;
    protected $table = 'website_page';
    protected $casts = [
        'fk_website' => 'int',
        'fk_page' => 'int',
        'allowed_in_frames' => 'int',
        'status' => 'int',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'date_creation' => 'datetime',
        'tms' => 'datetime'
    ];

    protected $fillable = [
        'fk_website',
        'type_container',
        'pageurl',
        'aliasalt',
        'title',
        'description',
        'image',
        'keywords',
        'lang',
        'fk_page',
        'allowed_in_frames',
        'htmlheader',
        'content',
        'status',
        'grabbed_from',
        'fk_user_creat',
        'fk_user_modif',
        'author_alias',
        'date_creation',
        'tms',
        'import_key',
        'object_type',
        'fk_object'
    ];

    public function website()
    {
        return $this->belongsTo(Website::class, 'fk_website');
    }

    public function categories()
    {
        return $this->belongsToMany(Categorie::class, 'alx_categorie_website_page', 'fk_website_page', 'fk_categorie')
            ->withPivot('import_key');
    }
}
