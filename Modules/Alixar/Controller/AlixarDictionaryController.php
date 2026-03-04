<?php

declare(strict_types=1);

namespace Modules\Alixar\Controller;

use Alxarafe\Attribute\Menu;
use CoreModules\Admin\Controller\DictionaryController;

/**
 * Class AlixarDictionaryController
 *
 * Extends the generic DictionaryController to add Alixar-specific sidebar menu items
 * for the most commonly used ERP dictionaries.
 *
 * Usage: index.php?module=Alixar&controller=AlixarDictionary&model=CCountry
 *
 * @package Modules\Alixar\Controller
 */
#[Menu(
    menu: 'main_menu',
    label: 'Diccionarios',
    icon: 'fas fa-book',
    parent: DashboardController::class,
    order: 50,
    permission: 'Alixar.Setup'
)]
class AlixarDictionaryController extends DictionaryController
{
    /**
     * Menu items for key dictionaries.
     * Each redirects to DictionaryController with the appropriate model.
     */

    #[Menu(
        menu: 'main_menu',
        label: 'Países',
        icon: 'fas fa-globe',
        parent: AlixarDictionaryController::class,
        order: 1,
        permission: 'Alixar.Setup'
    )]
    public function doCountries(): bool
    {
        $_GET['model'] = 'CCountry';
        return $this->doIndex();
    }

    #[Menu(
        menu: 'main_menu',
        label: 'Formas de Pago',
        icon: 'fas fa-credit-card',
        parent: AlixarDictionaryController::class,
        order: 2,
        permission: 'Alixar.Setup'
    )]
    public function doPaymentMethods(): bool
    {
        $_GET['model'] = 'CPaiement';
        return $this->doIndex();
    }

    #[Menu(
        menu: 'main_menu',
        label: 'Condiciones Pago',
        icon: 'fas fa-calendar-check',
        parent: AlixarDictionaryController::class,
        order: 3,
        permission: 'Alixar.Setup'
    )]
    public function doPaymentTerms(): bool
    {
        $_GET['model'] = 'CPaymentTerm';
        return $this->doIndex();
    }

    #[Menu(
        menu: 'main_menu',
        label: 'Tipos IVA',
        icon: 'fas fa-percent',
        parent: AlixarDictionaryController::class,
        order: 4,
        permission: 'Alixar.Setup'
    )]
    public function doVatRates(): bool
    {
        $_GET['model'] = 'CTva';
        return $this->doIndex();
    }

    #[Menu(
        menu: 'main_menu',
        label: 'Tipos de Tercero',
        icon: 'fas fa-building',
        parent: AlixarDictionaryController::class,
        order: 5,
        permission: 'Alixar.Setup'
    )]
    public function doEntityTypes(): bool
    {
        $_GET['model'] = 'CTypent';
        return $this->doIndex();
    }

    #[Menu(
        menu: 'main_menu',
        label: 'Monedas',
        icon: 'fas fa-coins',
        parent: AlixarDictionaryController::class,
        order: 6,
        permission: 'Alixar.Setup'
    )]
    public function doCurrencies(): bool
    {
        $_GET['model'] = 'CCurrencies';
        return $this->doIndex();
    }

    #[Menu(
        menu: 'main_menu',
        label: 'Unidades de Medida',
        icon: 'fas fa-ruler',
        parent: AlixarDictionaryController::class,
        order: 7,
        permission: 'Alixar.Setup'
    )]
    public function doUnits(): bool
    {
        $_GET['model'] = 'CUnits';
        return $this->doIndex();
    }
}
