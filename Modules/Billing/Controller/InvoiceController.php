<?php

namespace Modules\Billing\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\Decimal;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Fields\RelationList;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Invoice;

/**
 * InvoiceController — Facturas de clientes.
 * Dolibarr equivalent: htdocs/compta/facture/card.php
 */
#[Menu(
    menu: 'top_menu',
    label: 'Facturación',
    icon: 'fas fa-file-invoice-dollar',
    order: 50,
    module: 'Billing'
)]
class InvoiceController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return Invoice::class;
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Facturas Client.', icon: 'fas fa-file-invoice', parent: InvoiceController::class, order: 1)]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Nueva Factura', icon: 'fas fa-plus', parent: InvoiceController::class, order: 2)]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('ref', 'Referencia'),
            new Text('thirdParty.nom', 'Tercero'),
            new Date('datef', 'Fecha Factura'),
            new Date('date_lim_reglement', 'Fecha Vencimiento'),
            new Decimal('total_ht', 'Total HT'),
            new Decimal('total_tva', 'Total IVA'),
            new Decimal('total_ttc', 'Total TTC'),
            new Decimal('paye', 'Pagado'),
            new Text('fk_statut', 'Estado'),
        ];
    }

    #[\Override]
    protected function getEditFields(): array
    {
        return [
            'main' => [
                'label' => 'Ficha',
                'fields' => [
                    new Panel('General', [
                        new Text('ref', 'Ref.', ['readonly' => true, 'col' => 'col-md-6']),
                        new Select('type', 'Tipo', ['col' => 'col-md-6']),
                        new Select('fk_soc', 'Tercero', [
                            'model' => \Modules\Alixar\Model\ThirdParty::class,
                            'label_field' => 'nom', 'required' => true, 'col' => 'col-md-6',
                        ]),
                        new Date('datef', 'Fecha Factura', ['col' => 'col-md-6']),
                        new Date('date_lim_reglement', 'Fecha Vencimiento', ['col' => 'col-md-6']),
                        new Select('fk_cond_reglement', 'Condición Pago', ['col' => 'col-md-6']),
                        new Select('fk_mode_reglement', 'Modo Pago', ['col' => 'col-md-6']),
                        new Select('fk_account', 'Cuenta Bancaria', ['col' => 'col-md-6']),
                    ]),
                ],
            ],
            'lines' => [
                'label' => 'Líneas',
                'fields' => [
                    new RelationList('lines', 'Líneas', [
                        ['field' => 'description', 'label' => 'Descripción'],
                        ['field' => 'qty', 'label' => 'Cant.'],
                        ['field' => 'subprice', 'label' => 'Precio'],
                        ['field' => 'tva_tx', 'label' => '% IVA'],
                        ['field' => 'total_ht', 'label' => 'Subtotal'],
                    ]),
                ],
            ],
            'payments' => [
                'label' => 'Pagos',
                'fields' => [
                    new RelationList('payments', 'Pagos asociados', [
                        ['field' => 'datep', 'label' => 'Fecha'],
                        ['field' => 'amount', 'label' => 'Importe'],
                        ['field' => 'fk_paiement', 'label' => 'Tipo Pago'],
                        ['field' => 'num_paiement', 'label' => 'Núm. Pago'],
                    ]),
                ],
            ],
            'notes' => [
                'label' => 'Notas',
                'fields' => [
                    new Panel('Notas', [
                        new Textarea('note_private', 'Nota Privada'),
                        new Textarea('note_public', 'Nota Pública'),
                    ]),
                ],
            ],
        ];
    }
}
