<?php

namespace Modules\Support\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\KnowledgeRecord;

/**
 * KnowledgeController — Base de conocimiento.
 * Dolibarr equivalent: htdocs/knowledgemanagement/knowledgerecord_card.php
 */
#[Menu(
    menu: 'main_menu',
    label: 'Base Conocimiento',
    icon: 'fas fa-book',
    parent: TicketController::class,
    order: 10,
    module: 'Support'
)]
class KnowledgeController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return KnowledgeRecord::class;
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Listado Artículos', icon: 'fas fa-list', parent: KnowledgeController::class, order: 1)]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Nuevo Artículo', icon: 'fas fa-plus', parent: KnowledgeController::class, order: 2)]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('ref', 'Referencia'),
            new Text('question', 'Pregunta'),
            new Text('status', 'Estado'),
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
                        new Text('question', 'Pregunta', ['required' => true, 'col' => 'col-md-12']),
                        new Textarea('answer', 'Respuesta'),
                        new Select('fk_c_ticket_category', 'Categoría', ['col' => 'col-md-6']),
                    ]),
                ],
            ],
        ];
    }
}
