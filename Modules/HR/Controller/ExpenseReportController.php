<?php

declare(strict_types=1);

namespace Modules\HR\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Decimal;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\RelationList;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Expensereport;
use Modules\Alixar\Model\User;

/**
 * Class ExpenseReportController
 * Manages Expense Reports (llx_expensereport).
 *
 * @package Modules\HR\Controller
 */
#[Menu(
    menu: 'main_menu',
    label: 'Notas de Gastos',
    icon: 'fas fa-receipt',
    parent: UserController::class,
    order: 20,
    permission: 'Alixar.ExpenseReport.doIndex'
)]
class ExpenseReportController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return Expensereport::class;
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Listado Gastos',
        icon: 'fas fa-list',
        parent: ExpenseReportController::class,
        order: 1,
        permission: 'Alixar.ExpenseReport.doIndex'
    )]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Nueva Nota de Gastos',
        icon: 'fas fa-plus',
        parent: ExpenseReportController::class,
        order: 2,
        permission: 'Alixar.ExpenseReport.doCreate'
    )]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('ref', 'Ref.'),
            new Text('user.login', 'Usuario'),
            new Date('date_debut', 'Desde'),
            new Date('date_fin', 'Hasta'),
            new Decimal('total_ht', 'Total HT'),
            new Decimal('total_ttc', 'Total TTC'),
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
                    new Panel('Información General', [
                        new Select('fk_user', 'Usuario', [
                            'model' => User::class,
                            'label_field' => 'login',
                            'required' => true,
                            'col' => 'col-md-12'
                        ]),
                        new Date('date_debut', 'Fecha Inicio', ['col' => 'col-md-6']),
                        new Date('date_fin', 'Fecha Fin', ['col' => 'col-md-6']),
                        new Textarea('note_public', 'Descripción / Motivo'),
                    ]),
                ]
            ],
            'lines' => [
                'label' => 'Líneas de Gasto',
                'fields' => [
                    new RelationList('details', 'Detalles', [
                        ['field' => 'comments', 'label' => 'Concepto'],
                        ['field' => 'date', 'label' => 'Fecha'],
                        ['field' => 'total_ht', 'label' => 'Importe HT'],
                    ])
                ]
            ]
        ];
    }

    #[\Override]
    protected function beforeConfig()
    {
        $this->addVariable('title', 'Nota de Gastos');
    }
}
