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
    use \App\Infrastructure\DolibarrMappingTrait;

    private const API_MAP = [
        'nameAlias' => 'name_alias',
        'type' => 'client',
        'isSupplier' => 'fournisseur',
        'customerCode' => 'code_client',
        'supplierCode' => 'code_fournisseur',
        'countryId' => 'fk_pays',
        'vatNumber' => 'tva_intra',
        'nif' => 'siren',
        'notePrivate' => 'note_private',
        'notePublic' => 'note_public',
        'createdAt' => 'datec',
    ];

    public function __construct(
        private ThirdPartyRepository $repository,
        private \App\Domain\ThirdParty\ThirdPartyValidator $validator,
        private ?\App\Domain\ThirdParty\BankAccountRepository $bankAccountRepository = null,
        private ?\App\Domain\Category\ThirdPartyCategoryRepository $categoryRepository = null,
        private ?\App\Domain\User\ThirdPartyRepresentativeRepository $representativeRepository = null,
    ) {
    }

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

        // Dolibarr returns an array of objects with API format
        $response = array_map(fn(ThirdParty $tp) => $this->mapToDolibarr($tp->toArray(), self::API_MAP), $results);

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

        Flight::json($this->mapToDolibarr($tp->toArray(), self::API_MAP));
    }

    /**
     * POST /api/thirdparties
     *
     * Dolibarr POST returns the new ID as a plain integer.
     */
    public function create(): void
    {
        $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
        $cleanData = $this->mapToClean($payload, self::API_MAP);

        $tp = new ThirdParty(
            name: (string) ($cleanData['name'] ?? ''),
            type: \App\Domain\ThirdParty\ThirdPartyType::from((int) ($cleanData['type'] ?? 0)),
            isSupplier: (bool) ($cleanData['isSupplier'] ?? false),
            status: isset($cleanData['status'])
                ? \App\Domain\ThirdParty\ThirdPartyStatus::from((int) $cleanData['status'])
                : null,
            nameAlias: isset($cleanData['nameAlias']) ? (string) $cleanData['nameAlias'] : null,
        );

        // Apply optional fields
        $tp->updateFrom($cleanData);

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

        $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
        $cleanData = $this->mapToClean($payload, self::API_MAP);
        
        $tp->updateFrom($cleanData);

        // Domain Validation
        $this->validator->validate($tp);

        $this->repository->save($tp);

        // Dolibarr returns the updated object
        Flight::json($this->mapToDolibarr($tp->toArray(), self::API_MAP));
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

    // ── Bank Accounts ───────────────────────────────────

    public function getBankAccounts(int $id): void
    {
        $tp = $this->repository->findById($id);
        if ($tp === null) throw ThirdPartyNotFoundException::withId($id);
        if (!$this->bankAccountRepository) throw new \RuntimeException('BankAccountRepository is not configured.');

        $accounts = $this->bankAccountRepository->findByThirdPartyId($id);
        Flight::json(array_map(fn($acc) => $this->mapToDolibarr(
            $acc->toArray(),
            \App\Infrastructure\Persistence\Mysql\MysqlBankAccountRepository::COLUMN_MAP
        ), $accounts));
    }

    public function postBankAccount(int $id): void
    {
        $tp = $this->repository->findById($id);
        if ($tp === null) throw ThirdPartyNotFoundException::withId($id);
        if (!$this->bankAccountRepository) throw new \RuntimeException('BankAccountRepository is not configured.');

        $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
        $cleanData = $this->mapToClean($payload, \App\Infrastructure\Persistence\Mysql\MysqlBankAccountRepository::COLUMN_MAP);

        $account = new \App\Domain\ThirdParty\BankAccount(thirdPartyId: $id);
        $account->updateFrom($cleanData);
        $this->bankAccountRepository->save($account);

        Flight::json($account->getId(), 200);
    }

    public function putBankAccount(int $id, int $bankaccountId): void
    {
        $tp = $this->repository->findById($id);
        if ($tp === null) throw ThirdPartyNotFoundException::withId($id);
        if (!$this->bankAccountRepository) throw new \RuntimeException('BankAccountRepository is not configured.');

        $account = $this->bankAccountRepository->findById($bankaccountId);
        if ($account === null || $account->getThirdPartyId() !== $id) {
            Flight::halt(404, json_encode(['error' => 'Bank account not found or does not belong to this thirdparty']));
            return;
        }

        $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
        $cleanData = $this->mapToClean($payload, \App\Infrastructure\Persistence\Mysql\MysqlBankAccountRepository::COLUMN_MAP);

        $account->updateFrom($cleanData);
        $this->bankAccountRepository->save($account);

        Flight::json($this->mapToDolibarr($account->toArray(), \App\Infrastructure\Persistence\Mysql\MysqlBankAccountRepository::COLUMN_MAP));
    }

    public function deleteBankAccount(int $id, int $bankaccountId): void
    {
        $tp = $this->repository->findById($id);
        if ($tp === null) throw ThirdPartyNotFoundException::withId($id);
        if (!$this->bankAccountRepository) throw new \RuntimeException('BankAccountRepository is not configured.');

        $account = $this->bankAccountRepository->findById($bankaccountId);
        if ($account === null || $account->getThirdPartyId() !== $id) {
            Flight::halt(404, json_encode(['error' => 'Bank account not found or does not belong to this thirdparty']));
            return;
        }

        $this->bankAccountRepository->delete($bankaccountId);

        Flight::json([
            'success' => [
                'code' => 200,
                'message' => 'Object deleted',
            ],
        ]);
    }

    // ── Categories ──────────────────────────────────────

    public function getCategories(int $id): void
    {
        $tp = $this->repository->findById($id);
        if ($tp === null) throw ThirdPartyNotFoundException::withId($id);
        if (!$this->categoryRepository) throw new \RuntimeException('CategoryRepository is not configured.');

        // Customer type = 2
        $categories = $this->categoryRepository->findByThirdPartyId($id, 2);
        Flight::json(array_map(fn($cat) => $this->mapToDolibarr(
            $cat->toArray(),
            \App\Infrastructure\Persistence\Mysql\Category\MysqlThirdPartyCategoryRepository::CATEGORY_COLUMN_MAP
        ), $categories));
    }

    public function putCategory(int $id, int $categoryId): void
    {
        $tp = $this->repository->findById($id);
        if ($tp === null) throw ThirdPartyNotFoundException::withId($id);
        if (!$this->categoryRepository) throw new \RuntimeException('CategoryRepository is not configured.');

        $this->categoryRepository->linkCategory($id, $categoryId);
        Flight::json($this->mapToDolibarr($tp->toArray(), self::API_MAP));
    }

    public function deleteCategory(int $id, int $categoryId): void
    {
        $tp = $this->repository->findById($id);
        if ($tp === null) throw ThirdPartyNotFoundException::withId($id);
        if (!$this->categoryRepository) throw new \RuntimeException('CategoryRepository is not configured.');

        $this->categoryRepository->unlinkCategory($id, $categoryId);
        Flight::json($this->mapToDolibarr($tp->toArray(), self::API_MAP));
    }

    // ── Supplier Categories ─────────────────────────────

    public function getSupplierCategories(int $id): void
    {
        $tp = $this->repository->findById($id);
        if ($tp === null) throw ThirdPartyNotFoundException::withId($id);
        if (!$this->categoryRepository) throw new \RuntimeException('CategoryRepository is not configured.');

        // Supplier type = 1
        $categories = $this->categoryRepository->findByThirdPartyId($id, 1);
        Flight::json(array_map(fn($cat) => $this->mapToDolibarr(
            $cat->toArray(),
            \App\Infrastructure\Persistence\Mysql\Category\MysqlThirdPartyCategoryRepository::CATEGORY_COLUMN_MAP
        ), $categories));
    }

    public function putSupplierCategory(int $id, int $categoryId): void
    {
        $tp = $this->repository->findById($id);
        if ($tp === null) throw ThirdPartyNotFoundException::withId($id);
        if (!$this->categoryRepository) throw new \RuntimeException('CategoryRepository is not configured.');

        $this->categoryRepository->linkCategory($id, $categoryId);
        Flight::json($this->mapToDolibarr($tp->toArray(), self::API_MAP));
    }

    public function deleteSupplierCategory(int $id, int $categoryId): void
    {
        $tp = $this->repository->findById($id);
        if ($tp === null) throw ThirdPartyNotFoundException::withId($id);
        if (!$this->categoryRepository) throw new \RuntimeException('CategoryRepository is not configured.');

        $this->categoryRepository->unlinkCategory($id, $categoryId);
        Flight::json($this->mapToDolibarr($tp->toArray(), self::API_MAP));
    }

    // ── Representatives ─────────────────────────────

    public function getRepresentatives(int $id): void
    {
        $tp = $this->repository->findById($id);
        if ($tp === null) throw ThirdPartyNotFoundException::withId($id);
        if (!$this->representativeRepository) throw new \RuntimeException('RepresentativeRepository is not configured.');

        $users = $this->representativeRepository->findByThirdPartyId($id);
        Flight::json(array_map(fn($user) => $user->toArray(), $users));
    }

    public function putRepresentative(int $id, int $userId): void
    {
        $tp = $this->repository->findById($id);
        if ($tp === null) throw ThirdPartyNotFoundException::withId($id);
        if (!$this->representativeRepository) throw new \RuntimeException('RepresentativeRepository is not configured.');

        $this->representativeRepository->linkRepresentative($id, $userId);
        Flight::json($this->mapToDolibarr($tp->toArray(), self::API_MAP));
    }

    public function deleteRepresentative(int $id, int $userId): void
    {
        $tp = $this->repository->findById($id);
        if ($tp === null) throw ThirdPartyNotFoundException::withId($id);
        if (!$this->representativeRepository) throw new \RuntimeException('RepresentativeRepository is not configured.');

        $this->representativeRepository->unlinkRepresentative($id, $userId);
        Flight::json($this->mapToDolibarr($tp->toArray(), self::API_MAP));
    }

    // ── Utilities ─────────────────────────────

    public function generateBankAccountDocument(int $id, int $companybankid, string $model = 'sepamandate'): void
    {
        Flight::json([
            'error' => [
                'code' => 501,
                'message' => 'PDF generation is not yet ported to Hexagonal Architecture (Pending Phase 3)',
            ],
        ], 501);
    }

    public function merge(int $id, int $idtodelete): void
    {
        Flight::json([
            'error' => [
                'code' => 501,
                'message' => 'ThirdParty Merge feature requires cross-domain orchestration not yet available (Pending Phase 3)',
            ],
        ], 501);
    }
}
