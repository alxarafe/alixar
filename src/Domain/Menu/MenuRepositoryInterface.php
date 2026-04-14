<?php

declare(strict_types=1);

namespace Core\Domain\Menu;

/**
 * Puerto de acceso a los menús de navegación.
 * Define el contrato que cualquier adaptador de infraestructura debe cumplir.
 */
interface MenuRepositoryInterface
{
    /**
     * @return MenuNode[]
     */
    public function getTopMenus(): array;

    /**
     * @param string $mainmenu El ID del menú superior (ej: 'companies', 'billing')
     * @return MenuNode[]
     */
    public function getLeftMenus(string $mainmenu): array;
}
