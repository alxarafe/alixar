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
use Modules\Alixar\Model\SupplierProposal;
use Modules\Alixar\Model\ThirdParty;

/**
 * Class SupplierProposalController
 * Manages Supplier Proposals (Presupuestos Proveedor).
 *
 * @package Modules\Purchase\Controller
 */
#[Menu(
    menu: 'top_menu',
    label: 'Compras',
    icon: 'fas fa-shopping-cart',
    order: 30,
    permission: 'Alixar.SupplierProposal.doIndex'
)]
class SupplierProposalController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return SupplierProposal::class;
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Listado Presupuestos',
        icon: 'fas fa-list',
        parent: SupplierProposalController::class,
        order: 1,
        permission: 'Alixar.SupplierProposal.doIndex'
    )]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Nuevo Presupuesto',
        icon: 'fas fa-plus',
        parent: SupplierProposalController::class,
        order: 2,
        permission: 'Alixar.SupplierProposal.doCreate'
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
            new Text('thirdParty.nom', 'Proveedor'),
            new Date('datec', 'Fecha Creación'),
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
                        new Select('fk_soc', 'Proveedor', [
                            'model' => ThirdParty::class,
                            'query' => function ($q) {
                                $q->where('fournisseur', 1);
                            },
                            'label_field' => 'nom',
                            'required' => true,
                            'col' => 'col-md-6'
                        ]),
                        new Date('datec', 'Fecha Creación', ['col' => 'col-md-6']),
                        new Date('date_valid', 'Fecha Validación', ['col' => 'col-md-6']),
                    ]),
                ]
            ],
            'lines' => [
                'label' => 'Líneas',
                'fields' => [
                    new RelationList('lines', 'Artículos', [
                        ['field' => 'label', 'label' => 'Producto'],
                        ['field' => 'qty', 'label' => 'Cant.'],
                        ['field' => 'price', 'label' => 'Precio'],
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
        $this->addVariable('title', 'Presupuesto Proveedor: ' . ($this->recordId === 'new' ? 'Nuevo' : $this->getRecord()->ref));
    }
}
