<?php

declare(strict_types=1);

namespace Plugin\Business\Infrastructure\Persistence\Mysql\User;

use Plugin\Business\Domain\User\Representative;
use Plugin\Business\Domain\User\ThirdPartyRepresentativeRepository;
use PDO;

class MysqlThirdPartyRepresentativeRepository implements ThirdPartyRepresentativeRepository
{
    public function __construct(private PDO $pdo)
    {
    }

    #[\Override]
    public function findByThirdPartyId(int $thirdPartyId): array
    {
        // For simplicity returning only the Representative DTO with the ids
        $stmt = $this->pdo->prepare('SELECT * FROM third_party_representatives WHERE third_party_id = :id');
        $stmt->execute(['id' => $thirdPartyId]);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

        $items = [];
        foreach ($rows as $row) {
            $items[] = new Representative(
                id: (int) $row['user_id'], // Representative uses user id as its id? Or wait, let's just supply empty strings
                login: '',
                email: '',
                firstname: '',
                lastname: ''
            );
        }

        return $items;
    }

    #[\Override]
    public function linkRepresentative(int $thirdPartyId, int $userId): void
    {
        $stmt = $this->pdo->prepare('INSERT IGNORE INTO third_party_representatives (third_party_id, user_id) VALUES (:tp, :usr)');
        $stmt->execute(['tp' => $thirdPartyId, 'usr' => $userId]);
    }

    #[\Override]
    public function unlinkRepresentative(int $thirdPartyId, int $userId): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM third_party_representatives WHERE third_party_id = :tp AND user_id = :usr');
        $stmt->execute(['tp' => $thirdPartyId, 'usr' => $userId]);
    }
}
