<?php

declare(strict_types=1);

namespace Modules\Alixar\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Container\Panel;
use Modules\Alixar\Model\Configuration;
use Alxarafe\Lib\Trans;

/**
 * Class OrganizationController
 *
 * Company setup — reads/writes configuration constants from llx_const.
 * Dolibarr equivalent: htdocs/admin/company.php
 *
 * All fields from Dolibarr's company configuration are included.
 *
 * @package Modules\Alixar\Controller
 */
#[Menu(
    menu: 'main_menu',
    label: 'Empresa',
    icon: 'fas fa-building',
    parent: \CoreModules\Admin\Controller\HomeController::class,
    order: 5
)]
class OrganizationController extends ResourceController
{
    protected bool $useTabs = true;

    #[\Override]
    protected function getModelClass()
    {
        return Configuration::class;
    }

    /**
     * Always edit mode for the 'mysoc' virtual record.
     */
    #[\Override]
    protected function detectMode()
    {
        $this->mode = self::MODE_EDIT;
        $this->recordId = 'mysoc';
    }

    #[\Override]
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

    #[\Override]
    protected function getEditFields(): array
    {
        // Build month options for fiscal month start
        $monthOptions = [];
        for ($i = 1; $i <= 12; $i++) {
            $monthOptions[(string)$i] = date('F', mktime(0, 0, 0, $i, 1));
        }

        return [
            // ── Tab 1: Company Identity ──────────────────────────────
            'main' => [
                'label' => 'Empresa',
                'fields' => [
                    new Panel('Datos Identificativos', [
                        new Text('MAIN_INFO_SOCIETE_NOM', 'Nombre de la Empresa', [
                            'required' => true,
                            'col' => 'col-md-6',
                        ]),
                        new Text('MAIN_INFO_SOCIETE_OBJECT', 'Actividad / Objeto Social', [
                            'col' => 'col-md-6',
                        ]),
                    ]),
                    new Panel('Dirección', [
                        new Text('MAIN_INFO_SOCIETE_COUNTRY', 'País', [
                            'col' => 'col-md-4',
                            'help' => 'Seleccione primero el país para determinar los campos fiscales.',
                        ]),
                        new Text('MAIN_INFO_SOCIETE_STATE', 'Provincia / Estado', [
                            'col' => 'col-md-4',
                        ]),
                        new Text('MAIN_INFO_SOCIETE_TOWN', 'Ciudad', [
                            'col' => 'col-md-4',
                        ]),
                        new Text('MAIN_INFO_SOCIETE_ADDRESS', 'Dirección'),
                        new Text('MAIN_INFO_SOCIETE_ZIP', 'Código Postal', [
                            'col' => 'col-md-3',
                        ]),
                    ]),
                ],
            ],

            // ── Tab 2: Contact ───────────────────────────────────────
            'contact' => [
                'label' => 'Contacto',
                'fields' => [
                    new Panel('Teléfono', [
                        new Text('MAIN_INFO_SOCIETE_TEL', 'Teléfono', [
                            'col' => 'col-md-4',
                        ]),
                        new Text('MAIN_INFO_SOCIETE_MOBILE', 'Móvil', [
                            'col' => 'col-md-4',
                        ]),
                        new Text('MAIN_INFO_SOCIETE_FAX', 'Fax', [
                            'col' => 'col-md-4',
                        ]),
                    ]),
                    new Panel('Internet', [
                        new Text('MAIN_INFO_SOCIETE_MAIL', 'Email', [
                            'col' => 'col-md-6',
                        ]),
                        new Text('MAIN_INFO_SOCIETE_WEB', 'Sitio Web', [
                            'col' => 'col-md-6',
                        ]),
                    ]),
                    new Panel('Identificación', [
                        new Text('MAIN_INFO_SOCIETE_GENCOD', 'Código de barras', [
                            'col' => 'col-md-6',
                        ]),
                    ]),
                ],
            ],

            // ── Tab 3: Fiscal ────────────────────────────────────────
            'fiscal' => [
                'label' => 'Fiscal',
                'fields' => [
                    new Panel('Identificación Fiscal', [
                        new Text('MAIN_INFO_TVAINTRA', 'NIF/CIF / IVA Intracomunitario', [
                            'col' => 'col-md-6',
                        ]),
                        new Text('MAIN_INFO_SOCIETE_FORME_JURIDIQUE', 'Forma Jurídica', [
                            'col' => 'col-md-6',
                        ]),
                    ]),
                    new Panel('Identificadores Profesionales', [
                        new Text('MAIN_INFO_SIREN', 'Prof ID 1 (SIREN / CIF)', [
                            'col' => 'col-md-4',
                        ]),
                        new Text('MAIN_INFO_SIRET', 'Prof ID 2 (SIRET)', [
                            'col' => 'col-md-4',
                        ]),
                        new Text('MAIN_INFO_APE', 'Prof ID 3 (APE / CNAE)', [
                            'col' => 'col-md-4',
                        ]),
                        new Text('MAIN_INFO_RCS', 'Prof ID 4 (RCS)', [
                            'col' => 'col-md-4',
                        ]),
                        new Text('MAIN_INFO_PROFID5', 'Prof ID 5', [
                            'col' => 'col-md-4',
                        ]),
                        new Text('MAIN_INFO_PROFID6', 'Prof ID 6', [
                            'col' => 'col-md-4',
                        ]),
                        new Text('MAIN_INFO_PROFID7', 'Prof ID 7', [
                            'col' => 'col-md-4',
                        ]),
                        new Text('MAIN_INFO_PROFID8', 'Prof ID 8', [
                            'col' => 'col-md-4',
                        ]),
                        new Text('MAIN_INFO_PROFID9', 'Prof ID 9', [
                            'col' => 'col-md-4',
                        ]),
                        new Text('MAIN_INFO_PROFID10', 'Prof ID 10', [
                            'col' => 'col-md-4',
                        ]),
                    ]),
                    new Panel('Ejercicio Fiscal', [
                        new Text('MAIN_INFO_CAPITAL', 'Capital Social', [
                            'col' => 'col-md-6',
                        ]),
                        new Text('SOCIETE_FISCAL_MONTH_START', 'Mes inicio ejercicio fiscal (1-12)', [
                            'col' => 'col-md-6',
                            'placeholder' => '1',
                        ]),
                    ]),
                ],
            ],

            // ── Tab 4: Responsables y Notas ──────────────────────────
            'notes' => [
                'label' => 'Responsables',
                'fields' => [
                    new Panel('Dirección y Responsables', [
                        new Text('MAIN_INFO_SOCIETE_MANAGERS', 'Gerentes / Directores', [
                            'col' => 'col-md-6',
                        ]),
                        new Text('MAIN_INFO_GDPR', 'Responsable GDPR / DPO', [
                            'col' => 'col-md-6',
                        ]),
                    ]),
                    new Panel('Notas', [
                        new Text('MAIN_INFO_SOCIETE_NOTE', 'Notas sobre la empresa', [
                            'placeholder' => 'Notas internas sobre la empresa...',
                        ]),
                    ]),
                ],
            ],

            // ── Tab 5: Avanzado ──────────────────────────────────────
            'advanced' => [
                'label' => 'Avanzado',
                'fields' => [
                    new Panel('Regional', [
                        new Text('MAIN_MONNAIE', 'Moneda (código ISO)', [
                            'col' => 'col-md-4',
                            'placeholder' => 'EUR',
                        ]),
                        new Text('MAIN_LANG_DEFAULT', 'Idioma por defecto', [
                            'col' => 'col-md-4',
                            'placeholder' => 'es_ES',
                        ]),
                        new Text('MAIN_FIRST_SYSLOG', 'Zona horaria', [
                            'col' => 'col-md-4',
                            'placeholder' => 'Europe/Madrid',
                        ]),
                    ]),
                    new Panel('Logotipo', [
                        new Text('MAIN_INFO_SOCIETE_LOGO', 'Nombre fichero logo', [
                            'col' => 'col-md-6',
                            'placeholder' => 'logo.png',
                        ]),
                        new Text('MAIN_INFO_SOCIETE_LOGO_SQUARRED', 'Logo cuadrado (miniatura)', [
                            'col' => 'col-md-6',
                            'placeholder' => 'logo_squarred.png',
                        ]),
                    ]),
                ],
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
     * Accepts constants starting with MAIN_ or SOCIETE_ (Dolibarr compatible).
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
                // Accept MAIN_* and SOCIETE_* prefixes (Dolibarr compatibility)
                if (str_starts_with($key, 'MAIN_') || str_starts_with($key, 'SOCIETE_')) {
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
     * Must match exactly the fields declared in getEditFields().
     */
    private function getAllConstantKeys(): array
    {
        return [
            // Tab 1: Empresa
            'MAIN_INFO_SOCIETE_NOM',
            'MAIN_INFO_SOCIETE_OBJECT',
            'MAIN_INFO_SOCIETE_COUNTRY',
            'MAIN_INFO_SOCIETE_STATE',
            'MAIN_INFO_SOCIETE_TOWN',
            'MAIN_INFO_SOCIETE_ADDRESS',
            'MAIN_INFO_SOCIETE_ZIP',

            // Tab 2: Contacto
            'MAIN_INFO_SOCIETE_TEL',
            'MAIN_INFO_SOCIETE_MOBILE',
            'MAIN_INFO_SOCIETE_FAX',
            'MAIN_INFO_SOCIETE_MAIL',
            'MAIN_INFO_SOCIETE_WEB',
            'MAIN_INFO_SOCIETE_GENCOD',

            // Tab 3: Fiscal
            'MAIN_INFO_TVAINTRA',
            'MAIN_INFO_SOCIETE_FORME_JURIDIQUE',
            'MAIN_INFO_SIREN',
            'MAIN_INFO_SIRET',
            'MAIN_INFO_APE',
            'MAIN_INFO_RCS',
            'MAIN_INFO_PROFID5',
            'MAIN_INFO_PROFID6',
            'MAIN_INFO_PROFID7',
            'MAIN_INFO_PROFID8',
            'MAIN_INFO_PROFID9',
            'MAIN_INFO_PROFID10',
            'MAIN_INFO_CAPITAL',
            'SOCIETE_FISCAL_MONTH_START',

            // Tab 4: Responsables y Notas
            'MAIN_INFO_SOCIETE_MANAGERS',
            'MAIN_INFO_GDPR',
            'MAIN_INFO_SOCIETE_NOTE',

            // Tab 5: Avanzado
            'MAIN_MONNAIE',
            'MAIN_LANG_DEFAULT',
            'MAIN_FIRST_SYSLOG',
            'MAIN_INFO_SOCIETE_LOGO',
            'MAIN_INFO_SOCIETE_LOGO_SQUARRED',
        ];
    }
}
