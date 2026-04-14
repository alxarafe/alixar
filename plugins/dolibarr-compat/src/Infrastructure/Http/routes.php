<?php

/**
 * Dolibarr Compat Plugin — Route Registration.
 *
 * Expone endpoints heredados que dependen de las tablas nativas de Dolibarr
 * (como la configuración o los menús).
 */

declare(strict_types=1);

use Core\Application\Plugin\HookRegistryInterface;
use Core\Application\Plugin\PluginRegistry;

return function (flight\Engine $app, \PDO $pdo, HookRegistryInterface $hooks, PluginRegistry $registry): void {

    // Extraer prefix y config
    $dbConfig = $GLOBALS['__api_config']['database'] ?? [];
    $tablePrefix = $dbConfig['table_prefix'] ?? '';

    // Rutas de setup heredadas
    try {
        $configPort = new \Plugin\DolibarrCompat\Infrastructure\Persistence\Mysql\MysqlConfigurationAdapter($pdo);
        $menuAdapter = new \Plugin\DolibarrCompat\Infrastructure\Persistence\Mysql\Menu\MysqlLegacyDolibarrMenuAdapter($pdo, $configPort, $tablePrefix);
        
        $getNavigationTree = new \Core\Application\Menu\GetNavigationTree($menuAdapter);
        $setupCtrl = new \Core\Infrastructure\Http\Api\Controller\SetupApiController($getNavigationTree);

        // This endpoint was tightly coupled to the Vue frontend mapping, using GET /api/setup/menus
        $app->route('GET /api/setup/menus', [$setupCtrl, 'getMenus']);
    } catch (\Throwable $e) {
        // En instalaciones completamente nuevas sin Dolibarr, estas tablas (`llx_const`, `llx_menu`)
        // podrían no existir o fallar. Silenciar el error en tiempo de inicialización de rutas.
    }

    // ── Translation APIGateway (Anti-Corruption Layer) ──
    // Intercepts Dolibarr API calls, maps them to Alixar Native Domain, and responds in Dolibarr format.
    
    // Expense Reports Legacy Routing
    $nativeExpenseReportRepo = new \Plugin\Hr\Infrastructure\Persistence\Mysql\MysqlExpenseReportRepository($pdo);
    $expenseReportMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\ExpenseReportLegacyMapper();
    $legacyExpenseCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\LegacyExpenseReportApiController($nativeExpenseReportRepo, $expenseReportMapper);

    $app->route('GET /api/expensereports', [$legacyExpenseCtrl, 'list']);
    $app->route('POST /api/expensereports', [$legacyExpenseCtrl, 'create']);
    $app->route('GET /api/expensereports/@id', [$legacyExpenseCtrl, 'show']);
    $app->route('PUT /api/expensereports/@id', [$legacyExpenseCtrl, 'update']);
    $app->route('DELETE /api/expensereports/@id', [$legacyExpenseCtrl, 'destroy']);

    // Shipments Legacy Routing
    $nativeShipmentRepo = new \Plugin\Logistics\Infrastructure\Persistence\Mysql\MysqlShipmentRepository($pdo);
    $shipmentMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\ShipmentLegacyMapper();
    $legacyShipmentCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeShipmentRepo, $shipmentMapper, \Plugin\Logistics\Domain\Shipment\Shipment::class);

    $app->route('GET /api/shipments', [$legacyShipmentCtrl, 'list']);
    $app->route('POST /api/shipments', [$legacyShipmentCtrl, 'create']);
    $app->route('GET /api/shipments/@id', [$legacyShipmentCtrl, 'show']);
    $app->route('PUT /api/shipments/@id', [$legacyShipmentCtrl, 'update']);
    $app->route('DELETE /api/shipments/@id', [$legacyShipmentCtrl, 'destroy']);

    // Receptions Legacy Routing
    $nativeReceptionRepo = new \Plugin\Logistics\Infrastructure\Persistence\Mysql\MysqlReceptionRepository($pdo);
    $receptionMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\ReceptionLegacyMapper();
    $legacyReceptionCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeReceptionRepo, $receptionMapper, \Plugin\Logistics\Domain\Reception\Reception::class);

    $app->route('GET /api/receptions', [$legacyReceptionCtrl, 'list']);
    $app->route('POST /api/receptions', [$legacyReceptionCtrl, 'create']);
    $app->route('GET /api/receptions/@id', [$legacyReceptionCtrl, 'show']);
    $app->route('PUT /api/receptions/@id', [$legacyReceptionCtrl, 'update']);
    $app->route('DELETE /api/receptions/@id', [$legacyReceptionCtrl, 'destroy']);

    // Interventions Legacy Routing
    $nativeInterventionRepo = new \Plugin\Interventions\Infrastructure\Persistence\Mysql\MysqlInterventionRepository($pdo);
    $interventionMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\InterventionLegacyMapper();
    $legacyInterventionCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeInterventionRepo, $interventionMapper, \Plugin\Interventions\Domain\Intervention\Intervention::class);

    $app->route('GET /api/interventions', [$legacyInterventionCtrl, 'list']);
    $app->route('POST /api/interventions', [$legacyInterventionCtrl, 'create']);
    $app->route('GET /api/interventions/@id', [$legacyInterventionCtrl, 'show']);
    $app->route('PUT /api/interventions/@id', [$legacyInterventionCtrl, 'update']);
    $app->route('DELETE /api/interventions/@id', [$legacyInterventionCtrl, 'destroy']);

    // Products Legacy Routing
    $nativeProductRepo = new \Plugin\Products\Infrastructure\Persistence\Mysql\MysqlProductRepository($pdo);
    $productMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\ProductLegacyMapper();
    $legacyProductCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeProductRepo, $productMapper, \Plugin\Products\Domain\Product\Product::class);

    $app->route('GET /api/products', [$legacyProductCtrl, 'list']);
    $app->route('POST /api/products', [$legacyProductCtrl, 'create']);
    $app->route('GET /api/products/@id', [$legacyProductCtrl, 'show']);
    $app->route('PUT /api/products/@id', [$legacyProductCtrl, 'update']);
    $app->route('DELETE /api/products/@id', [$legacyProductCtrl, 'destroy']);

    // ThirdParties Legacy Routing — reuse native controller (already Dolibarr-compat)
    $configPort = new \Plugin\DolibarrCompat\Infrastructure\Persistence\Mysql\MysqlConfigurationAdapter($pdo);
    $codeGenerator = new \Plugin\Business\Application\Codification\NullThirdPartyCodeGenerator();
    $nativeThirdPartyRepo = new \Plugin\Business\Infrastructure\Persistence\Mysql\ThirdParty\MysqlThirdPartyRepository($pdo);
    $thirdPartyValidator = new \Plugin\Business\Domain\ThirdParty\ThirdPartyValidator($nativeThirdPartyRepo, $configPort, $codeGenerator);
    $bankAccountRepo = new \Plugin\Business\Infrastructure\Persistence\Mysql\BankAccount\MysqlBankAccountRepository($pdo);
    $categoryRepo = new \Plugin\Business\Infrastructure\Persistence\Mysql\Category\MysqlThirdPartyCategoryRepository($pdo);
    $representativeRepo = new \Plugin\Business\Infrastructure\Persistence\Mysql\User\MysqlThirdPartyRepresentativeRepository($pdo);

    $legacyThirdPartyCtrl = new \Plugin\Business\Infrastructure\Http\Api\Controller\ThirdPartyApiController(
        $nativeThirdPartyRepo, $thirdPartyValidator, $bankAccountRepo, $categoryRepo, $representativeRepo
    );

    $app->route('GET /api/thirdparties', [$legacyThirdPartyCtrl, 'list']);
    $app->route('POST /api/thirdparties', [$legacyThirdPartyCtrl, 'create']);
    $app->route('GET /api/thirdparties/@id', [$legacyThirdPartyCtrl, 'show']);
    $app->route('PUT /api/thirdparties/@id', [$legacyThirdPartyCtrl, 'update']);
    $app->route('DELETE /api/thirdparties/@id', [$legacyThirdPartyCtrl, 'destroy']);
    $app->route('GET /api/thirdparties/@id/bankaccounts', [$legacyThirdPartyCtrl, 'getBankAccounts']);
    $app->route('POST /api/thirdparties/@id/bankaccounts', [$legacyThirdPartyCtrl, 'postBankAccount']);
    $app->route('PUT /api/thirdparties/@id/bankaccounts/@bankaccountId', [$legacyThirdPartyCtrl, 'putBankAccount']);
    $app->route('DELETE /api/thirdparties/@id/bankaccounts/@bankaccountId', [$legacyThirdPartyCtrl, 'deleteBankAccount']);
    $app->route('GET /api/thirdparties/@id/categories', [$legacyThirdPartyCtrl, 'getCategories']);
    $app->route('GET /api/thirdparties/@id/supplier_categories', [$legacyThirdPartyCtrl, 'getSupplierCategories']);
    $app->route('GET /api/thirdparties/@id/representatives', [$legacyThirdPartyCtrl, 'getRepresentatives']);

    // Trading Legacy Routing
    $nativeInvoiceRepo = new \Plugin\Trading\Infrastructure\Persistence\Mysql\Invoice\MysqlInvoiceRepository($pdo);
    $invoiceMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\InvoiceLegacyMapper();
    $legacyInvoiceCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeInvoiceRepo, $invoiceMapper, \Plugin\Trading\Domain\Invoice\Invoice::class);
    $app->route('GET /api/invoices', [$legacyInvoiceCtrl, 'list']);
    $app->route('POST /api/invoices', [$legacyInvoiceCtrl, 'create']);
    $app->route('GET /api/invoices/@id', [$legacyInvoiceCtrl, 'show']);
    $app->route('PUT /api/invoices/@id', [$legacyInvoiceCtrl, 'update']);
    $app->route('DELETE /api/invoices/@id', [$legacyInvoiceCtrl, 'destroy']);

    $nativeOrderRepo = new \Plugin\Trading\Infrastructure\Persistence\Mysql\Order\MysqlOrderRepository($pdo);
    $orderMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\OrderLegacyMapper();
    $legacyOrderCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeOrderRepo, $orderMapper, \Plugin\Trading\Domain\Order\Order::class);
    $app->route('GET /api/orders', [$legacyOrderCtrl, 'list']);
    $app->route('POST /api/orders', [$legacyOrderCtrl, 'create']);
    $app->route('GET /api/orders/@id', [$legacyOrderCtrl, 'show']);
    $app->route('PUT /api/orders/@id', [$legacyOrderCtrl, 'update']);
    $app->route('DELETE /api/orders/@id', [$legacyOrderCtrl, 'destroy']);

    $nativeProposalRepo = new \Plugin\Trading\Infrastructure\Persistence\Mysql\Proposal\MysqlProposalRepository($pdo);
    $proposalMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\ProposalLegacyMapper();
    $legacyProposalCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeProposalRepo, $proposalMapper, \Plugin\Trading\Domain\Proposal\Proposal::class);
    $app->route('GET /api/proposals', [$legacyProposalCtrl, 'list']);
    $app->route('POST /api/proposals', [$legacyProposalCtrl, 'create']);
    $app->route('GET /api/proposals/@id', [$legacyProposalCtrl, 'show']);
    $app->route('PUT /api/proposals/@id', [$legacyProposalCtrl, 'update']);
    $app->route('DELETE /api/proposals/@id', [$legacyProposalCtrl, 'destroy']);

    $nativeSupplierInvoiceRepo = new \Plugin\Trading\Infrastructure\Persistence\Mysql\SupplierInvoice\MysqlSupplierInvoiceRepository($pdo);
    $supplierInvoiceMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\SupplierInvoiceLegacyMapper();
    $legacySupplierInvoiceCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeSupplierInvoiceRepo, $supplierInvoiceMapper, \Plugin\Trading\Domain\SupplierInvoice\SupplierInvoice::class);
    $app->route('GET /api/supplierinvoices', [$legacySupplierInvoiceCtrl, 'list']);
    $app->route('POST /api/supplierinvoices', [$legacySupplierInvoiceCtrl, 'create']);
    $app->route('GET /api/supplierinvoices/@id', [$legacySupplierInvoiceCtrl, 'show']);
    $app->route('PUT /api/supplierinvoices/@id', [$legacySupplierInvoiceCtrl, 'update']);
    $app->route('DELETE /api/supplierinvoices/@id', [$legacySupplierInvoiceCtrl, 'destroy']);

    $nativeSupplierOrderRepo = new \Plugin\Trading\Infrastructure\Persistence\Mysql\SupplierOrder\MysqlSupplierOrderRepository($pdo);
    $supplierOrderMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\SupplierOrderLegacyMapper();
    $legacySupplierOrderCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeSupplierOrderRepo, $supplierOrderMapper, \Plugin\Trading\Domain\SupplierOrder\SupplierOrder::class);
    $app->route('GET /api/supplierorders', [$legacySupplierOrderCtrl, 'list']);
    $app->route('POST /api/supplierorders', [$legacySupplierOrderCtrl, 'create']);
    $app->route('GET /api/supplierorders/@id', [$legacySupplierOrderCtrl, 'show']);
    $app->route('PUT /api/supplierorders/@id', [$legacySupplierOrderCtrl, 'update']);
    $app->route('DELETE /api/supplierorders/@id', [$legacySupplierOrderCtrl, 'destroy']);

    // CRM Legacy Routing — reuse native controllers (already Dolibarr-compat)
    $nativeContactRepo = new \Plugin\Crm\Infrastructure\Persistence\Mysql\Contact\MysqlContactRepository($pdo);
    $contactCategoryRepo = new \Plugin\Crm\Infrastructure\Persistence\Mysql\Category\MysqlContactCategoryRepository($pdo);
    $legacyContactCtrl = new \Plugin\Crm\Infrastructure\Http\Api\Controller\ContactApiController($nativeContactRepo, $contactCategoryRepo);

    $app->route('GET /api/contacts', [$legacyContactCtrl, 'list']);
    $app->route('POST /api/contacts', [$legacyContactCtrl, 'create']);
    $app->route('GET /api/contacts/@id', [$legacyContactCtrl, 'show']);
    $app->route('PUT /api/contacts/@id', [$legacyContactCtrl, 'update']);
    $app->route('DELETE /api/contacts/@id', [$legacyContactCtrl, 'destroy']);
    $app->route('GET /api/contacts/email/@email', [$legacyContactCtrl, 'getByEmail']);
    $app->route('GET /api/contacts/@id/categories', [$legacyContactCtrl, 'getCategories']);

    $nativeEventRepo = new \Plugin\Crm\Infrastructure\Persistence\Mysql\Event\MysqlEventRepository($pdo);
    $legacyEventCtrl = new \Plugin\Crm\Infrastructure\Http\Api\Controller\EventApiController($nativeEventRepo);
    $app->route('GET /api/agendaevents', [$legacyEventCtrl, 'list']);
    $app->route('POST /api/agendaevents', [$legacyEventCtrl, 'create']);
    $app->route('GET /api/agendaevents/@id', [$legacyEventCtrl, 'show']);
    $app->route('PUT /api/agendaevents/@id', [$legacyEventCtrl, 'update']);
    $app->route('DELETE /api/agendaevents/@id', [$legacyEventCtrl, 'destroy']);
    // Also register on /api/events for test compatibility
    $app->route('GET /api/events', [$legacyEventCtrl, 'list']);
    $app->route('POST /api/events', [$legacyEventCtrl, 'create']);
    $app->route('GET /api/events/@id', [$legacyEventCtrl, 'show']);
    $app->route('PUT /api/events/@id', [$legacyEventCtrl, 'update']);
    $app->route('DELETE /api/events/@id', [$legacyEventCtrl, 'destroy']);

    // Projects Legacy Routing
    $nativeProjectRepo = new \Plugin\Projects\Infrastructure\Persistence\Mysql\Project\MysqlProjectRepository($pdo);
    $projectMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\ProjectLegacyMapper();
    $legacyProjectCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeProjectRepo, $projectMapper, \Plugin\Projects\Domain\Project\Project::class);
    $app->route('GET /api/projects', [$legacyProjectCtrl, 'list']);
    $app->route('POST /api/projects', [$legacyProjectCtrl, 'create']);
    $app->route('GET /api/projects/@id', [$legacyProjectCtrl, 'show']);
    $app->route('PUT /api/projects/@id', [$legacyProjectCtrl, 'update']);
    $app->route('DELETE /api/projects/@id', [$legacyProjectCtrl, 'destroy']);

    // Finance Legacy Routing
    $nativeTreasuryRepo = new \Plugin\Finance\Infrastructure\Persistence\Mysql\BankAccount\MysqlTreasuryBankAccountRepository($pdo);
    $treasuryMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\TreasuryBankAccountLegacyMapper();
    $legacyTreasuryCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeTreasuryRepo, $treasuryMapper, \Plugin\Finance\Domain\BankAccount\BankAccount::class);
    $app->route('GET /api/bankaccounts', [$legacyTreasuryCtrl, 'list']);
    $app->route('POST /api/bankaccounts', [$legacyTreasuryCtrl, 'create']);
    $app->route('GET /api/bankaccounts/@id', [$legacyTreasuryCtrl, 'show']);
    $app->route('PUT /api/bankaccounts/@id', [$legacyTreasuryCtrl, 'update']);
    $app->route('DELETE /api/bankaccounts/@id', [$legacyTreasuryCtrl, 'destroy']);
};
