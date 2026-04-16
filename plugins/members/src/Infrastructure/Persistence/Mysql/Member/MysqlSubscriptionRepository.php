<?php

declare(strict_types=1);

namespace Plugin\Members\Infrastructure\Persistence\Mysql\Member;

use Plugin\Members\Domain\Member\Subscription;
use Plugin\Members\Domain\Member\SubscriptionRepository;
use PDO;

class MysqlSubscriptionRepository implements SubscriptionRepository
{
    public function __construct(private PDO $pdo)
    {
}

    public function save(Subscription $sub): int
    {
        if ($sub->id) {
            $stmt = $this->pdo->prepare("
                UPDATE member_subscriptions 
                SET member_id = :member_id, date_start = :date_start, date_end = :date_end, 
                    amount = :amount, status = :status
                WHERE id = :id
            ");
        } else {
            $stmt = $this->pdo->prepare("
                INSERT INTO member_subscriptions (member_id, date_start, date_end, amount, status)
                VALUES (:member_id, :date_start, :date_end, :amount, :status)
            ");
        }
        
        $data = $sub->toArray();
        unset($data['created_at'], $data['updated_at']);
        
        $stmt->execute($data);
        return $sub->id ?? (int) $this->pdo->lastInsertId();
    }

    public function findById(int $id): ?Subscription
    {
        $stmt = $this->pdo->prepare("SELECT * FROM member_subscriptions WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();
        return $data ? Subscription::fromArray($data) : null;
    }

    public function findByMemberId(int $memberId): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM member_subscriptions WHERE member_id = :member_id ORDER BY date_start DESC");
        $stmt->execute(['member_id' => $memberId]);
        
        $results = [];
        foreach ($stmt->fetchAll() as $data) {
            $results[] = Subscription::fromArray($data);
        }
        return $results;
    }

    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM member_subscriptions WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
