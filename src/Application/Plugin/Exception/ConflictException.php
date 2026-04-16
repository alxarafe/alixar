<?php

declare(strict_types=1);

namespace Core\Application\Plugin\Exception;

/**
 * Thrown when a plugin cannot be activated because it conflicts with an active plugin.
 */
final class ConflictException extends \RuntimeException
{
    public function __construct(string $plugin, string $conflict)
    {
        parent::__construct(
            "Cannot activate plugin '{$plugin}': conflicts with active plugin '{$conflict}'."
        );
    }
}
