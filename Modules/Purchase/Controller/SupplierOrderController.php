<?php

namespace Modules\Purchase\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\Decimal;
use Alxarafe\Component\Fields\RelationList;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\OrderFournisseur;
use Modules\Alixar\Model\ThirdParty;

/**
 * Class SupplierOrderController
 * Manages Purchase Orders (Pedidos a Proveedor).
 *
 * @package Modules\Purchase\Controller
 */
#[Menu(
    menu: 'main_menu',
    label: 'Pedidos Prov.',
    icon: 'fas fa-truck',
    parent: SupplierProposalController::class,
    order: 10,
    permission: 'Alixar.SupplierOrder.doIndex'
)]
class SupplierOrderController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return OrderFournisseur::class;
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Listado Pedidos',
        icon: 'fas fa-list',
        parent: SupplierOrderController::class,
        order: 1,
        permission: 'Alixar.SupplierOrder.doIndex'
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
        parent: SupplierOrderController::class,
        order: 2,
        permission: 'Alixar.SupplierOrder.doCreate'
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
            new Text('ref_supplier', 'Ref. Prov.'),
            new Text('thirdParty.nom', 'Proveedor'),
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
                        new Text('ref_supplier', 'Ref. del Proveedor', ['col' => 'col-md-6']),
                        new Select('fk_soc', 'Proveedor', [
                            'model' => ThirdParty::class,
                            'query' => function ($q) {
                                $q->where('fournisseur', 1);
                            },
                            'label_field' => 'nom',
                            'required' => true,
                            'col' => 'col-md-12'
                        ]),
                        new Date('date_commande', 'Fecha Pedido', ['col' => 'col-md-6']),
                        new Date('date_livraison', 'Fecha Entrega Prevista', ['col' => 'col-md-6']),
                    ]),
                ]
            ],
            'lines' => [
                'label' => 'Líneas',
                'fields' => [
                    new RelationList('lines', 'Artículos', [
                        ['field' => 'label', 'label' => 'Producto'],
                        ['field' => 'qty', 'label' => 'Cant.'],
                        ['field' => 'subprice', 'label' => 'Precio Compra'],
                        ['field' => 'total_ht', 'label' => 'Subtotal'],
                    ])
                ]
            ],
            'notes' => [
                'label' => 'Notas',
                'fields' => [
                    new Panel('Observaciones', [
                        new \Alxarafe\Component\Fields\Textarea('note_private', 'Nota Privada'),
                        new \Alxarafe\Component\Fields\Textarea('note_public', 'Nota Pública'),
                    ])
                ]
            ]
        ];
    }

    #[\Override]
    protected function beforeConfig()
    {
        $this->addVariable('title', 'Pedido Proveedor: ' . ($this->recordId === 'new' ? 'Nuevo' : $this->getRecord()->ref));
    }
}
