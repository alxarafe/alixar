<?php

/**
 * CRM Plugin — Hook Registration.
 *
 * Registers hooks that the CRM plugin emits or listens to.
 * Other plugins can hook into CRM via these hooks.
 *
 * Available hooks emitted by CRM:
 * - 'thirdparty.tabs'     (filter)  — Allows other plugins to add tabs to a ThirdParty detail view
 * - 'thirdparty.created'  (action)  — Fired after a ThirdParty is created
 * - 'contact.created'     (action)  — Fired after a Contact is created
 *
 * @return \Closure(HookRegistryInterface, PluginRegistry): void
 */

declare(strict_types=1);

use Core\Application\Plugin\HookRegistryInterface;
use Core\Application\Plugin\PluginRegistry;

return function (HookRegistryInterface $hooks): void {
    // CRM contributes its own menu entries
    $hooks->on('menu.items', function (array $data): array {
        $data['items'][] = [
            'id'       => 'crm',
            'label'    => 'CRM',
            'icon'     => 'fas fa-id-card',
            'children' => [
                ['id' => 'thirdparties', 'label' => 'Terceros',  'route' => '/thirdparties', 'schema' => 'terceros'],
                ['id' => 'contacts',     'label' => 'Contactos', 'route' => '/contacts',     'schema' => 'contactos'],
                ['id' => 'events',       'label' => 'Agenda',    'route' => '/events',        'schema' => 'agenda'],
            ],
        ];
        return $data;
    });
};
