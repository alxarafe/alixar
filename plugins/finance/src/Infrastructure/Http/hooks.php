<?php

declare(strict_types=1);

use Core\Application\Plugin\HookRegistryInterface;
use Core\Application\Plugin\PluginRegistry;

return function (HookRegistryInterface $hooks, PluginRegistry $registry): void {
    $hooks->on('menu.items', function (array $data): array {
        $data['items'][] = [
            'id'       => 'finance',
            'label'    => 'Tesorería',
            'icon'     => 'fas fa-university',
            'children' => [
                ['id' => 'bankaccounts', 'label' => 'Cuentas Bancarias', 'route' => '/bank-accounts', 'schema' => 'cuentas-bancarias'],
            ],
        ];
        return $data;
    });
};
