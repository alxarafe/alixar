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

namespace Dolibarr\Core\Model;

use Dolibarr\Code\Comm\Model\Propaldet;
use Dolibarr\Code\Commande\Model\Commandedet;
use Dolibarr\Code\Compta\Model\Facturedet;
use Dolibarr\Code\Compta\Model\FacturedetRec;
use Dolibarr\Code\Contrat\Model\Contratdet;
use Dolibarr\Code\FactureFournisseur\Model\FactureFournDet;
use Dolibarr\Code\FactureFournisseur\Model\FactureFournDetRec;
use Dolibarr\Code\Fourn\Model\CommandeFournisseurdet;
use Dolibarr\Code\Product\Model\Product;
use Dolibarr\Code\SupplierProposal\Model\SupplierProposaldet;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class CUnit
 *
 * @property int $rowid
 * @property string|null $code
 * @property int|null $sortorder
 * @property int|null $scale
 * @property string|null $label
 * @property string|null $short_label
 * @property string|null $unit_type
 * @property int $active
 *
 * @property Collection|CommandeFournisseurdet[] $commande_fournisseurdets
 * @property Collection|Commandedet[] $commandedets
 * @property Collection|Contratdet[] $contratdets
 * @property Collection|FactureFournDet[] $facture_fourn_dets
 * @property Collection|FactureFournDetRec[] $facture_fourn_det_recs
 * @property Collection|Facturedet[] $facturedets
 * @property Collection|FacturedetRec[] $facturedet_recs
 * @property Collection|Product[] $products
 * @property Collection|Propaldet[] $propaldets
 * @property Collection|SupplierProposaldet[] $supplier_proposaldets
 */
class CUnit extends Model
{
    public $timestamps = false;
    protected $table = 'c_units';
    protected $casts = [
        'sortorder' => 'int',
        'scale' => 'int',
        'active' => 'int'
    ];

    protected $fillable = [
        'code',
        'sortorder',
        'scale',
        'label',
        'short_label',
        'unit_type',
        'active'
    ];

    public function commande_fournisseurdets()
    {
        return $this->hasMany(CommandeFournisseurdet::class, 'fk_unit');
    }

    public function commandedets()
    {
        return $this->hasMany(Commandedet::class, 'fk_unit');
    }

    public function contratdets()
    {
        return $this->hasMany(Contratdet::class, 'fk_unit');
    }

    public function facture_fourn_dets()
    {
        return $this->hasMany(FactureFournDet::class, 'fk_unit');
    }

    public function facture_fourn_det_recs()
    {
        return $this->hasMany(FactureFournDetRec::class, 'fk_unit');
    }

    public function facturedets()
    {
        return $this->hasMany(Facturedet::class, 'fk_unit');
    }

    public function facturedet_recs()
    {
        return $this->hasMany(FacturedetRec::class, 'fk_unit');
    }

    public function products()
    {
        return $this->hasMany(Product::class, 'fk_unit');
    }

    public function propaldets()
    {
        return $this->hasMany(Propaldet::class, 'fk_unit');
    }

    public function supplier_proposaldets()
    {
        return $this->hasMany(SupplierProposaldet::class, 'fk_unit');
    }
}
