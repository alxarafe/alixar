<?php

declare(strict_types=1);

/*
 * Copyright (C) 2024-2026 Rafael San José <rsanjose@alxarafe.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 */

namespace Modules\CRM\Application;

use Alxarafe\Application\Bus\SimpleCommandBus;
use Alxarafe\Domain\Port\Driven\PersistencePort;
use Alxarafe\Infrastructure\Adapter\Persistence\PdoMysqlAdapter;
use Alxarafe\Infrastructure\Container\ServiceContainer;
use Alxarafe\Infrastructure\Persistence\Config;
use Modules\CRM\Application\Bus\Command\CreateContactCommand;
use Modules\CRM\Application\Bus\Command\UpdateContactCommand;
use Modules\CRM\Application\Bus\Command\CreateThirdPartyCommand;
use Modules\CRM\Application\Bus\Command\UpdateThirdPartyCommand;
use Modules\CRM\Application\Bus\Handler\CreateContactHandler;
use Modules\CRM\Application\Bus\Handler\UpdateContactHandler;
use Modules\CRM\Application\Bus\Handler\CreateThirdPartyHandler;
use Modules\CRM\Application\Bus\Handler\UpdateThirdPartyHandler;
use Modules\CRM\Domain\Port\Driven\ContactRepositoryInterface;
use Modules\CRM\Domain\Port\Driven\ThirdPartyRepositoryInterface;
use Modules\CRM\Domain\Service\ReferenceGenerator;
use Modules\CRM\Infrastructure\Adapter\Persistence\PdoContactRepository;
use Modules\CRM\Infrastructure\Adapter\Persistence\PdoThirdPartyRepository;

/**
 * AppContainer — DI Container for the CRM module.
 *
 * Same pattern as Chascarrillo\Application\AppContainer.
 * Wires all ports to their infrastructure adapters and registers command handlers.
 */
class AppContainer
{
    private static ?ServiceContainer $instance = null;

    public static function get(): ServiceContainer
    {
        if (self::$instance === null) {
            $container = new ServiceContainer();

            // ── Persistence Port (Dolibarr uses `rowid` as primary key) ──
            $container->singleton(PersistencePort::class, function () {
                $dbConfig = Config::getConfig()->db;
                return PdoMysqlAdapter::fromConfig($dbConfig, 'rowid');
            });

            // ── Domain Services ──
            $container->singleton(ReferenceGenerator::class, function () {
                return new ReferenceGenerator();
            });

            // ── Repositories ──
            $container->singleton(ThirdPartyRepositoryInterface::class, function ($c) {
                return new PdoThirdPartyRepository(
                    $c->get(PersistencePort::class)
                );
            });

            $container->singleton(ContactRepositoryInterface::class, function ($c) {
                return new PdoContactRepository(
                    $c->get(PersistencePort::class)
                );
            });

            // ── Command Bus ──
            $container->singleton(SimpleCommandBus::class, function ($c) {
                $bus = new SimpleCommandBus();

                $bus->registerCommand(
                    CreateThirdPartyCommand::class,
                    new CreateThirdPartyHandler(
                        $c->get(ThirdPartyRepositoryInterface::class),
                        $c->get(ReferenceGenerator::class),
                    )
                );

                $bus->registerCommand(
                    UpdateThirdPartyCommand::class,
                    new UpdateThirdPartyHandler(
                        $c->get(ThirdPartyRepositoryInterface::class),
                    )
                );

                $bus->registerCommand(
                    CreateContactCommand::class,
                    new CreateContactHandler(
                        $c->get(ContactRepositoryInterface::class),
                    )
                );

                $bus->registerCommand(
                    UpdateContactCommand::class,
                    new UpdateContactHandler(
                        $c->get(ContactRepositoryInterface::class),
                    )
                );

                return $bus;
            });

            self::$instance = $container;
        }

        return self::$instance;
    }

    /**
     * Reset the container (useful for testing).
     */
    public static function reset(): void
    {
        self::$instance = null;
    }
}
