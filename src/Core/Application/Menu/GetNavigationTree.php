<?php

declare(strict_types=1);

namespace Core\Application\Menu;

use Core\Domain\Menu\MenuRepositoryInterface;

class GetNavigationTree
{
    public function __construct(
        private MenuRepositoryInterface $menuRepository
    ) {
}

    /**
     * Devuelve el árbol completo de navegación combinando el superior y opcionalmente el lateral.
     */
    public function execute(string $mainmenu = ''): array
    {
        $leftMenus = [];
        if ($mainmenu !== '') {
            $leftNodes = $this->menuRepository->getLeftMenus($mainmenu);
            $leftMenus = array_map(fn($node) => $node->toArray(), $leftNodes);
        }

        return [
            'top' => array_map(fn($node) => $node->toArray(), $this->menuRepository->getTopMenus()),
            'left' => $leftMenus
        ];
    }
}
