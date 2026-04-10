<?php

namespace Modules\HR\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\RecruitmentJobPosition;

/**
 * RecruitmentController — Ofertas de empleo y candidaturas.
 * Dolibarr equivalent: htdocs/recruitment/recruitmentjobposition_card.php
 */
#[Menu(
    menu: 'main_menu',
    label: 'Reclutamiento',
    icon: 'fas fa-user-plus',
    parent: UserController::class,
    order: 30,
    module: 'HR'
)]
class RecruitmentController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return RecruitmentJobPosition::class;
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Ofertas Empleo', icon: 'fas fa-list', parent: RecruitmentController::class, order: 1)]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Nueva Oferta', icon: 'fas fa-plus', parent: RecruitmentController::class, order: 2)]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('ref', 'Referencia'),
            new Text('label', 'Puesto'),
            new Date('date_planned', 'Fecha Prevista'),
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
                        new Text('label', 'Puesto', ['required' => true, 'col' => 'col-md-6']),
                        new Date('date_planned', 'Fecha Prevista', ['col' => 'col-md-6']),
                        new Select('fk_soc', 'Empresa', ['col' => 'col-md-6']),
                        new Textarea('description', 'Descripción del puesto'),
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
