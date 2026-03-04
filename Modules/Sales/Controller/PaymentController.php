<?php

namespace Modules\Sales\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Decimal;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\RelationList;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Payment;
use Modules\Alixar\Model\BankAccount;

/**
 * Class PaymentController
 * Manages Customer Payments.
 *
 * @package Modules\Sales\Controller
 */
#[Menu(
    menu: 'main_menu',
    label: 'Cobros',
    icon: 'fas fa-cash-register',
    parent: ProposalController::class,
    order: 30,
    permission: 'Alixar.Payment.doIndex'
)]
class PaymentController extends ResourceController
{
    protected function getModelClass(): string
    {
        return Payment::class;
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
                'title' => 'Detalle del Cobro',
                'fields' => [
                    new Panel('General', [
                        new Text('ref', 'Ref. Cobro', ['readonly' => true, 'col' => 'col-md-6']),
                        new Date('datep', 'Fecha del Cobro', ['required' => true, 'col' => 'col-md-6']),
                        new Decimal('amount', 'Importe Total', ['required' => true, 'col' => 'col-md-6']),
                        new Text('num_paiement', 'Nº Cheque/Referencia', ['col' => 'col-md-6']),
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
                'title' => 'Facturas Pagadas',
                'fields' => [
                    new RelationList('invoices', 'Facturas', [
                        ['field' => 'ref', 'label' => 'Factura'],
                        ['field' => 'total_ttc', 'label' => 'Total Factura'],
                        ['field' => 'pivot.amount', 'label' => 'Importe Aplicado'],
                    ])
                ]
            ]
        ];
    }

    protected function beforeConfig()
    {
        $this->addVariable('title', 'Gestión de Cobros (Clientes) - Alixar');
    }
}
