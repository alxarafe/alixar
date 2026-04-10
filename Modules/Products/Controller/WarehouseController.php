<?php

declare(strict_types=1);

namespace Modules\Products\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Warehouse;

/**
 * Class WarehouseController
 * Manages Warehouses (entrepot).
 *
 * Dolibarr equivalent: htdocs/product/stock/card.php
 *
 * @package Modules\Products\Controller
 */
#[Menu(
    menu: 'top_menu',
    label: 'Stock',
    icon: 'fas fa-warehouse',
    order: 45,
    permission: 'Alixar.Warehouse.doIndex'
)]
class WarehouseController extends ResourceController
{
    const MENU = 'Productos|Almacenes';
    const SIDEBAR_MENU = [
        ['option' => 'Listado Almacenes'],
        ['option' => 'Nuevo Almacén'],
    ];

    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return Warehouse::class;
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Listado Almacenes',
        icon: 'fas fa-list',
        parent: WarehouseController::class,
        order: 1,
        permission: 'Alixar.Warehouse.doIndex'
    )]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Nuevo Almacén',
        icon: 'fas fa-plus',
        parent: WarehouseController::class,
        order: 2,
        permission: 'Alixar.Warehouse.doCreate'
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
            new Text('lieu', 'Etiqueta'),
            new Text('town', 'Ciudad'),
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
                        new Text('ref', 'Referencia', ['required' => true, 'col' => 'col-md-6']),
                        new Text('lieu', 'Nombre / Etiqueta', ['required' => true, 'col' => 'col-md-6']),
                        new Textarea('description', 'Descripción'),
                    ]),
                ]
            ],
            'address' => [
                'label' => 'Localización',
                'fields' => [
                    new Panel('Dirección', [
                        new Text('address', 'Dirección'),
                        new Text('zip', 'CP', ['col' => 'col-md-3']),
                        new Text('town', 'Ciudad', ['col' => 'col-md-9']),
                        new Text('fk_pays', 'País'),
                    ]),
                ]
            ],
        ];
    }

    #[\Override]
    protected function beforeConfig()
    {
        $this->addVariable('title', 'Gestión de Almacenes - Alixar');
    }
}
