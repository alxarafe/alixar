<?php

declare(strict_types=1);

namespace Plugin\Interventions\Infrastructure\Http\Api\Controller;

use Core\Domain\Exception\DomainValidationException;
use Plugin\Interventions\Domain\Intervention\Intervention;
use Plugin\Interventions\Domain\Intervention\InterventionRepository;

class InterventionApiController
{
    public function __construct(
        private InterventionRepository $repository
    ) {
    }

    public function list(): void
    {
        $limit = isset($_GET['limit']) ? (int) $_GET['limit'] : 100;
        $offset = isset($_GET['offset']) ? (int) $_GET['offset'] : 0;
        $sortField = isset($_GET['sortField']) ? (string) $_GET['sortField'] : 'id';
        $sortOrder = isset($_GET['sortOrder']) ? (string) $_GET['sortOrder'] : 'ASC';

        $items = $this->repository->findAll($limit, $offset, $sortField, $sortOrder);
        \Flight::json(array_map(fn($o) => $o->toArray(), $items));
    }

    public function show(string $id): void
    {
        $item = $this->repository->findById((int) $id);
        if (!$item) {
            \Flight::json(['error' => 'Intervention not found'], 404);
            return;
        }

        \Flight::json($item->toArray());
    }

    public function create(): void
    {
        $data = \Flight::request()->data->getData();
        
        if (!isset($data['thirdPartyId'])) {
            throw new DomainValidationException(['thirdPartyId' => 'Missing required fields'], 'Invalid intervention data');
        }

        $item = Intervention::fromArray($data);
        $this->repository->save($item);

        \Flight::json($item->toArray(), 201);
    }

    public function update(string $id): void
    {
        $item = $this->repository->findById((int) $id);
        if (!$item) {
            \Flight::json(['error' => 'Intervention not found'], 404);
            return;
        }

        $data = \Flight::request()->data->getData();
        $updatedItem = Intervention::fromArray(array_merge($item->toArray(), $data));
        $updatedItem->setId((int) $id);
        $this->repository->save($updatedItem);

        \Flight::json($updatedItem->toArray());
    }

    public function destroy(string $id): void
    {
        $this->repository->delete((int) $id);
        \Flight::json(['success' => true]);
    }
}
