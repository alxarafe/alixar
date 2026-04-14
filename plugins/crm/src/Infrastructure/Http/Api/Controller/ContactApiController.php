<?php

declare(strict_types=1);

namespace Plugin\Crm\Infrastructure\Http\Api\Controller;

use Plugin\Crm\Domain\Contact\Contact;
use Plugin\Crm\Domain\Contact\ContactNotFoundException;
use Plugin\Crm\Domain\Contact\ContactRepository;
use Flight;

/**
 * ContactApiController — Dolibarr-compatible contacts API.
 *
 *   GET    /api/contacts        → list
 *   GET    /api/contacts/{id}   → show
 *   POST   /api/contacts        → create
 *   PUT    /api/contacts/{id}   → update
 *   DELETE /api/contacts/{id}   → delete
 */
class ContactApiController
{
    use \Plugin\DolibarrCompat\Infrastructure\DolibarrMappingTrait;

    private const API_MAP = [
        'thirdPartyId' => 'socid',
        'jobTitle' => 'poste',
        'phone' => 'phone_pro',
        'phonePerso' => 'phone_perso',
        'phoneMobile' => 'phone_mobile',
        'countryId' => 'fk_pays',
        'address' => 'address',
        'zip' => 'zip',
        'town' => 'town',
        'email' => 'email',
        'notePrivate' => 'note_private',
        'notePublic' => 'note_public',
        'isPrivate' => 'priv',
    ];

    public function __construct(
        private ContactRepository $repository,
        private ?\Plugin\Crm\Domain\Category\ContactCategoryRepository $categoryRepository = null,
    ) {
    }

    private function mapResponse(Contact $contact): array
    {
        $data = $this->mapToDolibarr($contact->toArray(), self::API_MAP);
        $data['status'] = "1";
        return $data;
    }

    public function list(): void
    {
        $limit = (int) ($_GET['limit'] ?? 100);
        $page = (int) ($_GET['page'] ?? 0);
        $offset = $page * $limit;
        $sortField = $_GET['sortfield'] ?? 't.rowid';
        $sortOrder = $_GET['sortorder'] ?? 'ASC';

        $filters = [];
        if (!empty($_GET['thirdparty_ids'])) {
            $filters['thirdparty_ids'] = $_GET['thirdparty_ids'];
        }

        $results = $this->repository->findAll($filters, $limit, $offset, $sortField, $sortOrder);

        Flight::json(array_map(fn(Contact $c) => $this->mapResponse($c), $results));
    }

    public function show(int $id): void
    {
        $contact = $this->repository->findById($id);

        if ($contact === null) {
            throw ContactNotFoundException::withId($id);
        }

        Flight::json($this->mapResponse($contact));
    }

    public function create(): void
    {
        $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
        // Map alternative valid fields that might be passed incorrectly in tests
        if (isset($payload['fk_soc']) && !isset($payload['socid'])) {
            $payload['socid'] = $payload['fk_soc'];
        }
        $cleanData = $this->mapToClean($payload, self::API_MAP);

        $contact = new Contact(
            lastname: (string) ($cleanData['lastname'] ?? ''),
            firstname: isset($cleanData['firstname']) ? (string) $cleanData['firstname'] : null,
            thirdPartyId: isset($cleanData['thirdPartyId']) && $cleanData['thirdPartyId'] ? (int) $cleanData['thirdPartyId'] : null,
        );

        $contact->updateFrom($cleanData);
        $this->repository->save($contact);

        // Dolibarr devuelve el ID como entero
        Flight::json($contact->getId(), 200);
    }

    public function update(int $id): void
    {
        $contact = $this->repository->findById($id);

        if ($contact === null) {
            throw ContactNotFoundException::withId($id);
        }

        $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
        if (isset($payload['fk_soc']) && !isset($payload['socid'])) {
            $payload['socid'] = $payload['fk_soc'];
        }
        $cleanData = $this->mapToClean($payload, self::API_MAP);
        
        $contact->updateFrom($cleanData);
        $this->repository->save($contact);

        Flight::json($this->mapResponse($contact));
    }

    public function destroy(int $id): void
    {
        $contact = $this->repository->findById($id);

        if ($contact === null) {
            throw ContactNotFoundException::withId($id);
        }

        $this->repository->delete($id);

        Flight::json([
            'success' => [
                'code' => 200,
                'message' => 'Object deleted',
            ],
        ]);
    }

    // ── Extras & Utilities ──────────────────────────

    public function getByEmail(string $email): void
    {
        $contact = $this->repository->findByEmail($email);
        if ($contact === null) {
            throw ContactNotFoundException::withEmail($email);
        }

        Flight::json($this->mapResponse($contact));
    }

    public function createUser(int $id): void
    {
        Flight::json([
            'error' => [
                'code' => 501,
                'message' => 'User orchestration is pending Phase 3 rollout in Hexagonal Architecture',
            ],
        ], 501);
    }

    // ── Categories ──────────────────────────────────────

    public function getCategories(int $id): void
    {
        $contact = $this->repository->findById($id);
        if ($contact === null) throw ContactNotFoundException::withId($id);
        if (!$this->categoryRepository) throw new \RuntimeException('CategoryRepository is not configured.');

        $categories = $this->categoryRepository->findByContactId($id);
        Flight::json(array_map(fn(\Plugin\Business\Domain\Category\Category $cat) => $this->mapToDolibarr(
            $cat->toArray(),
            \Plugin\DolibarrCompat\Infrastructure\Persistence\Mysql\Crm\DolibarrMysqlContactCategoryRepository::CATEGORY_COLUMN_MAP
        ), $categories));
    }

    public function putCategory(int $id, int $categoryId): void
    {
        $contact = $this->repository->findById($id);
        if ($contact === null) throw ContactNotFoundException::withId($id);
        if (!$this->categoryRepository) throw new \RuntimeException('CategoryRepository is not configured.');

        $this->categoryRepository->linkCategory($id, $categoryId);
        Flight::json($this->mapResponse($contact));
    }

    public function deleteCategory(int $id, int $categoryId): void
    {
        $contact = $this->repository->findById($id);
        if ($contact === null) throw ContactNotFoundException::withId($id);
        if (!$this->categoryRepository) throw new \RuntimeException('CategoryRepository is not configured.');

        $this->categoryRepository->unlinkCategory($id, $categoryId);
        Flight::json($this->mapResponse($contact));
    }
}
