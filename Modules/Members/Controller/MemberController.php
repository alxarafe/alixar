<?php

declare(strict_types=1);

namespace Modules\Members\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Boolean;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Member;
use Modules\Alixar\Model\MemberType;

/**
 * Class MemberController
 * Manages Members (llx_adherent).
 *
 * @package Modules\Members\Controller
 */
#[Menu(
    menu: 'top_menu',
    label: 'Asociaciones',
    icon: 'fas fa-users-cog',
    order: 70,
    permission: 'Alixar.Member.doIndex'
)]
class MemberController extends ResourceController
{
    protected bool $useTabs = true;

    protected function getModelClass(): string
    {
        return Member::class;
    }

    #[Menu(
        menu: 'main_menu',
        label: 'Miembros',
        icon: 'fas fa-user-friends',
        parent: MemberController::class,
        order: 1,
        permission: 'Alixar.Member.doIndex'
    )]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[Menu(
        menu: 'main_menu',
        label: 'Nuevo Miembro',
        icon: 'fas fa-user-plus',
        parent: MemberController::class,
        order: 2,
        permission: 'Alixar.Member.doCreate'
    )]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }

    protected function getListColumns(): array
    {
        return [
            new Text('lastname', 'Apellidos'),
            new Text('firstname', 'Nombre'),
            new Text('type.label', 'Tipo'),
            new Text('email', 'Email'),
            new Text('statut', 'Estado'),
        ];
    }

    protected function getEditFields(): array
    {
        return [
            'main' => [
                'label' => 'Ficha',
                'fields' => [
                    new Panel('Identidad', [
                        new Select('fk_adherent_type', 'Tipo de Miembro', [
                            'model' => MemberType::class,
                            'label_field' => 'label',
                            'required' => true,
                            'col' => 'col-md-12'
                        ]),
                        new Text('firstname', 'Nombre', ['col' => 'col-md-6']),
                        new Text('lastname', 'Apellidos', ['required' => true, 'col' => 'col-md-6']),
                        new Text('email', 'Email', ['col' => 'col-md-6']),
                        new Text('phone', 'Teléfono', ['col' => 'col-md-6']),
                    ]),
                    new Panel('Estado', [
                        new Select('statut', 'Estado', [
                            'options' => [
                                0 => 'Baja',
                                1 => 'Activo'
                            ]
                        ]),
                        new Date('datefin', 'Fecha Fin Suscripción'),
                    ]),
                ]
            ],
            'notes' => [
                'label' => 'Notas',
                'fields' => [
                    new Panel('Observaciones', [
                        new \Alxarafe\Component\Fields\Textarea('note_private', 'Nota interna'),
                        new \Alxarafe\Component\Fields\Textarea('note_public', 'Nota pública'),
                    ])
                ]
            ]
        ];
    }

    protected function beforeConfig()
    {
        $this->addVariable('title', 'Miembro: ' . ($this->recordId === 'new' ? 'Nuevo' : $this->getRecord()->lastname));
    }
}
