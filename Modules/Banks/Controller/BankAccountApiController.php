<?php

namespace Modules\Banks\Controller;

use Alxarafe\Base\Controller\ApiController;
use Modules\Alixar\Model\BankAccountAccount;

/**
 * Class BankAccountApiController
 * API Endpoint for Bank Accounts.
 *
 * @package Modules\Banks\Controller
 */
class BankAccountApiController extends ApiController
{
    /**
     * Lists all bank accounts.
     * Endpoint: api.php/Alixar/BankAccountApi/list
     */
    public function doList()
    {
        if (!static::$user || !static::$user->can('lire', '', 'bank')) {
            static::badApiCall('Permission denied: bank.lire required', 403);
        }

        $limit = (int) ($_REQUEST['limit'] ?? 20);
        $offset = (int) ($_REQUEST['offset'] ?? 0);

        $query = BankAccountAccount::query();

        if (isset($_REQUEST['clos'])) {
            $query->where('clos', $_REQUEST['clos']);
        }

        $total = $query->count();
        $items = $query->limit($limit)->offset($offset)->get();

        static::jsonResponse([
            'total' => $total,
            'items' => $items->toArray()
        ]);
    }

    /**
     * Gets a single bank account detail.
     * Endpoint: api.php/Alixar/BankAccountApi/get/{id}
     */
    public function doGet($id = null)
    {
        if (!static::$user || !static::$user->can('lire', '', 'bank')) {
            static::badApiCall('Permission denied: bank.lire required', 403);
        }

        $id = $id ?? $_REQUEST['id'] ?? null;
        if (!$id) static::badApiCall('Missing ID');

        $account = BankAccountAccount::find($id);
        if (!$account) static::badApiCall('Bank Account not found', 404);

        static::jsonResponse($account->toArray());
    }
}
