<?php

declare(strict_types=1);

use Core\Application\Plugin\HookRegistryInterface;
use Core\Application\Plugin\PluginRegistry;

return function (HookRegistryInterface $hooks, PluginRegistry $registry): void {
    $hooks->on('menu.items', function (array $data): array {
        $data['items'][] = [
            'id'       => 'products',
            'label'    => 'Productos',
            'icon'     => 'fas fa-box-open',
            'children' => [
                ['id' => 'products', 'label' => 'Productos/Servicios', 'route' => '/products', 'schema' => 'productos'],
            ],
        ];
        return $data;
    });
};
