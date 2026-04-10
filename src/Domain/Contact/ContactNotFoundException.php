<?php

declare(strict_types=1);

namespace App\Domain\Contact;

class ContactNotFoundException extends \RuntimeException
{
    public static function withId(int $id): self
    {
        return new self("Contacto con ID {$id} no encontrado.", 404);
    }
}
