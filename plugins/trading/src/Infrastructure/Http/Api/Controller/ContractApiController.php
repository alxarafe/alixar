<?php

declare(strict_types=1);

namespace Plugin\Trading\Infrastructure\Http\Api\Controller;

use Flight;
use Plugin\Trading\Domain\Contract\Contract;
use Plugin\Trading\Domain\Contract\ContractLine;
use Plugin\Trading\Domain\Contract\ContractRepository;

class ContractApiController
{
    public function __construct(private ContractRepository $repository)
    {
    }

    public function list(): void
    {

        
        $limit = (int) (Flight::request()->query['limit'] ?? 100);
        $offset = (int) (Flight::request()->query['offset'] ?? 0);
        $sortField = Flight::request()->query['sortfield'] ?? 'id';
        $sortOrder = Flight::request()->query['sortorder'] ?? 'ASC';

        $filters = [];
        if (isset(Flight::request()->query['thirdparty_ids'])) {
            $filters['thirdparty_ids'] = Flight::request()->query['thirdparty_ids'];
        }

        $contracts = $this->repository->findAll($filters, $limit, $offset, $sortField, $sortOrder);
        Flight::json(array_map(fn($c) => $c->toArray(), $contracts));
    }

    public function show(int $id): void
    {

        $contract = $this->repository->findById($id);
        if (!$contract) {
            Flight::json(['error' => 'Not found'], 404);
            return;
        }
        Flight::json($contract->toArray());
    }

    public function create(): void
    {

        $data = Flight::request()->data->getData();
        try {
            $contract = Contract::fromArray($data);
            $this->repository->save($contract);
            Flight::json(['id' => $contract->getId()], 201);
        } catch (\Exception $e) {
            Flight::json(['error' => $e->getMessage()], 400);
        }
    }

    public function update(int $id): void
    {

        $contract = $this->repository->findById($id);
        if (!$contract) {
            Flight::json(['error' => 'Not found'], 404);
            return;
        }

        $data = Flight::request()->data->getData();
        $contract->updateFrom($data);
        $this->repository->save($contract);
        Flight::json($contract->toArray());
    }

    public function destroy(int $id): void
    {

        $this->repository->delete($id);
        Flight::json(['success' => true]);
    }

    // --- Lines ---
    
    public function getLines(int $id): void
    {

        $lines = $this->repository->findLinesByContractId($id);
        Flight::json(array_map(fn($l) => $l->toArray(), $lines));
    }

    public function postLine(int $id): void
    {

        $contract = $this->repository->findById($id);
        if (!$contract) {
            Flight::json(['error' => 'Contract Not found'], 404);
            return;
        }

        $data = Flight::request()->data->getData();
        $data['contractId'] = $id;

        try {
            $line = ContractLine::fromArray($data);
            $this->repository->saveLine($line);
            Flight::json(['id' => $line->getId()], 201);
        } catch (\Exception $e) {
            Flight::json(['error' => $e->getMessage()], 400);
        }
    }

    public function putLine(int $id, int $lineId): void
    {

        $line = $this->repository->findLineById($lineId);
        if (!$line || $line->toArray()['contractId'] !== $id) {
            Flight::json(['error' => 'Line Not found'], 404);
            return;
        }

        $data = Flight::request()->data->getData();
        $line->updateFrom($data);
        $this->repository->saveLine($line);
        Flight::json($line->toArray());
    }

    public function deleteLine(int $id, int $lineId): void
    {
        $this->repository->deleteLine($lineId);
        Flight::json(['success' => true]);
    }
}
