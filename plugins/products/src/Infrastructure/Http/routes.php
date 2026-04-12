<?php

declare(strict_types=1);

use Core\Application\Plugin\HookRegistryInterface;
use Core\Application\Plugin\PluginRegistry;

return function (flight\Engine $app, PDO $pdo, HookRegistryInterface $hooks, PluginRegistry $registry): void {

    $dbConfig = $GLOBALS['__api_config']['database'] ?? [];
    $tablePrefix = $dbConfig['table_prefix'] ?? '';

    $productRepo = new \Plugin\Products\Infrastructure\Persistence\Mysql\MysqlProductRepository($pdo, $tablePrefix);
    $productCtrl = new \Plugin\Products\Infrastructure\Http\Api\Controller\ProductApiController($productRepo);

    $app->route('GET /api/products', [$productCtrl, 'list']);
    $app->route('GET /api/products/@id', [$productCtrl, 'get']);
    $app->route('GET /api/products/ref/@ref', [$productCtrl, 'getByRef']);
    $app->route('GET /api/products/ref_ext/@ref_ext', [$productCtrl, 'getByRefExt']);
    $app->route('GET /api/products/barcode/@barcode', [$productCtrl, 'getByBarcode']);
    $app->route('POST /api/products', [$productCtrl, 'create']);
    $app->route('PUT /api/products/@id', [$productCtrl, 'update']);
    $app->route('DELETE /api/products/@id', [$productCtrl, 'delete']);

    $app->route('POST /api/products/@id/purchase_prices', [$productCtrl, 'addPurchasePrices']);
    $app->route('GET /api/products/@id/purchase_prices', [$productCtrl, 'getPurchasePrices']);
    $app->route('DELETE /api/products/@id/purchase_prices/@priceid', [$productCtrl, 'deletePurchasePrices']);
    $app->route('GET /api/products/@id/subproducts', [$productCtrl, 'getSubproducts']);
    $app->route('POST /api/products/@id/subproducts/@subproductid', [$productCtrl, 'addSubproducts']);
    $app->route('DELETE /api/products/@id/subproducts/@subproductid', [$productCtrl, 'deleteSubproducts']);
    $app->route('GET /api/products/@id/stock', [$productCtrl, 'getStock']);
    $app->route('GET /api/products/@id/variants', [$productCtrl, 'getVariants']);
    $app->route('GET /api/products/@id/customer_prices', [$productCtrl, 'getCustomerPrices']);
    $app->route('GET /api/products/attributes', [$productCtrl, 'getAttributes']);
    $app->route('GET /api/products/@id/contacts', [$productCtrl, 'getContacts']);
    $app->route('POST /api/products/@id/contact/@contactid/@type', [$productCtrl, 'addContact']);
    $app->route('DELETE /api/products/@id/contact/@contactid/@type', [$productCtrl, 'deleteContact']);
};
