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
    $invoiceRepo = new \Plugin\Trading\Infrastructure\Persistence\Mysql\Invoice\MysqlInvoiceRepository($pdo);
    $invoiceCtrl = new \Plugin\Trading\Infrastructure\Http\Api\Controller\InvoiceApiController($invoiceRepo);

    $app->route('GET /api/v1/invoices', [$invoiceCtrl, 'list']);
    $app->route('GET /api/v1/invoices/@id', [$invoiceCtrl, 'show']);
    $app->route('GET /api/v1/invoices/ref/@ref', [$invoiceCtrl, 'getByRef']);
    $app->route('GET /api/v1/invoices/ref_ext/@ref_ext', [$invoiceCtrl, 'getByRefExt']);
    $app->route('POST /api/v1/invoices', [$invoiceCtrl, 'create']);
    $app->route('PUT /api/v1/invoices/@id', [$invoiceCtrl, 'update']);
    $app->route('DELETE /api/v1/invoices/@id', [$invoiceCtrl, 'destroy']);

    $app->route('GET /api/v1/invoices/@id/lines', [$invoiceCtrl, 'getLines']);
    $app->route('POST /api/v1/invoices/@id/lines', [$invoiceCtrl, 'postLine']);
    $app->route('PUT /api/v1/invoices/@id/lines/@lineId', [$invoiceCtrl, 'putLine']);
    $app->route('DELETE /api/v1/invoices/@id/lines/@lineId', [$invoiceCtrl, 'deleteLine']);

    $app->route('POST /api/v1/invoices/@id/validate', [$invoiceCtrl, 'validate']);
    $app->route('POST /api/v1/invoices/@id/settopaid', [$invoiceCtrl, 'setPaid']);

    $app->route('POST /api/v1/invoices/createfromorder/@orderid', [$invoiceCtrl, 'createInvoiceFromOrder']);
    $app->route('POST /api/v1/invoices/createfromcontract/@contractid', [$invoiceCtrl, 'createInvoiceFromContract']);
    $app->route('GET /api/v1/invoices/@id/contacts', [$invoiceCtrl, 'getContacts']);
    $app->route('POST /api/v1/invoices/@id/contact/@contactid/@type', [$invoiceCtrl, 'postContact']);
    $app->route('DELETE /api/v1/invoices/@id/contact/@contactid/@type', [$invoiceCtrl, 'deleteContact']);

    // ── Proposals ────────────────────────────────────────────
    $proposalRepo = new \Plugin\Trading\Infrastructure\Persistence\Mysql\Proposal\MysqlProposalRepository($pdo);
    $proposalCtrl = new \Plugin\Trading\Infrastructure\Http\Api\Controller\ProposalApiController($proposalRepo);

    $app->route('GET /api/v1/proposals', [$proposalCtrl, 'list']);
    $app->route('POST /api/v1/proposals', [$proposalCtrl, 'create']);
    $app->route('GET /api/v1/proposals/@id', [$proposalCtrl, 'show']);
    $app->route('PUT /api/v1/proposals/@id', [$proposalCtrl, 'update']);
    $app->route('DELETE /api/v1/proposals/@id', [$proposalCtrl, 'destroy']);
    $app->route('GET /api/v1/proposals/ref/@ref', [$proposalCtrl, 'getByRef']);

    $app->route('GET /api/v1/proposals/@id/lines', [$proposalCtrl, 'getLines']);
    $app->route('POST /api/v1/proposals/@id/lines', [$proposalCtrl, 'postLine']);
    $app->route('PUT /api/v1/proposals/@id/lines/@lineId', [$proposalCtrl, 'putLine']);
    $app->route('DELETE /api/v1/proposals/@id/lines/@lineId', [$proposalCtrl, 'deleteLine']);

    $app->route('POST /api/v1/proposals/@id/validate', [$proposalCtrl, 'validate']);
    $app->route('POST /api/v1/proposals/@id/close', [$proposalCtrl, 'close']);
    $app->route('GET /api/v1/proposals/@id/contacts', [$proposalCtrl, 'getContacts']);
    $app->route('POST /api/v1/proposals/@id/contact/@contactid/@type', [$proposalCtrl, 'postContact']);
    $app->route('DELETE /api/v1/proposals/@id/contact/@contactid/@type', [$proposalCtrl, 'deleteContact']);

    // ── Orders ───────────────────────────────────────────────
    $orderRepo = new \Plugin\Trading\Infrastructure\Persistence\Mysql\Order\MysqlOrderRepository($pdo);
    $orderCtrl = new \Plugin\Trading\Infrastructure\Http\Api\Controller\OrderApiController($orderRepo);

    $app->route('GET /api/v1/orders', [$orderCtrl, 'list']);
    $app->route('POST /api/v1/orders', [$orderCtrl, 'create']);
    $app->route('GET /api/v1/orders/@id', [$orderCtrl, 'show']);
    $app->route('PUT /api/v1/orders/@id', [$orderCtrl, 'update']);
    $app->route('DELETE /api/v1/orders/@id', [$orderCtrl, 'destroy']);
    $app->route('GET /api/v1/orders/ref/@ref', [$orderCtrl, 'getByRef']);

    $app->route('GET /api/v1/orders/@id/lines', [$orderCtrl, 'getLines']);
    $app->route('POST /api/v1/orders/@id/lines', [$orderCtrl, 'postLine']);
    $app->route('PUT /api/v1/orders/@id/lines/@lineId', [$orderCtrl, 'putLine']);
    $app->route('DELETE /api/v1/orders/@id/lines/@lineId', [$orderCtrl, 'deleteLine']);

    $app->route('POST /api/v1/orders/@id/validate', [$orderCtrl, 'validate']);
    $app->route('POST /api/v1/orders/@id/close', [$orderCtrl, 'close']);
    $app->route('GET /api/v1/orders/@id/contacts', [$orderCtrl, 'getContacts']);
    $app->route('POST /api/v1/orders/@id/contact/@contactid/@type', [$orderCtrl, 'postContact']);
    $app->route('DELETE /api/v1/orders/@id/contact/@contactid/@type', [$orderCtrl, 'deleteContact']);

    // ══════════════════════════════════════════════════════════
    // PURCHASES
    // ══════════════════════════════════════════════════════════

    // ── Supplier Invoices ────────────────────────────────────
    $supplierInvoiceRepo = new \Plugin\Trading\Infrastructure\Persistence\Mysql\SupplierInvoice\MysqlSupplierInvoiceRepository($pdo);
    $supplierInvoiceCtrl = new \Plugin\Trading\Infrastructure\Http\Api\Controller\SupplierInvoiceApiController($supplierInvoiceRepo);

    $app->route('GET /api/v1/supplierinvoices', [$supplierInvoiceCtrl, 'list']);
    $app->route('POST /api/v1/supplierinvoices', [$supplierInvoiceCtrl, 'create']);
    $app->route('GET /api/v1/supplierinvoices/@id', [$supplierInvoiceCtrl, 'show']);
    $app->route('PUT /api/v1/supplierinvoices/@id', [$supplierInvoiceCtrl, 'update']);
    $app->route('DELETE /api/v1/supplierinvoices/@id', [$supplierInvoiceCtrl, 'destroy']);
    $app->route('GET /api/v1/supplierinvoices/ref/@ref', [$supplierInvoiceCtrl, 'getByRef']);

    $app->route('GET /api/v1/supplierinvoices/@id/lines', [$supplierInvoiceCtrl, 'getLines']);
    $app->route('POST /api/v1/supplierinvoices/@id/lines', [$supplierInvoiceCtrl, 'postLine']);
    $app->route('PUT /api/v1/supplierinvoices/@id/lines/@lineId', [$supplierInvoiceCtrl, 'putLine']);
    $app->route('DELETE /api/v1/supplierinvoices/@id/lines/@lineId', [$supplierInvoiceCtrl, 'deleteLine']);

    $app->route('GET /api/v1/supplierinvoices/@id/payments', [$supplierInvoiceCtrl, 'getPayments']);
    $app->route('POST /api/v1/supplierinvoices/@id/payments', [$supplierInvoiceCtrl, 'addPayment']);

    $app->route('POST /api/v1/supplierinvoices/@id/validate', [$supplierInvoiceCtrl, 'validate']);
    $app->route('POST /api/v1/supplierinvoices/@id/settodraft', [$supplierInvoiceCtrl, 'settodraft']);
    $app->route('POST /api/v1/supplierinvoices/@id/settopaid', [$supplierInvoiceCtrl, 'settopaid']);
    $app->route('POST /api/v1/supplierinvoices/@id/settounpaid', [$supplierInvoiceCtrl, 'settounpaid']);

    // ── Supplier Orders ──────────────────────────────────────
    $supplierOrderRepo = new \Plugin\Trading\Infrastructure\Persistence\Mysql\SupplierOrder\MysqlSupplierOrderRepository($pdo);
    $supplierOrderCtrl = new \Plugin\Trading\Infrastructure\Http\Api\Controller\SupplierOrderApiController($supplierOrderRepo);

    $app->route('GET /api/v1/supplierorders', [$supplierOrderCtrl, 'list']);
    $app->route('POST /api/v1/supplierorders', [$supplierOrderCtrl, 'create']);
    $app->route('GET /api/v1/supplierorders/@id', [$supplierOrderCtrl, 'show']);
    $app->route('PUT /api/v1/supplierorders/@id', [$supplierOrderCtrl, 'update']);
    $app->route('DELETE /api/v1/supplierorders/@id', [$supplierOrderCtrl, 'destroy']);
    $app->route('GET /api/v1/supplierorders/ref/@ref', [$supplierOrderCtrl, 'getByRef']);

    $app->route('GET /api/v1/supplierorders/@id/lines', [$supplierOrderCtrl, 'getLines']);
    $app->route('POST /api/v1/supplierorders/@id/lines', [$supplierOrderCtrl, 'postLine']);
    $app->route('PUT /api/v1/supplierorders/@id/lines/@lineId', [$supplierOrderCtrl, 'putLine']);
    $app->route('DELETE /api/v1/supplierorders/@id/lines/@lineId', [$supplierOrderCtrl, 'deleteLine']);

    $app->route('POST /api/v1/supplierorders/@id/validate', [$supplierOrderCtrl, 'validate']);
    $app->route('POST /api/v1/supplierorders/@id/close', [$supplierOrderCtrl, 'close']);
};
