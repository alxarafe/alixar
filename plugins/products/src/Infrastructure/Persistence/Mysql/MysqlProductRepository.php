<?php

declare(strict_types=1);

namespace Plugin\Products\Infrastructure\Persistence\Mysql;

use Plugin\Products\Domain\Product\Product;
use Plugin\Products\Domain\Product\ProductRepository;
use PDO;
use RuntimeException;

class MysqlProductRepository implements ProductRepository
{
    private string $table;

    public function __construct(private PDO $pdo)
    {
        $this->table = 'products';
    }

    #[\Override]
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array
    {
        $allowedSortFields = ['id', 'entity', 'ref', 'ref_ext', 'barcode', 'label', 'description', 'price', 'price_ttc', 'tva_tx', 'type', 'status', 'status_buy', 'created_at', 'updated_at'];
        if (!in_array($sortField, $allowedSortFields, true)) {
            // legacy fallback
            if ($sortField === 'rowid') {
                $sortField = 'id';
            } else {
                $sortField = 'id';
            }
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
            $products[] = $this->mapRowToEntity($row);
        }

        return $products;
    }

    #[\Override]
    public function count(array $criteria = []): int
    {
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

        return $this->mapRowToEntity($row);
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

        return $this->mapRowToEntity($row);
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

        return $this->mapRowToEntity($row);
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

        return $this->mapRowToEntity($row);
    }

    #[\Override]
    public function save(Product $product): void
    {
        if ($product->getId() === null) {
            $this->insert($product);
        } else {
            $this->update($product);
        }
    }

    private function insert(Product $product): void
    {
        $data = $this->extractParams($product);
        unset($data['id']);

        $columns = array_keys($data);
        $placeholders = array_map(fn($c) => ':' . $c, $columns);

        $sql = sprintf(
            'INSERT INTO %s (%s) VALUES (%s)',
            $this->table,
            implode(', ', $columns),
            implode(', ', $placeholders)
        );

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($data);
        $product->setId((int) $this->pdo->lastInsertId());
    }

    private function update(Product $product): void
    {
        $data = $this->extractParams($product);
        $id = $data['id'];
        unset($data['id']);
        
        // created_at is managed by db on insert
        unset($data['created_at']);

        $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($data));

        $sql = sprintf(
            'UPDATE %s SET %s WHERE id = :id',
            $this->table,
            implode(', ', $sets)
        );

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $id] + $data);
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
        $stmt = $this->pdo->prepare("SELECT * FROM product_associations WHERE fk_product_parent = :id");
        $stmt->execute(['id' => $productId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    #[\Override]
    public function addSubproduct(int $productId, int $subproductId, float $qty, int $incdec = 1): void
    {
        $stmt = $this->pdo->prepare("INSERT INTO product_associations (fk_product_parent, fk_product_child, qty, incdec) VALUES (:id, :subid, :qty, :incdec)");
        $stmt->execute(['id' => $productId, 'subid' => $subproductId, 'qty' => $qty, 'incdec' => $incdec]);
    }

    #[\Override]
    public function deleteSubproduct(int $productId, int $subproductId): void
    {
        $stmt = $this->pdo->prepare("DELETE FROM product_associations WHERE fk_product_parent = :id AND fk_product_child = :subid");
        $stmt->execute(['id' => $productId, 'subid' => $subproductId]);
    }

    #[\Override]
    public function getPurchasePrices(int $productId): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM product_supplier_prices WHERE fk_product = :id");
        $stmt->execute(['id' => $productId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    #[\Override]
    public function addPurchasePrice(int $productId, array $data): void
    {
        $data['fk_product'] = $productId;
        $columns = array_keys($data);
        $placeholders = array_map(fn($c) => ':' . $c, $columns);
        $sql = sprintf("INSERT INTO product_supplier_prices (%s) VALUES (%s)", implode(', ', $columns), implode(', ', $placeholders));
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($data);
    }

    #[\Override]
    public function deletePurchasePrice(int $productId, int $priceId): void
    {
        $stmt = $this->pdo->prepare("DELETE FROM product_supplier_prices WHERE id = :id AND fk_product = :prod");
        $stmt->execute(['id' => $priceId, 'prod' => $productId]);
    }

    #[\Override]
    public function getCustomerPrices(int $productId): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM product_customer_prices WHERE fk_product = :id");
        $stmt->execute(['id' => $productId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    #[\Override]
    public function getStock(int $productId, ?int $warehouseId = null): array
    {
        $sql = "SELECT * FROM product_stock WHERE fk_product = :id";
        $params = ['id' => $productId];
        
        if ($warehouseId !== null) {
            $sql .= " AND fk_warehouse = :wh";
            $params['wh'] = $warehouseId;
        }

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    #[\Override]
    public function getAttributes(int $limit = 100, int $offset = 0): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM product_attributes LIMIT :limit OFFSET :offset");
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    #[\Override]
    public function getVariants(int $productId): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM product_variants WHERE fk_product_parent = :id");
        $stmt->execute(['id' => $productId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    #[\Override]
    public function getContacts(int $productId, string $type = ''): array
    {
        $sql = "SELECT * FROM product_contacts WHERE product_id = :id";
        if ($type !== '') {
            $sql .= " AND type = :type";
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['id' => $productId, 'type' => $type]);
        } else {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['id' => $productId]);
        }
        
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    #[\Override]
    public function addContact(int $productId, int $contactId, string $type): void
    {
        $stmt = $this->pdo->prepare("INSERT INTO product_contacts (product_id, contact_id, type) VALUES (:id, :contact, :type)");
        $stmt->execute(['id' => $productId, 'contact' => $contactId, 'type' => $type]);
    }

    #[\Override]
    public function deleteContact(int $productId, int $contactId, string $type): void
    {
        $stmt = $this->pdo->prepare("DELETE FROM product_contacts WHERE product_id = :id AND contact_id = :contact AND type = :type");
        $stmt->execute(['id' => $productId, 'contact' => $contactId, 'type' => $type]);
    }

    private function mapRowToEntity(array $row): Product
    {
        return Product::fromArray([
            'id' => (int) $row['id'],
            'entity' => (int) $row['entity'],
            'ref' => $row['ref'],
            'refExt' => $row['ref_ext'] ?? null,
            'barcode' => $row['barcode'] ?? null,
            'label' => $row['label'],
            'description' => $row['description'] ?? null,
            'price' => (float) $row['price'],
            'priceTtc' => (float) $row['price_ttc'],
            'tvaTx' => (float) $row['tva_tx'],
            'type' => (int) $row['type'],
            'status' => (bool) $row['status'],
            'statusBuy' => (bool) $row['status_buy'],
            'createdAt' => $row['created_at'],
            'updatedAt' => $row['updated_at'] ?? null,
        ]);
    }

    private function extractParams(Product $product): array
    {
        $arr = $product->toArray();
        return [
            'id' => $arr['id'],
            'entity' => $arr['entity'] ?? 1,
            'ref' => $arr['ref'],
            'ref_ext' => $arr['refExt'],
            'barcode' => $arr['barcode'],
            'label' => $arr['label'],
            'description' => $arr['description'],
            'price' => $arr['price'],
            'price_ttc' => $arr['priceTtc'],
            'tva_tx' => $arr['tvaTx'],
            'type' => $arr['type'],
            'status' => $arr['status'] ? 1 : 0,
            'status_buy' => $arr['statusBuy'] ? 1 : 0,
            'created_at' => $arr['createdAt'],
            'updated_at' => $arr['updatedAt'] ?? null,
        ];
    }
}
