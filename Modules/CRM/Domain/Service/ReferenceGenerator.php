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

namespace Modules\CRM\Domain\Service;

use Modules\CRM\Domain\ValueObject\Reference;

/**
 * ReferenceGenerator — Pure domain service for generating reference codes.
 *
 * Extracts the mask resolution logic from HasReference trait into a
 * pure, testable service with NO database dependencies.
 *
 * The caller (handler) is responsible for providing the last used number
 * via the repository.
 *
 * Supported tags: {yyyy}, {yy}, {mm}, {dd}, {0000} (variable length).
 */
class ReferenceGenerator
{
    /**
     * Generate a reference from a mask and the last used sequential number.
     *
     * @param string $mask       e.g. 'CU{yy}{mm}-{0000}'
     * @param int    $lastNumber The last sequential number already used (e.g. 42)
     *
     * @return Reference The generated reference (e.g. 'CU2603-0043')
     */
    public function generate(string $mask, int $lastNumber = 0): Reference
    {
        $now = new \DateTime();

        // 1. Resolve date tags
        $result = str_replace(
            ['{yyyy}', '{yy}', '{mm}', '{dd}'],
            [$now->format('Y'), $now->format('y'), $now->format('m'), $now->format('d')],
            $mask
        );

        // 2. Resolve sequence tag (e.g. {0000})
        if (preg_match('/\{0+\}/', $result, $matches)) {
            $tag = $matches[0];
            $length = strlen($tag) - 2; // Remove the braces

            $newNum = str_pad((string) ($lastNumber + 1), $length, '0', STR_PAD_LEFT);
            $result = str_replace($tag, $newNum, $result);
        }

        return new Reference($result);
    }

    /**
     * Extract the prefix from a mask (everything before the sequence tag).
     * Used by the repository to query for the last used number.
     *
     * @param string $mask e.g. 'CU{yy}{mm}-{0000}'
     * @return string e.g. 'CU2603-'
     */
    public function extractPrefix(string $mask): string
    {
        $now = new \DateTime();

        // Resolve date tags first
        $result = str_replace(
            ['{yyyy}', '{yy}', '{mm}', '{dd}'],
            [$now->format('Y'), $now->format('y'), $now->format('m'), $now->format('d')],
            $mask
        );

        // Everything before the sequence tag is the prefix
        if (preg_match('/\{0+\}/', $result, $matches, PREG_OFFSET_CAPTURE)) {
            return substr($result, 0, $matches[0][1]);
        }

        return $result;
    }

    /**
     * Get the length of the sequence part in the mask.
     *
     * @param string $mask e.g. 'CU{yy}{mm}-{0000}'
     * @return int e.g. 4
     */
    public function getSequenceLength(string $mask): int
    {
        if (preg_match('/\{(0+)\}/', $mask, $matches)) {
            return strlen($matches[1]);
        }
        return 0;
    }
}
