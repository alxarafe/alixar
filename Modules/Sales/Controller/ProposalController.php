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
use Modules\Alixar\Model\Proposal;

/**
 * Class ProposalController
 * Manages Proposals (Presupuestos).
 *
 * @package Modules\Sales\Controller
 */
#[Menu(
    menu: 'top_menu',
    label: 'Ventas',
    icon: 'fas fa-file-invoice',
    order: 20,
    permission: 'Alixar.Proposal.doIndex'
)]
class ProposalController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return Proposal::class;
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Listado Presupuestos',
        icon: 'fas fa-list',
        parent: ProposalController::class,
        order: 1,
        permission: 'Alixar.Proposal.doIndex'
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
        parent: ProposalController::class,
        order: 2,
        permission: 'Alixar.Proposal.doCreate'
    )]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }

    /**
     * Define columns for the list view.
     */
    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('ref', 'Referencia'),
            new Text('thirdParty.nom', 'Tercero'),
            new Date('datec', 'Fecha'),
            new Date('fin_validite', 'Válido hasta'),
            new Decimal('total_ht', 'Total HT'),
            new Decimal('total_ttc', 'Total TTC'),
            new Text('fk_statut', 'Estado'),
        ];
    }

    /**
     * Define fields for the edit form.
     */
    #[\Override]
    protected function getEditFields(): array
    {
        return [
            'main' => [
                'label' => 'Ficha',
                'fields' => [
                    new Panel('Información General', [
                        new Text('ref', 'Referencia', ['readonly' => true, 'placeholder' => '(PROX-REF)', 'col' => 'col-md-6']),
                        new Select('fk_soc', 'Tercero', [
                            'model' => \Modules\Alixar\Model\ThirdParty::class,
                            'label_field' => 'nom',
                            'required' => true,
                            'col' => 'col-md-6'
                        ]),
                    ]),
                    new Panel('Fechas y Plazos', [
                        new Date('datec', 'Fecha Creación', ['col' => 'col-md-4']),
                        new Date('datep', 'Fecha Propuesta', ['col' => 'col-md-4']),
                        new Date('fin_validite', 'Fin Validez', ['col' => 'col-md-4']),
                    ]),
                    new Panel('Condiciones', [
                        new Text('fk_cond_reglement', 'Condiciones de Pago', ['col' => 'col-md-6']),
                        new Text('fk_mode_reglement', 'Método de Pago', ['col' => 'col-md-6']),
                    ]),
                ]
            ],
            'lines' => [
                'label' => 'Líneas',
                'fields' => [
                    new RelationList('lines', 'Líneas', [
                        ['field' => 'label', 'label' => 'Producto/Servicio'],
                        ['field' => 'qty', 'label' => 'Cant.'],
                        ['field' => 'subprice', 'label' => 'P.U.'],
                        ['field' => 'remise_percent', 'label' => 'Dto %'],
                        ['field' => 'total_ht', 'label' => 'Subtotal'],
                    ])
                ]
            ],
            'notes' => [
                'label' => 'Notas',
                'fields' => [
                    new \Alxarafe\Component\Fields\Textarea('note_private', 'Nota Privada'),
                    new \Alxarafe\Component\Fields\Textarea('note_public', 'Nota Pública'),
                ]
            ]
        ];
    }

    #[\Override]
    protected function beforeConfig()
    {
        $this->addVariable('title', 'Presupuesto: ' . ($this->recordId === 'new' ? 'Nuevo' : $this->getRecord()->ref));
    }
}
