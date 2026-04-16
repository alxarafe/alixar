<?php

declare(strict_types=1);

namespace Plugin\Finance\Infrastructure\Persistence\Mysql\Payment;

use PDO;
use Plugin\Finance\Domain\Payment\Payment;
use Plugin\Finance\Domain\Payment\PaymentRepository;

class MysqlPaymentRepository implements PaymentRepository
{
    private string $table = 'payments';

    public function __construct(private PDO $pdo)
    {
    }

    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array
    {
        $sortField = $sortField === 'rowid' ? 'id' : $sortField;
        $sql = "SELECT * FROM {$this->table} ORDER BY {$sortField} {$sortOrder} LIMIT {$limit} OFFSET {$offset}";
        $stmt = $this->pdo->query($sql);

        $results = [];
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $results[] = $this->mapRowToEntity($row);
        }

        return $results;
    }

    public function count(array $criteria = []): int
    {
        $stmt = $this->pdo->query("SELECT COUNT(*) FROM {$this->table}");
        return (int) $stmt->fetchColumn();
    }

    public function findById(int $id): ?Payment
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table} WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) {
            return null;
        }

        return $this->mapRowToEntity($row);
    }

    public function findByRef(string $ref): ?Payment
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table} WHERE ref = :ref");
        $stmt->execute(['ref' => $ref]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) {
            return null;
        }

        return $this->mapRowToEntity($row);
    }
    
    public function findByInvoiceId(int $invoiceId): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table} WHERE invoice_id = :invoiceId");
        $stmt->execute(['invoiceId' => $invoiceId]);
        
        $results = [];
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $results[] = $this->mapRowToEntity($row);
        }
        
        return $results;
    }

    public function save(Payment $payment): void
    {
        if ($payment->getId() === null) {
            $this->insert($payment);
        } else {
            $this->update($payment);
        }
    }

    private function insert(Payment $payment): void
    {
        $data = $payment->toArray();
        $mappedData = $this->mapEntityToRow($data);
        unset($mappedData['id'], $mappedData['updated_at']);

        $columns = array_keys($mappedData);
        $placeholders = array_map(fn($c) => ':' . $c, $columns);

        $sql = sprintf(
            'INSERT INTO %s (%s) VALUES (%s)',
            $this->table,
            implode(', ', $columns),
            implode(', ', $placeholders)
        );

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($mappedData);
        
        $payment->setId((int) $this->pdo->lastInsertId());
    }

    private function update(Payment $payment): void
    {
        $data = $payment->toArray();
        $mappedData = $this->mapEntityToRow($data);
        $id = $mappedData['id'];
        unset($mappedData['id'], $mappedData['created_at']);

        $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($mappedData));

        $sql = sprintf(
            'UPDATE %s SET %s WHERE id = :id',
            $this->table,
            implode(', ', $sets)
        );

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $id] + $mappedData);
    }

    public function delete(int $id): void
    {
        $stmt = $this->pdo->prepare("DELETE FROM {$this->table} WHERE id = :id");
        $stmt->execute(['id' => $id]);
    }

    // --- Mappers ---

    private function mapRowToEntity(array $row): Payment
    {
        return Payment::fromArray([
            'id' => (int) $row['id'],
            'ref' => $row['ref'],
            'amount' => (float) $row['amount'],
            'paymentType' => $row['payment_type'],
            'num' => $row['num'],
            'note' => $row['note'],
            'invoiceId' => (int) $row['invoice_id'],
            'bankAccountId' => $row['bank_account_id'] ? (int) $row['bank_account_id'] : null,
            'date' => $row['date'],
            'createdAt' => $row['created_at'],
            'updatedAt' => $row['updated_at']
        ]);
    }

    private function mapEntityToRow(array $data): array
    {
        return [
            'id' => $data['id'] !== null ? (int) $data['id'] : null,
            'ref' => $data['ref'],
            'amount' => $data['amount'],
            'payment_type' => $data['paymentType'],
            'num' => $data['num'],
            'note' => $data['note'],
            'invoice_id' => $data['invoiceId'],
            'bank_account_id' => $data['bankAccountId'],
            'date' => $data['date'],
            'created_at' => $data['createdAt'],
            'updated_at' => $data['updatedAt']
        ];
    }
}
