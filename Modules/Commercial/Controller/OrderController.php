<?php

namespace Modules\Commercial\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\Decimal;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Fields\RelationList;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Order;

/**
 * OrderController — Pedidos de clientes.
 * Dolibarr equivalent: htdocs/commande/card.php
 */
#[Menu(
    menu: 'main_menu',
    label: 'Pedidos Client.',
    icon: 'fas fa-shopping-basket',
    parent: ProposalController::class,
    order: 10,
    module: 'Commercial'
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
    #[Menu(menu: 'main_menu', label: 'Listado Pedidos', icon: 'fas fa-list', parent: OrderController::class, order: 1)]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Nuevo Pedido', icon: 'fas fa-plus', parent: OrderController::class, order: 2)]
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
            new Date('date_livraison', 'Fecha Entrega'),
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
                            'label_field' => 'nom', 'required' => true, 'col' => 'col-md-6',
                        ]),
                        new Date('date_commande', 'Fecha Pedido', ['col' => 'col-md-6']),
                        new Date('date_livraison', 'Fecha Entrega', ['col' => 'col-md-6']),
                        new Select('fk_cond_reglement', 'Condición Pago', ['col' => 'col-md-6']),
                        new Select('fk_mode_reglement', 'Modo Pago', ['col' => 'col-md-6']),
                    ]),
                ],
            ],
            'lines' => [
                'label' => 'Líneas',
                'fields' => [
                    new RelationList('lines', 'Artículos', [
                        ['field' => 'description', 'label' => 'Descripción'],
                        ['field' => 'qty', 'label' => 'Cant.'],
                        ['field' => 'subprice', 'label' => 'Precio'],
                        ['field' => 'tva_tx', 'label' => '% IVA'],
                        ['field' => 'total_ht', 'label' => 'Subtotal'],
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
