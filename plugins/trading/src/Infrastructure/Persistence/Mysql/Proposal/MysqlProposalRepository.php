<?php

declare(strict_types=1);

namespace Plugin\Trading\Infrastructure\Persistence\Mysql\Proposal;

use Plugin\Trading\Domain\Proposal\Proposal;
use Plugin\Trading\Domain\Proposal\ProposalRepository;
use Plugin\Trading\Infrastructure\Persistence\Mysql\Shared\AbstractMysqlTradingRepository;
use PDO;

class MysqlProposalRepository extends AbstractMysqlTradingRepository implements ProposalRepository
{
    private string $table = 'proposals';
    private string $lineTable = 'proposal_lines';
    private string $contactTable = 'proposal_contacts';
    private string $fkColumn = 'proposal_id';

    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array
    {
        if ($sortField === 'rowid' || $sortField === 't.rowid') $sortField = 'id';
        $sortOrder = strtoupper($sortOrder) === 'DESC' ? 'DESC' : 'ASC';

        $sql = sprintf(
            'SELECT * FROM %s ORDER BY %s %s LIMIT %d OFFSET %d',
            $this->table, $sortField, $sortOrder, $limit, $offset
        );
        $stmt = $this->pdo->query($sql);
        $rows = $stmt ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];
        return array_map(fn($row) => $this->mapRow($row), $rows);
    }

    public function count(array $criteria = []): int
    {
        $stmt = $this->pdo->query('SELECT COUNT(*) FROM ' . $this->table);
        return (int) ($stmt ? $stmt->fetchColumn() : 0);
    }

    public function findById(int $id): ?Proposal
    {
        $row = $this->findByIdBase($id, $this->table);
        return $row ? $this->mapRow($row) : null;
    }

    public function findByRef(string $ref): ?Proposal
    {
        $row = $this->findByRefBase($ref, $this->table);
        return $row ? $this->mapRow($row) : null;
    }

    public function save(Proposal $proposal): void
    {
        $data = $this->camelToSnake($proposal->toArray());
        
        if ($proposal->getId() === null) {
            unset($data['id']);
            $columns = array_keys($data);
            $placeholders = array_map(fn($c) => ':' . $c, $columns);
            $sql = sprintf('INSERT INTO %s (%s) VALUES (%s)', $this->table, implode(', ', $columns), implode(', ', $placeholders));
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($data);
            $proposal->setId((int) $this->pdo->lastInsertId());
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
        // First delete relationships
        $this->pdo->prepare('DELETE FROM ' . $this->lineTable . ' WHERE ' . $this->fkColumn . ' = ?')->execute([$id]);
        $this->pdo->prepare('DELETE FROM ' . $this->contactTable . ' WHERE ' . $this->fkColumn . ' = ?')->execute([$id]);
        $this->deleteBase($id, $this->table);
    }

    // Lines
    public function getLines(int $proposalId): array
    {
        return $this->getLinesBase($proposalId, $this->lineTable, $this->fkColumn);
    }
    public function addLine(int $proposalId, array $data): void
    {
        $this->addLineBase($proposalId, $this->camelToSnake($data), $this->lineTable, $this->fkColumn);
    }
    public function updateLine(int $proposalId, int $lineId, array $data): void
    {
        $this->updateLineBase($proposalId, $lineId, $this->camelToSnake($data), $this->lineTable, $this->fkColumn);
    }
    public function deleteLine(int $proposalId, int $lineId): void
    {
        $this->deleteLineBase($proposalId, $lineId, $this->lineTable, $this->fkColumn);
    }

    // Contacts
    public function getContacts(int $proposalId, string $type = ''): array
    {
        return $this->getContactsBase($proposalId, $this->contactTable, $this->fkColumn, $type);
    }
    public function addContact(int $proposalId, int $contactId, string $type): void
    {
        $this->addContactBase($proposalId, $contactId, $type, $this->contactTable, $this->fkColumn);
    }
    public function deleteContact(int $proposalId, int $contactId, string $type): void
    {
        $this->deleteContactBase($proposalId, $contactId, $type, $this->contactTable, $this->fkColumn);
    }

    private function mapRow(array $row): Proposal
    {
        $data = [];
        foreach ($row as $k => $v) {
            // snake_case to camelCase
            $camelKeys = lcfirst(str_replace(' ', '', ucwords(str_replace('_', ' ', $k))));
            $data[$camelKeys] = $v;
        }
        return Proposal::fromArray($data + ['id' => $row['id']]);
    }
}
