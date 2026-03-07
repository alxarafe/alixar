<?php

declare(strict_types=1);

namespace Modules\Sales\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Boolean;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Configuration;
use Modules\Sales\Controller\ProposalController;

/**
 * Class SetupController
 * Configuration for Sales Module (Proposals, Orders, Invoices).
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
        $this->recordId = 'sales_setup';
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Configuración Ventas',
        icon: 'fas fa-cog',
        parent: ProposalController::class,
        order: 100,
        permission: 'Alixar.Setup'
    )]
    public function doIndex(): bool
    {
        $this->addVariable('title', 'Configuración de Módulo de Ventas');
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
                        new Text('PROPOSAL_ADDON', 'Modelo Presupuestos', ['placeholder' => 'Ej: marbore']),
                        new Text('COMMANDE_ADDON', 'Modelo Pedidos', ['placeholder' => 'Ej: einstein']),
                        new Text('FACURE_ADDON', 'Modelo Facturas', ['placeholder' => 'Ej: terre']),
                    ]),
                ]
            ],
            'texts' => [
                'label' => 'Textos Libres',
                'fields' => [
                    new Panel('Pie de documento', [
                        new Textarea('PROPOSAL_FREE_TEXT', 'Texto libre en Presupuestos'),
                        new Textarea('FACTURE_FREE_TEXT', 'Texto libre en Facturas'),
                    ]),
                ]
            ],
            'behavior' => [
                'label' => 'Comportamiento',
                'fields' => [
                    new Panel('Validación', [
                        new Boolean('FACTURE_FORCE_RECALC_ON_VALIDATE', 'Forzar recálculo al validar factura'),
                        new Boolean('PRICE_ALLOW_ADD_EXTERNAL', 'Permitir añadir productos externos manualmente'),
                    ]),
                ]
            ],
        ];
    }

    #[\Override]
    protected function fetchRecordData(): array
    {
        $fields = [
            'PROPOSAL_ADDON',
            'COMMANDE_ADDON',
            'FACURE_ADDON',
            'PROPOSAL_FREE_TEXT',
            'FACTURE_FREE_TEXT',
            'FACTURE_FORCE_RECALC_ON_VALIDATE',
            'PRICE_ALLOW_ADD_EXTERNAL',
        ];

        $data = [];
        foreach ($fields as $field) {
            $data[$field] = Configuration::getValue($field, '');
        }

        return [
            'id' => 'sales_setup',
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
                'message' => 'Configuración de Ventas guardada correctamente.'
            ]);
        } catch (\Exception $e) {
            \Alxarafe\Base\Database::connection()->rollBack();
            $this->jsonResponse(['error' => $e->getMessage()]);
        }
    }
}
