<?php

namespace Modules\Alixar\Controller;

use Alxarafe\Base\Controller\ViewController;
use Alxarafe\Base\Controller\Trait\DbTrait;
use Alxarafe\Attribute\Menu;
use Alxarafe\Lib\Trans;
use Alxarafe\Lib\Functions;
use Modules\Alixar\Model\Configuration;

#[Menu(
    menu: 'main_menu',
    label: 'Configuración Inicial',
    icon: 'fas fa-magic',
    order: 0,
    permission: 'Alixar.Setup'
)]
class SetupController extends ViewController
{
    use DbTrait;

    /**
     * Dashboard-like landing page for the initial setup wizard.
     */
    public function doIndex(): bool
    {
        $this->addVariable('title', 'Asistente de Configuración - Alixar');

        $socName = Configuration::getValue('MAIN_INFO_SOCIETE_NOM');

        $steps = [
            'tech' => [
                'label' => 'Requisitos Técnicos',
                'description' => 'Configuración de base de datos y migraciones.',
                'completed' => true,
                'url' => \CoreModules\Admin\Controller\ConfigController::url(),
                'icon' => 'fas fa-database'
            ],
            'organization' => [
                'label' => 'Datos de la Empresa',
                'description' => 'Nombre, NIF, dirección y contacto de tu organización.',
                'completed' => (bool)$socName,
                'url' => OrganizationController::url(),
                'icon' => 'fas fa-building'
            ],
            'modules' => [
                'label' => 'Módulos y Funcionalidades',
                'description' => 'Activa los módulos que necesites de Dolibarr.',
                'completed' => (bool)Configuration::where('name', 'like', 'MAIN_MODULE_%')->where('value', '1')->exists(),
                'url' => $this::url('doModules'),
                'icon' => 'fas fa-cubes'
            ]
        ];

        $this->addVariable('steps', $steps);
        $this->addVariable('socName', $socName);

        $this->setDefaultTemplate('page/setup_wizard');
        return true;
    }

    /**
     * Lists all Dolibarr modules and their states.
     * 
     * @return bool
     */
    public function doModules(): bool
    {
        $this->addVariable('title', 'Gestión de Módulos Dolibarr - Alixar');

        $modules = \Modules\Alixar\Lib\DolibarrHelper::listModules();
        $config = Configuration::where('name', 'like', 'MAIN_MODULE_%')->get()->pluck('value', 'name')->toArray();

        foreach ($modules as &$mod) {
            $mod['active'] = (isset($config[$mod['const_name']]) && $config[$mod['const_name']] == 1);
        }

        $this->addVariable('modules', $modules);
        $this->setDefaultTemplate('page/setup_modules');
        return true;
    }

    /**
     * Activates a Dolibarr module in Alixar.
     */
    public function doActivateModule()
    {
        $name = $_REQUEST['name'] ?? null;
        if ($name) {
            Configuration::setValue('MAIN_MODULE_' . strtoupper($name), 1);
            \Alxarafe\Lib\Messages::addMessage("Módulo {$name} activado.");
        }

        Functions::httpRedirect($this::url('doModules'));
    }

    /**
     * Deactivates a Dolibarr module in Alixar.
     */
    public function doDeactivateModule()
    {
        $name = $_REQUEST['name'] ?? null;
        if ($name) {
            Configuration::where('name', 'MAIN_MODULE_' . strtoupper($name))->delete();
            \Alxarafe\Lib\Messages::addMessage("Módulo {$name} desactivado.");
        }

        Functions::httpRedirect($this::url('doModules'));
    }
}
