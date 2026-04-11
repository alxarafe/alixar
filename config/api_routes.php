<?php

declare(strict_types=1);

/**
 * Rutas de la API REST — Módulos hexagonales.
 *
 * Cada Bounded Context registra sus rutas aquí.
 * Se carga desde public/api.php.
 *
 * Las rutas siguen el formato de la API de Dolibarr:
 *   GET    /api/{resource}       → listar
 *   GET    /api/{resource}/{id}  → obtener
 *   POST   /api/{resource}       → crear
 *   PUT    /api/{resource}/{id}  → actualizar
 *   DELETE /api/{resource}/{id}  → eliminar
 */

$app = Flight::app();

// ── ThirdParties ─────────────────────────────────────────────
// Composition root: conectar puerto con adaptador
$dbConfig = $GLOBALS['__api_config']['database'] ?? [];

$pdo = new PDO(
    sprintf('mysql:host=%s;port=%d;dbname=%s;charset=%s',
        $dbConfig['host'] ?? 'alixar_db',
        $dbConfig['port'] ?? 3306,
        $dbConfig['database'] ?? 'alixar_db',
        $dbConfig['charset'] ?? 'utf8mb4',
    ),
    $dbConfig['username'] ?? 'root',
    $dbConfig['password'] ?? 'root',
    [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]
);

$configPort = new \App\Infrastructure\Persistence\Mysql\MysqlConfigurationAdapter($pdo);
$codeGenerator = new \App\Application\Codification\NullThirdPartyCodeGenerator();

$tablePrefix = $dbConfig['table_prefix'] ?? 'llx_';
$thirdPartyRepo = new \App\Infrastructure\Persistence\Mysql\MysqlThirdPartyRepository($pdo, $tablePrefix);
$thirdPartyValidator = new \App\Domain\ThirdParty\ThirdPartyValidator($thirdPartyRepo, $configPort, $codeGenerator);
$bankAccountRepo = new \App\Infrastructure\Persistence\Mysql\MysqlBankAccountRepository($pdo, $tablePrefix);
$categoryRepo = new \App\Infrastructure\Persistence\Mysql\Category\MysqlThirdPartyCategoryRepository($pdo, $tablePrefix);
$representativeRepo = new \App\Infrastructure\Persistence\Mysql\User\MysqlThirdPartyRepresentativeRepository($pdo, $tablePrefix);

$thirdPartyCtrl = new \App\Infrastructure\Http\Api\Controller\ThirdPartyApiController($thirdPartyRepo, $thirdPartyValidator, $bankAccountRepo, $categoryRepo, $representativeRepo);

$app->route('GET /api/thirdparties', [$thirdPartyCtrl, 'list']);
$app->route('GET /api/thirdparties/@id', [$thirdPartyCtrl, 'show']);
$app->route('POST /api/thirdparties', [$thirdPartyCtrl, 'create']);
$app->route('PUT /api/thirdparties/@id', [$thirdPartyCtrl, 'update']);
$app->route('DELETE /api/thirdparties/@id', [$thirdPartyCtrl, 'destroy']);

$app->route('GET /api/thirdparties/@id/bankaccounts', [$thirdPartyCtrl, 'getBankAccounts']);
$app->route('POST /api/thirdparties/@id/bankaccounts', [$thirdPartyCtrl, 'postBankAccount']);
$app->route('PUT /api/thirdparties/@id/bankaccounts/@bankaccountId', [$thirdPartyCtrl, 'putBankAccount']);
$app->route('DELETE /api/thirdparties/@id/bankaccounts/@bankaccountId', [$thirdPartyCtrl, 'deleteBankAccount']);

$app->route('GET /api/thirdparties/@id/categories', [$thirdPartyCtrl, 'getCategories']);
$app->route('PUT /api/thirdparties/@id/categories/@categoryId', [$thirdPartyCtrl, 'putCategory']);
$app->route('DELETE /api/thirdparties/@id/categories/@categoryId', [$thirdPartyCtrl, 'deleteCategory']);

$app->route('GET /api/thirdparties/@id/supplier_categories', [$thirdPartyCtrl, 'getSupplierCategories']);
$app->route('PUT /api/thirdparties/@id/supplier_categories/@categoryId', [$thirdPartyCtrl, 'putSupplierCategory']);
$app->route('DELETE /api/thirdparties/@id/supplier_categories/@categoryId', [$thirdPartyCtrl, 'deleteSupplierCategory']);

$app->route('GET /api/thirdparties/@id/representatives', [$thirdPartyCtrl, 'getRepresentatives']);
$app->route('PUT /api/thirdparties/@id/representatives/@userId', [$thirdPartyCtrl, 'putRepresentative']);
$app->route('DELETE /api/thirdparties/@id/representatives/@userId', [$thirdPartyCtrl, 'deleteRepresentative']);

$app->route('GET /api/thirdparties/@id/generateBankAccountDocument/@companybankid(/@model)', [$thirdPartyCtrl, 'generateBankAccountDocument']);
$app->route('PUT /api/thirdparties/@id/merge/@idtodelete', [$thirdPartyCtrl, 'merge']);

// ── Contacts ─────────────────────────────────────────────────
$contactRepo = new \App\Infrastructure\Persistence\Mysql\MysqlContactRepository($pdo, $tablePrefix);
$contactCategoryRepo = new \App\Infrastructure\Persistence\Mysql\Category\MysqlContactCategoryRepository($pdo, $tablePrefix);
$contactCtrl = new \App\Infrastructure\Http\Api\Controller\ContactApiController($contactRepo, $contactCategoryRepo);

$app->route('GET /api/contacts', [$contactCtrl, 'list']);
$app->route('GET /api/contacts/@id', [$contactCtrl, 'show']);
$app->route('POST /api/contacts', [$contactCtrl, 'create']);
$app->route('PUT /api/contacts/@id', [$contactCtrl, 'update']);
$app->route('DELETE /api/contacts/@id', [$contactCtrl, 'destroy']);

$app->route('GET /api/contacts/email/@email', [$contactCtrl, 'getByEmail']);
$app->route('POST /api/contacts/@id/createUser', [$contactCtrl, 'createUser']);
$app->route('GET /api/contacts/@id/categories', [$contactCtrl, 'getCategories']);
$app->route('PUT /api/contacts/@id/categories/@categoryId', [$contactCtrl, 'putCategory']);
$app->route('DELETE /api/contacts/@id/categories/@categoryId', [$contactCtrl, 'deleteCategory']);

// ── Invoices ─────────────────────────────────────────────────
$invoiceRepo = new \App\Infrastructure\Persistence\Mysql\MysqlInvoiceRepository($pdo, $tablePrefix);
$invoiceCtrl = new \App\Infrastructure\Http\Api\Controller\InvoiceApiController($invoiceRepo);

$app->route('GET /api/invoices', [$invoiceCtrl, 'list']);
$app->route('GET /api/invoices/@id', [$invoiceCtrl, 'show']);
$app->route('GET /api/invoices/ref/@ref', [$invoiceCtrl, 'getByRef']);
$app->route('GET /api/invoices/ref_ext/@ref_ext', [$invoiceCtrl, 'getByRefExt']);
$app->route('POST /api/invoices', [$invoiceCtrl, 'create']);
$app->route('PUT /api/invoices/@id', [$invoiceCtrl, 'update']);
$app->route('DELETE /api/invoices/@id', [$invoiceCtrl, 'destroy']);

$app->route('GET /api/invoices/@id/lines', [$invoiceCtrl, 'getLines']);
$app->route('POST /api/invoices/@id/lines', [$invoiceCtrl, 'postLine']);
$app->route('PUT /api/invoices/@id/lines/@lineId', [$invoiceCtrl, 'putLine']);
$app->route('DELETE /api/invoices/@id/lines/@lineId', [$invoiceCtrl, 'deleteLine']);

$app->route('POST /api/invoices/@id/validate', [$invoiceCtrl, 'validate']);
$app->route('POST /api/invoices/@id/settopaid', [$invoiceCtrl, 'setPaid']);

// Stubs
$app->route('POST /api/invoices/createfromorder/@orderid', [$invoiceCtrl, 'createInvoiceFromOrder']);
$app->route('POST /api/invoices/createfromcontract/@contractid', [$invoiceCtrl, 'createInvoiceFromContract']);
$app->route('GET /api/invoices/@id/contacts', [$invoiceCtrl, 'getContacts']);
$app->route('POST /api/invoices/@id/contact/@contactid/@type', [$invoiceCtrl, 'postContact']);
$app->route('DELETE /api/invoices/@id/contact/@contactid/@type', [$invoiceCtrl, 'deleteContact']);

// ── Products ─────────────────────────────────────────────────
$productRepo = new \App\Infrastructure\Persistence\Mysql\MysqlProductRepository($pdo, $tablePrefix);
$productCtrl = new \App\Infrastructure\Http\Api\Controller\ProductApiController($productRepo);

$app->route('GET /api/products', [$productCtrl, 'list']);
$app->route('GET /api/products/@id', [$productCtrl, 'get']);
$app->route('GET /api/products/ref/@ref', [$productCtrl, 'getByRef']);
$app->route('GET /api/products/ref_ext/@ref_ext', [$productCtrl, 'getByRefExt']);
$app->route('GET /api/products/barcode/@barcode', [$productCtrl, 'getByBarcode']);
$app->route('POST /api/products', [$productCtrl, 'create']);
$app->route('PUT /api/products/@id', [$productCtrl, 'update']);
$app->route('DELETE /api/products/@id', [$productCtrl, 'delete']);

// Advanced functionality
$app->route('POST /api/products/@id/purchase_prices', [$productCtrl, 'addPurchasePrices']);
$app->route('GET /api/products/@id/purchase_prices', [$productCtrl, 'getPurchasePrices']);
$app->route('DELETE /api/products/@id/purchase_prices/@priceid', [$productCtrl, 'deletePurchasePrices']);
$app->route('GET /api/products/@id/subproducts', [$productCtrl, 'getSubproducts']);
$app->route('POST /api/products/@id/subproducts/@subproductid', [$productCtrl, 'addSubproducts']);
$app->route('DELETE /api/products/@id/subproducts/@subproductid', [$productCtrl, 'deleteSubproducts']);
$app->route('GET /api/products/@id/stock', [$productCtrl, 'getStock']);
$app->route('GET /api/products/@id/variants', [$productCtrl, 'getVariants']);
$app->route('GET /api/products/@id/customer_prices', [$productCtrl, 'getCustomerPrices']);
$app->route('GET /api/products/attributes', [$productCtrl, 'getAttributes']);
$app->route('GET /api/products/@id/contacts', [$productCtrl, 'getContacts']);
$app->route('POST /api/products/@id/contact/@contactid/@type', [$productCtrl, 'addContact']);
$app->route('DELETE /api/products/@id/contact/@contactid/@type', [$productCtrl, 'deleteContact']);

// ── Proposals (Presupuestos) ─────────────────────────────────
$proposalRepo = new \App\Infrastructure\Persistence\Mysql\MysqlProposalRepository($pdo, $tablePrefix);
$proposalCtrl = new \App\Infrastructure\Http\Api\Controller\ProposalApiController($proposalRepo);

$app->route('GET /api/proposals', [$proposalCtrl, 'list']);
$app->route('POST /api/proposals', [$proposalCtrl, 'create']);
$app->route('GET /api/proposals/@id', [$proposalCtrl, 'show']);
$app->route('PUT /api/proposals/@id', [$proposalCtrl, 'update']);
$app->route('DELETE /api/proposals/@id', [$proposalCtrl, 'destroy']);
$app->route('GET /api/proposals/ref/@ref', [$proposalCtrl, 'getByRef']);

$app->route('GET /api/proposals/@id/lines', [$proposalCtrl, 'getLines']);
$app->route('POST /api/proposals/@id/lines', [$proposalCtrl, 'postLine']);
$app->route('PUT /api/proposals/@id/lines/@lineId', [$proposalCtrl, 'putLine']);
$app->route('DELETE /api/proposals/@id/lines/@lineId', [$proposalCtrl, 'deleteLine']);

$app->route('POST /api/proposals/@id/validate', [$proposalCtrl, 'validate']);
$app->route('POST /api/proposals/@id/close', [$proposalCtrl, 'close']);
$app->route('GET /api/proposals/@id/contacts', [$proposalCtrl, 'getContacts']);
$app->route('POST /api/proposals/@id/contact/@contactid/@type', [$proposalCtrl, 'postContact']);
$app->route('DELETE /api/proposals/@id/contact/@contactid/@type', [$proposalCtrl, 'deleteContact']);

// ── Orders (Pedidos) ─────────────────────────────────────────
$orderRepo = new \App\Infrastructure\Persistence\Mysql\MysqlOrderRepository($pdo, $tablePrefix);
$orderCtrl = new \App\Infrastructure\Http\Api\Controller\OrderApiController($orderRepo);

$app->route('GET /api/orders', [$orderCtrl, 'list']);
$app->route('POST /api/orders', [$orderCtrl, 'create']);
$app->route('GET /api/orders/@id', [$orderCtrl, 'show']);
$app->route('PUT /api/orders/@id', [$orderCtrl, 'update']);
$app->route('DELETE /api/orders/@id', [$orderCtrl, 'destroy']);
$app->route('GET /api/orders/ref/@ref', [$orderCtrl, 'getByRef']);

$app->route('GET /api/orders/@id/lines', [$orderCtrl, 'getLines']);
$app->route('POST /api/orders/@id/lines', [$orderCtrl, 'postLine']);
$app->route('PUT /api/orders/@id/lines/@lineId', [$orderCtrl, 'putLine']);
$app->route('DELETE /api/orders/@id/lines/@lineId', [$orderCtrl, 'deleteLine']);

$app->route('POST /api/orders/@id/validate', [$orderCtrl, 'validate']);
$app->route('POST /api/orders/@id/close', [$orderCtrl, 'close']);
$app->route('GET /api/orders/@id/contacts', [$orderCtrl, 'getContacts']);
$app->route('POST /api/orders/@id/contact/@contactid/@type', [$orderCtrl, 'postContact']);
$app->route('DELETE /api/orders/@id/contact/@contactid/@type', [$orderCtrl, 'deleteContact']);

// ── Supplier Invoices (Facturas de Proveedor) ────────────────
$supplierInvoiceRepo = new \App\Infrastructure\Persistence\Mysql\MysqlSupplierInvoiceRepository($pdo, $tablePrefix);
$supplierInvoiceCtrl = new \App\Infrastructure\Http\Api\Controller\SupplierInvoiceApiController($supplierInvoiceRepo);

$app->route('GET /api/supplierinvoices', [$supplierInvoiceCtrl, 'list']);
$app->route('POST /api/supplierinvoices', [$supplierInvoiceCtrl, 'create']);
$app->route('GET /api/supplierinvoices/@id', [$supplierInvoiceCtrl, 'show']);
$app->route('PUT /api/supplierinvoices/@id', [$supplierInvoiceCtrl, 'update']);
$app->route('DELETE /api/supplierinvoices/@id', [$supplierInvoiceCtrl, 'destroy']);
$app->route('GET /api/supplierinvoices/ref/@ref', [$supplierInvoiceCtrl, 'getByRef']);

$app->route('GET /api/supplierinvoices/@id/lines', [$supplierInvoiceCtrl, 'getLines']);
$app->route('POST /api/supplierinvoices/@id/lines', [$supplierInvoiceCtrl, 'postLine']);
$app->route('PUT /api/supplierinvoices/@id/lines/@lineId', [$supplierInvoiceCtrl, 'putLine']);
$app->route('DELETE /api/supplierinvoices/@id/lines/@lineId', [$supplierInvoiceCtrl, 'deleteLine']);

$app->route('GET /api/supplierinvoices/@id/payments', [$supplierInvoiceCtrl, 'getPayments']);
$app->route('POST /api/supplierinvoices/@id/payments', [$supplierInvoiceCtrl, 'addPayment']);

$app->route('POST /api/supplierinvoices/@id/validate', [$supplierInvoiceCtrl, 'validate']);
$app->route('POST /api/supplierinvoices/@id/settodraft', [$supplierInvoiceCtrl, 'settodraft']);
$app->route('POST /api/supplierinvoices/@id/settopaid', [$supplierInvoiceCtrl, 'settopaid']);
$app->route('POST /api/supplierinvoices/@id/settounpaid', [$supplierInvoiceCtrl, 'settounpaid']);

// ── Supplier Orders (Pedidos de Proveedor) ───────────────────
$supplierOrderRepo = new \App\Infrastructure\Persistence\Mysql\MysqlSupplierOrderRepository($pdo, $tablePrefix);
$supplierOrderCtrl = new \App\Infrastructure\Http\Api\Controller\SupplierOrderApiController($supplierOrderRepo);

$app->route('GET /api/supplierorders', [$supplierOrderCtrl, 'list']);
$app->route('POST /api/supplierorders', [$supplierOrderCtrl, 'create']);
$app->route('GET /api/supplierorders/@id', [$supplierOrderCtrl, 'show']);
$app->route('PUT /api/supplierorders/@id', [$supplierOrderCtrl, 'update']);
$app->route('DELETE /api/supplierorders/@id', [$supplierOrderCtrl, 'destroy']);
$app->route('GET /api/supplierorders/ref/@ref', [$supplierOrderCtrl, 'getByRef']);

$app->route('GET /api/supplierorders/@id/lines', [$supplierOrderCtrl, 'getLines']);
$app->route('POST /api/supplierorders/@id/lines', [$supplierOrderCtrl, 'postLine']);
$app->route('PUT /api/supplierorders/@id/lines/@lineId', [$supplierOrderCtrl, 'putLine']);
$app->route('DELETE /api/supplierorders/@id/lines/@lineId', [$supplierOrderCtrl, 'deleteLine']);

$app->route('POST /api/supplierorders/@id/validate', [$supplierOrderCtrl, 'validate']);
$app->route('POST /api/supplierorders/@id/close', [$supplierOrderCtrl, 'close']);

// ── Projects & Tasks (Proyectos y Tareas) ────────────────────
$projectRepo = new \App\Infrastructure\Persistence\Mysql\MysqlProjectRepository($pdo, $tablePrefix);
$projectCtrl = new \App\Infrastructure\Http\Api\Controller\ProjectApiController($projectRepo);

$app->route('GET /api/projects', [$projectCtrl, 'list']);
$app->route('POST /api/projects', [$projectCtrl, 'create']);
$app->route('GET /api/projects/@id', [$projectCtrl, 'show']);
$app->route('PUT /api/projects/@id', [$projectCtrl, 'update']);
$app->route('DELETE /api/projects/@id', [$projectCtrl, 'destroy']);
$app->route('GET /api/projects/ref/@ref', [$projectCtrl, 'getByRef']);

$app->route('GET /api/projects/@id/tasks', [$projectCtrl, 'getTasks']);
$app->route('POST /api/projects/@id/tasks', [$projectCtrl, 'postTask']);
$app->route('PUT /api/projects/@id/tasks/@taskId', [$projectCtrl, 'putTask']);
$app->route('DELETE /api/projects/@id/tasks/@taskId', [$projectCtrl, 'deleteTask']);

$app->route('POST /api/projects/@id/validate', [$projectCtrl, 'validate']);
$app->route('POST /api/projects/@id/close', [$projectCtrl, 'close']);

// ── Bank Accounts & Transactions (Cuentas y Pagos) ───────────────
$bankRepo = new \App\Infrastructure\Persistence\Mysql\MysqlTreasuryBankAccountRepository($pdo, $tablePrefix);
$bankCtrl = new \App\Infrastructure\Http\Api\Controller\BankAccountApiController($bankRepo);

$app->route('GET /api/bankaccounts', [$bankCtrl, 'list']);
$app->route('POST /api/bankaccounts', [$bankCtrl, 'create']);
$app->route('GET /api/bankaccounts/@id', [$bankCtrl, 'show']);
$app->route('PUT /api/bankaccounts/@id', [$bankCtrl, 'update']);
$app->route('DELETE /api/bankaccounts/@id', [$bankCtrl, 'destroy']);

$app->route('GET /api/bankaccounts/@id/transactions', [$bankCtrl, 'getTransactions']);
$app->route('POST /api/bankaccounts/@id/transactions', [$bankCtrl, 'postTransaction']);
$app->route('PUT /api/bankaccounts/@id/transactions/@transactionId', [$bankCtrl, 'putTransaction']);
$app->route('DELETE /api/bankaccounts/@id/transactions/@transactionId', [$bankCtrl, 'deleteTransaction']);

// ── Events / Agenda (Acciones Comerciales) ───────────────
$eventRepo = new \App\Infrastructure\Persistence\Mysql\MysqlEventRepository($pdo, $tablePrefix);
$eventCtrl = new \App\Infrastructure\Http\Api\Controller\EventApiController($eventRepo);

$app->route('GET /api/events', [$eventCtrl, 'list']);
$app->route('POST /api/events', [$eventCtrl, 'create']);
$app->route('GET /api/events/@id', [$eventCtrl, 'show']);
$app->route('PUT /api/events/@id', [$eventCtrl, 'update']);
$app->route('DELETE /api/events/@id', [$eventCtrl, 'destroy']);
