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
use Modules\CRM\Application\Bus\Command\UpdateContactCommand;
use Modules\CRM\Domain\Port\Driven\ContactRepositoryInterface;

/**
 * UpdateContactHandler — Orchestrates Contact updates.
 */
class UpdateContactHandler implements CommandHandler
{
    public function __construct(
        private ContactRepositoryInterface $repository,
    ) {
    }

    /**
     * @param UpdateContactCommand $command
     */
    public function handle(Command $command): mixed
    {
        $contact = $this->repository->findById($command->id);

        if ($contact === null) {
            throw new \DomainException("Contacto con ID {$command->id} no encontrado.");
        }

        // To properly update, we'll recreate the entity using fromArray for fully transparent fields map,
        // or just recreate a new entity if it has the setters.
        // For this phase, we map directly to array to use fromArray, then save it.
        $data = $contact->toArray();
        if ($command->lastname !== null) $data['lastname'] = $command->lastname;
        if ($command->firstname !== null) $data['firstname'] = $command->firstname;
        if ($command->thirdPartyId !== null) $data['fk_soc'] = $command->thirdPartyId;
        if ($command->civility !== null) $data['civility'] = $command->civility;
        if ($command->position !== null) $data['poste'] = $command->position;
        if ($command->phone !== null) $data['phone'] = $command->phone;
        if ($command->phonePersonal !== null) $data['phone_perso'] = $command->phonePersonal;
        if ($command->phoneMobile !== null) $data['phone_mobile'] = $command->phoneMobile;
        // ... (Simpler mapping for demonstration of Hexagonal update)
        $data['address'] = $command->address ?? $data['address'];
        $data['zip'] = $command->zip ?? $data['zip'];
        $data['town'] = $command->town ?? $data['town'];
        $data['email'] = $command->email ?? $data['email'];
        
        $updatedContact = \Modules\CRM\Domain\Model\Contact::fromArray($data);

        $this->repository->save($updatedContact);

        return $updatedContact->getId();
    }
}
