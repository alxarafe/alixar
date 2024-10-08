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

use Carbon\Carbon;
use Dolibarr\Code\Bank\Model\CategorieAccount;
use Dolibarr\Code\Comm\Model\Actioncomm;
use Dolibarr\Code\Contact\Model\CategorieContact;
use Dolibarr\Code\Fourn\Model\CategorieFournisseur;
use Dolibarr\Code\KnowledgeManagement\Model\CategorieKnowledgemanagement;
use Dolibarr\Code\Members\Model\CategorieMember;
use Dolibarr\Code\Product\Model\Product;
use Dolibarr\Code\ProductStock\Model\CategorieWarehouse;
use Dolibarr\Code\Projet\Model\CategorieProject;
use Dolibarr\Code\Societe\Model\Societe;
use Dolibarr\Code\Ticket\Model\Ticket;
use Dolibarr\Code\UserGroup\Model\User;
use Dolibarr\Code\Website\Model\WebsitePage;
use Dolibarr\Core\Base\Model;
use Dolibarr\Core\Model\ElementCategorie;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class Categorie
 *
 * @property int $rowid
 * @property int $entity
 * @property int $fk_parent
 * @property string $label
 * @property string|null $ref_ext
 * @property int $type
 * @property string|null $description
 * @property string|null $color
 * @property int|null $position
 * @property int|null $fk_soc
 * @property int $visible
 * @property Carbon|null $date_creation
 * @property Carbon|null $tms
 * @property int|null $fk_user_creat
 * @property int|null $fk_user_modif
 * @property string|null $import_key
 *
 * @property Collection|CategorieAccount[] $categorie_accounts
 * @property Collection|Actioncomm[] $actioncomms
 * @property Collection|CategorieContact[] $categorie_contacts
 * @property Collection|CategorieFournisseur[] $categorie_fournisseurs
 * @property Collection|CategorieKnowledgemanagement[] $categorie_knowledgemanagements
 * @property Collection|CategorieLang[] $categorie_langs
 * @property Collection|CategorieMember[] $categorie_members
 * @property Collection|Product[] $products
 * @property Collection|CategorieProject[] $categorie_projects
 * @property Collection|Societe[] $societes
 * @property Collection|Ticket[] $tickets
 * @property Collection|User[] $users
 * @property Collection|CategorieWarehouse[] $categorie_warehouses
 * @property Collection|WebsitePage[] $website_pages
 * @property Collection|ElementCategorie[] $element_categories
 */
class Categorie extends Model
{
    public $timestamps = false;
    protected $table = 'categorie';
    protected $casts = [
        'entity' => 'int',
        'fk_parent' => 'int',
        'type' => 'int',
        'position' => 'int',
        'fk_soc' => 'int',
        'visible' => 'int',
        'date_creation' => 'datetime',
        'tms' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int'
    ];

    protected $fillable = [
        'entity',
        'fk_parent',
        'label',
        'ref_ext',
        'type',
        'description',
        'color',
        'position',
        'fk_soc',
        'visible',
        'date_creation',
        'tms',
        'fk_user_creat',
        'fk_user_modif',
        'import_key'
    ];

    public function categorie_accounts()
    {
        return $this->hasMany(CategorieAccount::class, 'fk_categorie');
    }

    public function actioncomms()
    {
        return $this->belongsToMany(Actioncomm::class, 'alx_categorie_actioncomm', 'fk_categorie', 'fk_actioncomm')
            ->withPivot('import_key');
    }

    public function categorie_contacts()
    {
        return $this->hasMany(CategorieContact::class, 'fk_categorie');
    }

    public function categorie_fournisseurs()
    {
        return $this->hasMany(CategorieFournisseur::class, 'fk_categorie');
    }

    public function categorie_knowledgemanagements()
    {
        return $this->hasMany(CategorieKnowledgemanagement::class, 'fk_categorie');
    }

    public function categorie_langs()
    {
        return $this->hasMany(CategorieLang::class, 'fk_category');
    }

    public function categorie_members()
    {
        return $this->hasMany(CategorieMember::class, 'fk_categorie');
    }

    public function products()
    {
        return $this->belongsToMany(Product::class, 'alx_categorie_product', 'fk_categorie', 'fk_product')
            ->withPivot('import_key');
    }

    public function categorie_projects()
    {
        return $this->hasMany(CategorieProject::class, 'fk_categorie');
    }

    public function societes()
    {
        return $this->belongsToMany(Societe::class, 'alx_categorie_societe', 'fk_categorie', 'fk_soc')
            ->withPivot('import_key');
    }

    public function tickets()
    {
        return $this->belongsToMany(Ticket::class, 'alx_categorie_ticket', 'fk_categorie', 'fk_ticket')
            ->withPivot('import_key');
    }

    public function users()
    {
        return $this->belongsToMany(User::class, 'alx_categorie_user', 'fk_categorie', 'fk_user')
            ->withPivot('import_key');
    }

    public function categorie_warehouses()
    {
        return $this->hasMany(CategorieWarehouse::class, 'fk_categorie');
    }

    public function website_pages()
    {
        return $this->belongsToMany(WebsitePage::class, 'alx_categorie_website_page', 'fk_categorie', 'fk_website_page')
            ->withPivot('import_key');
    }

    public function element_categories()
    {
        return $this->hasMany(ElementCategorie::class, 'fk_categorie');
    }
}
