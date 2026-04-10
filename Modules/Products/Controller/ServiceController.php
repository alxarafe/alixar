<?php

namespace Modules\Products\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Decimal;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Fields\Boolean;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Product;

/**
 * ServiceController — Servicios (productos de tipo 1).
 * Dolibarr equivalent: htdocs/product/card.php (type=1)
 */
#[Menu(
    menu: 'main_menu',
    label: 'Servicios',
    icon: 'fas fa-concierge-bell',
    parent: ProductController::class,
    order: 10,
    module: 'Products'
)]
class ServiceController extends ResourceController
{
    const MENU = 'Productos|Servicios';
    const SIDEBAR_MENU = [
        ['option' => 'Listado Servicios'],
        ['option' => 'Nuevo Servicio'],
    ];

    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return Product::class;
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Listado Servicios', icon: 'fas fa-list', parent: ServiceController::class, order: 1)]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Nuevo Servicio', icon: 'fas fa-plus', parent: ServiceController::class, order: 2)]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('ref', 'Referencia'),
            new Text('label', 'Nombre'),
            new Decimal('price', 'Precio Venta'),
            new Boolean('tosell', 'En Venta'),
            new Boolean('tobuy', 'En Compra'),
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
                        new Text('ref', 'Referencia', ['required' => true, 'col' => 'col-md-6']),
                        new Text('label', 'Nombre', ['required' => true, 'col' => 'col-md-6']),
                        new Select('fk_product_type', 'Tipo', ['col' => 'col-md-6']),
                        new Boolean('tosell', 'En Venta', ['col' => 'col-md-3']),
                        new Boolean('tobuy', 'En Compra', ['col' => 'col-md-3']),
                        new Textarea('description', 'Descripción'),
                    ]),
                ],
            ],
            'price' => [
                'label' => 'Precios',
                'fields' => [
                    new Panel('Precios', [
                        new Decimal('price', 'Precio Venta HT', ['col' => 'col-md-6']),
                        new Decimal('price_ttc', 'Precio Venta TTC', ['col' => 'col-md-6']),
                        new Select('tva_tx', '% IVA', ['col' => 'col-md-6']),
                        new Decimal('cost_price', 'Precio Coste', ['col' => 'col-md-6']),
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
