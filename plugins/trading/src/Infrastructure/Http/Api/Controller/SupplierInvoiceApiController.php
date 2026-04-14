<?php

declare(strict_types=1);

namespace Plugin\Trading\Infrastructure\Http\Api\Controller;

use Plugin\Trading\Domain\SupplierInvoice\SupplierInvoice;
use Plugin\Trading\Domain\SupplierInvoice\SupplierInvoiceRepository;
use Plugin\DolibarrCompat\Infrastructure\DolibarrMappingTrait;
use Flight;

class SupplierInvoiceApiController
{
    use DolibarrMappingTrait;

    private const API_MAP = [
        'id' => 'id',
        'thirdPartyId' => 'socid',
        'ref' => 'ref',
        'refSupplier' => 'ref_supplier',
        'refExt' => 'ref_ext',
        'totalHt' => 'total_ht',
        'totalTva' => 'total_tva',
        'totalTtc' => 'total_ttc',
        'status' => 'statut',
    ];

    public function __construct(
        private SupplierInvoiceRepository $repository,
    ) {
    }

    /**
     * @return array<string, mixed>
     */
    private function mapResponse(SupplierInvoice $invoice): array
    {
        $payload = $invoice->toArray();
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

        $invoices = $this->repository->findAll($limit, $offset, $sortField, $sortOrder);

        $response = array_map(function (SupplierInvoice $invoice) {
            return $this->mapResponse($invoice);
        }, $invoices);

        Flight::json($response, 200);
    }

    public function show(int $id): void
    {
        $invoice = $this->repository->findById($id);

        if (!$invoice) {
            Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
            return;
        }

        $response = $this->mapResponse($invoice);
        $response['lines'] = $this->repository->getLines($id);

        Flight::json($response, 200);
    }

    public function getByRef(string $ref): void
    {
        $invoice = $this->repository->findByRef($ref);
        if (!$invoice) {
            Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
            return;
        }
        $response = $this->mapResponse($invoice);
        $response['lines'] = $this->repository->getLines($invoice->getId() ?? 0);
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

            $invoice = SupplierInvoice::fromArray($cleanData);
            $this->repository->save($invoice);

            Flight::json($invoice->getId(), 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function update(int $id): void
    {
        try {
            $invoice = $this->repository->findById($id);
            if (!$invoice) {
                Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
                return;
            }

            $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
            $cleanData = $this->mapToClean($payload, self::API_MAP);

            $invoice->updateFrom($cleanData);
            $this->repository->save($invoice);

            $updatedInvoice = $this->repository->findById($id);
            if (!$updatedInvoice) {
                Flight::json(['error' => ['code' => 500, 'message' => 'Failed to fetch updated invoice']], 500);
                return;
            }
            Flight::json($this->mapResponse($updatedInvoice), 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function destroy(int $id): void
    {
        try {
            $invoice = $this->repository->findById($id);
            if (!$invoice) {
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

    // --- Payments ---
    public function getPayments(int $id): void
    {
        Flight::json($this->repository->getPayments($id), 200);
    }

    public function addPayment(int $id): void
    {
        try {
            $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
            $this->repository->addPayment($id, $payload);
            Flight::json(['success' => ['code' => 200, 'message' => 'Payment added']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    // --- State Flow ---
    public function validate(int $id): void
    {
        try {
            $invoice = $this->repository->findById($id);
            if ($invoice) {
                $invoice->updateFrom(['status' => 1]);
                $this->repository->save($invoice);
                Flight::json(['success' => ['code' => 200, 'message' => 'Validated']], 200);
            }
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function settodraft(int $id): void
    {
        try {
            $invoice = $this->repository->findById($id);
            if ($invoice) {
                $invoice->updateFrom(['status' => 0]);
                $this->repository->save($invoice);
                Flight::json(['success' => ['code' => 200, 'message' => 'Set to draft']], 200);
            }
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function settopaid(int $id): void
    {
        try {
            $invoice = $this->repository->findById($id);
            if ($invoice) {
                $invoice->updateFrom(['status' => 2]);
                $this->repository->save($invoice);
                Flight::json(['success' => ['code' => 200, 'message' => 'Set to paid']], 200);
            }
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function settounpaid(int $id): void
    {
        try {
            $invoice = $this->repository->findById($id);
            if ($invoice) {
                $invoice->updateFrom(['status' => 1]); // Validated but unpaid
                $this->repository->save($invoice);
                Flight::json(['success' => ['code' => 200, 'message' => 'Set to unpaid']], 200);
            }
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }
}
