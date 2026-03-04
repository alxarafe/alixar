<?php

namespace Modules\Banks\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Fields\Boolean;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\BankAccountAccount;

/**
 * Class BankAccountController
 * Manages Financial/Bank Accounts.
 *
 * @package Modules\Banks\Controller
 */
#[Menu(
    menu: 'top_menu',
    label: 'Bancos',
    icon: 'fas fa-university',
    order: 50,
    permission: 'Alixar.Bank.doIndex'
)]
class BankAccountController extends ResourceController
{
    protected bool $useTabs = true;

    #[Menu(
        menu: 'main_menu',
        label: 'Listado Cuentas',
        icon: 'fas fa-list',
        parent: BankAccountController::class,
        order: 1,
        permission: 'Alixar.Bank.doIndex'
    )]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[Menu(
        menu: 'main_menu',
        label: 'Nueva Cuenta',
        icon: 'fas fa-plus',
        parent: BankAccountController::class,
        order: 2,
        permission: 'Alixar.Bank.doCreate'
    )]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }
    protected function getModelClass(): string
    {
        return BankAccountAccount::class;
    }

    protected function getListColumns(): array
    {
        return [
            new Text('ref', 'Referencia'),
            new Text('label', 'Etiqueta'),
            new Text('bank', 'Banco'),
            new Text('number', 'Nº Cuenta'),
            new Text('currency_code', 'Moneda'),
            new Boolean('clos', 'Cerrada'),
        ];
    }

    protected function getEditFields(): array
    {
        return [
            'main' => [
                'label' => 'Ficha',
                'fields' => [
                    new Panel('General', [
                        new Text('ref', 'Referencia', ['required' => true, 'col' => 'col-md-6']),
                        new Text('label', 'Etiqueta / Nombre de la cuenta', ['required' => true, 'col' => 'col-md-6']),
                        new Text('bank', 'Nombre del Banco', ['col' => 'col-md-6']),
                        new Text('currency_code', 'Código de Moneda (EUR, USD...)', ['col' => 'col-md-6']),
                    ]),
                    new Panel('Números de Cuenta', [
                        new Text('code_banque', 'Cód. Banco', ['col' => 'col-md-3']),
                        new Text('code_guichet', 'Cód. Oficina', ['col' => 'col-md-3']),
                        new Text('number', 'Nº Cuenta', ['col' => 'col-md-4']),
                        new Text('cle_rib', 'D.C.', ['col' => 'col-md-2']),
                        new Text('iban_prefix', 'IBAN', ['col' => 'col-md-12']),
                        new Text('bic', 'BIC/SWIFT', ['col' => 'col-md-6']),
                    ]),
                ]
            ],
            'notes' => [
                'label' => 'Notas',
                'fields' => [
                    new Panel('Observaciones', [
                        new Textarea('comment', 'Comentarios internos'),
                        new Textarea('note_public', 'Nota pública'),
                    ])
                ]
            ]
        ];
    }

    protected function beforeConfig()
    {
        $this->addVariable('title', 'Cuentas Bancarias - Alixar');
    }
}
