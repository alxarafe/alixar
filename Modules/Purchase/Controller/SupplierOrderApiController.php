<?php

namespace Modules\Purchase\Controller;

use Alxarafe\Base\Controller\ApiController;
use Modules\Alixar\Model\OrderFournisseur;

/**
 * Class SupplierOrderApiController
 * API Endpoint for Supplier Orders.
 *
 * @package Modules\Purchase\Controller
 */
class SupplierOrderApiController extends ApiController
{
    /**
     * Lists all supplier orders with filters.
     * Endpoint: api.php/Alixar/SupplierOrderApi/list
     */
    public function doList()
    {
        // Dolibarr permission: module 'fournisseur', perm 'commande.lire'
        if (!static::$user || !static::$user->can('commande.lire', '', 'fournisseur')) {
            static::badApiCall('Permission denied: fournisseur.commande.lire required', 403);
        }

        $limit = (int) ($_REQUEST['limit'] ?? 20);
        $offset = (int) ($_REQUEST['offset'] ?? 0);

        $query = OrderFournisseur::with('thirdParty');

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
     * Gets a supplier order with its lines.
     * Endpoint: api.php/Alixar/SupplierOrderApi/get/{id}
     */
    public function doGet($id = null)
    {
        if (!static::$user || !static::$user->can('commande.lire', '', 'fournisseur')) {
            static::badApiCall('Permission denied: fournisseur.commande.lire required', 403);
        }

        $id = $id ?? $_REQUEST['id'] ?? null;
        if (!$id) static::badApiCall('Missing ID');

        $order = OrderFournisseur::with(['thirdParty', 'lines'])->find($id);
        if (!$order) static::badApiCall('Supplier Order not found', 404);

        static::jsonResponse($order->toArray());
    }
}
