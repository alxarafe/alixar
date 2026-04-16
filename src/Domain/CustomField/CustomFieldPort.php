<?php

declare(strict_types=1);

namespace Core\Domain\CustomField;

/**
 * CustomFieldPort — Generic port for entity-level custom (extra) fields.
 *
 * This is a cross-cutting concern: any domain (CRM, Trading, Products, etc.)
 * can declare custom fields without knowing how they are physically stored.
 *
 * The contract is entity-type agnostic: a single implementation serves ALL
 * entity types (thirdparty, contact, invoice, product, ...).
 */
interface CustomFieldPort
{
    /**
     * Retrieve all custom fields for a given entity.
     *
     * @param string $entityType  Logical entity type: 'thirdparty', 'contact', 'invoice', etc.
     * @param int    $entityId    The entity's primary key.
     * @return array<string, mixed> Associative array: ['field_name' => value, ...].
     */
    public function getFields(string $entityType, int $entityId): array;

    /**
     * Set (upsert) a single custom field for a given entity.
     *
     * @param string $entityType  Logical entity type.
     * @param int    $entityId    The entity's primary key.
     * @param string $fieldName   The field name (e.g. 'rating', 'vip_level').
     * @param mixed  $value       The field value.
     */
    public function setField(string $entityType, int $entityId, string $fieldName, mixed $value): void;

    /**
     * Set (upsert) multiple custom fields for a given entity at once.
     *
     * @param string $entityType  Logical entity type.
     * @param int    $entityId    The entity's primary key.
     * @param array<string, mixed> $fields  Associative array: ['field_name' => value, ...].
     */
    public function setFields(string $entityType, int $entityId, array $fields): void;

    /**
     * Delete a single custom field for a given entity.
     *
     * @param string $entityType  Logical entity type.
     * @param int    $entityId    The entity's primary key.
     * @param string $fieldName   The field name to delete.
     */
    public function deleteField(string $entityType, int $entityId, string $fieldName): void;

    /**
     * Delete all custom fields for a given entity (e.g., when the entity is deleted).
     *
     * @param string $entityType  Logical entity type.
     * @param int    $entityId    The entity's primary key.
     */
    public function deleteAllFields(string $entityType, int $entityId): void;
}
