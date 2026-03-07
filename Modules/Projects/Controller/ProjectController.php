<?php

declare(strict_types=1);

namespace Modules\Projects\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\RelationList;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Project;
use Modules\Alixar\Model\ThirdParty;

/**
 * Class ProjectController
 * Manages Projects (llx_projet).
 *
 * @package Modules\Projects\Controller
 */
#[Menu(
    menu: 'top_menu',
    label: 'Proyectos',
    icon: 'fas fa-project-diagram',
    order: 35,
    permission: 'Alixar.Project.doIndex'
)]
class ProjectController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return Project::class;
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Listado Proyectos',
        icon: 'fas fa-list',
        parent: ProjectController::class,
        order: 1,
        permission: 'Alixar.Project.doIndex'
    )]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Nuevo Proyecto',
        icon: 'fas fa-plus',
        parent: ProjectController::class,
        order: 2,
        permission: 'Alixar.Project.doCreate'
    )]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('ref', 'Referencia'),
            new Text('title', 'Etiqueta'),
            new Text('thirdParty.nom', 'Tercero'),
            new Date('datec', 'Fecha Creación'),
            new Date('datee', 'Fecha Fin'),
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
                        new Text('ref', 'Ref.', ['required' => true, 'col' => 'col-md-6']),
                        new Text('title', 'Etiqueta', ['required' => true, 'col' => 'col-md-6']),
                        new Select('fk_soc', 'Tercero', [
                            'model' => ThirdParty::class,
                            'label_field' => 'nom',
                            'col' => 'col-md-12'
                        ]),
                        new Date('datec', 'Fecha Inicio', ['col' => 'col-md-6']),
                        new Date('datee', 'Fecha Fin prevista', ['col' => 'col-md-6']),
                    ]),
                ]
            ],
            'tasks' => [
                'label' => 'Tareas',
                'fields' => [
                    new RelationList('tasks', 'Tareas del Proyecto', [
                        ['field' => 'ref', 'label' => 'Ref.'],
                        ['field' => 'label', 'label' => 'Etiqueta'],
                        ['field' => 'progress', 'label' => 'Progreso'],
                    ])
                ]
            ],
            'notes' => [
                'label' => 'Notas',
                'fields' => [
                    new Panel('Observaciones', [
                        new \Alxarafe\Component\Fields\Textarea('note_private', 'Nota Privada'),
                        new \Alxarafe\Component\Fields\Textarea('note_public', 'Nota Pública'),
                    ])
                ]
            ]
        ];
    }

    #[\Override]
    protected function beforeConfig()
    {
        $this->addVariable('title', 'Proyecto: ' . ($this->recordId === 'new' ? 'Nuevo' : $this->getRecord()->ref));
    }
}
