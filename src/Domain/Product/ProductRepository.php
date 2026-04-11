<?php

declare(strict_types=1);

namespace App\Domain\Product;

/**
 * ProductRepository — Interfaz para la gestión de persistencia de Productos.
 */
interface ProductRepository
{
    /**
     * @return array<Product>
     */
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'rowid', string $sortOrder = 'ASC'): array;

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int;

    public function findById(int $id): ?Product;

    public function findByRef(string $ref): ?Product;

    public function findByRefExt(string $refExt): ?Product;

    public function findByBarcode(string $barcode): ?Product;

    public function save(Product $product): void;

    public function delete(int $id): void;

    // --- Subproducts ---
    /** @return array<int, mixed> */
    public function getSubproducts(int $productId): array;
    public function addSubproduct(int $productId, int $subproductId, float $qty, int $incdec = 1): void;
    public function deleteSubproduct(int $productId, int $subproductId): void;

    // --- Purchase Prices (Suppliers) ---
    /** @return array<int, mixed> */
    public function getPurchasePrices(int $productId): array;
    /** @param array<string, mixed> $data */
    public function addPurchasePrice(int $productId, array $data): void;
    public function deletePurchasePrice(int $productId, int $priceId): void;

    // --- Customer Prices ---
    /** @return array<int, mixed> */
    public function getCustomerPrices(int $productId): array;

    // --- Stock ---
    /** @return array<int, mixed> */
    public function getStock(int $productId, ?int $warehouseId = null): array;

    // --- Attributes & Variants ---
    /** @return array<int, mixed> */
    public function getAttributes(int $limit = 100, int $offset = 0): array;
    /** @return array<int, mixed> */
    public function getVariants(int $productId): array;

    // --- Contacts ---
    /** @return array<int, mixed> */
    public function getContacts(int $productId, string $type = ''): array;
    public function addContact(int $productId, int $contactId, string $type): void;
    public function deleteContact(int $productId, int $contactId, string $type): void;
}
