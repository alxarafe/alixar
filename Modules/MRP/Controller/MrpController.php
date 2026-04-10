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
use Modules\Alixar\Model\MrpMo;

/**
 * MrpController — Órdenes de fabricación (Manufacturing Orders).
 * Dolibarr equivalent: htdocs/mrp/mo_card.php
 */
#[Menu(
    menu: 'main_menu',
    label: 'Órdenes Fabricación',
    icon: 'fas fa-cogs',
    parent: BomController::class,
    order: 10,
    module: 'MRP'
)]
class MrpController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return MrpMo::class;
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Listado Órdenes Fab.', icon: 'fas fa-list', parent: MrpController::class, order: 1)]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Nueva Orden Fab.', icon: 'fas fa-plus', parent: MrpController::class, order: 2)]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('ref', 'Referencia'),
            new Text('product.ref', 'Producto'),
            new Decimal('qty', 'Cantidad'),
            new Date('date_start_planned', 'Inicio Previsto'),
            new Date('date_end_planned', 'Fin Previsto'),
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
                        new Select('fk_bom', 'Lista Materiales', ['col' => 'col-md-6']),
                        new Select('fk_product', 'Producto a fabricar', ['col' => 'col-md-6']),
                        new Decimal('qty', 'Cantidad', ['required' => true, 'col' => 'col-md-6']),
                        new Date('date_start_planned', 'Inicio Previsto', ['col' => 'col-md-6']),
                        new Date('date_end_planned', 'Fin Previsto', ['col' => 'col-md-6']),
                        new Select('fk_warehouse', 'Almacén', ['col' => 'col-md-6']),
                    ]),
                ],
            ],
            'production' => [
                'label' => 'Producción',
                'fields' => [
                    new RelationList('lines', 'Líneas de Producción', [
                        ['field' => 'fk_product', 'label' => 'Producto'],
                        ['field' => 'qty', 'label' => 'Cantidad'],
                        ['field' => 'role', 'label' => 'Rol'],
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
