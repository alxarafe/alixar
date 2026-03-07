<?php

namespace Modules\CRM\Controller;

use Alxarafe\Base\Controller\ApiController;
use Modules\Alixar\Model\ThirdParty;

/**
 * Class ThirdPartyApiController
 * API Endpoint for managing Third Parties.
 *
 * @package Modules\Alixar\Controller
 */
class ThirdPartyApiController extends ApiController
{
    /**
     * Lists all third parties.
     * Endpoint: api.php/Alixar/ThirdPartyApi/list
     */
    public function doList()
    {
        // 1. Check permissions (Dolibarr style: module 'societe', perm 'lire')
        if (!static::$user || !static::$user->can('lire', '', 'societe')) {
            static::badApiCall('Permission denied: societe.lire required', 403);
        }

        $limit = (int) ($_REQUEST['limit'] ?? 20);
        $offset = (int) ($_REQUEST['offset'] ?? 0);

        $query = ThirdParty::query();

        // Basic filtering
        if (isset($_REQUEST['client'])) {
            $query->where('client', $_REQUEST['client']);
        }
        if (isset($_REQUEST['fournisseur'])) {
            $query->where('fournisseur', $_REQUEST['fournisseur']);
        }
        if (isset($_REQUEST['name'])) {
            $query->where('nom', 'like', '%' . $_REQUEST['name'] . '%');
        }

        $total = $query->count();
        $data = $query->limit($limit)->offset($offset)->get();

        static::jsonResponse([
            'total' => $total,
            'limit' => $limit,
            'offset' => $offset,
            'items' => $data->toArray()
        ]);
    }

    /**
     * Gets a single third party detail.
     * Endpoint: api.php/Alixar/ThirdPartyApi/get/{id}
     */
    public function doGet($id = null)
    {
        // 1. Check permissions
        if (!static::$user || !static::$user->can('lire', '', 'societe')) {
            static::badApiCall('Permission denied: societe.lire required', 403);
        }

        $id = $id ?? $_REQUEST['id'] ?? null;

        if (!$id) {
            static::badApiCall('Missing ID', 400);
        }

        $item = ThirdParty::find($id);

        if (!$item) {
            static::badApiCall('Third party not found', 404);
        }

        static::jsonResponse($item->toArray());
    }

    /**
     * Placeholder for creating/updating.
     */
    public function doSave()
    {
        // 1. Check permissions (Dolibarr: module 'societe', perm 'creer')
        if (!static::$user || !static::$user->can('creer', '', 'societe')) {
            static::badApiCall('Permission denied: societe.creer required', 403);
        }

        // Logic for save/update would go here (Fase 2)
        static::jsonResponse(['status' => 'Feature coming soon in Fase 2']);
    }
}
