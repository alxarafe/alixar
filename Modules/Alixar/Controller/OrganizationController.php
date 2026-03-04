<?php

declare(strict_types=1);

namespace Modules\Alixar\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Configuration;
use Alxarafe\Lib\Trans;

/**
 * Class OrganizationController
 *
 * Company setup — reads/writes MAIN_INFO_SOCIETE_* constants from llx_const.
 * Dolibarr equivalent: htdocs/admin/company.php
 *
 * @package Modules\Alixar\Controller
 */
#[Menu(
    menu: 'main_menu',
    label: 'Empresa',
    icon: 'fas fa-building',
    parent: DashboardController::class,
    order: 10,
    permission: 'Alixar.Setup'
)]
class OrganizationController extends ResourceController
{
    protected bool $useTabs = true;

    protected function getModelClass()
    {
        return Configuration::class;
    }

    /**
     * Always edit mode for the 'mysoc' virtual record.
     */
    protected function detectMode()
    {
        $this->mode = self::MODE_EDIT;
        $this->recordId = 'mysoc';
    }

    #[Menu(
        menu: 'main_menu',
        label: 'Empresa',
        icon: 'fas fa-building',
        parent: OrganizationController::class,
        order: 1,
        permission: 'Alixar.Setup'
    )]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    protected function getEditFields(): array
    {
        return [
            'main' => [
                'label' => 'Empresa',
                'fields' => [
                    new Panel('Datos Identificativos', [
                        new Text('MAIN_INFO_SOCIETE_NOM', 'Nombre de la Empresa', ['required' => true, 'col' => 'col-md-6']),
                        new Text('MAIN_INFO_SOCIETE_OBJECT', 'Actividad / Objeto Social', ['col' => 'col-md-6']),
                    ]),
                    new Panel('Dirección', [
                        new Text('MAIN_INFO_SOCIETE_ADDRESS', 'Dirección'),
                        new Text('MAIN_INFO_SOCIETE_ZIP', 'Código Postal', ['col' => 'col-md-3']),
                        new Text('MAIN_INFO_SOCIETE_TOWN', 'Ciudad', ['col' => 'col-md-3']),
                        new Text('MAIN_INFO_SOCIETE_STATE', 'Provincia', ['col' => 'col-md-3']),
                        new Text('MAIN_INFO_SOCIETE_COUNTRY', 'País', ['col' => 'col-md-3']),
                    ]),
                ]
            ],
            'contact' => [
                'label' => 'Contacto',
                'fields' => [
                    new Panel('Teléfono y Email', [
                        new Text('MAIN_INFO_SOCIETE_TEL', 'Teléfono', ['col' => 'col-md-4']),
                        new Text('MAIN_INFO_SOCIETE_FAX', 'Fax', ['col' => 'col-md-4']),
                        new Text('MAIN_INFO_SOCIETE_MAIL', 'Email', ['col' => 'col-md-4']),
                        new Text('MAIN_INFO_SOCIETE_WEB', 'Sitio Web'),
                    ]),
                ]
            ],
            'fiscal' => [
                'label' => 'Fiscal',
                'fields' => [
                    new Panel('Identificación Fiscal', [
                        new Text('MAIN_INFO_TVAINTRA', 'NIF/CIF / IVA Intracomunitario', ['col' => 'col-md-6']),
                        new Text('MAIN_INFO_SIREN', 'SIREN / CIF', ['col' => 'col-md-6']),
                        new Text('MAIN_INFO_SIRET', 'SIRET', ['col' => 'col-md-6']),
                        new Text('MAIN_INFO_APE', 'APE / CNAE', ['col' => 'col-md-6']),
                        new Text('MAIN_INFO_SOCIETE_FORME_JURIDIQUE', 'Forma Jurídica', ['col' => 'col-md-4']),
                        new Text('MAIN_INFO_CAPITAL', 'Capital Social', ['col' => 'col-md-4']),
                        new Text('MAIN_INFO_SOCIETE_MANAGER', 'Gerente / Responsable', ['col' => 'col-md-4']),
                    ]),
                ]
            ],
            'advanced' => [
                'label' => 'Avanzado',
                'fields' => [
                    new Panel('Regional', [
                        new Text('MAIN_MONNAIE', 'Moneda (código ISO)', ['col' => 'col-md-4', 'placeholder' => 'EUR']),
                        new Text('MAIN_LANG_DEFAULT', 'Idioma por defecto', ['col' => 'col-md-4', 'placeholder' => 'es_ES']),
                        new Text('MAIN_FIRST_SYSLOG', 'Zona horaria', ['col' => 'col-md-4', 'placeholder' => 'Europe/Madrid']),
                    ]),
                    new Panel('Logotipo', [
                        new Text('MAIN_INFO_SOCIETE_LOGO', 'Nombre fichero logo', ['placeholder' => 'logo.png']),
                    ]),
                ]
            ],
        ];
    }

    /**
     * Provide values from the 'const' table.
     */
    #[\Override]
    protected function fetchRecordData(): array
    {
        $fields = $this->getAllConstantKeys();
        $data = [];
        foreach ($fields as $field) {
            $data[$field] = Configuration::getValue($field, '');
        }

        return [
            'id' => 'mysoc',
            'data' => (object) $data,
            'meta' => ['model' => 'Configuration']
        ];
    }

    /**
     * Store each field as a separate constant in the 'const' table.
     */
    #[\Override]
    protected function saveRecord()
    {
        $data = $_POST['data'] ?? $_POST;
        $exclude = ['module', 'controller', 'action', 'id', 'ajax', 'PHPSESSID'];
        foreach ($exclude as $key) {
            unset($data[$key]);
        }

        if (empty($data)) {
            $this->jsonResponse(['error' => 'No data provided']);
            exit;
        }

        try {
            \Alxarafe\Base\Database::connection()->beginTransaction();
            foreach ($data as $key => $value) {
                if (str_starts_with($key, 'MAIN_')) {
                    Configuration::setValue($key, $value);
                }
            }
            \Alxarafe\Base\Database::connection()->commit();
            $this->jsonResponse([
                'status' => 'success',
                'message' => 'Configuración de la empresa guardada correctamente.'
            ]);
        } catch (\Exception $e) {
            \Alxarafe\Base\Database::connection()->rollBack();
            $this->jsonResponse(['error' => $e->getMessage()]);
        }
    }

    /**
     * Get all constant keys used in the edit form.
     */
    private function getAllConstantKeys(): array
    {
        return [
            'MAIN_INFO_SOCIETE_NOM',
            'MAIN_INFO_SOCIETE_OBJECT',
            'MAIN_INFO_SOCIETE_ADDRESS',
            'MAIN_INFO_SOCIETE_ZIP',
            'MAIN_INFO_SOCIETE_TOWN',
            'MAIN_INFO_SOCIETE_STATE',
            'MAIN_INFO_SOCIETE_COUNTRY',
            'MAIN_INFO_SOCIETE_TEL',
            'MAIN_INFO_SOCIETE_FAX',
            'MAIN_INFO_SOCIETE_MAIL',
            'MAIN_INFO_SOCIETE_WEB',
            'MAIN_INFO_TVAINTRA',
            'MAIN_INFO_SIREN',
            'MAIN_INFO_SIRET',
            'MAIN_INFO_APE',
            'MAIN_INFO_RCS',
            'MAIN_INFO_IDPROF5',
            'MAIN_INFO_IDPROF6',
            'MAIN_INFO_SOCIETE_FORME_JURIDIQUE',
            'MAIN_INFO_CAPITAL',
            'MAIN_INFO_SOCIETE_MANAGER',
            'MAIN_MONNAIE',
            'MAIN_LANG_DEFAULT',
            'MAIN_FIRST_SYSLOG',
            'MAIN_INFO_SOCIETE_LOGO',
        ];
    }
}
