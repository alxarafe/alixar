<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;
use Modules\Alixar\Lib\Trait\HasReference;

/**
 * Class SupplierProposal
 * Represents table supplier_proposal
 */
class SupplierProposal extends Model
{
    use HasReference;

    protected $table = 'supplier_proposal';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'entity',
        'ref_ext',
        'fk_soc',
        'fk_projet',
        'datec',
        'date_valid',
        'date_cloture',
        'fk_user_author',
        'fk_user_modif',
        'fk_user_valid',
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
        'fk_mode_reglement',
        'note_private',
        'note_public',
        'model_pdf',
        'last_main_doc',
        'date_livraison',
        'fk_shipping_method',
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
        return $this->hasMany(SupplierProposalDetail::class, 'fk_supplier_proposal', 'rowid');
    }
}
