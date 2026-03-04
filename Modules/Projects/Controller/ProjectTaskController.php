<?php

declare(strict_types=1);

namespace Modules\Projects\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Integer;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\ProjectTask;
use Modules\Alixar\Model\Project;

/**
 * Class ProjectTaskController
 * Manages Tasks (llx_projet_task).
 *
 * @package Modules\Projects\Controller
 */
#[Menu(
    menu: 'main_menu',
    label: 'Tareas',
    icon: 'fas fa-tasks',
    parent: ProjectController::class,
    order: 10,
    permission: 'Alixar.ProjectTask.doIndex'
)]
class ProjectTaskController extends ResourceController
{
    protected bool $useTabs = true;

    protected function getModelClass(): string
    {
        return ProjectTask::class;
    }

    #[Menu(
        menu: 'main_menu',
        label: 'Listado Tareas',
        icon: 'fas fa-list',
        parent: ProjectTaskController::class,
        order: 1,
        permission: 'Alixar.ProjectTask.doIndex'
    )]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[Menu(
        menu: 'main_menu',
        label: 'Nueva Tarea',
        icon: 'fas fa-plus',
        parent: ProjectTaskController::class,
        order: 2,
        permission: 'Alixar.ProjectTask.doCreate'
    )]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }

    protected function getListColumns(): array
    {
        return [
            new Text('ref', 'Ref.'),
            new Text('label', 'Etiqueta'),
            new Text('project.ref', 'Proyecto'),
            new Integer('progress', 'Progreso %'),
            new Date('dateo', 'Fecha Inicio'),
            new Date('datee', 'Fecha Fin'),
        ];
    }

    protected function getEditFields(): array
    {
        return [
            'main' => [
                'label' => 'Ficha',
                'fields' => [
                    new Panel('General', [
                        new Select('fk_projet', 'Proyecto', [
                            'model' => Project::class,
                            'label_field' => 'ref',
                            'required' => true,
                            'col' => 'col-md-12'
                        ]),
                        new Text('ref', 'Ref.', ['required' => true, 'col' => 'col-md-6']),
                        new Text('label', 'Etiqueta', ['required' => true, 'col' => 'col-md-6']),
                        new Integer('progress', 'Progreso (%)', ['col' => 'col-md-6']),
                    ]),
                    new Panel('Fechas', [
                        new Date('dateo', 'Fecha Inicio', ['col' => 'col-md-6']),
                        new Date('datee', 'Fecha Fin', ['col' => 'col-md-6']),
                    ]),
                ]
            ],
            'notes' => [
                'label' => 'Notas',
                'fields' => [
                    new Panel('Observaciones', [
                        new \Alxarafe\Component\Fields\Textarea('description', 'Descripción de la tarea'),
                    ])
                ]
            ]
        ];
    }

    protected function beforeConfig()
    {
        $this->addVariable('title', 'Tarea: ' . ($this->recordId === 'new' ? 'Nueva' : $this->getRecord()->ref));
    }
}
