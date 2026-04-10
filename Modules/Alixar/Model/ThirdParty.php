<?php

declare(strict_types=1);

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;
use Modules\Alixar\Lib\Trait\HasReference;
use Modules\Alixar\Traits\HasWorkflow;

/**
 * Class ThirdParty
 *
 * Represents the 'societe' table from Dolibarr.
 * Handles Customers, Prospects and Suppliers.
 * 
 * @property int $rowid
 * @property string $nom
 * @property string|null $code_client
 * @property string|null $code_fournisseur
 * @property string $datec
 * @property int $entity
 * @property int $client
 * @property int $fournisseur
 * @property int $status
 */
class ThirdParty extends Model
{
    use HasReference;
    use HasWorkflow;

    protected $table = 'societe';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    /**
     * Define the states and transitions for the ThirdParty workflow.
     */
    #[\Override]
    protected function getWorkflowDefinition(): array
    {
        return [
            'states' => [
                0 => 'Closed',
                1 => 'Active',
            ],
            'transitions' => [
                'activate' => ['from' => [0], 'to' => 1],
                'close' => ['from' => [1], 'to' => 0],
            ]
        ];
    }

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
     * Cast numeric columns to their proper types.
     * This prevents SQL errors when empty strings are submitted for integer/decimal fields.
     * Covers all known numeric columns in the societe table.
     */
    protected $casts = [
        'entity' => 'integer',
        'parent' => 'integer',
        'client' => 'integer',
        'fournisseur' => 'integer',
        'status' => 'integer',
        'statut' => 'integer',
        'fk_typent' => 'integer',
        'fk_pays' => 'integer',
        'fk_departement' => 'integer',
        'fk_effectif' => 'integer',
        'fk_forme_juridique' => 'integer',
        'fk_account' => 'integer',
        'fk_stcomm' => 'integer',
        'fk_user_creat' => 'integer',
        'fk_user_modif' => 'integer',
        'fk_prospectlevel' => 'integer',
        'fk_incoterms' => 'integer',
        'fk_shipping_method' => 'integer',
        'fk_barcode_type' => 'integer',
        'fk_warehouse' => 'integer',
        'fk_multicurrency' => 'integer',
        'fk_currency' => 'integer',
        'mode_reglement' => 'integer',
        'cond_reglement' => 'integer',
        'mode_reglement_supplier' => 'integer',
        'cond_reglement_supplier' => 'integer',
        'transport_mode' => 'integer',
        'transport_mode_supplier' => 'integer',
        'tva_assuj' => 'integer',
        'vat_reverse_charge' => 'integer',
        'localtax1_assuj' => 'integer',
        'localtax2_assuj' => 'integer',
        'price_level' => 'integer',
        'customer_bad' => 'integer',
        'deposit_percent' => 'float',
        'capital' => 'float',
        'remise_client' => 'float',
        'remise_supplier' => 'float',
        'outstanding_limit' => 'float',
        'order_min_amount' => 'float',
        'supplier_order_min_amount' => 'float',
        'customer_rate' => 'float',
        'supplier_rate' => 'float',
        'localtax1_value' => 'float',
        'localtax2_value' => 'float',
        'geolat' => 'float',
        'geolong' => 'float',
    ];

    /**
     * Override setAttribute to convert empty strings to null for numeric columns.
     * MySQL strict mode rejects empty strings for integer/decimal columns.
     */
    public function setAttribute($key, $value)
    {
        if ($value === '') {
            // Check if the column is cast as a numeric type
            $castType = $this->casts[$key] ?? null;
            if ($castType && in_array($castType, ['integer', 'float', 'decimal', 'double'])) {
                $value = null;
            }
            // Also catch any fk_* fields not explicitly in casts
            elseif (str_starts_with($key, 'fk_')) {
                $value = null;
            }
        }
        return parent::setAttribute($key, $value);
    }

    /**
     * Boot function to handle automatic timestamps and defaults.
     */
    #[\Override]
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
