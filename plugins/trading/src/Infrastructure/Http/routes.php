<?php

/**
 * Trading Plugin — Route Registration.
 *
 * Registers all API routes for:
 * - Sales: Proposals, Orders, Invoices
 * - Purchases: Supplier Invoices, Supplier Orders
 *
 * NOTE: Uses App\* classes from src/ as a transitional step.
 * In a future refactoring, these will be moved into plugins/trading/src/.
 */

declare(strict_types=1);

use Core\Application\Plugin\HookRegistryInterface;
use Core\Application\Plugin\PluginRegistry;

return function (flight\Engine $app, PDO $pdo, HookRegistryInterface $hooks, PluginRegistry $registry): void {

    $dbConfig = $GLOBALS['__api_config']['database'] ?? [];
    $tablePrefix = $dbConfig['table_prefix'] ?? '';

    // ══════════════════════════════════════════════════════════
    // SALES
    // ══════════════════════════════════════════════════════════

    // ── Invoices ─────────────────────────────────────────────
    $invoiceRepo = new \Plugin\Trading\Infrastructure\Persistence\Mysql\MysqlInvoiceRepository($pdo, $tablePrefix);
    $invoiceCtrl = new \Plugin\Trading\Infrastructure\Http\Api\Controller\InvoiceApiController($invoiceRepo);

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

    $app->route('POST /api/invoices/createfromorder/@orderid', [$invoiceCtrl, 'createInvoiceFromOrder']);
    $app->route('POST /api/invoices/createfromcontract/@contractid', [$invoiceCtrl, 'createInvoiceFromContract']);
    $app->route('GET /api/invoices/@id/contacts', [$invoiceCtrl, 'getContacts']);
    $app->route('POST /api/invoices/@id/contact/@contactid/@type', [$invoiceCtrl, 'postContact']);
    $app->route('DELETE /api/invoices/@id/contact/@contactid/@type', [$invoiceCtrl, 'deleteContact']);

    // ── Proposals ────────────────────────────────────────────
    $proposalRepo = new \Plugin\Trading\Infrastructure\Persistence\Mysql\MysqlProposalRepository($pdo, $tablePrefix);
    $proposalCtrl = new \Plugin\Trading\Infrastructure\Http\Api\Controller\ProposalApiController($proposalRepo);

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

    // ── Orders ───────────────────────────────────────────────
    $orderRepo = new \Plugin\Trading\Infrastructure\Persistence\Mysql\MysqlOrderRepository($pdo, $tablePrefix);
    $orderCtrl = new \Plugin\Trading\Infrastructure\Http\Api\Controller\OrderApiController($orderRepo);

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

    // ══════════════════════════════════════════════════════════
    // PURCHASES
    // ══════════════════════════════════════════════════════════

    // ── Supplier Invoices ────────────────────────────────────
    $supplierInvoiceRepo = new \Plugin\Trading\Infrastructure\Persistence\Mysql\MysqlSupplierInvoiceRepository($pdo, $tablePrefix);
    $supplierInvoiceCtrl = new \Plugin\Trading\Infrastructure\Http\Api\Controller\SupplierInvoiceApiController($supplierInvoiceRepo);

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

    // ── Supplier Orders ──────────────────────────────────────
    $supplierOrderRepo = new \Plugin\Trading\Infrastructure\Persistence\Mysql\MysqlSupplierOrderRepository($pdo, $tablePrefix);
    $supplierOrderCtrl = new \Plugin\Trading\Infrastructure\Http\Api\Controller\SupplierOrderApiController($supplierOrderRepo);

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
};
