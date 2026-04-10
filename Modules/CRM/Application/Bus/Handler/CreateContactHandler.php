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
use Modules\CRM\Application\Bus\Command\CreateContactCommand;
use Modules\CRM\Domain\Model\Contact;
use Modules\CRM\Domain\Port\Driven\ContactRepositoryInterface;

/**
 * CreateContactHandler — Orchestrates Contact creation.
 */
class CreateContactHandler implements CommandHandler
{
    public function __construct(
        private ContactRepositoryInterface $repository,
    ) {
    }

    /**
     * @param CreateContactCommand $command
     */
    public function handle(Command $command): mixed
    {
        $contact = new Contact(
            lastname: $command->lastname,
            firstname: $command->firstname,
            thirdPartyId: $command->thirdPartyId,
        );

        $this->repository->save($contact);

        return $contact->getId();
    }
}
