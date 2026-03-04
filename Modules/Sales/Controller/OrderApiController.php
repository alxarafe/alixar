<?php

namespace Modules\Sales\Controller;

use Alxarafe\Base\Controller\ApiController;
use Modules\Alixar\Model\Order;

class OrderApiController extends ApiController
{
    /**
     * Lists all orders with filters.
     * Endpoint: api.php/Alixar/OrderApi/list
     */
    public function doList()
    {
        if (!static::$user || !static::$user->hasPermission('commande', 'lire')) {
            static::badApiCall('Permission denied: commande.lire required', 403);
        }

        $limit = (int) ($_REQUEST['limit'] ?? 20);
        $offset = (int) ($_REQUEST['offset'] ?? 0);

        $query = Order::with('thirdParty');

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
     * Gets an order with its lines.
     * Endpoint: api.php/Alixar/OrderApi/get/{id}
     */
    public function doGet($id = null)
    {
        if (!static::$user || !static::$user->hasPermission('commande', 'lire')) {
            static::badApiCall('Permission denied: commande.lire required', 403);
        }

        $id = $id ?? $_REQUEST['id'] ?? null;
        if (!$id) static::badApiCall('Missing ID');

        $order = Order::with(['thirdParty', 'lines'])->find($id);
        if (!$order) static::badApiCall('Order not found', 404);

        static::jsonResponse($order->toArray());
    }
}
