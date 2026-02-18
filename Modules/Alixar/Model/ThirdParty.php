<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ThirdParty
 * Represents table societe
 */
class ThirdParty extends Model
{
    protected $table = 'societe';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'nom',
        'name_alias',
        'entity',
        'ref_ext',
        'statut',
        'parent',
        'status',
        'code_client',
        'code_fournisseur',
        'tp_payment_reference',
        'accountancy_code_customer_general',
        'code_compta',
        'accountancy_code_supplier_general',
        'code_compta_fournisseur',
        'address',
        'zip',
        'town',
        'fk_departement',
        'fk_pays',
        'geolat',
        'geolong',
        'geopoint',
        'georesultcode',
        'phone',
        'phone_mobile',
        'fax',
        'url',
        'email',
        'fk_account',
        'socialnetworks',
        'fk_effectif',
        'fk_typent',
        'fk_forme_juridique',
        'fk_currency',
        'siren',
        'siret',
        'ape',
        'idprof4',
        'idprof5',
        'idprof6',
        'tva_intra',
        'capital',
        'fk_stcomm',
        'note_private',
        'note_public',
        'model_pdf',
        'last_main_doc',
        'prefix_comm',
        'client',
        'fournisseur',
        'supplier_account',
        'fk_prospectlevel',
        'fk_incoterms',
        'location_incoterms',
        'customer_bad',
        'customer_rate',
        'supplier_rate',
        'remise_client',
        'remise_supplier',
        'mode_reglement',
        'cond_reglement',
        'deposit_percent',
        'transport_mode',
        'mode_reglement_supplier',
        'cond_reglement_supplier',
        'transport_mode_supplier',
        'fk_shipping_method',
        'tva_assuj',
        'vat_reverse_charge',
        'localtax1_assuj',
        'localtax1_value',
        'localtax2_assuj',
        'localtax2_value',
        'barcode',
        'fk_barcode_type',
        'price_level',
        'outstanding_limit',
        'order_min_amount',
        'supplier_order_min_amount',
        'default_lang',
        'logo',
        'logo_squarred',
        'canvas',
        'fk_warehouse',
        'webservices_url',
        'webservices_key',
        'accountancy_code_sell',
        'accountancy_code_buy',
        'datec',
        'fk_user_creat',
        'fk_user_modif',
        'fk_multicurrency',
        'multicurrency_code',
        'ip',
        'import_key',
    ];

    /**
     * Boot function to handle creation dates if needed.
     */
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->datec)) {
                $model->datec = date('Y-m-d H:i:s');
            }
            if (empty($model->entity)) {
                $model->entity = 1;
            }
        });
    }

    /**
     * Scopes for common queries.
     */

    public function scopeIsClient($query)
    {
        return $query->where('client', '>', 0);
    }

    public function scopeIsSupplier($query)
    {
        return $query->where('fournisseur', '>', 0);
    }
}
