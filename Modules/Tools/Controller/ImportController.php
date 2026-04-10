<?php

namespace Modules\Tools\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\ImportModel;

/**
 * ImportController — Importación de datos.
 * Dolibarr equivalent: htdocs/imports/import.php
 */
#[Menu(
    menu: 'main_menu',
    label: 'Importaciones',
    icon: 'fas fa-file-import',
    parent: MailingController::class,
    order: 20,
    module: 'Tools'
)]
class ImportController extends ResourceController
{
    #[\Override]
    protected function getModelClass(): string
    {
        return ImportModel::class;
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Asistente Import', icon: 'fas fa-list', parent: ImportController::class, order: 1)]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('label', 'Etiqueta'),
            new Text('type', 'Tipo'),
        ];
    }

    #[\Override]
    protected function getEditFields(): array
    {
        return [
            'main' => [
                'label' => 'Importación',
                'fields' => [
                    new Panel('General', [
                        new Text('label', 'Nombre importación', ['required' => true, 'col' => 'col-md-12']),
                        new Select('type_import', 'Formato', ['col' => 'col-md-6']),
                    ]),
                ],
            ],
        ];
    }
}
