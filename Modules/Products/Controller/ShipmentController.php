<?php

namespace Modules\Products\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\Decimal;
use Alxarafe\Component\Fields\RelationList;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Expedition;

/**
 * ShipmentController — Envíos (expediciones).
 * Dolibarr equivalent: htdocs/expedition/card.php
 */
#[Menu(
    menu: 'main_menu',
    label: 'Envíos',
    icon: 'fas fa-truck',
    parent: ProductController::class,
    order: 30,
    module: 'Products'
)]
class ShipmentController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return Expedition::class;
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Listado Envíos', icon: 'fas fa-list', parent: ShipmentController::class, order: 1)]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('ref', 'Referencia'),
            new Text('thirdParty.nom', 'Tercero'),
            new Date('date_delivery', 'Fecha Envío'),
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
                        new Select('fk_soc', 'Tercero', [
                            'model' => \Modules\Alixar\Model\ThirdParty::class,
                            'label_field' => 'nom', 'col' => 'col-md-6',
                        ]),
                        new Date('date_delivery', 'Fecha Envío', ['col' => 'col-md-6']),
                        new Select('fk_shipping_method', 'Método Envío', ['col' => 'col-md-6']),
                        new Text('tracking_number', 'Nº Seguimiento', ['col' => 'col-md-6']),
                    ]),
                ],
            ],
            'lines' => [
                'label' => 'Productos',
                'fields' => [
                    new RelationList('lines', 'Líneas', [
                        ['field' => 'fk_product', 'label' => 'Producto'],
                        ['field' => 'qty', 'label' => 'Cantidad'],
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
