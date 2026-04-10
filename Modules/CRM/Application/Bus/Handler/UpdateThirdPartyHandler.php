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

namespace Modules\CRM\Application\Bus\Handler;

use Alxarafe\Application\Bus\Command;
use Alxarafe\Application\Bus\CommandHandler;
use Modules\CRM\Application\Bus\Command\UpdateThirdPartyCommand;
use Modules\CRM\Domain\Port\Driven\ThirdPartyRepositoryInterface;
use Modules\CRM\Domain\ValueObject\ThirdPartyStatus;
use Modules\CRM\Domain\ValueObject\ThirdPartyType;

/**
 * UpdateThirdPartyHandler — Orchestrates ThirdParty updates.
 */
class UpdateThirdPartyHandler implements CommandHandler
{
    public function __construct(
        private ThirdPartyRepositoryInterface $repository,
    ) {
    }

    /**
     * @param UpdateThirdPartyCommand $command
     */
    public function handle(Command $command): mixed
    {
        $thirdParty = $this->repository->findById($command->id);

        if ($thirdParty === null) {
            throw new \DomainException("Tercero con ID {$command->id} no encontrado.");
        }

        // Update basic fields if provided (null = not changed)
        // Since the entity is immutable-ish, we rebuild via fromArray for non-address fields
        // For now, use the address/contact/notes update methods

        if ($command->address !== null || $command->zip !== null || $command->town !== null) {
            $thirdParty->updateAddress(
                $command->address,
                $command->zip,
                $command->town,
                $command->stateId,
                $command->countryId,
            );
        }

        if ($command->phone !== null || $command->email !== null) {
            $thirdParty->updateContact(
                $command->phone,
                $command->phoneMobile,
                $command->fax,
                $command->email,
                $command->url,
            );
        }

        if ($command->notePrivate !== null || $command->notePublic !== null) {
            $thirdParty->updateNotes($command->notePrivate, $command->notePublic);
        }

        // Handle status transition if requested
        if ($command->targetStatus !== null) {
            $target = ThirdPartyStatus::from($command->targetStatus);
            $thirdParty->transitionTo($target);
        }

        $this->repository->save($thirdParty);

        return $thirdParty->getId();
    }
}
