<?php

declare(strict_types=1);

namespace Core\Domain\CustomField;

/**
 * HasCustomFields — Domain entity trait for custom/extra fields.
 *
 * Any entity that supports custom fields (ThirdParty, Contact, Invoice, etc.)
 * can `use HasCustomFields` to gain in-memory storage and serialization
 * of arbitrary key-value custom field data, without code duplication.
 *
 * The repository adapter is responsible for loading/saving these fields
 * from/to the underlying storage (e.g., Dolibarr's `_extrafields` tables).
 */
trait HasCustomFields
{
    /** @var array<string, mixed> */
    private array $customFields = [];

    /**
     * @return array<string, mixed>
     */
    public function getCustomFields(): array
    {
        return $this->customFields;
    }

    public function getCustomField(string $name, mixed $default = null): mixed
    {
        return $this->customFields[$name] ?? $default;
    }

    public function setCustomField(string $name, mixed $value): void
    {
        $this->customFields[$name] = $value;
    }

    /**
     * @param array<string, mixed> $fields
     */
    public function setCustomFields(array $fields): void
    {
        $this->customFields = $fields;
    }

    /**
     * Merge custom fields into the entity (preserves existing fields not in $fields).
     *
     * @param array<string, mixed> $fields
     */
    public function mergeCustomFields(array $fields): void
    {
        $this->customFields = array_merge($this->customFields, $fields);
    }

    public function hasCustomField(string $name): bool
    {
        return array_key_exists($name, $this->customFields);
    }

    public function removeCustomField(string $name): void
    {
        unset($this->customFields[$name]);
    }
}
