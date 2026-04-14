<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Persistence\Mysql\Products;

use Plugin\Products\Domain\Product\Product;
use Plugin\Products\Domain\Product\ProductRepository;
use Plugin\DolibarrCompat\Infrastructure\DolibarrMappingTrait;
use PDO;
use RuntimeException;

class DolibarrMysqlProductRepository implements ProductRepository
{
    use DolibarrMappingTrait;

    private string $table;

    // Map Domain Product attributes to Dolibarr llx_product DB columns
    private const COLUMN_MAP = [
        'id' => 'id',
        'entity' => 'entity',
        'ref' => 'ref',
        'refExt' => 'ref_ext',
        'barcode' => 'barcode',
        'label' => 'label',
        'description' => 'description',
        'price' => 'price',
        'priceTtc' => 'price_ttc',
        'tvaTx' => 'tva_tx',
        'type' => 'fk_product_type',
        'status' => 'tosell',
        'statusBuy' => 'tobuy',
        'createdAt' => 'datec',
        'updatedAt' => 'tms',
    ];

    public function __construct(private PDO $pdo, string $prefix = 'llx_')
    {
        $this->table = $prefix . 'product';
    }

    /**
     * @return array<Product>
     */
    #[\Override]
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array
    {
        $allowedSortFields = array_values(self::COLUMN_MAP);
        if (!in_array($sortField, $allowedSortFields, true)) {
            $sortField = 'id';
        }

        $sortOrder = strtoupper($sortOrder) === 'DESC' ? 'DESC' : 'ASC';

        $sql = sprintf(
            'SELECT * FROM %s ORDER BY %s %s LIMIT %d OFFSET %d',
            $this->table,
            $sortField,
            $sortOrder,
            $limit,
            $offset
        );

        $stmt = $this->pdo->query($sql);
        if (!$stmt) {
            return [];
        }
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

        $products = [];
        foreach ($rows as $row) {
            $products[] = Product::fromArray($this->mapToClean($row, self::COLUMN_MAP));
        }

        return $products;
    }

    /**
     * @param array<string, mixed> $criteria
     */
    #[\Override]
    public function count(array $criteria = []): int
    {
        // Simple count for now, no criteria applied natively
        $stmt = $this->pdo->query('SELECT COUNT(*) FROM ' . $this->table);
        if (!$stmt) {
            return 0;
        }
        return (int) $stmt->fetchColumn();
    }

    #[\Override]
    public function findById(int $id): ?Product
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE id = :id');
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) {
            return null;
        }

        return Product::fromArray($this->mapToClean($row, self::COLUMN_MAP));
    }

    #[\Override]
    public function findByRef(string $ref): ?Product
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE ref = :ref');
        $stmt->execute(['ref' => $ref]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) {
            return null;
        }

        return Product::fromArray($this->mapToClean($row, self::COLUMN_MAP));
    }

    #[\Override]
    public function findByRefExt(string $refExt): ?Product
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE ref_ext = :refExt');
        $stmt->execute(['refExt' => $refExt]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) {
            return null;
        }

        return Product::fromArray($this->mapToClean($row, self::COLUMN_MAP));
    }

    #[\Override]
    public function findByBarcode(string $barcode): ?Product
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE barcode = :barcode');
        $stmt->execute(['barcode' => $barcode]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) {
            return null;
        }

        return Product::fromArray($this->mapToClean($row, self::COLUMN_MAP));
    }

    #[\Override]
    public function save(Product $product): void
    {
        $dbData = $this->mapToDolibarr($product->toArray(), self::COLUMN_MAP);
        
        // Remove tms as it's auto-updated by DB in Dolibarr
        unset($dbData['tms']);

        if ($product->getId() === null) {
            unset($dbData['id']);
            $columns = array_keys($dbData);
            $placeholders = array_map(fn($c) => ':' . $c, $columns);

            $sql = sprintf(
                'INSERT INTO %s (%s) VALUES (%s)',
                $this->table,
                implode(', ', $columns),
                implode(', ', $placeholders)
            );

            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($dbData);
            $product->setId((int) $this->pdo->lastInsertId());
        } else {
            $id = $dbData['id'];
            unset($dbData['id']);
            // Unset datec so we do not overwrite creation date on updates
            unset($dbData['datec']);

            $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($dbData));

            $sql = sprintf(
                'UPDATE %s SET %s WHERE id = :id',
                $this->table,
                implode(', ', $sets)
            );

            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['id' => $id] + $dbData);
        }
    }

    #[\Override]
    public function delete(int $id): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM ' . $this->table . ' WHERE id = :id');
        $stmt->execute(['id' => $id]);
    }

    #[\Override]
    public function getSubproducts(int $productId): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table}_association WHERE fk_product_pere = :id");
        $stmt->execute(['id' => $productId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    #[\Override]
    public function addSubproduct(int $productId, int $subproductId, float $qty, int $incdec = 1): void
    {
        $stmt = $this->pdo->prepare("INSERT INTO {$this->table}_association (fk_product_pere, fk_product_fils, qty, incdec) VALUES (:id, :subid, :qty, :incdec)");
        $stmt->execute(['id' => $productId, 'subid' => $subproductId, 'qty' => $qty, 'incdec' => $incdec]);
    }

    #[\Override]
    public function deleteSubproduct(int $productId, int $subproductId): void
    {
        $stmt = $this->pdo->prepare("DELETE FROM {$this->table}_association WHERE fk_product_pere = :id AND fk_product_fils = :subid");
        $stmt->execute(['id' => $productId, 'subid' => $subproductId]);
    }

    #[\Override]
    public function getPurchasePrices(int $productId): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table}_fournisseur_price WHERE fk_product = :id");
        $stmt->execute(['id' => $productId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    #[\Override]
    public function addPurchasePrice(int $productId, array $data): void
    {
        // Minimal array injection
        $data['fk_product'] = $productId;
        $columns = array_keys($data);
        $placeholders = array_map(fn($c) => ':' . $c, $columns);
        $sql = sprintf("INSERT INTO {$this->table}_fournisseur_price (%s) VALUES (%s)", implode(', ', $columns), implode(', ', $placeholders));
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($data);
    }

    #[\Override]
    public function deletePurchasePrice(int $productId, int $priceId): void
    {
        $stmt = $this->pdo->prepare("DELETE FROM {$this->table}_fournisseur_price WHERE id = :id AND fk_product = :prod");
        $stmt->execute(['id' => $priceId, 'prod' => $productId]);
    }

    #[\Override]
    public function getCustomerPrices(int $productId): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table}_customer_price WHERE fk_product = :id");
        $stmt->execute(['id' => $productId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    #[\Override]
    public function getStock(int $productId, ?int $warehouseId = null): array
    {
        $sql = "SELECT * FROM {$this->table}_stock WHERE fk_product = :id";
        $params = ['id' => $productId];
        
        if ($warehouseId !== null) {
            $sql .= " AND fk_entrepot = :wh";
            $params['wh'] = $warehouseId;
        }

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    #[\Override]
    public function getAttributes(int $limit = 100, int $offset = 0): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table}_attribute LIMIT :limit OFFSET :offset");
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    #[\Override]
    public function getVariants(int $productId): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table}_attribute_combination WHERE fk_product_parent = :id");
        $stmt->execute(['id' => $productId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    #[\Override]
    public function getContacts(int $productId, string $type = ''): array
    {
        $sql = "SELECT * FROM llx_element_contact WHERE element_id = :id AND fk_c_type_contact IN (SELECT rowid FROM llx_c_type_contact WHERE element = 'product')";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $productId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    #[\Override]
    public function addContact(int $productId, int $contactId, string $type): void
    {
        // Minimal linkage resolution
        $stmt = $this->pdo->prepare("INSERT INTO llx_element_contact (element_id, fk_socpeople, fk_c_type_contact) VALUES (:id, :contact, (SELECT rowid FROM llx_c_type_contact WHERE element='product' AND source='external' LIMIT 1))");
        $stmt->execute(['id' => $productId, 'contact' => $contactId]);
    }

    #[\Override]
    public function deleteContact(int $productId, int $contactId, string $type): void
    {
        $stmt = $this->pdo->prepare("DELETE FROM llx_element_contact WHERE element_id = :id AND fk_socpeople = :contact");
        $stmt->execute(['id' => $productId, 'contact' => $contactId]);
    }
}
