<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller;

use Plugin\Hr\Domain\ExpenseReport\ExpenseReport;
use Plugin\Hr\Domain\ExpenseReport\ExpenseReportRepository;
use Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\ExpenseReportLegacyMapper;

class LegacyExpenseReportApiController
{
    public function __construct(
        private ExpenseReportRepository $repository,
        private ExpenseReportLegacyMapper $mapper
    ) {
    }

    public function list(): void
    {
        $limit = isset($_GET['limit']) ? (int) $_GET['limit'] : 100;
        $offset = isset($_GET['page']) ? (int) $_GET['page'] * $limit : 0; // Dolibarr compat often uses page or offset

        $items = $this->repository->findAll($limit, $offset, 'id', 'ASC');
        $legacyItems = array_map(fn($item) => $this->mapper->toLegacy($item->toArray()), $items);
        
        \Flight::json($legacyItems);
    }

    public function show(string $id): void
    {
        $item = $this->repository->findById((int) $id);
        if (!$item) {
            \Flight::json(['error' => 'not found'], 404);
            return;
        }

        \Flight::json($this->mapper->toLegacy($item->toArray()));
    }

    public function create(): void
    {
        $legacyPayload = \Flight::request()->data->getData();
        $nativePayload = $this->mapper->toNative($legacyPayload);

        $entity = ExpenseReport::fromArray($nativePayload);
        $this->repository->save($entity);

        \Flight::json($this->mapper->toLegacy($entity->toArray()), 201);
    }

    public function update(string $id): void
    {
        $item = $this->repository->findById((int) $id);
        if (!$item) {
            \Flight::json(['error' => 'not found'], 404);
            return;
        }

        $legacyPayload = \Flight::request()->data->getData();
        $nativePayload = $this->mapper->toNative($legacyPayload);

        $mergedData = array_merge($item->toArray(), $nativePayload);
        $updatedEntity = ExpenseReport::fromArray($mergedData);
        $updatedEntity->setId((int) $id);

        $this->repository->save($updatedEntity);

        \Flight::json($this->mapper->toLegacy($updatedEntity->toArray()));
    }

    public function destroy(string $id): void
    {
        $this->repository->delete((int) $id);
        \Flight::json(['success' => true]);
    }
}
