<?php

declare(strict_types=1);

namespace Modules\Purchase\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Configuration;
use Modules\Purchase\Controller\SupplierProposalController;

/**
 * Class SetupController
 * Configuration for Purchase Module.
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
        $this->recordId = 'purchase_setup';
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Configuración Compras',
        icon: 'fas fa-cog',
        parent: SupplierProposalController::class,
        order: 100,
        permission: 'Alixar.Setup'
    )]
    public function doIndex(): bool
    {
        $this->addVariable('title', 'Configuración de Módulo de Compras');
        return parent::doIndex();
    }

    #[\Override]
    protected function getEditFields(): array
    {
        return [
            'numbering' => [
                'label' => 'Numeración',
                'fields' => [
                    new Panel('Modelos de Referencia', [
                        new Text('SUPPLIER_PROPOSAL_ADDON', 'Modelo Presupuestos Prov.', ['placeholder' => 'Ej: orchid']),
                        new Text('SUPPLIER_ORDER_ADDON', 'Modelo Pedidos Prov.', ['placeholder' => 'Ej: althea']),
                        new Text('SUPPLIER_INVOICE_ADDON', 'Modelo Facturas Prov.', ['placeholder' => 'Ej: canelle']),
                    ]),
                ]
            ],
        ];
    }

    #[\Override]
    protected function fetchRecordData(): array
    {
        $fields = [
            'SUPPLIER_PROPOSAL_ADDON',
            'SUPPLIER_ORDER_ADDON',
            'SUPPLIER_INVOICE_ADDON',
        ];

        $data = [];
        foreach ($fields as $field) {
            $data[$field] = Configuration::getValue($field, '');
        }

        return [
            'id' => 'purchase_setup',
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
                'message' => 'Configuración de Compras guardada correctamente.'
            ]);
        } catch (\Exception $e) {
            \Alxarafe\Base\Database::connection()->rollBack();
            $this->jsonResponse(['error' => $e->getMessage()]);
        }
    }
}
