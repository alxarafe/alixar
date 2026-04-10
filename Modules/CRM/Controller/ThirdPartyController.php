<?php

namespace Modules\CRM\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Boolean;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\RelationList;
use Alxarafe\Component\Container\Panel;
use Alxarafe\Component\Container\Tab;
use Modules\CRM\Domain\Model\ThirdParty;
use Modules\CRM\Domain\Port\Driven\ThirdPartyRepositoryInterface;
use Modules\CRM\Application\AppContainer;
use Alxarafe\Application\Bus\SimpleCommandBus;
use Modules\CRM\Application\Bus\Command\CreateThirdPartyCommand;
use Modules\CRM\Application\Bus\Command\UpdateThirdPartyCommand;

/**
 * Class ThirdPartyController
 * Manages Third Parties (Customers, Prospects, Suppliers).
 *
 * Dolibarr equivalent: htdocs/societe/card.php
 *
 * @package Modules\CRM\Controller
 */
#[Menu(
    menu: 'top_menu',
    label: 'CRM',
    icon: 'fas fa-id-card',
    order: 10,
    permission: 'Alixar.ThirdParty.doIndex'
)]
class ThirdPartyController extends ResourceController
{
    /**
     * Legacy menu constants for sidebar rendering.
     * MENU: top-level group identifier (pipe-separated hierarchy).
     * SIDEBAR_MENU: array of sidebar options displayed under this group.
     */
    const MENU = 'CRM|Terceros';
    const SIDEBAR_MENU = [
        ['option' => 'Listado'],
        ['option' => 'Nuevo Tercero'],
    ];

    /**
     * Enable tab-based edit form (Alxarafe v0.4.8+).
     * Converts getEditFields() sections into Bootstrap nav-tabs.
     */
    protected bool $useTabs = true;

    // Hexagonal adapters
    private ThirdPartyRepositoryInterface $repository;
    private SimpleCommandBus $commandBus;

    public function __construct()
    {
        parent::__construct();
        $this->repository = AppContainer::get()->get(ThirdPartyRepositoryInterface::class);
        $this->commandBus = AppContainer::get()->get(SimpleCommandBus::class);
    }

    #[\Override]
    protected function getModelClass(): string
    {
        return ThirdParty::class;
    }

    // OVERRIDE: Prevent Eloquent grid listing
    #[\Override]
    protected function fetchListData(string $tabId): array
    {
        $filters = [];
        $limit = $this->structConfig['list']['limit'] ?? 50;
        
        $posts = $this->repository->findAll($filters, $limit, $this->offset);
        $total = $this->repository->count($filters);
        
        $data = [];
        foreach ($posts as $post) {
            $data[] = $post->toArray();
        }

        return [
            'data' => $data,
            'meta' => [
                'total' => $total,
                'limit' => $limit,
                'offset' => $this->offset,
            ]
        ];
    }
    
    // OVERRIDE: Prevent Eloquent fetching
    #[\Override]
    protected function fetchRecordData(): array
    {
        if ($this->recordId === 'new') {
            return [
                'id' => 'new',
                'data' => [],
                'meta' => [
                    'model' => ThirdParty::class,
                    'is_new' => true
                ]
            ];
        }

        $post = $this->repository->findById((int) $this->recordId);
        if (!$post) {
            return ['error' => 'Record not found'];
        }

        return [
            'id' => $this->recordId,
            'data' => $post->toArray(),
            'meta' => [
                'model' => ThirdParty::class
            ]
        ];
    }

    // OVERRIDE: Handle saving Hexagonal logic
    #[\Override]
    protected function saveRecord()
    {
        $data = $_POST['data'] ?? [];

        if (!empty($this->recordId) && $this->recordId !== 'new') {
            $cmd = new UpdateThirdPartyCommand(
                id: (int) $this->recordId,
                name: $data['nom'] ?? null,
                type: isset($data['fk_typent']) ? (int) $data['fk_typent'] : null,
                isSupplier: isset($data['fournisseur']) ? (bool) $data['fournisseur'] : null,
                nameAlias: $data['name_alias'] ?? null,
                address: $data['address'] ?? null,
                zip: $data['zip'] ?? null,
                town: $data['town'] ?? null,
                phone: $data['phone'] ?? null,
                phoneMobile: $data['phone_mobile'] ?? null,
                fax: $data['fax'] ?? null,
                email: $data['email'] ?? null,
                url: $data['url'] ?? null,
                vatNumber: $data['tva_intra'] ?? null,
                notePrivate: $data['note_private'] ?? null,
                notePublic: $data['note_public'] ?? null,
                targetStatus: isset($data['status']) ? (int) $data['status'] : null
            );
            $this->commandBus->dispatch($cmd);
            \Alxarafe\Infrastructure\Lib\Messages::addMessage('Tercero modificado con éxito.');
            $id = $this->recordId;
        } else {
            $cmd = new CreateThirdPartyCommand(
                name: $data['nom'] ?? 'Sin nombre',
                type: (int) ($data['fk_typent'] ?? 0),
                isSupplier: (bool) ($data['fournisseur'] ?? false),
                nameAlias: $data['name_alias'] ?? null,
                address: $data['address'] ?? null,
                zip: $data['zip'] ?? null,
                town: $data['town'] ?? null,
                phone: $data['phone'] ?? null,
                phoneMobile: $data['phone_mobile'] ?? null,
                fax: $data['fax'] ?? null,
                email: $data['email'] ?? null,
                url: $data['url'] ?? null,
                vatNumber: $data['tva_intra'] ?? null,
                notePrivate: $data['note_private'] ?? null,
                notePublic: $data['note_public'] ?? null
            );
            $id = $this->commandBus->dispatch($cmd);
            \Alxarafe\Infrastructure\Lib\Messages::addMessage('Tercero creado con éxito.');
        }

        if (isset($_GET['ajax']) && str_starts_with($_GET['ajax'], 'save_record')) {
            $this->jsonResponse([
                'status' => 'success',
                'id' => $id,
                'data' => $data,
                'messages' => \Alxarafe\Infrastructure\Lib\Messages::getMessages(),
            ]);
            exit;
        }

        header('Location: ' . static::url() . '&id=' . $id);
        exit;
    }
    
    // OVERRIDE: Handle Deletion
    #[\Override]
    public function doDelete(): bool
    {
        if ($this->recordId && $this->recordId !== 'new') {
            $this->repository->delete((int) $this->recordId);
            \Alxarafe\Infrastructure\Lib\Messages::addMessage('Tercero borrado con éxito.');
        }
        
        header('Location: ' . static::url());
        exit;
        return true;
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Listado Terceros',
        icon: 'fas fa-list',
        parent: ThirdPartyController::class,
        order: 1,
        permission: 'Alixar.ThirdParty.doIndex'
    )]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Nuevo Tercero',
        icon: 'fas fa-plus',
        parent: ThirdPartyController::class,
        order: 2,
        permission: 'Alixar.ThirdParty.doCreate'
    )]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('nom', 'Nombre'),
            new Text('code_client', 'Cód. Cliente'),
            new Text('town', 'Ciudad'),
            new Text('phone', 'Teléfono'),
            new Text('email', 'Email'),
            new Boolean('client', 'Cliente'),
            new Boolean('fournisseur', 'Proveedor'),
        ];
    }

    #[\Override]
    protected function getEditFields(): array
    {
        return [
            'main' => [
                'label' => 'Ficha',
                'fields' => [
                    new Panel('Identificación', [
                        new Text('nom', 'Razón Social', ['required' => true, 'col' => 'col-md-6']),
                        new Text('name_alias', 'Nombre Comercial', ['col' => 'col-md-6']),
                        new Text('barcode', 'Código de Barras', ['col' => 'col-md-6']),
                        new Text('ref_ext', 'Ref. Externa', ['col' => 'col-md-6']),
                    ]),
                    new Panel('Estado y Tipo', [
                        new Boolean('status', 'Activo', ['col' => 'col-md-3']),
                        new Boolean('client', 'Cliente / Prospecto', ['col' => 'col-md-3']),
                        new Boolean('fournisseur', 'Proveedor', ['col' => 'col-md-3']),
                        new Select('fk_typent', 'Tipo de Tercero',
                            (function() {
                                try {
                                    $values = \Modules\Alixar\Model\CTypent::where('active', 1)
                                        ->pluck('libelle', 'id')
                                        ->toArray();
                                    if (!empty($values)) return $values;
                                } catch (\Throwable $e) {}
                                // Fallback: standard Dolibarr entity types
                                return [
                                    0 => '- Sin definir -',
                                    1 => 'Particular',
                                    2 => 'Pequeña empresa',
                                    3 => 'Mediana empresa',
                                    4 => 'Gran empresa',
                                    5 => 'Administración pública',
                                    8 => 'Asociación',
                                ];
                            })(),
                            ['col' => 'col-md-3']
                        ),
                    ], ['col' => 'col-md-12']),
                    new Panel('Códigos', [
                        new Text('code_client', 'Código Cliente', ['col' => 'col-md-6']),
                        new Text('code_fournisseur', 'Código Proveedor', ['col' => 'col-md-6']),
                    ], ['col' => 'col-md-12']),
                    new Panel('Información Fiscal', [
                        new Text('tva_intra', 'NIF/CIF/IVA', ['col' => 'col-md-4']),
                        new Text('siren', 'SIREN', ['col' => 'col-md-4']),
                        new Text('siret', 'SIRET', ['col' => 'col-md-4']),
                        new Text('ape', 'APE/NAF', ['col' => 'col-md-4']),
                        new Text('idprof4', 'Prof. Id 4', ['col' => 'col-md-4']),
                        new Text('capital', 'Capital Social', ['col' => 'col-md-4']),
                    ]),
                ]
            ],
            'address' => [
                'label' => 'Dirección',
                'fields' => [
                    new Panel('Dirección Postal', [
                        new Text('address', 'Dirección'),
                        new Text('zip', 'CP', ['col' => 'col-md-3']),
                        new Text('town', 'Ciudad', ['col' => 'col-md-3']),
                        new Text('fk_departement', 'Provincia', ['col' => 'col-md-3']),
                        new Text('fk_pays', 'País', ['col' => 'col-md-3']),
                    ]),
                    new Panel('Contacto Directo', [
                        new Text('phone', 'Teléfono', ['col' => 'col-md-4']),
                        new Text('phone_mobile', 'Móvil', ['col' => 'col-md-4']),
                        new Text('fax', 'Fax', ['col' => 'col-md-4']),
                        new Text('email', 'Email', ['col' => 'col-md-6']),
                        new Text('url', 'Sitio Web', ['col' => 'col-md-6']),
                    ]),
                ]
            ],
            'commercial' => [
                'label' => 'Comercial',
                'fields' => [
                    new Panel('Condiciones Comerciales', [
                        new Text('remise_client', 'Descuento cliente (%)', ['col' => 'col-md-4']),
                        new Text('outstanding_limit', 'Límite de riesgo', ['col' => 'col-md-4']),
                        new Text('order_min_amount', 'Pedido mínimo', ['col' => 'col-md-4']),
                        new Text('mode_reglement', 'Forma de pago', ['col' => 'col-md-6']),
                        new Text('cond_reglement', 'Condiciones pago', ['col' => 'col-md-6']),
                    ]),
                    new Panel('Condiciones Proveedor', [
                        new Text('remise_supplier', 'Descuento prov. (%)', ['col' => 'col-md-4']),
                        new Text('supplier_order_min_amount', 'Pedido mín. prov.', ['col' => 'col-md-4']),
                        new Text('mode_reglement_supplier', 'Forma pago prov.', ['col' => 'col-md-6']),
                        new Text('cond_reglement_supplier', 'Cond. pago prov.', ['col' => 'col-md-6']),
                    ]),
                    new Panel('Contabilidad', [
                        new Text('code_compta', 'Cuenta contable cliente', ['col' => 'col-md-6']),
                        new Text('code_compta_fournisseur', 'Cuenta contable prov.', ['col' => 'col-md-6']),
                    ]),
                ]
            ],
            'contacts' => [
                'label' => 'Contactos',
                'fields' => [
                    new RelationList('contacts', 'Contactos', [
                        ['field' => 'lastname', 'label' => 'Apellidos'],
                        ['field' => 'firstname', 'label' => 'Nombre'],
                        ['field' => 'poste', 'label' => 'Cargo'],
                        ['field' => 'phone', 'label' => 'Teléfono'],
                        ['field' => 'email', 'label' => 'Email'],
                    ])
                ]
            ],
            'notes' => [
                'label' => 'Notas',
                'fields' => [
                    new Panel('Notas', [
                        new Textarea('note_private', 'Nota Privada'),
                        new Textarea('note_public', 'Nota Pública'),
                    ]),
                ]
            ],
        ];
    }

    #[\Override]
    protected function beforeConfig()
    {
        if ($this->recordId && $this->recordId !== 'new') {
            // Using repository instead of Eloquent record property
            $record = clone $this->repository->findById((int) $this->recordId);
            $this->addVariable('title', ($record ? $record->getName() : 'Tercero') . ' — Ficha');
        } else {
            $this->addVariable('title', 'Nuevo Tercero');
        }
    }
}
