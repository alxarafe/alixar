<?php

declare(strict_types=1);

use Core\Application\Plugin\HookRegistryInterface;
use Core\Application\Plugin\PluginRegistry;

return function (flight\Engine $app, PDO $pdo, HookRegistryInterface $hooks, PluginRegistry $registry): void {

    $dbConfig = $GLOBALS['__api_config']['database'] ?? [];
    $tablePrefix = $dbConfig['table_prefix'] ?? '';

    $productRepo = new \Plugin\Products\Infrastructure\Persistence\Mysql\MysqlProductRepository($pdo);
    $productCtrl = new \Plugin\Products\Infrastructure\Http\Api\Controller\ProductApiController($productRepo);

    $app->route('GET /api/v1/products', [$productCtrl, 'list']);
    $app->route('GET /api/v1/products/@id', [$productCtrl, 'get']);
    $app->route('GET /api/v1/products/ref/@ref', [$productCtrl, 'getByRef']);
    $app->route('GET /api/v1/products/ref_ext/@ref_ext', [$productCtrl, 'getByRefExt']);
    $app->route('GET /api/v1/products/barcode/@barcode', [$productCtrl, 'getByBarcode']);
    $app->route('POST /api/v1/products', [$productCtrl, 'create']);
    $app->route('PUT /api/v1/products/@id', [$productCtrl, 'update']);
    $app->route('DELETE /api/v1/products/@id', [$productCtrl, 'delete']);

    $app->route('POST /api/v1/products/@id/purchase_prices', [$productCtrl, 'addPurchasePrices']);
    $app->route('GET /api/v1/products/@id/purchase_prices', [$productCtrl, 'getPurchasePrices']);
    $app->route('DELETE /api/v1/products/@id/purchase_prices/@priceid', [$productCtrl, 'deletePurchasePrices']);
    $app->route('GET /api/v1/products/@id/subproducts', [$productCtrl, 'getSubproducts']);
    $app->route('POST /api/v1/products/@id/subproducts/@subproductid', [$productCtrl, 'addSubproducts']);
    $app->route('DELETE /api/v1/products/@id/subproducts/@subproductid', [$productCtrl, 'deleteSubproducts']);
    $app->route('GET /api/v1/products/@id/stock', [$productCtrl, 'getStock']);
    $app->route('GET /api/v1/products/@id/variants', [$productCtrl, 'getVariants']);
    $app->route('GET /api/v1/products/@id/customer_prices', [$productCtrl, 'getCustomerPrices']);
    $app->route('GET /api/v1/products/attributes', [$productCtrl, 'getAttributes']);
    $app->route('GET /api/v1/products/@id/contacts', [$productCtrl, 'getContacts']);
    $app->route('POST /api/v1/products/@id/contact/@contactid/@type', [$productCtrl, 'addContact']);
    $app->route('DELETE /api/v1/products/@id/contact/@contactid/@type', [$productCtrl, 'deleteContact']);
};
