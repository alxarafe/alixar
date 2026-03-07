<?php

declare(strict_types=1);

namespace Modules\HR\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Boolean;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\User;

/**
 * Class UserController
 * Manages Dolibarr Users (llx_user).
 *
 * @package Modules\HR\Controller
 */
#[Menu(
    menu: 'top_menu',
    label: 'Recursos Humanos',
    icon: 'fas fa-user-friends',
    order: 60,
    permission: 'Alixar.HR.doIndex'
)]
class UserController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return User::class;
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Usuarios',
        icon: 'fas fa-user',
        parent: UserController::class,
        order: 1,
        permission: 'Alixar.User.doIndex'
    )]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Nuevo Usuario',
        icon: 'fas fa-user-plus',
        parent: UserController::class,
        order: 2,
        permission: 'Alixar.User.doCreate'
    )]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('login', 'Login'),
            new Text('lastname', 'Apellidos'),
            new Text('firstname', 'Nombre'),
            new Text('email', 'Email'),
            new Boolean('admin', 'Admin'),
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
                    new Panel('Identidad', [
                        new Text('login', 'Login', ['required' => true, 'col' => 'col-md-6']),
                        new Text('firstname', 'Nombre', ['col' => 'col-md-6']),
                        new Text('lastname', 'Apellidos', ['required' => true, 'col' => 'col-md-6']),
                        new Text('email', 'Email', ['col' => 'col-md-6']),
                    ]),
                    new Panel('Opciones', [
                        new Boolean('admin', 'Administrador del sistema'),
                        new Boolean('employee', 'Es empleado'),
                        new Select('statut', 'Estado', [
                            'options' => [
                                0 => 'Desactivado',
                                1 => 'Activo'
                            ]
                        ]),
                    ]),
                ]
            ],
            'contact' => [
                'label' => 'Contacto & RH',
                'fields' => [
                    new Panel('Localización', [
                        new Text('address', 'Dirección'),
                        new Text('town', 'Ciudad', ['col' => 'col-md-8']),
                        new Text('zip', 'CP', ['col' => 'col-md-4']),
                    ]),
                    new Panel('Laboral', [
                        new Text('job', 'Puesto / Cargo'),
                        new Date('dateemployment', 'Fecha Contratación'),
                        new Text('salary', 'Salario Base'),
                    ]),
                ]
            ],
            'notes' => [
                'label' => 'Notas',
                'fields' => [
                    new Panel('Notas Privadas', [
                        new \Alxarafe\Component\Fields\Textarea('note_private', 'Notas internas'),
                    ])
                ]
            ]
        ];
    }

    #[\Override]
    protected function beforeConfig()
    {
        $this->addVariable('title', 'Usuario: ' . ($this->recordId === 'new' ? 'Nuevo' : $this->getRecord()->login));
    }
}
