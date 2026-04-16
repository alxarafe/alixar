<?php

declare(strict_types=1);

namespace Plugin\Crm\Infrastructure\Persistence\Mysql\Category;

use PDO;
use Plugin\Crm\Domain\Category\ContactCategoryRepository;
use Plugin\Business\Domain\Category\Category;

class MysqlContactCategoryRepository implements ContactCategoryRepository
{
    // In dolibarr, categories are shared but links are in categorie_contact
    // Native tables for Business category are third_party_categories.
    // For contacts, we can create contact_categories and contact_category_links.
    // Let's assume we reuse third_party_categories for all categories for simplicity,
    // and just use contact_category_links.
    // Actually, wait! Did we create `contact_categories` in the CRM migration? No!
    // I should add `contact_category_links` to 001_create_crm_tables.php!
    public function __construct(private PDO $pdo)
    {
    }

    public function findByContactId(int $contactId): array
    {
        $stmt = $this->pdo->prepare('
            SELECT c.* 
            FROM third_party_categories c
            INNER JOIN contact_category_links cl ON c.id = cl.category_id
            WHERE cl.contact_id = :id
        ');
        $stmt->execute(['id' => $contactId]);
        
        $categories = [];
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $categories[] = Category::fromArray($row);
        }
        return $categories;
    }

    public function linkCategory(int $contactId, int $categoryId): void
    {
        $stmt = $this->pdo->prepare('INSERT IGNORE INTO contact_category_links (contact_id, category_id) VALUES (:id, :cat)');
        $stmt->execute(['id' => $contactId, 'cat' => $categoryId]);
    }

    public function unlinkCategory(int $contactId, int $categoryId): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM contact_category_links WHERE contact_id = :id AND category_id = :cat');
        $stmt->execute(['id' => $contactId, 'cat' => $categoryId]);
    }
}
