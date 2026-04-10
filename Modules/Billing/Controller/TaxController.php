<?php

namespace Modules\Billing\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\Decimal;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Tax;

/**
 * TaxController — Impuestos y cargas sociales.
 * Dolibarr equivalent: htdocs/compta/sociales/card.php
 */
#[Menu(
    menu: 'main_menu',
    label: 'Impuestos/Tasas',
    icon: 'fas fa-money-check-alt',
    parent: InvoiceController::class,
    order: 20,
    module: 'Billing'
)]
class TaxController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return Tax::class;
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Listado Impuestos', icon: 'fas fa-list', parent: TaxController::class, order: 1)]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('label', 'Etiqueta'),
            new Date('date_ech', 'Fecha Vencimiento'),
            new Decimal('amount', 'Importe'),
            new Date('paye', 'Pagado'),
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
                        new Text('label', 'Etiqueta', ['required' => true, 'col' => 'col-md-6']),
                        new Select('fk_type', 'Tipo Impuesto', ['col' => 'col-md-6']),
                        new Date('date_ech', 'Fecha Vencimiento', ['col' => 'col-md-6']),
                        new Decimal('amount', 'Importe', ['required' => true, 'col' => 'col-md-6']),
                        new Select('fk_account', 'Cuenta Bancaria', ['col' => 'col-md-6']),
                        new Select('fk_mode_reglement', 'Modo Pago', ['col' => 'col-md-6']),
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
