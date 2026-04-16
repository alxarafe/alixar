<?php

declare(strict_types=1);

namespace Plugin\Hr\Infrastructure\Persistence\Mysql;

use Plugin\Hr\Domain\ExpenseReport\ExpenseReport;
use Plugin\Hr\Domain\ExpenseReport\ExpenseReportRepository;

class MysqlExpenseReportRepository implements ExpenseReportRepository
{
    private string $tableName;

    public function __construct(
        private \PDO $pdo,
        string $prefix = ''
    ) {
        $this->tableName = $prefix . 'expense_reports';
    }

    public function findById(int $id): ?ExpenseReport
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->tableName} WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch();

        if (!$row) {
            return null;
        }

        return $this->mapRowToEntity($row);
    }

    public function findByRef(string $ref): ?ExpenseReport
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->tableName} WHERE ref = :ref");
        $stmt->execute(['ref' => $ref]);
        $row = $stmt->fetch();

        if (!$row) {
            return null;
        }

        return $this->mapRowToEntity($row);
    }

    public function count(array $criteria = []): int
    {
        $stmt = $this->pdo->query("SELECT COUNT(*) FROM {$this->tableName}");
        return (int) $stmt->fetchColumn();
    }

    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array
    {
        $allowedFields = ['id', 'ref', 'user_id', 'status', 'date_creation'];
        if (!in_array($sortField, $allowedFields)) {
            $sortField = 'id';
        }
        $sortOrder = strtoupper($sortOrder) === 'DESC' ? 'DESC' : 'ASC';

        $stmt = $this->pdo->prepare("SELECT * FROM {$this->tableName} ORDER BY {$sortField} {$sortOrder} LIMIT :limit OFFSET :offset");
        $stmt->bindValue(':limit', $limit, \PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, \PDO::PARAM_INT);
        $stmt->execute();

        $results = [];
        while ($row = $stmt->fetch()) {
            $results[] = $this->mapRowToEntity($row);
        }

        return $results;
    }

    public function save(ExpenseReport $expenseReport): void
    {
        if ($expenseReport->getId() === null) {
            $this->insert($expenseReport);
        } else {
            $this->update($expenseReport);
        }
    }

    public function delete(int $id): void
    {
        $stmt = $this->pdo->prepare("DELETE FROM {$this->tableName} WHERE id = :id");
        $stmt->execute(['id' => $id]);
    }

    private function insert(ExpenseReport $item): void
    {
        $sql = "INSERT INTO {$this->tableName} 
                (ref, user_id, status, date_creation, date_start, date_end, note_private, note_public, amount_total, amount_to_pay, project_id, fk_user_author, fk_user_validator) 
                VALUES 
                (:ref, :user_id, :status, :date_creation, :date_start, :date_end, :note_private, :note_public, :amount_total, :amount_to_pay, :project_id, :fk_user_author, :fk_user_validator)";

        $stmt = $this->pdo->prepare($sql);
        $params = $this->extractParams($item);
        $stmt->execute($params);

        $item->setId((int)$this->pdo->lastInsertId());
    }

    private function update(ExpenseReport $item): void
    {
        $sql = "UPDATE {$this->tableName} SET 
                ref = :ref, user_id = :user_id, status = :status, date_creation = :date_creation, date_start = :date_start, date_end = :date_end, 
                note_private = :note_private, note_public = :note_public, amount_total = :amount_total, amount_to_pay = :amount_to_pay, 
                project_id = :project_id, fk_user_author = :fk_user_author, fk_user_validator = :fk_user_validator
                WHERE id = :id";

        $stmt = $this->pdo->prepare($sql);
        $params = $this->extractParams($item);
        $params['id'] = $item->getId();
        $stmt->execute($params);
    }

    private function mapRowToEntity(array $row): ExpenseReport
    {
        return ExpenseReport::fromArray([
            'id' => (int) $row['id'],
            'ref' => $row['ref'],
            'userId' => (int) $row['user_id'],
            'status' => (int) $row['status'],
            'dateCreation' => $row['date_creation'],
            'dateStart' => $row['date_start'],
            'dateEnd' => $row['date_end'],
            'notePrivate' => $row['note_private'],
            'notePublic' => $row['note_public'],
            'amountTotal' => (float) $row['amount_total'],
            'amountToPay' => (float) $row['amount_to_pay'],
            'projectId' => $row['project_id'],
            'fkUserAuthor' => $row['fk_user_author'],
            'fkUserValidator' => $row['fk_user_validator']
        ]);
    }

    private function extractParams(ExpenseReport $item): array
    {
        return [
            'ref' => $item->getRef(),
            'user_id' => $item->getUserId(),
            'status' => 0, // Defaults
            'date_creation' => $item->toArray()['dateCreation'] ?? null,
            'date_start' => $item->toArray()['dateStart'] ?? null,
            'date_end' => $item->toArray()['dateEnd'] ?? null,
            'note_private' => $item->toArray()['notePrivate'] ?? null,
            'note_public' => $item->toArray()['notePublic'] ?? null,
            'amount_total' => $item->toArray()['amountTotal'] ?? 0.0,
            'amount_to_pay' => $item->toArray()['amountToPay'] ?? 0.0,
            'project_id' => $item->toArray()['projectId'] ?? null,
            'fk_user_author' => $item->toArray()['fkUserAuthor'] ?? null,
            'fk_user_validator' => $item->toArray()['fkUserValidator'] ?? null,
        ];
    }
}
