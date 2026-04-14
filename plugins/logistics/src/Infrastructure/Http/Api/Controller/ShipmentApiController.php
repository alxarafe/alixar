<?php

declare(strict_types=1);

namespace Plugin\Logistics\Infrastructure\Http\Api\Controller;

use Core\Domain\Exception\DomainValidationException;
use Plugin\Logistics\Domain\Shipment\Shipment;
use Plugin\Logistics\Domain\Shipment\ShipmentRepository;

class ShipmentApiController
{
    public function __construct(
        private ShipmentRepository $repository
    ) {
    }

    public function list(): void
    {
        $limit = isset($_GET['limit']) ? (int) $_GET['limit'] : 100;
        $offset = isset($_GET['offset']) ? (int) $_GET['offset'] : 0;
        $sortField = isset($_GET['sortField']) ? (string) $_GET['sortField'] : 'id';
        $sortOrder = isset($_GET['sortOrder']) ? (string) $_GET['sortOrder'] : 'ASC';

        $items = $this->repository->findAll($limit, $offset, $sortField, $sortOrder);
        // FIXME: \Flight doesn't work well without fully qualified names or global usage
        // so we use the global \Flight helper
        \Flight::json(array_map(fn($o) => $o->toArray(), $items));
    }

    public function show(string $id): void
    {
        $item = $this->repository->findById((int) $id);
        if (!$item) {
            \Flight::json(['error' => 'Shipment not found'], 404);
            return;
        }

        \Flight::json($item->toArray());
    }

    public function create(): void
    {
        $data = \Flight::request()->data->getData();
        
        if (!isset($data['thirdPartyId'])) {
            throw new DomainValidationException(['thirdPartyId' => 'Missing required fields'], 'Invalid shipment data');
        }

        $item = Shipment::fromArray($data);
        $this->repository->save($item);

        \Flight::json($item->toArray(), 201);
    }

    public function update(string $id): void
    {
        $item = $this->repository->findById((int) $id);
        if (!$item) {
            \Flight::json(['error' => 'Shipment not found'], 404);
            return;
        }

        $data = \Flight::request()->data->getData();
        $updatedItem = Shipment::fromArray(array_merge($item->toArray(), $data));
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
