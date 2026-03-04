<?php

namespace Modules\Purchase\Controller;

use Alxarafe\Base\Controller\ApiController;
use Modules\Alixar\Model\SupplierProposal;

/**
 * Class SupplierProposalApiController
 * API Endpoint for Supplier Proposals.
 *
 * @package Modules\Purchase\Controller
 */
class SupplierProposalApiController extends ApiController
{
    /**
     * Lists all supplier proposals with filters.
     * Endpoint: api.php/Alixar/SupplierProposalApi/list
     */
    public function doList()
    {
        // Dolibarr permission: module 'fournisseur', perm 'propale.lire'
        if (!static::$user || !static::$user->hasPermission('fournisseur', 'propale.lire')) {
            static::badApiCall('Permission denied: fournisseur.propale.lire required', 403);
        }

        $limit = (int) ($_REQUEST['limit'] ?? 20);
        $offset = (int) ($_REQUEST['offset'] ?? 0);

        $query = SupplierProposal::with('thirdParty');

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
     * Gets a single supplier proposal detail.
     * Endpoint: api.php/Alixar/SupplierProposalApi/get/{id}
     */
    public function doGet($id = null)
    {
        if (!static::$user || !static::$user->hasPermission('fournisseur', 'propale.lire')) {
            static::badApiCall('Permission denied: fournisseur.propale.lire required', 403);
        }

        $id = $id ?? $_REQUEST['id'] ?? null;
        if (!$id) static::badApiCall('Missing ID');

        $proposal = SupplierProposal::with(['thirdParty', 'lines'])->find($id);
        if (!$proposal) static::badApiCall('Supplier Proposal not found', 404);

        static::jsonResponse($proposal->toArray());
    }
}
