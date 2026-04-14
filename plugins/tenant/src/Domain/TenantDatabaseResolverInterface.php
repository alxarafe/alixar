<?php

declare(strict_types=1);

namespace Plugin\Tenant\Domain;

/**
 * Puerto (driven): Resuelve la conexión de base de datos para un tenant dado.
 */
interface TenantDatabaseResolverInterface
{
    /**
     * Devuelve una instancia PDO configurada para el tenant dado.
     * En caso de BD compartida (shared), puede ser la BD principal
     * con alguna inicialización de contexto.
     *
     * @param Tenant $tenant
     * @return \PDO
     * @throws \RuntimeException Si no puede conectar a la BD del tenant
     */
    public function resolve(Tenant $tenant): \PDO;
}
