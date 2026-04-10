<?php

namespace Modules\Accountancy\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\Decimal;
use Alxarafe\Component\Fields\Boolean;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\AccountingAccount;

/**
 * AccountingController — Plan contable y asientos.
 * Dolibarr equivalent: htdocs/accountancy/index.php
 */
#[Menu(
    menu: 'top_menu',
    label: 'Contabilidad',
    icon: 'fas fa-calculator',
    order: 54,
    module: 'Accountancy'
)]
class AccountingController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return AccountingAccount::class;
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Plan Contable', icon: 'fas fa-stream', parent: AccountingController::class, order: 1)]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('account_number', 'Nº Cuenta'),
            new Text('label', 'Etiqueta'),
            new Text('account_parent', 'Cuenta Padre'),
            new Text('pcg_type', 'Tipo'),
            new Boolean('active', 'Activo'),
        ];
    }

    #[\Override]
    protected function getEditFields(): array
    {
        return [
            'main' => [
                'label' => 'Ficha',
                'fields' => [
                    new Panel('Cuenta Contable', [
                        new Text('account_number', 'Nº Cuenta', ['required' => true, 'col' => 'col-md-6']),
                        new Text('label', 'Etiqueta', ['required' => true, 'col' => 'col-md-6']),
                        new Select('account_parent', 'Cuenta Padre', ['col' => 'col-md-6']),
                        new Select('pcg_type', 'Clase Contable', ['col' => 'col-md-6']),
                        new Select('pcg_subtype', 'Subcategoría', ['col' => 'col-md-6']),
                        new Boolean('active', 'Activo', ['col' => 'col-md-6']),
                        new Boolean('reconcilable', 'Conciliable', ['col' => 'col-md-6']),
                    ]),
                ],
            ],
        ];
    }
}
