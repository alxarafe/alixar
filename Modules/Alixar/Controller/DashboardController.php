<?php

namespace Modules\Alixar\Controller;

use Alxarafe\Base\Controller\Controller;
use Alxarafe\Attribute\Menu;

#[Menu(
    menu: 'top_menu',
    label: 'Inicio',
    icon: 'fas fa-home',
    order: 1,
    permission: 'Alixar.Dashboard.doIndex'
)]
class DashboardController extends Controller
{
    #[Menu(
        menu: 'main_menu',
        label: 'Escritorio',
        icon: 'fas fa-tachometer-alt',
        parent: DashboardController::class,
        order: 1,
        permission: 'Alixar.Dashboard.doIndex'
    )]
    public function doIndex(): bool
    {
        $this->addVariable('title', 'Alixar ERP - Dashboard');

        // Fetch basic KPIs
        $stats = [
            'thirdparties' => \Modules\Alixar\Model\ThirdParty::count(),
            'products' => \Modules\Alixar\Model\Product::count(),
            'orders' => \Modules\Alixar\Model\Order::where('fk_statut', 1)->count(), // Validados/Abiertos
            'invoices' => \Modules\Alixar\Model\Invoice::where('paye', 0)->count(), // No pagadas
            'bank_balance' => \Modules\Alixar\Model\BankAccount::sum('amount'),
            'projects' => \Modules\Alixar\Model\Project::count(),
        ];

        // Fetch recent activity
        $recentThirdParties = \Modules\Alixar\Model\ThirdParty::orderBy('rowid', 'desc')->limit(5)->get();
        $pendingInvoices = \Modules\Alixar\Model\Invoice::where('paye', 0)->orderBy('datef', 'desc')->limit(5)->get();
        $recentProjects = \Modules\Alixar\Model\Project::orderBy('rowid', 'desc')->limit(5)->get();

        $this->addVariable('stats', $stats);
        $this->addVariable('recentThirdParties', $recentThirdParties);
        $this->addVariable('pendingInvoices', $pendingInvoices);
        $this->addVariable('recentProjects', $recentProjects);

        $this->setDefaultTemplate('page/home');

        return true;
    }
}
