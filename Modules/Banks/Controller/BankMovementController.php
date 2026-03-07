<?php

namespace Modules\Banks\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Decimal;
use Alxarafe\Component\Fields\Select;
use Modules\Alixar\Model\BankAccount;
use Modules\Alixar\Model\BankAccountAccount;

/**
 * Class BankMovementController
 * Manages individual bank transactions.
 *
 * @package Modules\Banks\Controller
 */
#[Menu(
    menu: 'main_menu',
    label: 'Movimientos',
    icon: 'fas fa-exchange-alt',
    parent: BankAccountController::class,
    order: 10,
    permission: 'Alixar.Bank.doIndex'
)]
class BankMovementController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Listado Movimientos',
        icon: 'fas fa-list',
        parent: BankMovementController::class,
        order: 1,
        permission: 'Alixar.Bank.doIndex'
    )]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Nuevo Movimiento',
        icon: 'fas fa-plus',
        parent: BankMovementController::class,
        order: 2,
        permission: 'Alixar.Bank.doCreate'
    )]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }
    #[\Override]
    protected function getModelClass(): string
    {
        return BankAccount::class;
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Date('datev', 'Fecha Valor'),
            new Text('label', 'Concepto'),
            new Text('account.label', 'Cuenta'),
            new Decimal('amount', 'Importe'),
            new Text('num_releve', 'Nº Extracto'),
        ];
    }

    #[\Override]
    protected function getEditFields(): array
    {
        return [
            'main' => [
                'label' => 'Ficha',
                'fields' => [
                    new Select('fk_account', 'Cuenta Bancaria', [
                        'model' => BankAccountAccount::class,
                        'label_field' => 'label',
                        'required' => true
                    ]),
                    new Date('datev', 'Fecha Valor', ['required' => true]),
                    new Date('dateo', 'Fecha Operación'),
                    new Text('label', 'Concepto', ['required' => true]),
                    new Decimal('amount', 'Importe', ['required' => true]),
                    new Text('note', 'Observaciones'),
                ]
            ]
        ];
    }

    #[\Override]
    protected function beforeList()
    {
        $this->addVariable('title', 'Movimientos Bancarios - Alixar');

        // Optional: Filter by account if fk_account is in REQUEST
        if (isset($_REQUEST['fk_account'])) {
            $this->structConfig['list']['tabs']['general']['conditions']['fk_account'] = $_REQUEST['fk_account'];
        }
    }
}
