<?php

declare(strict_types=1);

namespace App\Infrastructure\Http\Api\Controller;

use App\Domain\Contact\Contact;
use App\Domain\Contact\ContactNotFoundException;
use App\Domain\Contact\ContactRepository;
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
    public function __construct(
        private ContactRepository $repository,
    ) {}

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

        Flight::json(array_map(fn(Contact $c) => $c->toApiArray(), $results));
    }

    public function show(int $id): void
    {
        $contact = $this->repository->findById($id);

        if ($contact === null) {
            throw ContactNotFoundException::withId($id);
        }

        Flight::json($contact->toApiArray());
    }

    public function create(): void
    {
        $data = json_decode(file_get_contents('php://input'), true) ?? [];

        $contact = new Contact(
            lastname: $data['lastname'] ?? '',
            firstname: $data['firstname'] ?? null,
            thirdPartyId: isset($data['fk_soc']) && $data['fk_soc'] ? (int) $data['fk_soc'] : null,
        );

        $contact->updateFrom($data);
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

        $data = json_decode(file_get_contents('php://input'), true) ?? [];
        $contact->updateFrom($data);
        $this->repository->save($contact);

        Flight::json($contact->toApiArray());
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
}
