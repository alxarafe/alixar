<?php

declare(strict_types=1);

namespace Modules\CRM\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Boolean;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Configuration;

/**
 * Class SetupController
 * Configuration for CRM Module (Third Parties).
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
        $this->recordId = 'crm_setup';
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Configuración CRM',
        icon: 'fas fa-cog',
        parent: ThirdPartyController::class,
        order: 100,
        permission: 'Alixar.Setup'
    )]
    public function doIndex(): bool
    {
        $this->addVariable('title', 'Configuración de Módulo CRM (Terceros)');
        return parent::doIndex();
    }

    #[\Override]
    protected function getEditFields(): array
    {
        return [
            'codes' => [
                'label' => 'Códigos de Terceros',
                'fields' => [
                    new Panel('Máscaras de Código', [
                        new Text('THIRDPARTY_CUSTOMER_CODE_MASK', 'Máscara código clientes', [
                            'placeholder' => 'Ej: CU{0000}',
                            'help' => 'Use {0000} para un contador secuencial de 4 dígitos.'
                        ]),
                        new Text('THIRDPARTY_SUPPLIER_CODE_MASK', 'Máscara código proveedores', [
                            'placeholder' => 'Ej: SU{0000}'
                        ]),
                    ]),
                ]
            ],
            'validation' => [
                'label' => 'Validación y Duplicados',
                'fields' => [
                    new Panel('Identificadores Únicos', [
                        new Boolean('SOCIETE_IDPROF1_UNIQUE', 'NIF/CIF Obligatorio y único'),
                        new Boolean('SOCIETE_IDPROF2_UNIQUE', 'ID Prof. 2 único'),
                        new Boolean('SOCIETE_EMAIL_UNIQUE', 'Email único por tercero'),
                    ]),
                ]
            ],
            'defaults' => [
                'label' => 'Valores por Defecto',
                'fields' => [
                    new Panel('Comportamiento', [
                        new Boolean('THIRDPARTY_DEFAULT_CREATE_CONTACT', 'Crear contacto por defecto al crear tercero'),
                    ]),
                ]
            ],
        ];
    }

    #[\Override]
    protected function fetchRecordData(): array
    {
        $fields = [
            'THIRDPARTY_CUSTOMER_CODE_MASK',
            'THIRDPARTY_SUPPLIER_CODE_MASK',
            'SOCIETE_IDPROF1_UNIQUE',
            'SOCIETE_IDPROF2_UNIQUE',
            'SOCIETE_EMAIL_UNIQUE',
            'THIRDPARTY_DEFAULT_CREATE_CONTACT',
        ];

        $data = [];
        foreach ($fields as $field) {
            $data[$field] = Configuration::getValue($field, '');
        }

        return [
            'id' => 'crm_setup',
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
                'message' => 'Configuración de CRM guardada correctamente.'
            ]);
        } catch (\Exception $e) {
            \Alxarafe\Base\Database::connection()->rollBack();
            $this->jsonResponse(['error' => $e->getMessage()]);
        }
    }
}
