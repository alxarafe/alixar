<?php

declare(strict_types=1);

namespace Plugin\Finance\Infrastructure\Persistence\Mysql\Donation;

use Plugin\Finance\Domain\Donation\Donation;
use Plugin\Finance\Domain\Donation\DonationRepository;
use PDO;

class MysqlDonationRepository implements DonationRepository
{
    public function __construct(private PDO $pdo)
    {
}

    public function save(Donation $donation): int
    {
        if ($donation->id) {
            $stmt = $this->pdo->prepare("
                UPDATE finance_donations 
                SET ref = :ref, amount = :amount, third_party_id = :third_party_id, 
                    project_id = :project_id, status = :status, date = :date
                WHERE id = :id
            ");
        } else {
            $stmt = $this->pdo->prepare("
                INSERT INTO finance_donations (ref, amount, third_party_id, project_id, status, date)
                VALUES (:ref, :amount, :third_party_id, :project_id, :status, :date)
            ");
        }
        
        $data = $donation->toArray();
        unset($data['created_at'], $data['updated_at']);
        
        $stmt->execute($data);
        return $donation->id ?? (int) $this->pdo->lastInsertId();
    }

    public function findById(int $id): ?Donation
    {
        $stmt = $this->pdo->prepare("SELECT * FROM finance_donations WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();
        return $data ? Donation::fromArray($data) : null;
    }

    public function findAll(int $limit = 500, int $offset = 0): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM finance_donations ORDER BY date DESC LIMIT :limit OFFSET :offset");
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();
        
        $results = [];
        foreach ($stmt->fetchAll() as $data) {
            $results[] = Donation::fromArray($data);
        }
        return $results;
    }

    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM finance_donations WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
