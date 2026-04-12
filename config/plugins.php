<?php

declare(strict_types=1);

/**
 * Active plugins configuration.
 *
 * Lists the plugins that should be loaded at boot time.
 * Only plugins whose folder exists in plugins/ AND are listed here will be activated.
 *
 * Order doesn't matter — the PluginRegistry resolves the correct load order
 * via topological sort based on each plugin's 'requires' declarations.
 */
return [
    'crm',
    'trading',
    'products',
    'projects',
    'finance',
];
