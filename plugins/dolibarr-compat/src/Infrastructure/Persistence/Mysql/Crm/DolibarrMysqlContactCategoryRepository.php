<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Persistence\Mysql\Crm;

use Plugin\Business\Domain\Category\Category;
use Plugin\Crm\Domain\Category\ContactCategoryRepository;
use PDO;

class DolibarrMysqlContactCategoryRepository implements ContactCategoryRepository
{
    private string $tableCategorie;
    private string $tableCategorieContact;

    public const CATEGORY_COLUMN_MAP = [
        'id' => 'rowid',
        'type' => 'type',
        'label' => 'label',
        'description' => 'description',
        'color' => 'color',
    ];

    public function __construct(
        private PDO $pdo,
        string $tablePrefix = 'llx_'
    ) {
        $prefix = $tablePrefix ?: 'llx_';
        $this->tableCategorie = $prefix . 'categorie';
        $this->tableCategorieContact = $prefix . 'categorie_contact';
    }

    #[\Override]
    public function findByContactId(int $contactId): array
    {
        $sql = "SELECT c.rowid, c.label, c.type, c.description, c.color
                FROM {$this->tableCategorie} c
                INNER JOIN {$this->tableCategorieContact} cc ON c.rowid = cc.fk_categorie
                WHERE cc.fk_socpeople = :contactid";
                
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['contactid' => $contactId]);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $categories = [];
        foreach ($rows as $row) {
            $categories[] = new Category(
                id: (int) $row['rowid'],
                label: $row['label'],
                type: (int) $row['type'],
                description: $row['description'],
                color: $row['color'],
            );
        }
        
        return $categories;
    }

    #[\Override]
    public function linkCategory(int $contactId, int $categoryId): void
    {
        $sql = "INSERT INTO {$this->tableCategorieContact} (fk_socpeople, fk_categorie) 
                VALUES (:contactid, :categoryid) 
                ON DUPLICATE KEY UPDATE fk_categorie = fk_categorie";
        
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['categoryid' => $categoryId, 'contactid' => $contactId]);
    }

    #[\Override]
    public function unlinkCategory(int $contactId, int $categoryId): void
    {
        $sql = "DELETE FROM {$this->tableCategorieContact} WHERE fk_categorie = :categoryid AND fk_socpeople = :contactid";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['categoryid' => $categoryId, 'contactid' => $contactId]);
    }
}
