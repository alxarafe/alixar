<?php

declare(strict_types=1);

namespace Modules\HR\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Holiday;
use Modules\Alixar\Model\User;

/**
 * Class HolidayController
 * Manages Holidays / Leave (llx_holiday).
 *
 * @package Modules\HR\Controller
 */
#[Menu(
    menu: 'main_menu',
    label: 'Vacaciones',
    icon: 'fas fa-umbrella-beach',
    parent: UserController::class,
    order: 10,
    permission: 'Alixar.Holiday.doIndex'
)]
class HolidayController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return Holiday::class;
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Listado Vacaciones',
        icon: 'fas fa-list',
        parent: HolidayController::class,
        order: 1,
        permission: 'Alixar.Holiday.doIndex'
    )]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Solicitar Vacaciones',
        icon: 'fas fa-plus',
        parent: HolidayController::class,
        order: 2,
        permission: 'Alixar.Holiday.doCreate'
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
            new Date('date_debut', 'Fecha Inicio'),
            new Date('date_fin', 'Fecha Fin'),
            new Text('statut', 'Estado'),
        ];
    }

    #[\Override]
    protected function getEditFields(): array
    {
        return [
            'main' => [
                'label' => 'Ficha',
                'fields' => [
                    new Panel('Solicitud', [
                        new Select('fk_user', 'Empleado', [
                            'model' => User::class,
                            'label_field' => 'login',
                            'required' => true,
                            'col' => 'col-md-12'
                        ]),
                        new Date('date_debut', 'Fecha Inicio', ['required' => true, 'col' => 'col-md-6']),
                        new Date('date_fin', 'Fecha Fin', ['required' => true, 'col' => 'col-md-6']),
                    ]),
                    new Panel('Detalles', [
                        new \Alxarafe\Component\Fields\Textarea('description', 'Motivo / Comentarios'),
                    ]),
                ]
            ]
        ];
    }

    #[\Override]
    protected function beforeConfig()
    {
        $this->addVariable('title', 'Solicitud de Vacaciones');
    }
}
