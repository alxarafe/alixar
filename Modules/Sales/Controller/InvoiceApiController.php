<?php

namespace Modules\Sales\Controller;

use Alxarafe\Base\Controller\ApiController;
use Modules\Alixar\Model\Invoice;

class InvoiceApiController extends ApiController
{
    /**
     * Lists all invoices with filters.
     * Endpoint: api.php/Alixar/InvoiceApi/list
     */
    public function doList()
    {
        if (!static::$user || !static::$user->can('lire', '', 'facture')) {
            static::badApiCall('Permission denied: facture.lire required', 403);
        }

        $limit = (int) ($_REQUEST['limit'] ?? 20);
        $offset = (int) ($_REQUEST['offset'] ?? 0);

        $query = Invoice::with('thirdParty');

        if (isset($_REQUEST['ref'])) {
            $query->where('ref', 'like', '%' . $_REQUEST['ref'] . '%');
        }
        if (isset($_REQUEST['socid'])) {
            $query->where('fk_soc', $_REQUEST['socid']);
        }

        $total = $query->count();
        $items = $query->limit($limit)->offset($offset)->get();

        static::jsonResponse([
            'total' => $total,
            'items' => $items->toArray()
        ]);
    }

    /**
     * Gets an invoice with its lines.
     * Endpoint: api.php/Alixar/InvoiceApi/get/{id}
     */
    public function doGet($id = null)
    {
        if (!static::$user || !static::$user->can('lire', '', 'facture')) {
            static::badApiCall('Permission denied: facture.lire required', 403);
        }

        $id = $id ?? $_REQUEST['id'] ?? null;
        if (!$id) static::badApiCall('Missing ID');

        $invoice = Invoice::with(['thirdParty', 'lines'])->find($id);
        if (!$invoice) static::badApiCall('Invoice not found', 404);

        static::jsonResponse($invoice->toArray());
    }
}
