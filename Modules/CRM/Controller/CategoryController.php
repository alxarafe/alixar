<?php

namespace Modules\CRM\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Category;

/**
 * CategoryController — Categorías / etiquetas (tags).
 * Dolibarr equivalent: htdocs/categories/card.php
 */
#[Menu(
    menu: 'main_menu',
    label: 'Categorías',
    icon: 'fas fa-tags',
    parent: ThirdPartyController::class,
    order: 30,
    module: 'CRM'
)]
class CategoryController extends ResourceController
{
    const MENU = 'CRM|Categorías';
    const SIDEBAR_MENU = [
        ['option' => 'Listado Categorías'],
        ['option' => 'Nueva Categoría'],
    ];

    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return Category::class;
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Listado Categorías', icon: 'fas fa-list', parent: CategoryController::class, order: 1)]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Nueva Categoría', icon: 'fas fa-plus', parent: CategoryController::class, order: 2)]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('label', 'Etiqueta'),
            new Text('type', 'Tipo'),
            new Text('fk_parent', 'Categoría Padre'),
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
                        new Text('label', 'Etiqueta', ['required' => true, 'col' => 'col-md-6']),
                        new Select('type', 'Tipo (0=Producto, 1=Proveedor, 2=Cliente, 3=Socio, 4=Contacto, 5=Proyecto)', ['col' => 'col-md-6']),
                        new Select('fk_parent', 'Categoría Padre', ['col' => 'col-md-6']),
                        new Text('color', 'Color (hex)', ['col' => 'col-md-6']),
                        new Textarea('description', 'Descripción'),
                    ]),
                ],
            ],
        ];
    }
}
