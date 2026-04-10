<?php

namespace Modules\Tools\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\ExportModel;

/**
 * ExportController — Exportación de datos.
 * Dolibarr equivalent: htdocs/exports/export.php
 */
#[Menu(
    menu: 'main_menu',
    label: 'Exportaciones',
    icon: 'fas fa-file-export',
    parent: MailingController::class,
    order: 10,
    module: 'Tools'
)]
class ExportController extends ResourceController
{
    #[\Override]
    protected function getModelClass(): string
    {
        return ExportModel::class;
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Asistente Export', icon: 'fas fa-list', parent: ExportController::class, order: 1)]
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
                'label' => 'Exportación',
                'fields' => [
                    new Panel('General', [
                        new Text('label', 'Nombre exportación', ['required' => true, 'col' => 'col-md-12']),
                        new Select('type_export', 'Formato', ['col' => 'col-md-6']),
                    ]),
                ],
            ],
        ];
    }
}
