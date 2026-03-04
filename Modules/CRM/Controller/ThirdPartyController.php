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
use Modules\Alixar\Model\ThirdParty;

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
     * Enable tab-based edit form (Alxarafe v0.4.8+).
     * Converts getEditFields() sections into Bootstrap nav-tabs.
     */
    protected bool $useTabs = true;

    protected function getModelClass(): string
    {
        return ThirdParty::class;
    }

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
                        new Select('fk_typent', 'Tipo de Tercero', [
                            'model' => \Modules\Alixar\Model\CTypent::class,
                            'label_field' => 'libelle',
                            'col' => 'col-md-3'
                        ]),
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

    protected function beforeConfig()
    {
        if ($this->recordId && $this->recordId !== 'new') {
            $record = $this->getRecord();
            $this->addVariable('title', ($record->nom ?? 'Tercero') . ' — Ficha');
        } else {
            $this->addVariable('title', 'Nuevo Tercero');
        }
    }
}
