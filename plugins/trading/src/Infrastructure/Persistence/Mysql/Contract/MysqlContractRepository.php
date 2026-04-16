<?php

declare(strict_types=1);

namespace Plugin\Trading\Infrastructure\Persistence\Mysql\Contract;

use Plugin\Trading\Domain\Contract\Contract;
use Plugin\Trading\Domain\Contract\ContractLine;
use Plugin\Trading\Domain\Contract\ContractRepository;
use Plugin\Trading\Infrastructure\Persistence\Mysql\Shared\AbstractMysqlTradingRepository;
use PDO;

class MysqlContractRepository extends AbstractMysqlTradingRepository implements ContractRepository
{
    private string $table = 'contracts';
    private string $lineTable = 'contract_lines';
    private string $fkColumn = 'contract_id';

    public function findAll(array $filters = [], int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array
    {
        if ($sortField === 'rowid' || $sortField === 't.rowid') $sortField = 'id';
        $sortOrder = strtoupper($sortOrder) === 'DESC' ? 'DESC' : 'ASC';

        list($whereSql, $params) = $this->buildWhere($filters);
        
        $sql = sprintf(
            'SELECT * FROM %s %s ORDER BY %s %s LIMIT %d OFFSET %d',
            $this->table, $whereSql, $sortField, $sortOrder, $limit, $offset
        );
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($params);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
        
        return array_map(fn($row) => $this->mapRow($row), $rows);
    }

    private function buildWhere(array $filters): array
    {
        $sqls = [];
        $params = [];
        if (!empty($filters['thirdparty_ids'])) {
            $ids = explode(',', $filters['thirdparty_ids']);
            $idPlaceholders = [];
            foreach ($ids as $i => $id) {
                $idPlaceholders[] = ':tp' . $i;
                $params['tp' . $i] = (int) trim($id);
            }
            $sqls[] = 'third_party_id IN (' . implode(',', $idPlaceholders) . ')';
        }
        if (isset($filters['status']) && $filters['status'] !== '') {
            $sqls[] = 'status = :status';
            $params['status'] = (int) $filters['status'];
        }
        return [$sqls ? 'WHERE ' . implode(' AND ', $sqls) : '', $params];
    }

    public function findById(int $id): ?Contract
    {
        $row = $this->findByIdBase($id, $this->table);
        if (!$row) return null;
        $contract = $this->mapRow($row);
        
        // Lazy-load lines
        $lines = $this->findLinesByContractId($id);
        foreach ($lines as $line) {
            $contract->addLine($line);
        }
        return $contract;
    }

    public function findByRef(string $ref): ?Contract
    {
        $row = $this->findByRefBase($ref, $this->table);
        return $row ? $this->findById((int) $row['id']) : null;
    }

    public function save(Contract $contract): void
    {
        $data = $this->camelToSnake($contract->toArray());
        unset($data['lines']);
        
        if ($contract->getId() === null) {
            unset($data['id']);
            $columns = array_keys($data);
            $placeholders = array_map(fn($c) => ':' . $c, $columns);
            $sql = sprintf('INSERT INTO %s (%s) VALUES (%s)', $this->table, implode(', ', $columns), implode(', ', $placeholders));
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($data);
            $contract->setId((int) $this->pdo->lastInsertId());
        } else {
            $id = $data['id'];
            unset($data['id'], $data['created_at']);
            $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($data));
            $sql = sprintf('UPDATE %s SET %s WHERE id = :id', $this->table, implode(', ', $sets));
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['id' => $id] + $data);
        }
    }

    public function delete(int $id): void
    {
        $this->pdo->prepare('DELETE FROM ' . $this->lineTable . ' WHERE ' . $this->fkColumn . ' = ?')->execute([$id]);
        $this->deleteBase($id, $this->table);
    }

    // ── Lines ────────────────────────────────────────────

    public function findLinesByContractId(int $contractId): array
    {
        $rows = $this->getLinesBase($contractId, $this->lineTable, $this->fkColumn);
        return array_map(fn($row) => $this->mapLineRow($row), $rows);
    }

    public function findLineById(int $id): ?ContractLine
    {
        $row = $this->findByIdBase($id, $this->lineTable);
        return $row ? $this->mapLineRow($row) : null;
    }

    public function saveLine(ContractLine $line): void
    {
        $data = $this->camelToSnake($line->toArray());
        
        if ($line->getId() === null) {
            unset($data['id']);
            $columns = array_keys($data);
            $placeholders = array_map(fn($c) => ':' . $c, $columns);
            $sql = sprintf('INSERT INTO %s (%s) VALUES (%s)', $this->lineTable, implode(', ', $columns), implode(', ', $placeholders));
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($data);
            $line->setId((int) $this->pdo->lastInsertId());
        } else {
            $id = $data['id'];
            unset($data['id']);
            $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($data));
            $sql = sprintf('UPDATE %s SET %s WHERE id = :id', $this->lineTable, implode(', ', $sets));
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['id' => $id] + $data);
        }
    }

    public function deleteLine(int $lineId): void
    {
        $this->deleteBase($lineId, $this->lineTable);
    }

    private function mapRow(array $row): Contract
    {
        $data = [];
        foreach ($row as $k => $v) {
            $camelKeys = lcfirst(str_replace(' ', '', ucwords(str_replace('_', ' ', $k))));
            $data[$camelKeys] = $v;
        }
        return Contract::fromArray($data + ['id' => $row['id']]);
    }

    private function mapLineRow(array $row): ContractLine
    {
        $data = [];
        foreach ($row as $k => $v) {
            $camelKeys = lcfirst(str_replace(' ', '', ucwords(str_replace('_', ' ', $k))));
            $data[$camelKeys] = $v;
        }
        return ContractLine::fromArray($data + ['id' => $row['id']]);
    }
}
