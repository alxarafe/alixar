<?php

declare(strict_types=1);

namespace Core\Infrastructure\Http\Api\Controller;

use Core\Application\Menu\GetNavigationTree;
use Flight;

class SetupApiController
{
    public function __construct(
        private GetNavigationTree $getNavigationTree
    ) {
}

    /**
     * GET /api/setup/menus
     * Obtiene el árbol de navegación. Acepta query param ?mainmenu=xxx para cargar el menú lateral.
     */
    public function getMenus(): void
    {
        $request = Flight::request();
        $mainmenu = (string) ($request->query['mainmenu'] ?? '');

        try {
            $menus = $this->getNavigationTree->execute($mainmenu);
            Flight::json($menus);
        } catch (\Exception $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }
}
