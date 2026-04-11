<?php

declare(strict_types=1);

namespace App\Infrastructure\Http\Api\Controller;

use App\Domain\Product\Product;
use App\Domain\Product\ProductRepository;
use App\Infrastructure\DolibarrMappingTrait;
use Flight;

class ProductApiController
{
    use DolibarrMappingTrait;

    private const API_MAP = [
        'refExt' => 'ref_ext',
        'priceTtc' => 'price_ttc',
        'tvaTx' => 'tva_tx',
        'statusBuy' => 'status_buy',
    ];

    public function __construct(
        private ProductRepository $repository,
    ) {
    }

    /**
     * @return array<string, mixed>
     */
    private function mapResponse(Product $product): array
    {
        $payload = $product->toArray();
        if (isset($payload['createdAt'])) $payload['date_creation'] = strtotime($payload['createdAt']);
        if (isset($payload['updatedAt'])) $payload['date_modification'] = strtotime($payload['updatedAt']);
        
        return $this->mapToDolibarr($payload, self::API_MAP);
    }

    public function list(): void
    {
        $limit = (int) ($_GET['limit'] ?? 100);
        $page = (int) ($_GET['page'] ?? 0);
        $offset = $page * $limit;
        $sortField = $_GET['sortfield'] ?? 't.rowid';
        $sortOrder = $_GET['sortorder'] ?? 'ASC';

        // Translate sortfield if necessary (t. is used by native dolibarr api for aliases)
        $sortField = str_replace('t.', '', $sortField);

        $products = $this->repository->findAll($limit, $offset, $sortField, $sortOrder);

        $response = array_map(function (Product $product) {
            return $this->mapResponse($product);
        }, $products);

        Flight::json($response, 200);
    }

    public function get(int $id): void
    {
        $product = $this->repository->findById($id);

        if (!$product) {
            Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
            return;
        }

        Flight::json($this->mapResponse($product), 200);
    }

    public function getByRef(string $ref): void
    {
        $product = $this->repository->findByRef($ref);

        if (!$product) {
            Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
            return;
        }

        Flight::json($this->mapResponse($product), 200);
    }

    public function getByRefExt(string $refExt): void
    {
        $product = $this->repository->findByRefExt($refExt);

        if (!$product) {
            Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
            return;
        }

        Flight::json($this->mapResponse($product), 200);
    }

    public function getByBarcode(string $barcode): void
    {
        $product = $this->repository->findByBarcode($barcode);

        if (!$product) {
            Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
            return;
        }

        Flight::json($this->mapResponse($product), 200);
    }

    public function create(): void
    {
        try {
            $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
            $cleanData = $this->mapToClean($payload, self::API_MAP);

            if (empty($cleanData['ref']) || empty($cleanData['label'])) {
                Flight::json(['error' => ['code' => 400, 'message' => 'Ref and label are required']], 400);
                return;
            }

            $product = Product::fromArray($cleanData);
            $this->repository->save($product);

            Flight::json($product->getId(), 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function update(int $id): void
    {
        try {
            $product = $this->repository->findById($id);

            if (!$product) {
                Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
                return;
            }

            $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
            $cleanData = $this->mapToClean($payload, self::API_MAP);

            $product->updateFrom($cleanData);
            $this->repository->save($product);

            $updatedProduct = $this->repository->findById($id);
            if (!$updatedProduct) {
                Flight::json(['error' => ['code' => 500, 'message' => 'Failed to retrieve updated product']], 500);
                return;
            }
            Flight::json($this->mapResponse($updatedProduct), 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function delete(int $id): void
    {
        try {
            $product = $this->repository->findById($id);

            if (!$product) {
                Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
                return;
            }

            $this->repository->delete($id);

            Flight::json([
                'success' => ['code' => 200, 'message' => 'Product deleted']
            ], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    // --- STUBS for advanced undocumented/complex operations --- 

    // --- Subproducts ---
    public function getSubproducts(int $id): void
    {
        Flight::json($this->repository->getSubproducts($id), 200);
    }
    
    public function addSubproducts(int $id, int $subproductId): void
    {
        try {
            $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
            $qty = (float)($payload['qty'] ?? 1);
            $incdec = (int)($payload['incdec'] ?? 1);
            $this->repository->addSubproduct($id, $subproductId, $qty, $incdec);
            Flight::json(['success' => ['code' => 200, 'message' => 'Subproduct added']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function deleteSubproducts(int $id, int $subproductId): void
    {
        try {
            $this->repository->deleteSubproduct($id, $subproductId);
            Flight::json(['success' => ['code' => 200, 'message' => 'Subproduct deleted']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    // --- Purchase Prices ---
    public function getPurchasePrices(int $id): void
    {
        Flight::json($this->repository->getPurchasePrices($id), 200);
    }

    public function addPurchasePrices(int $id): void
    {
        try {
            $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
            $this->repository->addPurchasePrice($id, $payload);
            Flight::json(['success' => ['code' => 200, 'message' => 'Purchase price added']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function deletePurchasePrices(int $id, int $priceId): void
    {
        try {
            $this->repository->deletePurchasePrice($id, $priceId);
            Flight::json(['success' => ['code' => 200, 'message' => 'Purchase price deleted']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    // --- Customer Prices ---
    public function getCustomerPrices(int $id): void
    {
        Flight::json($this->repository->getCustomerPrices($id), 200);
    }

    // --- Stock ---
    public function getStock(int $id): void
    {
        $warehouseId = isset($_GET['warehouse']) ? (int)$_GET['warehouse'] : null;
        Flight::json($this->repository->getStock($id, $warehouseId), 200);
    }

    // --- Attributes & Variants ---
    public function getAttributes(): void
    {
        Flight::json($this->repository->getAttributes(), 200);
    }

    public function getVariants(int $id): void
    {
        Flight::json($this->repository->getVariants($id), 200);
    }

    // --- Contacts ---
    public function getContacts(int $id): void
    {
        Flight::json($this->repository->getContacts($id), 200);
    }

    public function addContact(int $id, int $contactId, string $type): void
    {
        try {
            $this->repository->addContact($id, $contactId, $type);
            Flight::json(['success' => ['code' => 200, 'message' => 'Contact added']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function deleteContact(int $id, int $contactId, string $type): void
    {
        try {
            $this->repository->deleteContact($id, $contactId, $type);
            Flight::json(['success' => ['code' => 200, 'message' => 'Contact deleted']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }
}
