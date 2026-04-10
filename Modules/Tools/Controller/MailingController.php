<?php

namespace Modules\Tools\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\Boolean;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Mailing;

/**
 * MailingController — Mailings / campañas de email.
 * Dolibarr equivalent: htdocs/comm/mailing/card.php
 */
#[Menu(
    menu: 'top_menu',
    label: 'Herramientas',
    icon: 'fas fa-tools',
    order: 90,
    module: 'Tools'
)]
class MailingController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return Mailing::class;
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Mailings', icon: 'fas fa-envelope-open-text', parent: MailingController::class, order: 1)]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Nuevo Mailing', icon: 'fas fa-plus', parent: MailingController::class, order: 2)]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('titre', 'Título'),
            new Date('date_creat', 'Fecha Creación'),
            new Text('nbemail', 'Nº Emails'),
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
                    new Panel('General', [
                        new Text('titre', 'Título', ['required' => true, 'col' => 'col-md-12']),
                        new Text('sujet', 'Asunto', ['required' => true, 'col' => 'col-md-12']),
                        new Text('email_from', 'De (email)', ['col' => 'col-md-6']),
                        new Text('email_replyto', 'Responder a', ['col' => 'col-md-6']),
                        new Text('email_errorsto', 'Errores a', ['col' => 'col-md-6']),
                    ]),
                ],
            ],
            'content' => [
                'label' => 'Contenido',
                'fields' => [
                    new Panel('Contenido', [
                        new Textarea('body', 'Cuerpo del email'),
                    ]),
                ],
            ],
        ];
    }
}
