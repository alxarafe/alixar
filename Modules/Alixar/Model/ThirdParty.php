<?php

declare(strict_types=1);

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;
use Alxarafe\Base\Model\Trait\HasWorkflow;
use Modules\Alixar\Lib\Trait\HasReference;

/**
 * Class ThirdParty
 *
 * Represents the 'societe' table from Dolibarr.
 * Handles Customers, Prospects and Suppliers.
 */
class ThirdParty extends Model
{
    use HasReference;
    use HasWorkflow;

    protected $table = 'societe';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    /**
     * Workflow states for Third Party status.
     * Field: status (Dolibarr names it 'status', unlike orders/invoices 'fk_statut')
     * @var array
     */
    protected array $states = [
        0 => ['label' => 'Closed', 'transitions' => [1]],
        1 => ['label' => 'Active', 'transitions' => [0]],
    ];

    protected string $stateField = 'status';

    /**
     * Automatic Reference Configuration
     *
     * Dolibarr Templates:
     * - Monkey: 'CU{yy}{mm}-{0000}'
     * - Leopard: (Remove field from mask to allow free text)
     */
    protected array $referenceConfig = [
        'code_client' => 'CU{yy}{mm}-{0000}',
        'code_fournisseur' => 'SU{yy}{mm}-{0000}'
    ];

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
     * Boot function to handle automatic timestamps and defaults.
     */
    protected static function boot(): void
    {
        parent::boot();

        static::creating(function (self $model): void {
            if (empty($model->datec)) {
                $model->datec = date('Y-m-d H:i:s');
            }
            if (!isset($model->entity)) {
                $model->entity = 1;
            }
        });
    }

    /**
     * Get the contacts associated with this third party.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function contacts()
    {
        return $this->hasMany(Contact::class, 'fk_soc', 'rowid');
    }

    /**
     * Semantic checks for entity types.
     */

    public function isCustomer(): bool
    {
        return (int)$this->client === 1 || (int)$this->client === 3;
    }

    public function isProspect(): bool
    {
        return (int)$this->client === 2 || (int)$this->client === 3;
    }

    public function isSupplier(): bool
    {
        return (int)$this->fournisseur === 1;
    }

    /**
     * Scopes for filtering Third Parties.
     */

    public function scopeIsClient($query)
    {
        return $query->whereIn('client', [1, 3]);
    }

    public function scopeIsSupplier($query)
    {
        return $query->where('fournisseur', 1);
    }
}
