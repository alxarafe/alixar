<?php

namespace Modules\MRP\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\Decimal;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Fields\RelationList;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Bom;

/**
 * BomController — Listas de materiales (Bill of Materials).
 * Dolibarr equivalent: htdocs/bom/bom_card.php
 */
#[Menu(
    menu: 'top_menu',
    label: 'Fabricación',
    icon: 'fas fa-industry',
    order: 31,
    module: 'MRP'
)]
class BomController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return Bom::class;
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Listas de Materiales', icon: 'fas fa-shapes', parent: BomController::class, order: 1)]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Nueva Lista Mat.', icon: 'fas fa-plus', parent: BomController::class, order: 2)]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('ref', 'Referencia'),
            new Text('label', 'Etiqueta'),
            new Text('product.ref', 'Producto'),
            new Decimal('qty', 'Cantidad'),
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
                        new Text('label', 'Etiqueta', ['required' => true, 'col' => 'col-md-6']),
                        new Select('fk_product', 'Producto a fabricar', ['col' => 'col-md-6']),
                        new Decimal('qty', 'Cantidad', ['col' => 'col-md-6']),
                        new Select('fk_warehouse', 'Almacén', ['col' => 'col-md-6']),
                    ]),
                ],
            ],
            'lines' => [
                'label' => 'Componentes',
                'fields' => [
                    new RelationList('lines', 'Componentes', [
                        ['field' => 'fk_product', 'label' => 'Producto'],
                        ['field' => 'qty', 'label' => 'Cantidad'],
                        ['field' => 'fk_bom_child', 'label' => 'Sub-lista'],
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
