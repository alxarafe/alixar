<?php

namespace Modules\Sales\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\Decimal;
use Alxarafe\Component\Fields\RelationList;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Invoice;

/**
 * Class InvoiceController
 * Manages Customer Invoices (Facturas).
 *
 * @package Modules\Sales\Controller
 */
#[Menu(
    menu: 'main_menu',
    label: 'Facturas Client.',
    icon: 'fas fa-file-invoice-dollar',
    parent: ProposalController::class,
    order: 20,
    permission: 'Alixar.Invoice.doIndex'
)]
class InvoiceController extends ResourceController
{
    protected bool $useTabs = true;

    protected function getModelClass(): string
    {
        return Invoice::class;
    }

    #[Menu(
        menu: 'main_menu',
        label: 'Listado Facturas',
        icon: 'fas fa-list',
        parent: InvoiceController::class,
        order: 1,
        permission: 'Alixar.Invoice.doIndex'
    )]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[Menu(
        menu: 'main_menu',
        label: 'Nueva Factura',
        icon: 'fas fa-plus',
        parent: InvoiceController::class,
        order: 2,
        permission: 'Alixar.Invoice.doCreate'
    )]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }

    protected function getListColumns(): array
    {
        return [
            new Text('ref', 'Referencia'),
            new Text('thirdParty.nom', 'Tercero'),
            new Date('datef', 'Fecha Factura'),
            new Date('date_lim_reglement', 'Vencimiento'),
            new Decimal('total_ht', 'Base Imponible'),
            new Decimal('total_ttc', 'Importe Total'),
            new Text('paye', 'Pagado %'),
        ];
    }

    protected function getEditFields(): array
    {
        return [
            'main' => [
                'label' => 'Ficha',
                'fields' => [
                    new Panel('Emisión', [
                        new Text('ref', 'Ref.', ['readonly' => true, 'col' => 'col-md-6']),
                        new Select('fk_soc', 'Tercero', [
                            'model' => \Modules\Alixar\Model\ThirdParty::class,
                            'label_field' => 'nom',
                            'required' => true,
                            'col' => 'col-md-6'
                        ]),
                        new Date('datef', 'Fecha Emisión', ['col' => 'col-md-6']),
                        new Date('date_lim_reglement', 'Fecha Vencimiento', ['col' => 'col-md-6']),
                    ]),
                    new Panel('Fiscal', [
                        new Text('type', 'Tipo de Factura', ['col' => 'col-md-6']),
                        new Text('tva_intra', 'NIF/CIF Intra', ['col' => 'col-md-6']),
                    ])
                ]
            ],
            'lines' => [
                'label' => 'Líneas',
                'fields' => [
                    new RelationList('lines', 'Líneas', [
                        ['field' => 'description', 'label' => 'Concepto'],
                        ['field' => 'qty', 'label' => 'Cant.'],
                        ['field' => 'subprice', 'label' => 'P.U.'],
                        ['field' => 'tva_tx', 'label' => 'IVA %'],
                        ['field' => 'total_ht', 'label' => 'Subtotal'],
                    ])
                ]
            ],
            'notes' => [
                'label' => 'Notas',
                'fields' => [
                    new Panel('Notas', [
                        new \Alxarafe\Component\Fields\Textarea('note_private', 'Nota Privada'),
                        new \Alxarafe\Component\Fields\Textarea('note_public', 'Nota Pública'),
                    ]),
                ]
            ]
        ];
    }

    protected function beforeConfig()
    {
        $this->addVariable('title', 'Factura: ' . ($this->recordId === 'new' ? 'Nueva' : $this->getRecord()->ref));
    }
}
