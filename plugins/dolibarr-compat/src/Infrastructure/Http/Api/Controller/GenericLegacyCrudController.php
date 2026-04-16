<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Controller;

use Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper\AbstractLegacyMapper;

class GenericLegacyCrudController
{
    private bool $findAllHasFiltersParam;

    /**
     * @param object $repository The native repository with findById, findAll, save, delete methods.
     * @param AbstractLegacyMapper $mapper The legacy mapper for translation.
     * @param string $entityClass The native Domain class to reconstruct (e.g. Shipment::class)
     */
    public function __construct(
        private object $repository,
        private AbstractLegacyMapper $mapper,
        private string $entityClass
    ) {
        // Detect if findAll() expects (array $filters, ...) or (int $limit, ...)
        $this->findAllHasFiltersParam = false;
        try {
            $ref = new \ReflectionMethod($repository, 'findAll');
            $params = $ref->getParameters();
            if (count($params) > 0) {
                $firstType = $params[0]->getType();
                if ($firstType instanceof \ReflectionNamedType && $firstType->getName() === 'array') {
                    $this->findAllHasFiltersParam = true;
                }
            }
        } catch (\ReflectionException $e) {
            // Fallback: no filters param
        }
    }

    public function list(): void
    {
        $limit = isset($_GET['limit']) ? (int) $_GET['limit'] : 100;
        $offset = isset($_GET['page']) ? (int) $_GET['page'] * $limit : 0;

        if ($this->findAllHasFiltersParam) {
            $items = $this->repository->findAll([], $limit, $offset, 'id', 'ASC');
        } else {
            $items = $this->repository->findAll($limit, $offset, 'id', 'ASC');
        }

        $legacyItems = array_map(fn($item) => $this->mapper->toLegacy($item), $items);
        
        \Flight::json($legacyItems);
    }

    public function show(string $id): void
    {
        $item = $this->repository->findById((int) $id);
        if (!$item) {
            \Flight::json(['error' => 'not found'], 404);
            return;
        }

        \Flight::json($this->mapper->toLegacy($item));
    }

    public function create(): void
    {
        $legacyPayload = \Flight::request()->data->getData();
        $nativePayload = $this->mapper->toNative($legacyPayload);

        $entityClass = $this->entityClass;
        $entity = call_user_func([$entityClass, 'fromArray'], $nativePayload);
        $this->repository->save($entity);

        // Dolibarr POST returns just the numeric ID
        \Flight::json($entity->getId(), 201);
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
        
        $entityClass = $this->entityClass;
        $updatedEntity = call_user_func([$entityClass, 'fromArray'], $mergedData);
        $updatedEntity->setId((int) $id);

        $this->repository->save($updatedEntity);

        \Flight::json($this->mapper->toLegacy($updatedEntity));
    }

    public function destroy(string $id): void
    {
        $this->repository->delete((int) $id);
        \Flight::json(['success' => true]);
    }
}
