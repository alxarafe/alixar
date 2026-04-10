<?php

namespace Modules\Products\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Decimal;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\RelationList;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\ProductStock;

/**
 * StockController — Control de stock / inventario.
 * Dolibarr equivalent: htdocs/product/stock/card.php
 */
#[Menu(
    menu: 'main_menu',
    label: 'Stock / Inventario',
    icon: 'fas fa-boxes',
    parent: ProductController::class,
    order: 20,
    module: 'Products'
)]
class StockController extends ResourceController
{
    const MENU = 'Productos|Stock';
    const SIDEBAR_MENU = [
        ['option' => 'Movimientos Stock'],
    ];

    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return ProductStock::class;
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Movimientos Stock', icon: 'fas fa-list', parent: StockController::class, order: 1)]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('product.ref', 'Producto'),
            new Text('warehouse.ref', 'Almacén'),
            new Decimal('reel', 'Stock Real'),
        ];
    }

    #[\Override]
    protected function getEditFields(): array
    {
        return [
            'main' => [
                'label' => 'Stock',
                'fields' => [
                    new Panel('Movimiento de Stock', [
                        new Select('fk_product', 'Producto', ['col' => 'col-md-6']),
                        new Select('fk_entrepot', 'Almacén', ['col' => 'col-md-6']),
                        new Decimal('reel', 'Stock Real', ['readonly' => true, 'col' => 'col-md-6']),
                    ]),
                ],
            ],
        ];
    }
}
