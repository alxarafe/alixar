<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;
use Modules\Alixar\Lib\Trait\HasReference;

/**
 * Class Proposal
 * Represents table propal
 */
class Proposal extends Model
{
    use HasReference;
    protected $table = 'propal';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'entity',
        'ref_ext',
        'ref_client',
        'fk_soc',
        'fk_projet',
        'datec',
        'datep',
        'fin_validite',
        'date_valid',
        'date_signature',
        'date_cloture',
        'fk_user_author',
        'fk_user_modif',
        'fk_user_valid',
        'fk_user_signature',
        'fk_user_cloture',
        'fk_statut',
        'price',
        'remise_percent',
        'remise_absolue',
        'remise',
        'total_ht',
        'total_tva',
        'localtax1',
        'localtax2',
        'total_ttc',
        'fk_account',
        'fk_currency',
        'fk_cond_reglement',
        'deposit_percent',
        'fk_mode_reglement',
        'online_sign_ip',
        'online_sign_name',
        'note_private',
        'note_public',
        'model_pdf',
        'model_pdf_pos_sign',
        'last_main_doc',
        'date_livraison',
        'fk_shipping_method',
        'fk_warehouse',
        'fk_availability',
        'fk_input_reason',
        'fk_incoterms',
        'location_incoterms',
        'import_key',
        'extraparams',
        'fk_delivery_address',
        'fk_multicurrency',
        'multicurrency_code',
        'multicurrency_tx',
        'multicurrency_total_ht',
        'multicurrency_total_tva',
        'multicurrency_total_ttc',
    ];

    /**
     * Get the third party associated with the proposal.
     */
    public function thirdParty()
    {
        return $this->belongsTo(ThirdParty::class, 'fk_soc', 'rowid');
    }

    /**
     * Get the lines of the proposal.
     */
    public function lines()
    {
        return $this->hasMany(ProposalDetail::class, 'fk_propal', 'rowid');
    }
}
