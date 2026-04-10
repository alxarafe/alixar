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
use Modules\Alixar\Model\Proposal;

/**
 * ProposalController — Propuestas comerciales (presupuestos a clientes).
 * Dolibarr equivalent: htdocs/comm/propal/card.php
 */
#[Menu(
    menu: 'top_menu',
    label: 'Comercial',
    icon: 'fas fa-handshake',
    order: 40,
    module: 'Commercial'
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
    #[Menu(menu: 'main_menu', label: 'Propuestas', icon: 'fas fa-file-signature', parent: ProposalController::class, order: 1)]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Nueva Propuesta', icon: 'fas fa-plus', parent: ProposalController::class, order: 2)]
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
            new Date('datep', 'Fecha Propuesta'),
            new Date('fin_validite', 'Fecha Fin Validez'),
            new Decimal('total_ht', 'Total HT'),
            new Decimal('total_tva', 'Total IVA'),
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
                        new Date('datep', 'Fecha Propuesta', ['col' => 'col-md-6']),
                        new Date('fin_validite', 'Fin Validez', ['col' => 'col-md-6']),
                        new Select('fk_cond_reglement', 'Condición Pago', ['col' => 'col-md-6']),
                        new Select('fk_mode_reglement', 'Modo Pago', ['col' => 'col-md-6']),
                        new Select('fk_availability', 'Plazo Entrega', ['col' => 'col-md-6']),
                        new Select('fk_shipping_method', 'Método Envío', ['col' => 'col-md-6']),
                    ]),
                ],
            ],
            'lines' => [
                'label' => 'Líneas',
                'fields' => [
                    new RelationList('lines', 'Líneas', [
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
