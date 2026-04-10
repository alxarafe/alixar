<?php

namespace Modules\Billing\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Decimal;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Loan;

/**
 * LoanController — Préstamos.
 * Dolibarr equivalent: htdocs/loan/card.php
 */
#[Menu(
    menu: 'main_menu',
    label: 'Préstamos',
    icon: 'fas fa-landmark',
    parent: InvoiceController::class,
    order: 50,
    module: 'Billing'
)]
class LoanController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return Loan::class;
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Listado Préstamos', icon: 'fas fa-list', parent: LoanController::class, order: 1)]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('ref', 'Referencia'),
            new Text('label', 'Etiqueta'),
            new Decimal('capital', 'Capital'),
            new Date('datestart', 'Fecha Inicio'),
            new Date('dateend', 'Fecha Fin'),
            new Text('paid', 'Pagado'),
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
                        new Text('label', 'Etiqueta', ['required' => true, 'col' => 'col-md-6']),
                        new Decimal('capital', 'Capital', ['required' => true, 'col' => 'col-md-6']),
                        new Decimal('rate', 'Tipo Interés (%)', ['col' => 'col-md-6']),
                        new Date('datestart', 'Fecha Inicio', ['col' => 'col-md-6']),
                        new Date('dateend', 'Fecha Fin', ['col' => 'col-md-6']),
                        new Decimal('nbterm', 'Nº Plazos', ['col' => 'col-md-6']),
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
