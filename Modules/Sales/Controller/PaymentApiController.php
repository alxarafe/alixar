<?php

namespace Modules\Sales\Controller;

use Alxarafe\Base\Controller\ApiController;
use Modules\Alixar\Model\Payment;
use Modules\Alixar\Model\Paiementfourn;

/**
 * Class PaymentApiController
 * API Endpoint for Payments (Customer and Supplier).
 *
 * @package Modules\Sales\Controller
 */
class PaymentApiController extends ApiController
{
    /**
     * Lists customer payments.
     * Endpoint: api.php/Alixar/PaymentApi/listCustomer
     */
    public function doListCustomer()
    {
        if (!static::$user || !static::$user->can('paiement-lire', '', 'facture')) {
            static::badApiCall('Permission denied: facture.paiement-lire required', 403);
        }

        $limit = (int) ($_REQUEST['limit'] ?? 20);
        $offset = (int) ($_REQUEST['offset'] ?? 0);

        $query = Payment::with(['bankMovement.account', 'invoices']);

        if (isset($_REQUEST['ref'])) {
            $query->where('ref', 'like', '%' . $_REQUEST['ref'] . '%');
        }

        $total = $query->count();
        $items = $query->limit($limit)->offset($offset)->get();

        static::jsonResponse([
            'total' => $total,
            'items' => $items->toArray()
        ]);
    }

    /**
     * Lists supplier payments.
     * Endpoint: api.php/Alixar/PaymentApi/listSupplier
     */
    public function doListSupplier()
    {
        if (!static::$user || !static::$user->can('facture.paiement-lire', '', 'fournisseur')) {
            static::badApiCall('Permission denied: fournisseur.facture.paiement-lire required', 403);
        }

        $limit = (int) ($_REQUEST['limit'] ?? 20);
        $offset = (int) ($_REQUEST['offset'] ?? 0);

        $query = Paiementfourn::with(['bankMovement.account', 'invoices']);

        if (isset($_REQUEST['ref'])) {
            $query->where('ref', 'like', '%' . $_REQUEST['ref'] . '%');
        }

        $total = $query->count();
        $items = $query->limit($limit)->offset($offset)->get();

        static::jsonResponse([
            'total' => $total,
            'items' => $items->toArray()
        ]);
    }
}
