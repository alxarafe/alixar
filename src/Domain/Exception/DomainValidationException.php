<?php

namespace Core\Domain\Exception;

use DomainException;

/**
 * Exception thrown when domain entity validation fails.
 * Holds an array of detailed errors (e.g. ['email' => 'ErrorEmailAlreadyExists']).
 */
class DomainValidationException extends DomainException
{
    /** @var array<string, string> */
    private array $errors;

    /**
     * @param array<string, string> $errors Mapping of field names/codes to error messages
     * @param string $message Global exception message
     */
    public function __construct(array $errors, string $message = "Validation failed")
    {
        parent::__construct($message);
        $this->errors = $errors;
    }

    /**
     * @return array<string, string>
     */
    public function getErrors(): array
    {
        return $this->errors;
    }
}
