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

namespace Modules\CRM\Application\Bus\Command;

use Alxarafe\Application\Bus\Command;

/**
 * UpdateContactCommand — Immutable command to update an existing Contact.
 */
readonly class UpdateContactCommand implements Command
{
    public function __construct(
        public int $id,
        public ?string $lastname = null,
        public ?string $firstname = null,
        public ?int $thirdPartyId = null,
        public ?string $civility = null,
        public ?string $position = null,
        public ?string $phone = null,
        public ?string $phonePersonal = null,
        public ?string $phoneMobile = null,
        public ?string $fax = null,
        public ?string $email = null,
        public ?string $url = null,
        public ?string $address = null,
        public ?string $zip = null,
        public ?string $town = null,
        public ?int $stateId = null,
        public ?int $countryId = null,
        public ?string $notePrivate = null,
        public ?string $notePublic = null,
    ) {
    }
}
