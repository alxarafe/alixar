<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Persistence\Mysql\Business;

use Plugin\Business\Domain\Category\Category;
use Plugin\Business\Domain\Category\ThirdPartyCategoryRepository;
use Plugin\DolibarrCompat\Infrastructure\DolibarrMappingTrait;
use PDO;

class DolibarrMysqlThirdPartyCategoryRepository implements ThirdPartyCategoryRepository
{
    use DolibarrMappingTrait;

    public const CATEGORY_COLUMN_MAP = [
        'id' => 'rowid',
        'type' => 'type',
        'label' => 'label',
        'description' => 'description',
        'color' => 'color',
        'parentId' => 'fk_parent',
    ];

    private string $tableCategory;
    private string $tableLink;

    public function __construct(
        private PDO $pdo,
        string $tablePrefix = 'llx_'
    ) {
        $prefix = $tablePrefix ?: 'llx_';
        $this->tableCategory = $prefix . 'categorie';
        $this->tableLink = $prefix . 'categorie_societe';
    }

    #[\Override]
    public function findByThirdPartyId(int $thirdPartyId, int $type): array
    {
        $sql = "SELECT c.* FROM {$this->tableCategory} c
                INNER JOIN {$this->tableLink} cs ON c.rowid = cs.fk_categorie
                WHERE cs.fk_soc = :socid AND c.type = :type";
                
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['socid' => $thirdPartyId, 'type' => $type]);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return array_map(function ($row) {
            $cleanData = $this->mapToClean($row, self::CATEGORY_COLUMN_MAP);
            return $this->hydrate($cleanData);
        }, $rows);
    }

    #[\Override]
    public function linkCategory(int $thirdPartyId, int $categoryId): void
    {
        $sql = "INSERT INTO {$this->tableLink} (fk_categorie, fk_soc) 
                VALUES (:catid, :socid) 
                ON DUPLICATE KEY UPDATE fk_categorie = fk_categorie";
        
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['catid' => $categoryId, 'socid' => $thirdPartyId]);
    }

    #[\Override]
    public function unlinkCategory(int $thirdPartyId, int $categoryId): void
    {
        $sql = "DELETE FROM {$this->tableLink} WHERE fk_categorie = :catid AND fk_soc = :socid";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['catid' => $categoryId, 'socid' => $thirdPartyId]);
    }

    private function hydrate(array $data): Category
    {
        $category = new Category(
            type: (int) $data['type']
        );
        $category->updateFrom($data);
        if (isset($data['id'])) {
            $category->setId((int) $data['id']);
        }
        return $category;
    }
}
