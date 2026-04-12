<?php

declare(strict_types=1);

namespace Plugin\Trading\Infrastructure\Http\Api\Controller;

use Plugin\Trading\Domain\Proposal\Proposal;
use Plugin\Trading\Domain\Proposal\ProposalRepository;
use Core\Infrastructure\DolibarrMappingTrait;
use Flight;

class ProposalApiController
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
        private ProposalRepository $repository,
    ) {
    }

    /**
     * @return array<string, mixed>
     */
    private function mapResponse(Proposal $proposal): array
    {
        $payload = $proposal->toArray();
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

        $proposals = $this->repository->findAll($limit, $offset, $sortField, $sortOrder);

        $response = array_map(function (Proposal $proposal) {
            return $this->mapResponse($proposal);
        }, $proposals);

        Flight::json($response, 200);
    }

    public function show(int $id): void
    {
        $proposal = $this->repository->findById($id);

        if (!$proposal) {
            Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
            return;
        }

        $response = $this->mapResponse($proposal);
        $response['lines'] = $this->repository->getLines($id);

        Flight::json($response, 200);
    }

    public function getByRef(string $ref): void
    {
        $proposal = $this->repository->findByRef($ref);
        if (!$proposal) {
            Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
            return;
        }
        $response = $this->mapResponse($proposal);
        $response['lines'] = $this->repository->getLines($proposal->getId() ?? 0);
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

            $proposal = Proposal::fromArray($cleanData);
            $this->repository->save($proposal);

            Flight::json($proposal->getId(), 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function update(int $id): void
    {
        try {
            $proposal = $this->repository->findById($id);
            if (!$proposal) {
                Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
                return;
            }

            $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
            $cleanData = $this->mapToClean($payload, self::API_MAP);

            $proposal->updateFrom($cleanData);
            $this->repository->save($proposal);

            $updatedProposal = $this->repository->findById($id);
            if (!$updatedProposal) {
                Flight::json(['error' => ['code' => 500, 'message' => 'Failed to fetch updated proposal']], 500);
                return;
            }
            Flight::json($this->mapResponse($updatedProposal), 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function destroy(int $id): void
    {
        try {
            $proposal = $this->repository->findById($id);
            if (!$proposal) {
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
            $proposal = $this->repository->findById($id);
            if ($proposal) {
                // Status 1 = Validated
                $proposal->updateFrom(['status' => 1]);
                $this->repository->save($proposal);
                Flight::json(['success' => ['code' => 200, 'message' => 'Validated']], 200);
            }
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function close(int $id): void
    {
        try {
            $proposal = $this->repository->findById($id);
            if ($proposal) {
                // Status 2/3 = Closed (Billed or signed)
                $proposal->updateFrom(['status' => 2]);
                $this->repository->save($proposal);
                Flight::json(['success' => ['code' => 200, 'message' => 'Closed']], 200);
            }
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }
}
