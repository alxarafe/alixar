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

    $nativeTaskRepo = new \Plugin\Projects\Infrastructure\Persistence\Mysql\Task\MysqlTaskRepository($pdo);
    $taskMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\TaskLegacyMapper();
    $legacyTaskCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeTaskRepo, $taskMapper, \Plugin\Projects\Domain\Task\Task::class);
    $app->route('GET /api/tasks', [$legacyTaskCtrl, 'list']);
    $app->route('POST /api/tasks', [$legacyTaskCtrl, 'create']);
    $app->route('GET /api/tasks/@id', [$legacyTaskCtrl, 'show']);
    $app->route('PUT /api/tasks/@id', [$legacyTaskCtrl, 'update']);
    $app->route('DELETE /api/tasks/@id', [$legacyTaskCtrl, 'destroy']);

    // Finance Legacy Routing
    $nativeTreasuryRepo = new \Plugin\Finance\Infrastructure\Persistence\Mysql\BankAccount\MysqlTreasuryBankAccountRepository($pdo);
    $treasuryMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\TreasuryBankAccountLegacyMapper();
    $legacyTreasuryCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeTreasuryRepo, $treasuryMapper, \Plugin\Finance\Domain\BankAccount\BankAccount::class);
    $app->route('GET /api/bankaccounts', [$legacyTreasuryCtrl, 'list']);
    $app->route('POST /api/bankaccounts', [$legacyTreasuryCtrl, 'create']);
    $app->route('GET /api/bankaccounts/@id', [$legacyTreasuryCtrl, 'show']);
    $app->route('PUT /api/bankaccounts/@id', [$legacyTreasuryCtrl, 'update']);
    $app->route('DELETE /api/bankaccounts/@id', [$legacyTreasuryCtrl, 'destroy']);

    $nativePaymentRepo = new \Plugin\Finance\Infrastructure\Persistence\Mysql\Payment\MysqlPaymentRepository($pdo);
    $paymentMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\PaymentLegacyMapper();
    $legacyPaymentCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativePaymentRepo, $paymentMapper, \Plugin\Finance\Domain\Payment\Payment::class);
    $app->route('GET /api/paiements', [$legacyPaymentCtrl, 'list']);
    $app->route('POST /api/paiements', [$legacyPaymentCtrl, 'create']);
    $app->route('GET /api/paiements/@id', [$legacyPaymentCtrl, 'show']);
    $app->route('PUT /api/paiements/@id', [$legacyPaymentCtrl, 'update']);
    $app->route('DELETE /api/paiements/@id', [$legacyPaymentCtrl, 'destroy']);

    $nativeCategoryRepo = new \Plugin\Business\Infrastructure\Persistence\Mysql\Category\MysqlCategoryRepository($pdo);
    $categoryMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\CategoryLegacyMapper();
    $legacyCategoryCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeCategoryRepo, $categoryMapper, \Plugin\Business\Domain\Category\Category::class);
    $app->route('GET /api/categories', [$legacyCategoryCtrl, 'list']);
    $app->route('POST /api/categories', [$legacyCategoryCtrl, 'create']);
    $app->route('GET /api/categories/@id', [$legacyCategoryCtrl, 'show']);
    $app->route('PUT /api/categories/@id', [$legacyCategoryCtrl, 'update']);
    $app->route('DELETE /api/categories/@id', [$legacyCategoryCtrl, 'destroy']);

    $nativeContractRepo = new \Plugin\Trading\Infrastructure\Persistence\Mysql\Contract\MysqlContractRepository($pdo);
    $contractMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\ContractLegacyMapper();
    $legacyContractCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeContractRepo, $contractMapper, \Plugin\Trading\Domain\Contract\Contract::class);
    $app->route('GET /api/contracts', [$legacyContractCtrl, 'list']);
    $app->route('POST /api/contracts', [$legacyContractCtrl, 'create']);
    $app->route('GET /api/contracts/@id', [$legacyContractCtrl, 'show']);
    $app->route('PUT /api/contracts/@id', [$legacyContractCtrl, 'update']);
    $app->route('DELETE /api/contracts/@id', [$legacyContractCtrl, 'destroy']);

    $nativeWarehouseRepo = new \Plugin\Logistics\Infrastructure\Persistence\Mysql\Warehouse\MysqlWarehouseRepository($pdo);
    $warehouseMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\WarehouseLegacyMapper();
    $legacyWarehouseCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeWarehouseRepo, $warehouseMapper, \Plugin\Logistics\Domain\Warehouse\Warehouse::class);
    $app->route('GET /api/warehouses', [$legacyWarehouseCtrl, 'list']);
    $app->route('POST /api/warehouses', [$legacyWarehouseCtrl, 'create']);
    $app->route('GET /api/warehouses/@id', [$legacyWarehouseCtrl, 'show']);
    $app->route('PUT /api/warehouses/@id', [$legacyWarehouseCtrl, 'update']);
    $app->route('DELETE /api/warehouses/@id', [$legacyWarehouseCtrl, 'destroy']);

    $nativeStockMovementRepo = new \Plugin\Logistics\Infrastructure\Persistence\Mysql\StockMovement\MysqlStockMovementRepository($pdo);
    $stockMovementMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\StockMovementLegacyMapper();
    $legacyStockMovementCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeStockMovementRepo, $stockMovementMapper, \Plugin\Logistics\Domain\StockMovement\StockMovement::class);
    $app->route('GET /api/stockmovements', [$legacyStockMovementCtrl, 'list']);
    $app->route('POST /api/stockmovements', [$legacyStockMovementCtrl, 'create']);
    $app->route('GET /api/stockmovements/@id', [$legacyStockMovementCtrl, 'show']);
    $app->route('PUT /api/stockmovements/@id', [$legacyStockMovementCtrl, 'update']);
    $app->route('DELETE /api/stockmovements/@id', [$legacyStockMovementCtrl, 'destroy']);

    // --- Phase 2: Extra Modules ---

    // Status Legacy Routing
    $statusCtrl = new \Core\Infrastructure\Http\Api\Controller\StatusApiController();
    $app->route('GET /api/status', [$statusCtrl, 'dolibarrStatus']);

    // Documents/Attachments Legacy Routing
    $nativeAttachmentRepo = new \Core\Infrastructure\Persistence\Mysql\Attachment\MysqlAttachmentRepository($pdo);
    $attachmentMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\DocumentLegacyMapper();
    $legacyAttachmentCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeAttachmentRepo, $attachmentMapper, \Core\Domain\Attachment\Attachment::class);
    $app->route('GET /api/documents', [$legacyAttachmentCtrl, 'list']);
    $app->route('POST /api/documents', [$legacyAttachmentCtrl, 'create']);
    $app->route('GET /api/documents/@id', [$legacyAttachmentCtrl, 'show']);
    $app->route('DELETE /api/documents/@id', [$legacyAttachmentCtrl, 'destroy']);

    // Supplier Proposals Legacy Routing
    $nativeSupplierProposalRepo = new \Plugin\Trading\Infrastructure\Persistence\Mysql\SupplierProposal\MysqlSupplierProposalRepository($pdo);
    $supplierProposalMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\SupplierProposalLegacyMapper();
    $legacySupplierProposalCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeSupplierProposalRepo, $supplierProposalMapper, \Plugin\Trading\Domain\SupplierProposal\SupplierProposal::class);
    $app->route('GET /api/supplierproposals', [$legacySupplierProposalCtrl, 'list']);
    $app->route('POST /api/supplierproposals', [$legacySupplierProposalCtrl, 'create']);
    $app->route('GET /api/supplierproposals/@id', [$legacySupplierProposalCtrl, 'show']);
    $app->route('PUT /api/supplierproposals/@id', [$legacySupplierProposalCtrl, 'update']);
    $app->route('DELETE /api/supplierproposals/@id', [$legacySupplierProposalCtrl, 'destroy']);

    // Tickets Legacy Routing
    $nativeTicketRepo = new \Plugin\Crm\Infrastructure\Persistence\Mysql\Ticket\MysqlTicketRepository($pdo);
    $ticketMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\TicketLegacyMapper();
    $legacyTicketCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeTicketRepo, $ticketMapper, \Plugin\Crm\Domain\Ticket\Ticket::class);
    $app->route('GET /api/tickets', [$legacyTicketCtrl, 'list']);
    $app->route('POST /api/tickets', [$legacyTicketCtrl, 'create']);
    $app->route('GET /api/tickets/@id', [$legacyTicketCtrl, 'show']);
    $app->route('PUT /api/tickets/@id', [$legacyTicketCtrl, 'update']);
    $app->route('DELETE /api/tickets/@id', [$legacyTicketCtrl, 'destroy']);

    // Accountancy Basics Legacy Routing
    $nativeAccountRepo = new \Plugin\Finance\Infrastructure\Persistence\Mysql\Accountancy\MysqlAccountingAccountRepository($pdo);
    $accountMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\AccountancyLegacyMapper();
    $legacyAccountCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeAccountRepo, $accountMapper, \Plugin\Finance\Domain\Accountancy\AccountingAccount::class);
    $app->route('GET /api/accountancy/accounts', [$legacyAccountCtrl, 'list']);
    $app->route('POST /api/accountancy/accounts', [$legacyAccountCtrl, 'create']);

    // Product Lots Legacy Routing
    $nativeLotRepo = new \Plugin\Products\Infrastructure\Persistence\Mysql\Lot\MysqlProductLotRepository($pdo);
    $lotMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\ProductLotLegacyMapper();
    $legacyLotCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeLotRepo, $lotMapper, \Plugin\Products\Domain\Lot\ProductLot::class);
    $app->route('GET /api/productlots', [$legacyLotCtrl, 'list']);
    $app->route('POST /api/productlots', [$legacyLotCtrl, 'create']);
    $app->route('GET /api/productlots/@id', [$legacyLotCtrl, 'show']);
    $app->route('PUT /api/productlots/@id', [$legacyLotCtrl, 'update']);
    $app->route('DELETE /api/productlots/@id', [$legacyLotCtrl, 'destroy']);

    // --- Phase 3: Members & HR ---

    // Members Legacy Routing
    $nativeMemberTypeRepo = new \Plugin\Members\Infrastructure\Persistence\Mysql\Member\MysqlMemberTypeRepository($pdo);
    $memberTypeMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\MemberTypeLegacyMapper();
    $legacyMemberTypeCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeMemberTypeRepo, $memberTypeMapper, \Plugin\Members\Domain\Member\MemberType::class);
    $app->route('GET /api/memberstypes', [$legacyMemberTypeCtrl, 'list']);
    $app->route('POST /api/memberstypes', [$legacyMemberTypeCtrl, 'create']);
    $app->route('GET /api/memberstypes/@id', [$legacyMemberTypeCtrl, 'show']);
    $app->route('PUT /api/memberstypes/@id', [$legacyMemberTypeCtrl, 'update']);
    $app->route('DELETE /api/memberstypes/@id', [$legacyMemberTypeCtrl, 'destroy']);

    $nativeMemberRepo = new \Plugin\Members\Infrastructure\Persistence\Mysql\Member\MysqlMemberRepository($pdo);
    $memberMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\MemberLegacyMapper();
    $legacyMemberCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeMemberRepo, $memberMapper, \Plugin\Members\Domain\Member\Member::class);
    $app->route('GET /api/members', [$legacyMemberCtrl, 'list']);
    $app->route('POST /api/members', [$legacyMemberCtrl, 'create']);
    $app->route('GET /api/members/@id', [$legacyMemberCtrl, 'show']);
    $app->route('PUT /api/members/@id', [$legacyMemberCtrl, 'update']);
    $app->route('DELETE /api/members/@id', [$legacyMemberCtrl, 'destroy']);

    $nativeSubscriptionRepo = new \Plugin\Members\Infrastructure\Persistence\Mysql\Member\MysqlSubscriptionRepository($pdo);
    $subscriptionMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\SubscriptionLegacyMapper();
    $legacySubscriptionCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeSubscriptionRepo, $subscriptionMapper, \Plugin\Members\Domain\Member\Subscription::class);
    $app->route('GET /api/subscriptions', [$legacySubscriptionCtrl, 'list']);
    $app->route('POST /api/subscriptions', [$legacySubscriptionCtrl, 'create']);
    $app->route('GET /api/subscriptions/@id', [$legacySubscriptionCtrl, 'show']);
    $app->route('PUT /api/subscriptions/@id', [$legacySubscriptionCtrl, 'update']);
    $app->route('DELETE /api/subscriptions/@id', [$legacySubscriptionCtrl, 'destroy']);

    // HR Legacy Routing
    $nativeLeaveRepo = new \Plugin\Hr\Infrastructure\Persistence\Mysql\Leave\MysqlLeaveRepository($pdo);
    $holidayMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\HolidayLegacyMapper();
    $legacyHolidayCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeLeaveRepo, $holidayMapper, \Plugin\Hr\Domain\Leave\Leave::class);
    $app->route('GET /api/holidays', [$legacyHolidayCtrl, 'list']);
    $app->route('POST /api/holidays', [$legacyHolidayCtrl, 'create']);
    $app->route('GET /api/holidays/@id', [$legacyHolidayCtrl, 'show']);
    $app->route('PUT /api/holidays/@id', [$legacyHolidayCtrl, 'update']);
    $app->route('DELETE /api/holidays/@id', [$legacyHolidayCtrl, 'destroy']);

    $nativeSalaryRepo = new \Plugin\Hr\Infrastructure\Persistence\Mysql\Salary\MysqlSalaryRepository($pdo);
    $salaryMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\SalaryLegacyMapper();
    $legacySalaryCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeSalaryRepo, $salaryMapper, \Plugin\Hr\Domain\Salary\Salary::class);
    $app->route('GET /api/salaries', [$legacySalaryCtrl, 'list']);
    $app->route('POST /api/salaries', [$legacySalaryCtrl, 'create']);
    $app->route('GET /api/salaries/@id', [$legacySalaryCtrl, 'show']);
    $app->route('PUT /api/salaries/@id', [$legacySalaryCtrl, 'update']);
    $app->route('DELETE /api/salaries/@id', [$legacySalaryCtrl, 'destroy']);

    $nativeRecruitmentRepo = new \Plugin\Hr\Infrastructure\Persistence\Mysql\Recruitment\MysqlRecruitmentRepository($pdo);
    $recruitmentMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\RecruitmentLegacyMapper();
    $legacyRecruitmentCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeRecruitmentRepo, $recruitmentMapper, \Plugin\Hr\Domain\Recruitment\Recruitment::class);
    $app->route('GET /api/recruitments', [$legacyRecruitmentCtrl, 'list']);
    $app->route('POST /api/recruitments', [$legacyRecruitmentCtrl, 'create']);
    $app->route('GET /api/recruitments/@id', [$legacyRecruitmentCtrl, 'show']);
    $app->route('PUT /api/recruitments/@id', [$legacyRecruitmentCtrl, 'update']);
    $app->route('DELETE /api/recruitments/@id', [$legacyRecruitmentCtrl, 'destroy']);

    // --- Phase 4: MRP & System ---

    // MRP Legacy Routing
    $nativeBomRepo = new \Plugin\Mrp\Infrastructure\Persistence\Mysql\Bom\MysqlBomRepository($pdo);
    $bomMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\BomLegacyMapper();
    $legacyBomCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeBomRepo, $bomMapper, \Plugin\Mrp\Domain\Bom\Bom::class);
    $app->route('GET /api/boms', [$legacyBomCtrl, 'list']);
    $app->route('POST /api/boms', [$legacyBomCtrl, 'create']);
    $app->route('GET /api/boms/@id', [$legacyBomCtrl, 'show']);
    $app->route('PUT /api/boms/@id', [$legacyBomCtrl, 'update']);
    $app->route('DELETE /api/boms/@id', [$legacyBomCtrl, 'destroy']);

    $nativeMoRepo = new \Plugin\Mrp\Infrastructure\Persistence\Mysql\ManufacturingOrder\MysqlManufacturingOrderRepository($pdo);
    $moMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\ManufacturingOrderLegacyMapper();
    $legacyMoCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeMoRepo, $moMapper, \Plugin\Mrp\Domain\ManufacturingOrder\ManufacturingOrder::class);
    $app->route('GET /api/mos', [$legacyMoCtrl, 'list']);
    $app->route('POST /api/mos', [$legacyMoCtrl, 'create']);
    $app->route('GET /api/mos/@id', [$legacyMoCtrl, 'show']);
    $app->route('PUT /api/mos/@id', [$legacyMoCtrl, 'update']);
    $app->route('DELETE /api/mos/@id', [$legacyMoCtrl, 'destroy']);

    $nativeWorkstationRepo = new \Plugin\Mrp\Infrastructure\Persistence\Mysql\Workstation\MysqlWorkstationRepository($pdo);
    $wsMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\WorkstationLegacyMapper();
    $legacyWsCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeWorkstationRepo, $wsMapper, \Plugin\Mrp\Domain\Workstation\Workstation::class);
    $app->route('GET /api/workstations', [$legacyWsCtrl, 'list']);
    $app->route('POST /api/workstations', [$legacyWsCtrl, 'create']);
    $app->route('GET /api/workstations/@id', [$legacyWsCtrl, 'show']);
    $app->route('PUT /api/workstations/@id', [$legacyWsCtrl, 'update']);
    $app->route('DELETE /api/workstations/@id', [$legacyWsCtrl, 'destroy']);

    // --- Phase 4: Finance Specials ---
    $nativeMcRepo = new \Plugin\Finance\Infrastructure\Persistence\Mysql\Multicurrency\MysqlMulticurrencyRepository($pdo);
    $mcMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\MulticurrencyLegacyMapper();
    $legacyMcCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeMcRepo, $mcMapper, \Plugin\Finance\Domain\Multicurrency\Multicurrency::class);
    $app->route('GET /api/multicurrencies', [$legacyMcCtrl, 'list']);
    $app->route('POST /api/multicurrencies', [$legacyMcCtrl, 'create']);

    $nativeDonationRepo = new \Plugin\Finance\Infrastructure\Persistence\Mysql\Donation\MysqlDonationRepository($pdo);
    $donationMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\DonationLegacyMapper();
    $legacyDonationCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeDonationRepo, $donationMapper, \Plugin\Finance\Domain\Donation\Donation::class);
    $app->route('GET /api/donations', [$legacyDonationCtrl, 'list']);
    $app->route('POST /api/donations', [$legacyDonationCtrl, 'create']);
    $app->route('GET /api/donations/@id', [$legacyDonationCtrl, 'show']);
    $app->route('PUT /api/donations/@id', [$legacyDonationCtrl, 'update']);
    $app->route('DELETE /api/donations/@id', [$legacyDonationCtrl, 'destroy']);

    // --- Phase 4: Core & System Integrations ---
    $nativeKmRepo = new \Core\Infrastructure\Persistence\Mysql\KnowledgeManagement\MysqlKnowledgeManagementRepository($pdo);
    $kmMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\KnowledgeManagementLegacyMapper();
    $legacyKmCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeKmRepo, $kmMapper, \Core\Domain\KnowledgeManagement\KnowledgeManagement::class);
    $app->route('GET /api/knowledgemanagement', [$legacyKmCtrl, 'list']);
    $app->route('POST /api/knowledgemanagement', [$legacyKmCtrl, 'create']);

    $nativeObjectLinkRepo = new \Core\Infrastructure\Persistence\Mysql\ObjectLink\MysqlObjectLinkRepository($pdo);
    $olMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\ObjectLinkLegacyMapper();
    $legacyOlCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeObjectLinkRepo, $olMapper, \Core\Domain\ObjectLink\ObjectLink::class);
    $app->route('GET /api/objectlinks', [$legacyOlCtrl, 'list']);
    $app->route('POST /api/objectlinks', [$legacyOlCtrl, 'create']);

    $nativeEtRepo = new \Core\Infrastructure\Persistence\Mysql\EmailTemplate\MysqlEmailTemplateRepository($pdo);
    $etMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\EmailTemplateLegacyMapper();
    $legacyEtCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeEtRepo, $etMapper, \Core\Domain\EmailTemplate\EmailTemplate::class);
    $app->route('GET /api/emailtemplates', [$legacyEtCtrl, 'list']);
    $app->route('POST /api/emailtemplates', [$legacyEtCtrl, 'create']);

    $nativeWhRepo = new \Core\Infrastructure\Persistence\Mysql\Webhook\MysqlWebhookRepository($pdo);
    $whMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\WebhookLegacyMapper();
    $legacyWhCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeWhRepo, $whMapper, \Core\Domain\Webhook\Webhook::class);
    $app->route('GET /api/webhook', [$legacyWhCtrl, 'list']);
    $app->route('POST /api/webhook', [$legacyWhCtrl, 'create']);

    $nativeZapierRepo = new \Core\Infrastructure\Persistence\Mysql\Zapier\MysqlZapierRepository($pdo);
    $zapierMapper = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\ZapierLegacyMapper();
    $legacyZapierCtrl = new \Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller\GenericLegacyCrudController($nativeZapierRepo, $zapierMapper, \Core\Domain\Zapier\Zapier::class);
    $app->route('GET /api/zapier', [$legacyZapierCtrl, 'list']);
    $app->route('POST /api/zapier', [$legacyZapierCtrl, 'create']);
};
