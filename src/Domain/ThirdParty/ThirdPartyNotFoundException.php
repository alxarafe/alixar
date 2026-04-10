<?php

declare(strict_types=1);

namespace App\Domain\ThirdParty;

/**
 * ThirdPartyNotFoundException — Thrown when a ThirdParty is not found.
 */
class ThirdPartyNotFoundException extends \RuntimeException
{
    public static function withId(int $id): self
    {
        return new self("Tercero con ID {$id} no encontrado.", 404);
    }
}
