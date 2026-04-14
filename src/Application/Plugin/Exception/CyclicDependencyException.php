<?php

declare(strict_types=1);

namespace Core\Application\Plugin\Exception;

/**
 * Thrown when plugin dependencies form a cycle (A requires B, B requires A).
 */
final class CyclicDependencyException extends \RuntimeException
{
    /**
     * @param string[] $cycle The plugins forming the cycle
     */
    public function __construct(array $cycle)
    {
        parent::__construct(
            'Cyclic dependency detected among plugins: ' . implode(' → ', $cycle) . '.'
        );
    }
}
