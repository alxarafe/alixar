<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Persistence\Mysql\Menu;

use Core\Application\Configuration\ConfigurationPort;
use Core\Domain\Menu\MenuNode;
use Core\Domain\Menu\MenuRepositoryInterface;
use PDO;

/**
 * Adaptador "Legacy" que lee de la base de datos de Dolibarr pero expone un formato limpio.
 * Sigue el principio del Strangler Fig Pattern: cuando queramos desvincularnos de Dolibarr,
 * reemplazaremos este adaptador sin tocar el frontend ni el caso de uso.
 */
class MysqlLegacyDolibarrMenuAdapter implements MenuRepositoryInterface
{
    public function __construct(
        private PDO $pdo,
        private ConfigurationPort $config,
        private string $tablePrefix = 'llx_'
    ) {
}

    #[\Override]
    public function getTopMenus(): array
    {
        // Mapeo declarativo (Dolibarr los tiene hardcoded en PHP, nosotros los definimos aquí limpios)
        /** @var array<int, array{id: string, label: string, module: string, route: string}> $declarative */
        $declarative = [
            ['id' => 'home', 'label' => 'Inicio', 'module' => 'always', 'route' => '/'],
            ['id' => 'users', 'label' => 'Usuarios', 'module' => 'always', 'route' => '/usuarios'],
            ['id' => 'roles', 'label' => 'Roles y Permisos', 'module' => 'always', 'route' => '/roles'],
            /* Temporalmente deshabilitados mientras desarrollamos el core puro
            ['id' => 'companies', 'label' => 'Terceros', 'module' => 'SOCIETE', 'route' => '/terceros'],
            ['id' => 'contacts', 'label' => 'Contactos', 'module' => 'SOCIETE', 'route' => '/contactos'],
            ['id' => 'products', 'label' => 'Productos / Servicios', 'module' => 'PRODUCT', 'route' => '/productos'],
            ['id' => 'mrp', 'label' => 'MRP', 'module' => 'MRP', 'route' => '/mrp'],
            ['id' => 'project', 'label' => 'Proyectos', 'module' => 'PROJET', 'route' => '/proyectos'],
            ['id' => 'commercial', 'label' => 'Comercial', 'module' => 'PROPALE', 'route' => '/comercial'],
            ['id' => 'billing', 'label' => 'Financiera', 'module' => 'FACTURE', 'route' => '/financiera'],
            ['id' => 'bank', 'label' => 'Bancos | Cajas', 'module' => 'BANQUE', 'route' => '/bancos'],
            ['id' => 'accountancy', 'label' => 'Contabilidad', 'module' => 'ACCOUNTING', 'route' => '/contabilidad'],
            ['id' => 'hrm', 'label' => 'RRHH', 'module' => 'HRM', 'route' => '/rrhh'],
            ['id' => 'ecm', 'label' => 'Documentos', 'module' => 'ECM', 'route' => '/documentos'],
            ['id' => 'agenda', 'label' => 'Agenda', 'module' => 'AGENDA', 'route' => '/agenda'],
            ['id' => 'ticket', 'label' => 'Tickets', 'module' => 'TICKET', 'route' => '/tickets']
            */
        ];

        $result = [];
        $pos = 0;
        foreach ($declarative as $def) {
            $enabled = $def['module'] === 'always' || $this->config->getBool('MAIN_MODULE_' . $def['module']);
            if ($enabled) {
                $pos += 10;
                $result[] = new MenuNode(
                    id: $def['id'],
                    label: $def['label'],
                    icon: $def['id'],
                    route: $def['route'],
                    position: $pos
                );
            }
        }
        return $result;
    }

    #[\Override]
    public function getLeftMenus(string $mainmenu): array
    {
        $table = $this->tablePrefix . 'menu';
        try {
            $sql = "SELECT rowid, fk_menu, titre, url, position, enabled 
                    FROM {$table} 
                    WHERE type='left' AND mainmenu = :mainmenu 
                    ORDER BY position";
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['mainmenu' => $mainmenu]);

            $result = [];
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                // Introspección básica de permisos ("caos" de Dolibarr, aislado aquí adentro)
                $enabled = true;
                if (!empty($row['enabled']) && preg_match('/isModEnabled\("([^"]+)"\)/i', $row['enabled'], $matches)) {
                    $moduleName = strtoupper($matches[1]);
                    $enabled = $this->config->getBool('MAIN_MODULE_' . $moduleName);
                }

                if ($enabled) {
                    $result[] = new MenuNode(
                        id: 'left_' . $row['rowid'],
                        label: $row['titre'],
                        icon: '',
                        route: $row['url'] ?? '',
                        position: (int)$row['position']
                    );
                }
            }
            return $result;
        } catch (\PDOException $e) {
            // Si la tabla legacy no existe (ej. Core limpio), devolver array vacío sin tumbar el router
            return [];
        }
    }
}
