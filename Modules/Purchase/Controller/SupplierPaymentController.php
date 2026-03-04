<?php

namespace Modules\Purchase\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Decimal;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\RelationList;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Paiementfourn;
use Modules\Alixar\Model\BankAccount;

/**
 * Class SupplierPaymentController
 * Manages Supplier Payments.
 *
 * @package Modules\Purchase\Controller
 */
#[Menu(
    menu: 'main_menu',
    label: 'Pagos Prov.',
    icon: 'fas fa-hand-holding-usd',
    parent: SupplierProposalController::class,
    order: 30,
    permission: 'Alixar.SupplierPayment.doIndex'
)]
class SupplierPaymentController extends ResourceController
{
    protected bool $useTabs = true;

    protected function getModelClass(): string
    {
        return Paiementfourn::class;
    }

    #[Menu(
        menu: 'main_menu',
        label: 'Listado Pagos',
        icon: 'fas fa-list',
        parent: SupplierPaymentController::class,
        order: 1,
        permission: 'Alixar.SupplierPayment.doIndex'
    )]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[Menu(
        menu: 'main_menu',
        label: 'Nuevo Pago',
        icon: 'fas fa-plus',
        parent: SupplierPaymentController::class,
        order: 2,
        permission: 'Alixar.SupplierPayment.doCreate'
    )]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }

    protected function getListColumns(): array
    {
        return [
            new Text('ref', 'Referencia'),
            new Date('datep', 'Fecha Pago'),
            new Decimal('amount', 'Importe'),
            new Text('num_paiement', 'Referencia/Nº'),
            new Text('bankMovement.account.label', 'Cuenta Bancaria'),
        ];
    }

    protected function getEditFields(): array
    {
        return [
            'main' => [
                'label' => 'Ficha',
                'fields' => [
                    new Panel('General', [
                        new Text('ref', 'Ref. Pago', ['readonly' => true, 'col' => 'col-md-6']),
                        new Date('datep', 'Fecha del Pago', ['required' => true, 'col' => 'col-md-6']),
                        new Decimal('amount', 'Importe Pagado', ['required' => true, 'col' => 'col-md-6']),
                        new Text('num_paiement', 'Nº Transferencia/Referencia', ['col' => 'col-md-6']),
                    ]),
                    new Panel('Tesorería', [
                        new Select('fk_bank', 'Movimiento Bancario Asociado', [
                            'model' => BankAccount::class,
                            'label_field' => 'label',
                            'col' => 'col-md-12'
                        ]),
                    ]),
                ]
            ],
            'invoices' => [
                'label' => 'Facturas',
                'fields' => [
                    new RelationList('invoices', 'Facturas', [
                        ['field' => 'ref', 'label' => 'Factura Prov.'],
                        ['field' => 'total_ttc', 'label' => 'Total Factura'],
                        ['field' => 'pivot.amount', 'label' => 'Importe Aplicado'],
                    ])
                ]
            ]
        ];
    }

    protected function beforeConfig()
    {
        $this->addVariable('title', 'Gestión de Pagos (Proveedores) - Alixar');
    }
}
