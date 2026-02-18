<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ContractDetail
 * Represents table contratdet
 */
class ContractDetail extends Model
{
    protected $table = 'contratdet';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_contrat',
        'fk_product',
        'statut',
        'label',
        'description',
        'fk_remise_except',
        'date_commande',
        'date_ouverture_prevue',
        'date_ouverture',
        'date_fin_validite',
        'date_cloture',
        'vat_src_code',
        'tva_tx',
        'localtax1_tx',
        'localtax1_type',
        'localtax2_tx',
        'localtax2_type',
        'qty',
        'remise_percent',
        'subprice',
        'subprice_ttc',
        'price_ht',
        'remise',
        'total_ht',
        'total_tva',
        'total_localtax1',
        'total_localtax2',
        'total_ttc',
        'product_type',
        'info_bits',
        'rang',
        'buy_price_ht',
        'fk_product_fournisseur_price',
        'fk_user_author',
        'fk_user_ouverture',
        'fk_user_cloture',
        'commentaire',
        'fk_unit',
        'fk_multicurrency',
        'multicurrency_code',
        'multicurrency_subprice',
        'multicurrency_subprice_ttc',
        'multicurrency_total_ht',
        'multicurrency_total_tva',
        'multicurrency_total_ttc',
    ];
}
