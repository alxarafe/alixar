<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018-2019 Alxarafe <info@alxarafe.com>
 */

namespace Alixar\Models;

use Alixar\Base\AlixarModel;

/**
 * Class Person
 *
 * @package Modules\Sample\Models
 */
class Person extends AlixarModel
{
    /**
     * Person constructor.
     *
     * @param bool $create
     */
    public function __construct(bool $create = false)
    {
        parent::__construct('people', ['create' => $create]);
    }

    /**
     * Returns the name of the identification field of the record. By default it will be name.
     *
     * @return string
     */
    public function getNameField(): string
    {
        return 'name';
    }

    /**
     * Return class dependencies
     *
     * @return string[]
     */
    public function getDependencies(): array
    {
        return [
            'Modules\\Sample\\Models\\Country',
        ];
    }
}
