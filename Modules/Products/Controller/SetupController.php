<?php

declare(strict_types=1);

namespace Modules\Products\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Boolean;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Configuration;
use Modules\Products\Controller\ProductController;

/**
 * Class SetupController
 * Configuration for Products and Services Module.
 */
class SetupController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass()
    {
        return Configuration::class;
    }

    #[\Override]
    protected function detectMode()
    {
        $this->mode = self::MODE_EDIT;
        $this->recordId = 'products_setup';
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Configuración Productos',
        icon: 'fas fa-cog',
        parent: ProductController::class,
        order: 100,
        permission: 'Alixar.Setup'
    )]
    public function doIndex(): bool
    {
        $this->addVariable('title', 'Configuración de Módulo de Productos/Servicios');
        return parent::doIndex();
    }

    #[\Override]
    protected function getEditFields(): array
    {
        return [
            'stock' => [
                'label' => 'Stock',
                'fields' => [
                    new Panel('Gestión de Inventario', [
                        new Boolean('STOCK_CALCULATE_ON_SHIPMENT', 'Disminuir stocks reales al validar envíos'),
                        new Boolean('STOCK_CALCULATE_ON_BILL', 'Disminuir stocks reales al validar facturas'),
                        new Boolean('STOCK_ALLOW_NEGATIVE_STOCK', 'Permitir stocks negativos'),
                    ]),
                ]
            ],
            'behavior' => [
                'label' => 'Comportamiento',
                'fields' => [
                    new Panel('General', [
                        new Boolean('PRODUCT_USE_UNITS', 'Usar unidades de medida'),
                        new Text('PRODUCT_LIMIT_SIZE', 'Límite de tamaño para imágenes (bytes)', ['placeholder' => '1048576']),
                    ]),
                ]
            ],
        ];
    }

    #[\Override]
    protected function fetchRecordData(): array
    {
        $fields = [
            'STOCK_CALCULATE_ON_SHIPMENT',
            'STOCK_CALCULATE_ON_BILL',
            'STOCK_ALLOW_NEGATIVE_STOCK',
            'PRODUCT_USE_UNITS',
            'PRODUCT_LIMIT_SIZE',
        ];

        $data = [];
        foreach ($fields as $field) {
            $data[$field] = Configuration::getValue($field, '');
        }

        return [
            'id' => 'products_setup',
            'data' => (object) $data,
            'meta' => ['model' => 'Configuration']
        ];
    }

    #[\Override]
    protected function saveRecord()
    {
        $data = $_POST['data'] ?? $_POST;
        unset($data['module'], $data['controller'], $data['action'], $data['id'], $data['ajax']);

        try {
            \Alxarafe\Base\Database::connection()->beginTransaction();
            foreach ($data as $key => $value) {
                Configuration::setValue($key, $value);
            }
            \Alxarafe\Base\Database::connection()->commit();
            $this->jsonResponse([
                'status' => 'success',
                'message' => 'Configuración de Productos guardada correctamente.'
            ]);
        } catch (\Exception $e) {
            \Alxarafe\Base\Database::connection()->rollBack();
            $this->jsonResponse(['error' => $e->getMessage()]);
        }
    }
}
