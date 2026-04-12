<?php

/**
 * Trading Plugin — Hook Registration.
 *
 * Hooks emitted by Trading:
 * - 'invoice.validated'  (action)  — After an invoice is validated
 * - 'order.validated'    (action)  — After an order is validated
 *
 * Hooks listened by Trading:
 * - 'thirdparty.tabs'    (filter)  — Adds Sales/Purchases tabs to ThirdParty detail
 * - 'menu.items'         (filter)  — Adds trading menu entries
 */

declare(strict_types=1);

use Core\Application\Plugin\HookRegistryInterface;
use Core\Application\Plugin\PluginRegistry;

return function (HookRegistryInterface $hooks): void {

    // ── Menu entries ─────────────────────────────────────────
    $hooks->on('menu.items', function (array $data): array {
        $data['items'][] = [
            'id'       => 'trading-sales',
            'label'    => 'Ventas',
            'icon'     => 'fas fa-file-invoice-dollar',
            'children' => [
                ['id' => 'proposals', 'label' => 'Presupuestos', 'route' => '/proposals',  'schema' => 'presupuestos'],
                ['id' => 'orders',    'label' => 'Pedidos',       'route' => '/orders',     'schema' => 'pedidos'],
                ['id' => 'invoices',  'label' => 'Facturas',      'route' => '/invoices',   'schema' => 'facturas'],
            ],
        ];
        $data['items'][] = [
            'id'       => 'trading-purchases',
            'label'    => 'Compras',
            'icon'     => 'fas fa-shopping-cart',
            'children' => [
                ['id' => 'supplierorders',   'label' => 'Pedidos Proveedor',  'route' => '/supplier-orders',   'schema' => 'pedidos-proveedor'],
                ['id' => 'supplierinvoices', 'label' => 'Facturas Proveedor', 'route' => '/supplier-invoices', 'schema' => 'facturas-proveedor'],
            ],
        ];
        return $data;
    });

    // ── Inject tabs into CRM ThirdParty detail ───────────────
    $hooks->on('thirdparty.tabs', function (array $data): array {
        $data['tabs'][] = [
            'id'     => 'proposals',
            'label'  => 'Presupuestos',
            'schema' => 'presupuestos',
            'filter' => ['third_party_id' => $data['thirdPartyId'] ?? null],
        ];
        $data['tabs'][] = [
            'id'     => 'orders',
            'label'  => 'Pedidos',
            'schema' => 'pedidos',
            'filter' => ['third_party_id' => $data['thirdPartyId'] ?? null],
        ];
        $data['tabs'][] = [
            'id'     => 'invoices',
            'label'  => 'Facturas',
            'schema' => 'facturas',
            'filter' => ['third_party_id' => $data['thirdPartyId'] ?? null],
        ];
        return $data;
    });
};
