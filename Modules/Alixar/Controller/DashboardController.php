<?php

namespace Modules\Alixar\Controller;

use Alxarafe\Base\Controller\Controller;
use Alxarafe\Attribute\Menu;

class DashboardController extends Controller
{
    #[Menu(
        menu: 'main_menu',
        label: 'Escritorio',
        icon: 'fas fa-tachometer-alt',
        parent: \CoreModules\Admin\Controller\HomeController::class,
        order: 1,
        permission: 'Alixar.Dashboard.doIndex'
    )]
    public function doIndex(): bool
    {
        $this->addVariable('title', 'Alixar ERP - Dashboard');

        $activeModules = [
            'crm' => \CoreModules\Admin\Model\Setting::getBool('module_enabled_crm'),
            'products' => \CoreModules\Admin\Model\Setting::getBool('module_enabled_products'),
            'sales' => \CoreModules\Admin\Model\Setting::getBool('module_enabled_sales'),
            'banks' => \CoreModules\Admin\Model\Setting::getBool('module_enabled_banks'),
            'projects' => \CoreModules\Admin\Model\Setting::getBool('module_enabled_projects'),
        ];
        $this->addVariable('activeModules', $activeModules);

        // Fetch basic KPIs only for active modules
        $stats = [];
        if ($activeModules['crm']) {
            $stats['thirdparties'] = \Modules\Alixar\Model\ThirdParty::count();
        }
        if ($activeModules['products']) {
            $stats['products'] = \Modules\Alixar\Model\Product::count();
        }
        if ($activeModules['sales']) {
            $stats['orders'] = \Modules\Alixar\Model\Order::where('fk_statut', 1)->count();
            $stats['invoices'] = \Modules\Alixar\Model\Invoice::where('paye', 0)->count();
        }
        if ($activeModules['banks']) {
            $stats['bank_balance'] = \Modules\Alixar\Model\BankAccount::sum('amount');
        }
        if ($activeModules['projects']) {
            $stats['projects'] = \Modules\Alixar\Model\Project::count();
        }

        // Fetch recent activity only for active modules
        if ($activeModules['crm']) {
            $this->addVariable('recentThirdParties', \Modules\Alixar\Model\ThirdParty::orderBy('rowid', 'desc')->limit(5)->get());
        }
        if ($activeModules['sales']) {
            $this->addVariable('pendingInvoices', \Modules\Alixar\Model\Invoice::where('paye', 0)->orderBy('datef', 'desc')->limit(5)->get());
        }
        if ($activeModules['projects']) {
            $this->addVariable('recentProjects', \Modules\Alixar\Model\Project::orderBy('rowid', 'desc')->limit(5)->get());
        }

        $this->addVariable('stats', $stats);
        $this->setDefaultTemplate('page/home');

        return true;
    }
}
