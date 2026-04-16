<?php

declare(strict_types=1);

use Core\Application\Plugin\HookRegistryInterface;
use Core\Application\Plugin\PluginRegistry;

return function (HookRegistryInterface $hooks, PluginRegistry $registry): void {
    $hooks->on('menu.items', function (array $data): array {
        $data['items'][] = [
            'id'       => 'projects',
            'label'    => 'Proyectos',
            'icon'     => 'fas fa-project-diagram',
            'children' => [
                ['id' => 'projects', 'label' => 'Proyectos', 'route' => '/projects', 'schema' => 'proyectos'],
            ],
        ];
        return $data;
    });
};
