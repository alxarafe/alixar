<?php

namespace Modules\Banks\Controller;

use Alxarafe\Base\Controller\ApiController;
use Modules\Alixar\Model\BankAccount;

/**
 * Class BankMovementApiController
 * API Endpoint for Bank Movements.
 *
 * @package Modules\Banks\Controller
 */
class BankMovementApiController extends ApiController
{
    /**
     * Lists bank movements with filters.
     * Endpoint: api.php/Alixar/BankMovementApi/list
     */
    public function doList()
    {
        if (!static::$user || !static::$user->can('lire', '', 'bank')) {
            static::badApiCall('Permission denied: bank.lire required', 403);
        }

        $limit = (int) ($_REQUEST['limit'] ?? 100);
        $offset = (int) ($_REQUEST['offset'] ?? 0);

        $query = BankAccount::with('account');

        if (isset($_REQUEST['fk_account'])) {
            $query->where('fk_account', $_REQUEST['fk_account']);
        }
        if (isset($_REQUEST['date_min'])) {
            $query->where('datev', '>=', $_REQUEST['date_min']);
        }
        if (isset($_REQUEST['date_max'])) {
            $query->where('datev', '<=', $_REQUEST['date_max']);
        }

        $total = $query->count();
        $items = $query->orderBy('datev', 'desc')->limit($limit)->offset($offset)->get();

        static::jsonResponse([
            'total' => $total,
            'items' => $items->toArray()
        ]);
    }

    /**
     * Gets a single movement.
     * Endpoint: api.php/Alixar/BankMovementApi/get/{id}
     */
    public function doGet($id = null)
    {
        if (!static::$user || !static::$user->can('lire', '', 'bank')) {
            static::badApiCall('Permission denied: bank.lire required', 403);
        }

        $id = $id ?? $_REQUEST['id'] ?? null;
        if (!$id) static::badApiCall('Missing ID');

        $movement = BankAccount::with('account')->find($id);
        if (!$movement) static::badApiCall('Bank Movement not found', 404);

        static::jsonResponse($movement->toArray());
    }
}
