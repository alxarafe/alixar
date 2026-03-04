<?php

namespace Modules\Purchase\Controller;

use Alxarafe\Attribute\Menu;
use Modules\Alixar\Model\ThirdParty;
use Modules\CRM\Controller\ThirdPartyController;

/**
 * Class SupplierController
 * Specialized controller for Suppliers (Fournisseurs).
 *
 * @package Modules\Purchase\Controller
 */
#[Menu(
    menu: 'main_menu',
    label: 'Proveedores',
    icon: 'fas fa-truck-loading',
    parent: SupplierProposalController::class,
    order: 40,
    permission: 'Alixar.Supplier.doIndex'
)]
class SupplierController extends ThirdPartyController
{
    #[Menu(
        menu: 'main_menu',
        label: 'Listado Proveedores',
        icon: 'fas fa-list',
        parent: SupplierController::class,
        order: 1,
        permission: 'Alixar.Supplier.doIndex'
    )]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[Menu(
        menu: 'main_menu',
        label: 'Nuevo Proveedor',
        icon: 'fas fa-plus',
        parent: SupplierController::class,
        order: 2,
        permission: 'Alixar.Supplier.doCreate'
    )]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }
    /**
     * Override beforeList to set the filter for suppliers only.
     */
    protected function beforeList()
    {
        $this->structConfig['list']['tabs']['general']['conditions']['fournisseur'] = 1;
        $this->addVariable('title', 'Gestión de Proveedores - Alixar');
    }

    /**
     * Override detectMode to ensure when creating via this controller, 
     * the 'fournisseur' flag is pre-checked.
     */
    protected function fetchRecordData(): array
    {
        $response = parent::fetchRecordData();
        if ($this->recordId === 'new') {
            $response['data']['fournisseur'] = 1;
            $response['data']['client'] = 0;
        }
        return $response;
    }
}
