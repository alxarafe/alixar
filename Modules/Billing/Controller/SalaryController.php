<?php

namespace Modules\Billing\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\Decimal;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Salary;

/**
 * SalaryController — Salarios y nóminas.
 * Dolibarr equivalent: htdocs/salaries/card.php
 */
#[Menu(
    menu: 'main_menu',
    label: 'Salarios',
    icon: 'fas fa-wallet',
    parent: InvoiceController::class,
    order: 40,
    module: 'Billing'
)]
class SalaryController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return Salary::class;
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Listado Salarios', icon: 'fas fa-list', parent: SalaryController::class, order: 1)]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('ref', 'Referencia'),
            new Text('user.lastname', 'Empleado'),
            new Date('datesp', 'Fecha Inicio'),
            new Date('dateep', 'Fecha Fin'),
            new Decimal('amount', 'Importe'),
            new Text('paye', 'Pagado'),
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
                        new Text('label', 'Etiqueta', ['col' => 'col-md-6']),
                        new Select('fk_user', 'Empleado', ['col' => 'col-md-6']),
                        new Date('datesp', 'Inicio Período', ['col' => 'col-md-6']),
                        new Date('dateep', 'Fin Período', ['col' => 'col-md-6']),
                        new Decimal('amount', 'Importe', ['required' => true, 'col' => 'col-md-6']),
                        new Select('fk_account', 'Cuenta Bancaria', ['col' => 'col-md-6']),
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
