<?php

declare(strict_types=1);

namespace Core\Application\Plugin\Exception;

/**
 * Thrown when a plugin cannot be activated because a required dependency is not active.
 */
final class DependencyNotMetException extends \RuntimeException
{
    public function __construct(string $plugin, string $dependency)
    {
        parent::__construct(
            "Cannot activate plugin '{$plugin}': required dependency '{$dependency}' is not active."
        );
    }
}
