<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;
use Modules\Alixar\Lib\Trait\HasReference;

/**
 * Class Order
 * Represents table commande
 */
class Order extends Model
{
    use HasReference;
    protected $table = 'commande';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'entity',
        'ref_ext',
        'ref_client',
        'fk_soc',
        'fk_projet',
        'date_creation',
        'date_valid',
        'date_cloture',
        'date_commande',
        'fk_user_author',
        'fk_user_modif',
        'fk_user_valid',
        'fk_user_cloture',
        'source',
        'fk_statut',
        'amount_ht',
        'remise_percent',
        'remise_absolue',
        'remise',
        'total_tva',
        'localtax1',
        'localtax2',
        'revenuestamp',
        'total_ht',
        'total_ttc',
        'signed_status',
        'note_private',
        'note_public',
        'model_pdf',
        'last_main_doc',
        'module_source',
        'pos_source',
        'facture',
        'fk_account',
        'fk_currency',
        'fk_cond_reglement',
        'deposit_percent',
        'fk_mode_reglement',
        'date_livraison',
        'fk_shipping_method',
        'fk_warehouse',
        'fk_availability',
        'fk_input_reason',
        'fk_delivery_address',
        'fk_incoterms',
        'location_incoterms',
        'import_key',
        'extraparams',
        'fk_multicurrency',
        'multicurrency_code',
        'multicurrency_tx',
        'multicurrency_total_ht',
        'multicurrency_total_tva',
        'multicurrency_total_ttc',
    ];

    /**
     * Get the third party associated with the order.
     */
    public function thirdParty()
    {
        return $this->belongsTo(ThirdParty::class, 'fk_soc', 'rowid');
    }

    /**
     * Get the lines of the order.
     */
    public function lines()
    {
        return $this->hasMany(OrderDetail::class, 'fk_commande', 'rowid');
    }
}
