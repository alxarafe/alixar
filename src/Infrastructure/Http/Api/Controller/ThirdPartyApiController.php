<?php

declare(strict_types=1);

namespace App\Infrastructure\Http\Api\Controller;

use App\Domain\ThirdParty\ThirdParty;
use App\Domain\ThirdParty\ThirdPartyNotFoundException;
use App\Domain\ThirdParty\ThirdPartyRepository;
use Flight;

/**
 * ThirdPartyApiController — API adapter for ThirdParty operations.
 *
 * Exposes Dolibarr-compatible endpoints:
 *   GET    /api/thirdparties        → list
 *   GET    /api/thirdparties/{id}   → show
 *   POST   /api/thirdparties        → create
 *   PUT    /api/thirdparties/{id}   → update
 *   DELETE /api/thirdparties/{id}   → delete
 *
 * Response format matches Dolibarr's REST API for compatibility.
 */
class ThirdPartyApiController
{
    public function __construct(
        private ThirdPartyRepository $repository,
        private \App\Domain\ThirdParty\ThirdPartyValidator $validator,
    ) {}

    /**
     * GET /api/thirdparties
     *
     * Query params (Dolibarr-compatible):
     *   - sortfield: t.rowid (default)
     *   - sortorder: ASC|DESC
     *   - limit: int (default 100)
     *   - page: int (default 0)
     *   - mode: 0=all, 1=customers, 2=prospects, 3=neither, 4=suppliers
     */
    public function list(): void
    {
        $limit = (int) ($_GET['limit'] ?? 100);
        $page = (int) ($_GET['page'] ?? 0);
        $offset = $page * $limit;
        $sortField = $_GET['sortfield'] ?? 't.rowid';
        $sortOrder = $_GET['sortorder'] ?? 'ASC';

        $filters = [];
        if (isset($_GET['mode']) && $_GET['mode'] !== '0') {
            $filters['mode'] = (int) $_GET['mode'];
        }

        $results = $this->repository->findAll($filters, $limit, $offset, $sortField, $sortOrder);

        // Dolibarr returns an array of objects with 'id' and 'name' keys
        $response = array_map(fn(ThirdParty $tp) => $tp->toApiArray(), $results);

        Flight::json($response);
    }

    /**
     * GET /api/thirdparties/{id}
     */
    public function show(int $id): void
    {
        $tp = $this->repository->findById($id);

        if ($tp === null) {
            throw ThirdPartyNotFoundException::withId($id);
        }

        Flight::json($tp->toApiArray());
    }

    /**
     * POST /api/thirdparties
     *
     * Dolibarr POST returns the new ID as a plain integer.
     */
    public function create(): void
    {
        $data = json_decode(file_get_contents('php://input'), true) ?? [];

        $tp = new ThirdParty(
            name: $data['name'] ?? $data['nom'] ?? '',
            type: \App\Domain\ThirdParty\ThirdPartyType::from((int) ($data['client'] ?? 0)),
            isSupplier: (bool) ($data['fournisseur'] ?? false),
            status: isset($data['status'])
                ? \App\Domain\ThirdParty\ThirdPartyStatus::from((int) $data['status'])
                : null,
            nameAlias: $data['name_alias'] ?? null,
        );

        // Apply optional fields
        $tp->updateFrom($data);

        // Domain Validation
        $this->validator->validate($tp);

        $this->repository->save($tp);

        // Dolibarr returns the ID as a plain integer
        Flight::json($tp->getId(), 200);
    }

    /**
     * PUT /api/thirdparties/{id}
     *
     * Dolibarr PUT returns the full updated object.
     */
    public function update(int $id): void
    {
        $tp = $this->repository->findById($id);

        if ($tp === null) {
            throw ThirdPartyNotFoundException::withId($id);
        }

        $data = json_decode(file_get_contents('php://input'), true) ?? [];
        $tp->updateFrom($data);

        // Domain Validation
        $this->validator->validate($tp);

        $this->repository->save($tp);

        // Dolibarr returns the updated object
        Flight::json($tp->toApiArray());
    }

    /**
     * DELETE /api/thirdparties/{id}
     *
     * Dolibarr DELETE returns: {"success": {"code": 200, "message": "Object deleted"}}
     */
    public function destroy(int $id): void
    {
        $tp = $this->repository->findById($id);

        if ($tp === null) {
            throw ThirdPartyNotFoundException::withId($id);
        }

        $this->repository->delete($id);

        // Dolibarr response format
        Flight::json([
            'success' => [
                'code' => 200,
                'message' => 'Object deleted',
            ],
        ]);
    }
}
