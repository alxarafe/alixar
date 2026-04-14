<?php

declare(strict_types=1);

namespace Plugin\Finance\Infrastructure\Http\Api\Controller;

use Plugin\Finance\Domain\BankAccount\BankAccount;
use Plugin\Finance\Domain\BankAccount\BankAccountRepository;
use Plugin\DolibarrCompat\Infrastructure\DolibarrMappingTrait;
use Flight;

class BankAccountApiController
{
    use DolibarrMappingTrait;

    private const API_MAP = [
        'id' => 'id',
        'ref' => 'ref',
        'label' => 'label',
        'bank' => 'bank',
        'bic' => 'bic',
        'ibanPrefix' => 'iban_prefix',
        'currencyCode' => 'currency_code',
        'status' => 'clos',
        'accountType' => 'courant'
    ];

    public function __construct(
        private BankAccountRepository $repository,
    ) {
    }

    /**
     * @return array<string, mixed>
     */
    private function mapResponse(BankAccount $account): array
    {
        $payload = $account->toArray();
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

        $accounts = $this->repository->findAll($limit, $offset, $sortField, $sortOrder);

        $response = array_map(function (BankAccount $account) {
            return $this->mapResponse($account);
        }, $accounts);

        Flight::json($response, 200);
    }

    public function show(int $id): void
    {
        $account = $this->repository->findById($id);

        if (!$account) {
            Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
            return;
        }

        $response = $this->mapResponse($account);
        $response['transactions'] = $this->repository->getTransactions($id);

        Flight::json($response, 200);
    }

    public function create(): void
    {
        try {
            $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
            $cleanData = $this->mapToClean($payload, self::API_MAP);

            if (empty($cleanData['ref']) || empty($cleanData['label'])) {
                Flight::json(['error' => ['code' => 400, 'message' => 'ref and label are required']], 400);
                return;
            }

            $account = BankAccount::fromArray($cleanData);
            $this->repository->save($account);

            Flight::json($account->getId(), 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function update(int $id): void
    {
        try {
            $account = $this->repository->findById($id);
            if (!$account) {
                Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
                return;
            }

            $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
            $cleanData = $this->mapToClean($payload, self::API_MAP);

            $account->updateFrom($cleanData);
            $this->repository->save($account);

            $updatedAccount = $this->repository->findById($id);
            if (!$updatedAccount) {
                Flight::json(['error' => ['code' => 500, 'message' => 'Failed to fetch updated account']], 500);
                return;
            }
            Flight::json($this->mapResponse($updatedAccount), 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function destroy(int $id): void
    {
        try {
            $account = $this->repository->findById($id);
            if (!$account) {
                Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
                return;
            }

            $this->repository->delete($id);
            Flight::json(['success' => ['code' => 200, 'message' => 'Deleted']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    // --- Transactions ---
    public function getTransactions(int $id): void
    {
        Flight::json($this->repository->getTransactions($id), 200);
    }

    public function postTransaction(int $id): void
    {
        try {
            $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
            $this->repository->addTransaction($id, $payload);
            Flight::json(['success' => ['code' => 200, 'message' => 'Transaction added']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function putTransaction(int $id, int $transactionId): void
    {
        try {
            $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
            $this->repository->updateTransaction($id, $transactionId, $payload);
            Flight::json(['success' => ['code' => 200, 'message' => 'Transaction updated']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function deleteTransaction(int $id, int $transactionId): void
    {
        try {
            $this->repository->deleteTransaction($id, $transactionId);
            Flight::json(['success' => ['code' => 200, 'message' => 'Transaction deleted']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }
}
