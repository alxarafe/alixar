<?php

declare(strict_types=1);

namespace Plugin\Business\Infrastructure\Persistence\Mysql\Category;

use Plugin\Business\Domain\Category\Category;
use Plugin\Business\Domain\Category\ThirdPartyCategoryRepository;
use PDO;

class MysqlThirdPartyCategoryRepository implements ThirdPartyCategoryRepository
{
    public function __construct(private PDO $pdo)
    {
    }

    #[\Override]
    public function findByThirdPartyId(int $thirdPartyId, int $type): array
    {
        $stmt = $this->pdo->prepare('
            SELECT c.* FROM third_party_categories c
            INNER JOIN third_party_category_links cl ON c.id = cl.category_id
            WHERE cl.third_party_id = :id AND c.type = :type
        ');
        $stmt->execute(['id' => $thirdPartyId, 'type' => $type]);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

        $items = [];
        foreach ($rows as $row) {
            $items[] = new Category(
                id: (int) $row['id'],
                label: $row['label'],
                description: $row['description'],
                type: (int) $row['type'],
                color: $row['color']
            );
        }

        return $items;
    }

    #[\Override]
    public function linkCategory(int $thirdPartyId, int $categoryId): void
    {
        $stmt = $this->pdo->prepare('INSERT IGNORE INTO third_party_category_links (third_party_id, category_id) VALUES (:id, :cat)');
        $stmt->execute(['id' => $thirdPartyId, 'cat' => $categoryId]);
    }

    #[\Override]
    public function unlinkCategory(int $thirdPartyId, int $categoryId): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM third_party_category_links WHERE third_party_id = :id AND category_id = :cat');
        $stmt->execute(['id' => $thirdPartyId, 'cat' => $categoryId]);
    }
}
