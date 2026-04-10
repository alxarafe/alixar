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
use Modules\CRM\Application\Bus\Command\CreateThirdPartyCommand;
use Modules\CRM\Domain\Model\ThirdParty;
use Modules\CRM\Domain\Port\Driven\ThirdPartyRepositoryInterface;
use Modules\CRM\Domain\Service\ReferenceGenerator;
use Modules\CRM\Domain\ValueObject\ThirdPartyType;

/**
 * CreateThirdPartyHandler — Orchestrates ThirdParty creation.
 *
 * Same pattern as Chascarrillo's CreatePostHandler.
 */
class CreateThirdPartyHandler implements CommandHandler
{
    public function __construct(
        private ThirdPartyRepositoryInterface $repository,
        private ReferenceGenerator $referenceGenerator,
    ) {
    }

    /**
     * @param CreateThirdPartyCommand $command
     */
    public function handle(Command $command): mixed
    {
        $type = ThirdPartyType::from($command->type);

        // 1. Create domain entity
        $thirdParty = new ThirdParty(
            name: $command->name,
            type: $type,
            isSupplier: $command->isSupplier,
            nameAlias: $command->nameAlias,
        );

        // 2. Generate customer code if applicable
        if ($type->isCustomer()) {
            $mask = 'CU{yy}{mm}-{0000}';
            $prefix = $this->referenceGenerator->extractPrefix($mask);
            $lastNum = $this->repository->getLastReferenceNumber('code_client', $prefix);
            $code = $this->referenceGenerator->generate($mask, $lastNum);
            $thirdParty->setCustomerCode($code);
        }

        // 3. Generate supplier code if applicable
        if ($command->isSupplier) {
            $mask = 'SU{yy}{mm}-{0000}';
            $prefix = $this->referenceGenerator->extractPrefix($mask);
            $lastNum = $this->repository->getLastReferenceNumber('code_fournisseur', $prefix);
            $code = $this->referenceGenerator->generate($mask, $lastNum);
            $thirdParty->setSupplierCode($code);
        }

        // 4. Set address
        $thirdParty->updateAddress(
            $command->address,
            $command->zip,
            $command->town,
            $command->stateId,
            $command->countryId,
        );

        // 5. Set contact info
        $thirdParty->updateContact(
            $command->phone,
            $command->phoneMobile,
            $command->fax,
            $command->email,
            $command->url,
        );

        // 6. Set notes
        $thirdParty->updateNotes($command->notePrivate, $command->notePublic);

        // 7. Persist via port
        $this->repository->save($thirdParty);

        return $thirdParty->getId();
    }
}
