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

namespace Dolibarr\Code\Societe\Model;

use Carbon\Carbon;
use Dolibarr\Code\Compta\Model\Facture;
use Dolibarr\Code\Compta\Model\Facturedet;
use Dolibarr\Code\FactureFournisseur\Model\FactureFourn;
use Dolibarr\Code\FactureFournisseur\Model\FactureFournDet;
use Dolibarr\Code\User\Model\User;
use Dolibarr\Core\Base\Model;

/**
 * Class SocieteRemiseExcept
 *
 * @property int $rowid
 * @property int $entity
 * @property int $fk_soc
 * @property int $discount_type
 * @property Carbon|null $datec
 * @property float $amount_ht
 * @property float $amount_tva
 * @property float $amount_ttc
 * @property float $tva_tx
 * @property string|null $vat_src_code
 * @property int $fk_user
 * @property int|null $fk_facture_line
 * @property int|null $fk_facture
 * @property int|null $fk_facture_source
 * @property int|null $fk_invoice_supplier_line
 * @property int|null $fk_invoice_supplier
 * @property int|null $fk_invoice_supplier_source
 * @property string $description
 * @property string|null $multicurrency_code
 * @property float|null $multicurrency_tx
 * @property float $multicurrency_amount_ht
 * @property float $multicurrency_amount_tva
 * @property float $multicurrency_amount_ttc
 *
 * @property Facturedet|null $facturedet
 * @property FactureFournDet|null $facture_fourn_det
 * @property Societe $societe
 * @property Facture|null $facture
 * @property FactureFourn|null $facture_fourn
 * @property User $user
 */
class SocieteRemiseExcept extends Model
{
    public $timestamps = false;
    protected $table = 'societe_remise_except';
    protected $casts = [
        'entity' => 'int',
        'fk_soc' => 'int',
        'discount_type' => 'int',
        'datec' => 'datetime',
        'amount_ht' => 'float',
        'amount_tva' => 'float',
        'amount_ttc' => 'float',
        'tva_tx' => 'float',
        'fk_user' => 'int',
        'fk_facture_line' => 'int',
        'fk_facture' => 'int',
        'fk_facture_source' => 'int',
        'fk_invoice_supplier_line' => 'int',
        'fk_invoice_supplier' => 'int',
        'fk_invoice_supplier_source' => 'int',
        'multicurrency_tx' => 'float',
        'multicurrency_amount_ht' => 'float',
        'multicurrency_amount_tva' => 'float',
        'multicurrency_amount_ttc' => 'float'
    ];

    protected $fillable = [
        'entity',
        'fk_soc',
        'discount_type',
        'datec',
        'amount_ht',
        'amount_tva',
        'amount_ttc',
        'tva_tx',
        'vat_src_code',
        'fk_user',
        'fk_facture_line',
        'fk_facture',
        'fk_facture_source',
        'fk_invoice_supplier_line',
        'fk_invoice_supplier',
        'fk_invoice_supplier_source',
        'description',
        'multicurrency_code',
        'multicurrency_tx',
        'multicurrency_amount_ht',
        'multicurrency_amount_tva',
        'multicurrency_amount_ttc'
    ];

    public function facturedet()
    {
        return $this->belongsTo(Facturedet::class, 'fk_facture_line');
    }

    public function facture_fourn_det()
    {
        return $this->belongsTo(FactureFournDet::class, 'fk_invoice_supplier_line');
    }

    public function societe()
    {
        return $this->belongsTo(Societe::class, 'fk_soc');
    }

    public function facture()
    {
        return $this->belongsTo(Facture::class, 'fk_facture_source');
    }

    public function facture_fourn()
    {
        return $this->belongsTo(FactureFourn::class, 'fk_invoice_supplier');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user');
    }
}
