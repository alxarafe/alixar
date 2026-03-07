<?php

namespace Modules\Purchase\Controller;

use Alxarafe\Base\Controller\ApiController;
use Modules\Alixar\Model\InvoiceFourn;

/**
 * Class SupplierInvoiceApiController
 * API Endpoint for Supplier Invoices.
 *
 * @package Modules\Purchase\Controller
 */
class SupplierInvoiceApiController extends ApiController
{
    /**
     * Lists all supplier invoices with filters.
     * Endpoint: api.php/Alixar/SupplierInvoiceApi/list
     */
    public function doList()
    {
        // Dolibarr permission: module 'fournisseur', perm 'facture.lire'
        if (!static::$user || !static::$user->can('facture.lire', '', 'fournisseur')) {
            static::badApiCall('Permission denied: fournisseur.facture.lire required', 403);
        }

        $limit = (int) ($_REQUEST['limit'] ?? 20);
        $offset = (int) ($_REQUEST['offset'] ?? 0);

        $query = InvoiceFourn::with('thirdParty');

        if (isset($_REQUEST['ref'])) {
            $query->where('ref', 'like', '%' . $_REQUEST['ref'] . '%');
        }
        if (isset($_REQUEST['socid'])) {
            $query->where('fk_soc', $_REQUEST['socid']);
        }
        if (isset($_REQUEST['statut'])) {
            $query->where('fk_statut', $_REQUEST['statut']);
        }

        $total = $query->count();
        $items = $query->limit($limit)->offset($offset)->get();

        static::jsonResponse([
            'total' => $total,
            'items' => $items->toArray()
        ]);
    }

    /**
     * Gets a single supplier invoice detail.
     * Endpoint: api.php/Alixar/SupplierInvoiceApi/get/{id}
     */
    public function doGet($id = null)
    {
        if (!static::$user || !static::$user->can('facture.lire', '', 'fournisseur')) {
            static::badApiCall('Permission denied: fournisseur.facture.lire required', 403);
        }

        $id = $id ?? $_REQUEST['id'] ?? null;
        if (!$id) static::badApiCall('Missing ID');

        $invoice = InvoiceFourn::with(['thirdParty', 'lines'])->find($id);
        if (!$invoice) static::badApiCall('Supplier Invoice not found', 404);

        static::jsonResponse($invoice->toArray());
    }
}
