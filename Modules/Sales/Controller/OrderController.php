<?php

namespace Modules\Sales\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\Decimal;
use Alxarafe\Component\Fields\RelationList;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Order;

/**
 * Class OrderController
 * Manages Sales Orders (Pedidos).
 *
 * @package Modules\Sales\Controller
 */
#[Menu(
    menu: 'main_menu',
    label: 'Pedidos Client.',
    icon: 'fas fa-shopping-basket',
    parent: ProposalController::class,
    order: 10,
    permission: 'Alixar.Order.doIndex'
)]
class OrderController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return Order::class;
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Listado Pedidos',
        icon: 'fas fa-list',
        parent: OrderController::class,
        order: 1,
        permission: 'Alixar.Order.doIndex'
    )]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Nuevo Pedido',
        icon: 'fas fa-plus',
        parent: OrderController::class,
        order: 2,
        permission: 'Alixar.Order.doCreate'
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
            new Text('thirdParty.nom', 'Tercero'),
            new Date('date_commande', 'Fecha Pedido'),
            new Decimal('total_ht', 'Total HT'),
            new Decimal('total_ttc', 'Total TTC'),
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
                            'label_field' => 'nom',
                            'required' => true,
                            'col' => 'col-md-6'
                        ]),
                        new Date('date_commande', 'Fecha Pedido', ['col' => 'col-md-6']),
                        new Date('date_livraison', 'Fecha Entrega', ['col' => 'col-md-6']),
                    ]),
                ]
            ],
            'lines' => [
                'label' => 'Líneas',
                'fields' => [
                    new RelationList('lines', 'Artículos', [
                        ['field' => 'label', 'label' => 'Producto'],
                        ['field' => 'qty', 'label' => 'Cant.'],
                        ['field' => 'subprice', 'label' => 'Precio'],
                        ['field' => 'total_ht', 'label' => 'Subtotal'],
                    ])
                ]
            ],
            'notes' => [
                'label' => 'Notas',
                'fields' => [
                    new Panel('Notas', [
                        new \Alxarafe\Component\Fields\Textarea('note_private', 'Nota Privada'),
                        new \Alxarafe\Component\Fields\Textarea('note_public', 'Nota Pública'),
                    ]),
                ]
            ]
        ];
    }

    #[\Override]
    protected function beforeConfig()
    {
        $this->addVariable('title', 'Pedido: ' . ($this->recordId === 'new' ? 'Nuevo' : $this->getRecord()->ref));
    }
}
