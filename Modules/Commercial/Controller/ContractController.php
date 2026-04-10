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
use Modules\Alixar\Model\Contract;

/**
 * ContractController — Contratos/abonos de clientes.
 * Dolibarr equivalent: htdocs/contrat/card.php
 */
#[Menu(
    menu: 'main_menu',
    label: 'Contratos',
    icon: 'fas fa-file-contract',
    parent: ProposalController::class,
    order: 20,
    module: 'Commercial'
)]
class ContractController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return Contract::class;
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Listado Contratos', icon: 'fas fa-list', parent: ContractController::class, order: 1)]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Nuevo Contrato', icon: 'fas fa-plus', parent: ContractController::class, order: 2)]
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
            new Date('date_contrat', 'Fecha Contrato'),
            new Decimal('total_ht', 'Total HT'),
            new Decimal('total_ttc', 'Total TTC'),
            new Text('statut', 'Estado'),
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
                        new Date('date_contrat', 'Fecha Contrato', ['col' => 'col-md-6']),
                        new Select('fk_commercial_signature', 'Comercial Firma', ['col' => 'col-md-6']),
                        new Select('fk_commercial_suivi', 'Comercial Seguimiento', ['col' => 'col-md-6']),
                    ]),
                ],
            ],
            'services' => [
                'label' => 'Servicios',
                'fields' => [
                    new RelationList('lines', 'Líneas de servicio', [
                        ['field' => 'description', 'label' => 'Descripción'],
                        ['field' => 'qty', 'label' => 'Cant.'],
                        ['field' => 'subprice', 'label' => 'Precio'],
                        ['field' => 'date_ouverture', 'label' => 'Fecha Inicio'],
                        ['field' => 'date_cloture', 'label' => 'Fecha Fin'],
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
