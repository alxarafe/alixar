<?php

namespace Modules\Accountancy\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\Decimal;
use Alxarafe\Component\Fields\Boolean;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Asset;

/**
 * AssetController — Activos fijos / inmovilizado.
 * Dolibarr equivalent: htdocs/asset/card.php
 */
#[Menu(
    menu: 'main_menu',
    label: 'Activos Fijos',
    icon: 'fas fa-building',
    parent: AccountingController::class,
    order: 10,
    module: 'Accountancy'
)]
class AssetController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass(): string
    {
        return Asset::class;
    }

    #[\Override]
    #[Menu(menu: 'main_menu', label: 'Listado Activos', icon: 'fas fa-list', parent: AssetController::class, order: 1)]
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
            new Date('date_acquisition', 'Fecha Adquisición'),
            new Decimal('acquisition_value_ht', 'Valor Adquisición HT'),
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
                        new Text('label', 'Etiqueta', ['required' => true, 'col' => 'col-md-6']),
                        new Date('date_acquisition', 'Fecha Adquisición', ['col' => 'col-md-6']),
                        new Decimal('acquisition_value_ht', 'Valor Adquisición HT', ['col' => 'col-md-6']),
                        new Decimal('reversal_amount_ht', 'Valor Residual HT', ['col' => 'col-md-6']),
                        new Select('fk_asset_type', 'Tipo Activo', ['col' => 'col-md-6']),
                        new Decimal('duration', 'Duración (años)', ['col' => 'col-md-6']),
                    ]),
                ],
            ],
            'depreciation' => [
                'label' => 'Amortización',
                'fields' => [
                    new Panel('Amortización', [
                        new Select('depreciation_type', 'Tipo Amortización', ['col' => 'col-md-6']),
                        new Decimal('depreciation_duration', 'Duración Amortización', ['col' => 'col-md-6']),
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
