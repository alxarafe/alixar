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

namespace Dolibarr\Code\Categories\Model;

use Dolibarr\Code\Website\Model\WebsitePage;
use Dolibarr\Core\Base\Model;

/**
 * Class CategorieWebsitePage
 *
 * @property int $fk_categorie
 * @property int $fk_website_page
 * @property string|null $import_key
 *
 * @property Categorie $categorie
 * @property WebsitePage $website_page
 */
class CategorieWebsitePage extends Model
{
    public $incrementing = false;
    public $timestamps = false;
    protected $table = 'categorie_website_page';
    protected $casts = [
        'fk_categorie' => 'int',
        'fk_website_page' => 'int'
    ];

    protected $fillable = [
        'import_key'
    ];

    public function categorie()
    {
        return $this->belongsTo(Categorie::class, 'fk_categorie');
    }

    public function website_page()
    {
        return $this->belongsTo(WebsitePage::class, 'fk_website_page');
    }
}
