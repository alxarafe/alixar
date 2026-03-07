<?php

declare(strict_types=1);

namespace Modules\Support\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\RelationList;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Intervention;
use Modules\Alixar\Model\ThirdParty;

/**
 * Class InterventionController
 * Manages Interventions (llx_fichinter).
 *
 * @package Modules\Support\Controller
 */
#[Menu(
    menu: 'top_menu',
    label: 'Servicios',
    icon: 'fas fa-handshake',
    order: 38,
    permission: 'Alixar.Intervention.doIndex'
)]
class InterventionController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return Intervention::class;
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Intervenciones',
        icon: 'fas fa-calendar-check',
        parent: InterventionController::class,
        order: 1,
        permission: 'Alixar.Intervention.doIndex'
    )]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Nueva Intervención',
        icon: 'fas fa-plus',
        parent: InterventionController::class,
        order: 2,
        permission: 'Alixar.Intervention.doCreate'
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
            new Text('thirdParty.nom', 'Tercero'),
            new Date('datem', 'Fecha Intervención'),
            new Text('duration', 'Duración'),
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
                        new Text('ref', 'Ref.', ['readonly' => true, 'col' => 'col-md-6']),
                        new Select('fk_soc', 'Tercero', [
                            'model' => ThirdParty::class,
                            'label_field' => 'nom',
                            'required' => true,
                            'col' => 'col-md-6'
                        ]),
                        new Date('datem', 'Fecha Intervención', ['required' => true, 'col' => 'col-md-6']),
                        new Text('duration', 'Duración total', ['col' => 'col-md-6']),
                    ]),
                ]
            ],
            'details' => [
                'label' => 'Detalles',
                'fields' => [
                    new RelationList('details', 'Líneas de Intervención', [
                        ['field' => 'description', 'label' => 'Descripción'],
                        ['field' => 'duration', 'label' => 'Duración'],
                    ])
                ]
            ],
            'notes' => [
                'label' => 'Notas',
                'fields' => [
                    new Panel('Observaciones', [
                        new \Alxarafe\Component\Fields\Textarea('description', 'Descripción detallada'),
                    ])
                ]
            ]
        ];
    }

    #[\Override]
    protected function beforeConfig()
    {
        $this->addVariable('title', 'Intervención: ' . ($this->recordId === 'new' ? 'Nueva' : $this->getRecord()->ref));
    }
}
