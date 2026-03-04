<?php

namespace Modules\Purchase\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\Decimal;
use Alxarafe\Component\Fields\RelationList;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\InvoiceFourn;
use Modules\Alixar\Model\ThirdParty;

/**
 * Class SupplierInvoiceController
 * Manages Purchase Invoices (Facturas de Proveedor).
 *
 * @package Modules\Purchase\Controller
 */
#[Menu(
    menu: 'main_menu',
    label: 'Facturas Prov.',
    icon: 'fas fa-file-invoice-dollar',
    parent: SupplierProposalController::class,
    order: 20,
    permission: 'Alixar.SupplierInvoice.doIndex'
)]
class SupplierInvoiceController extends ResourceController
{
    protected bool $useTabs = true;

    protected function getModelClass(): string
    {
        return InvoiceFourn::class;
    }

    #[Menu(
        menu: 'main_menu',
        label: 'Listado Facturas',
        icon: 'fas fa-list',
        parent: SupplierInvoiceController::class,
        order: 1,
        permission: 'Alixar.SupplierInvoice.doIndex'
    )]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[Menu(
        menu: 'main_menu',
        label: 'Nueva Factura',
        icon: 'fas fa-plus',
        parent: SupplierInvoiceController::class,
        order: 2,
        permission: 'Alixar.SupplierInvoice.doCreate'
    )]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }

    protected function getListColumns(): array
    {
        return [
            new Text('ref', 'Referencia'),
            new Text('ref_supplier', 'Ref. Prov.'),
            new Text('thirdParty.nom', 'Proveedor'),
            new Date('datef', 'Fecha Factura'),
            new Date('date_lim_reglement', 'Fecha Lím. Pago'),
            new Decimal('total_ht', 'Total HT'),
            new Decimal('total_ttc', 'Total TTC'),
            new Text('fk_statut', 'Estado'),
        ];
    }

    protected function getEditFields(): array
    {
        return [
            'main' => [
                'label' => 'Ficha',
                'fields' => [
                    new Panel('General', [
                        new Text('ref', 'Ref.', ['readonly' => true, 'col' => 'col-md-4']),
                        new Text('ref_supplier', 'Ref. Factura Proveedor', ['required' => true, 'col' => 'col-md-4']),
                        new Select('fk_soc', 'Proveedor', [
                            'model' => ThirdParty::class,
                            'query' => function ($q) {
                                $q->where('fournisseur', 1);
                            },
                            'label_field' => 'nom',
                            'required' => true,
                            'col' => 'col-md-4'
                        ]),
                        new Date('datef', 'Fecha Factura', ['col' => 'col-md-6']),
                        new Date('date_lim_reglement', 'Vencimiento', ['col' => 'col-md-6']),
                    ]),
                ]
            ],
            'lines' => [
                'label' => 'Líneas',
                'fields' => [
                    new RelationList('lines', 'Artículos Facturados', [
                        ['field' => 'label', 'label' => 'Concepto'],
                        ['field' => 'qty', 'label' => 'Cant.'],
                        ['field' => 'pu_ht', 'label' => 'P.U.'],
                        ['field' => 'tva_tx', 'label' => 'IVA'],
                        ['field' => 'total_ht', 'label' => 'Total HT'],
                    ])
                ]
            ],
            'notes' => [
                'label' => 'Notas',
                'fields' => [
                    new Panel('Observaciones', [
                        new \Alxarafe\Component\Fields\Textarea('note_private', 'Nota Privada'),
                        new \Alxarafe\Component\Fields\Textarea('note_public', 'Nota Pública'),
                    ])
                ]
            ]
        ];
    }

    protected function beforeConfig()
    {
        $this->addVariable('title', 'Factura Proveedor: ' . ($this->recordId === 'new' ? 'Nueva' : $this->getRecord()->ref));
    }
}
