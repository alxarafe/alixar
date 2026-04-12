<?php

declare(strict_types=1);

namespace Core\Application\Plugin\Exception;

/**
 * Thrown when a plugin cannot be deactivated because other active plugins depend on it.
 */
final class DependencyBlockException extends \RuntimeException
{
    public function __construct(string $plugin, string $dependent)
    {
        parent::__construct(
            "Cannot deactivate plugin '{$plugin}': plugin '{$dependent}' depends on it."
        );
    }
}
