<?php

namespace Modules\Support\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Ticket;

/**
 * TicketController — Tickets de soporte.
 * Dolibarr equivalent: htdocs/ticket/card.php
 */
#[Menu(
    menu: 'top_menu',
    label: 'Tickets',
    icon: 'fas fa-ticket-alt',
    order: 88,
    module: 'Support'
)]
class TicketController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return Ticket::class;
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Listado Tickets', icon: 'fas fa-list', parent: TicketController::class, order: 1)]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Nuevo Ticket', icon: 'fas fa-plus', parent: TicketController::class, order: 2)]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('ref', 'Referencia'),
            new Text('subject', 'Asunto'),
            new Text('thirdParty.nom', 'Tercero'),
            new Date('datec', 'Fecha Creación'),
            new Text('type_label', 'Tipo'),
            new Text('severity_label', 'Gravedad'),
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
                        new Text('ref', 'Ref.', ['readonly' => true, 'col' => 'col-md-6']),
                        new Text('subject', 'Asunto', ['required' => true, 'col' => 'col-md-6']),
                        new Select('fk_soc', 'Tercero', [
                            'model' => \Modules\Alixar\Model\ThirdParty::class,
                            'label_field' => 'nom', 'col' => 'col-md-6',
                        ]),
                        new Select('type_code', 'Tipo', ['col' => 'col-md-6']),
                        new Select('severity_code', 'Gravedad', ['col' => 'col-md-6']),
                        new Select('category_code', 'Categoría', ['col' => 'col-md-6']),
                    ]),
                ],
            ],
            'message' => [
                'label' => 'Mensajes',
                'fields' => [
                    new Panel('Mensaje inicial', [
                        new Textarea('message', 'Descripción del problema'),
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
