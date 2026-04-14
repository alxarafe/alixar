<?php

declare(strict_types=1);

namespace Plugin\Trading\Infrastructure\Http\Api\Controller;

use Plugin\Trading\Domain\Order\Order;
use Plugin\Trading\Domain\Order\OrderRepository;
use Plugin\DolibarrCompat\Infrastructure\DolibarrMappingTrait;
use Flight;

class OrderApiController
{
    use DolibarrMappingTrait;

    private const API_MAP = [
        'id' => 'id',
        'thirdPartyId' => 'socid',
        'ref' => 'ref',
        'refClient' => 'ref_client',
        'refExt' => 'ref_ext',
        'notePrivate' => 'note_private',
        'notePublic' => 'note_public',
        'totalHt' => 'total_ht',
        'totalTva' => 'total_tva',
        'totalTtc' => 'total_ttc',
        'status' => 'statut',
    ];

    public function __construct(
        private OrderRepository $repository,
    ) {
    }

    /**
     * @return array<string, mixed>
     */
    private function mapResponse(Order $order): array
    {
        $payload = $order->toArray();
        if (isset($payload['createdAt'])) $payload['date_creation'] = strtotime($payload['createdAt']);
        if (isset($payload['updatedAt'])) $payload['date_modification'] = strtotime($payload['updatedAt']);
        
        return $this->mapToDolibarr($payload, self::API_MAP);
    }

    public function list(): void
    {
        $limit = (int) ($_GET['limit'] ?? 100);
        $page = (int) ($_GET['page'] ?? 0);
        $offset = $page * $limit;
        $sortField = $_GET['sortfield'] ?? 't.rowid';
        $sortOrder = $_GET['sortorder'] ?? 'ASC';

        $sortField = str_replace('t.', '', $sortField);

        $orders = $this->repository->findAll($limit, $offset, $sortField, $sortOrder);

        $response = array_map(function (Order $order) {
            return $this->mapResponse($order);
        }, $orders);

        Flight::json($response, 200);
    }

    public function show(int $id): void
    {
        $order = $this->repository->findById($id);

        if (!$order) {
            Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
            return;
        }

        $response = $this->mapResponse($order);
        $response['lines'] = $this->repository->getLines($id);

        Flight::json($response, 200);
    }

    public function getByRef(string $ref): void
    {
        $order = $this->repository->findByRef($ref);
        if (!$order) {
            Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
            return;
        }
        $response = $this->mapResponse($order);
        $response['lines'] = $this->repository->getLines($order->getId() ?? 0);
        Flight::json($response, 200);
    }

    public function create(): void
    {
        try {
            $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
            $cleanData = $this->mapToClean($payload, self::API_MAP);

            if (empty($cleanData['thirdPartyId'])) {
                Flight::json(['error' => ['code' => 400, 'message' => 'socid is required']], 400);
                return;
            }

            $order = Order::fromArray($cleanData);
            $this->repository->save($order);

            Flight::json($order->getId(), 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function update(int $id): void
    {
        try {
            $order = $this->repository->findById($id);
            if (!$order) {
                Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
                return;
            }

            $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
            $cleanData = $this->mapToClean($payload, self::API_MAP);

            $order->updateFrom($cleanData);
            $this->repository->save($order);

            $updatedOrder = $this->repository->findById($id);
            if (!$updatedOrder) {
                Flight::json(['error' => ['code' => 500, 'message' => 'Failed to fetch updated order']], 500);
                return;
            }
            Flight::json($this->mapResponse($updatedOrder), 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function destroy(int $id): void
    {
        try {
            $order = $this->repository->findById($id);
            if (!$order) {
                Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
                return;
            }

            $this->repository->delete($id);
            Flight::json(['success' => ['code' => 200, 'message' => 'Deleted']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    // --- Lines ---
    public function getLines(int $id): void
    {
        Flight::json($this->repository->getLines($id), 200);
    }

    public function postLine(int $id): void
    {
        try {
            $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
            $this->repository->addLine($id, $payload);
            Flight::json(['success' => ['code' => 200, 'message' => 'Line added']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function putLine(int $id, int $lineId): void
    {
        try {
            $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
            $this->repository->updateLine($id, $lineId, $payload);
            Flight::json(['success' => ['code' => 200, 'message' => 'Line updated']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function deleteLine(int $id, int $lineId): void
    {
        try {
            $this->repository->deleteLine($id, $lineId);
            Flight::json(['success' => ['code' => 200, 'message' => 'Line deleted']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    // --- Contacts ---
    public function getContacts(int $id): void
    {
        Flight::json($this->repository->getContacts($id), 200);
    }

    public function postContact(int $id, int $contactId, string $type): void
    {
        try {
            $this->repository->addContact($id, $contactId, $type);
            Flight::json(['success' => ['code' => 200, 'message' => 'Contact link added']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function deleteContact(int $id, int $contactId, string $type): void
    {
        try {
            $this->repository->deleteContact($id, $contactId, $type);
            Flight::json(['success' => ['code' => 200, 'message' => 'Contact link deleted']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    // --- State Flow ---
    public function validate(int $id): void
    {
        try {
            $order = $this->repository->findById($id);
            if ($order) {
                // Status 1 = Validated
                $order->updateFrom(['status' => 1]);
                $this->repository->save($order);
                Flight::json(['success' => ['code' => 200, 'message' => 'Validated']], 200);
            }
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function close(int $id): void
    {
        try {
            $order = $this->repository->findById($id);
            if ($order) {
                // Status 3 = Delivered/Closed
                $order->updateFrom(['status' => 3]);
                $this->repository->save($order);
                Flight::json(['success' => ['code' => 200, 'message' => 'Closed']], 200);
            }
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }
}
