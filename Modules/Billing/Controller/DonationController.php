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
use Modules\Alixar\Model\Donation;

/**
 * DonationController — Donaciones.
 * Dolibarr equivalent: htdocs/don/card.php
 */
#[Menu(
    menu: 'main_menu',
    label: 'Donaciones',
    icon: 'fas fa-hand-holding-heart',
    parent: InvoiceController::class,
    order: 30,
    module: 'Billing'
)]
class DonationController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return Donation::class;
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Listado Donaciones', icon: 'fas fa-list', parent: DonationController::class, order: 1)]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('ref', 'Referencia'),
            new Text('societe', 'Donante'),
            new Date('datedon', 'Fecha Donación'),
            new Decimal('amount', 'Importe'),
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
                        new Text('societe', 'Donante / Empresa', ['col' => 'col-md-6']),
                        new Text('lastname', 'Apellido', ['col' => 'col-md-6']),
                        new Text('firstname', 'Nombre', ['col' => 'col-md-6']),
                        new Date('datedon', 'Fecha Donación', ['col' => 'col-md-6']),
                        new Decimal('amount', 'Importe', ['required' => true, 'col' => 'col-md-6']),
                        new Select('fk_payment', 'Modo Pago', ['col' => 'col-md-6']),
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
