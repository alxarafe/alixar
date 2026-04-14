<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Persistence\Mysql;

use Core\Domain\CustomField\CustomFieldPort;
use PDO;

/**
 * DolibarrExtrafieldsAdapter — Single adapter for ALL Dolibarr extrafield tables.
 *
 * Dolibarr stores custom fields in per-entity tables: `llx_societe_extrafields`,
 * `llx_socpeople_extrafields`, `llx_facture_extrafields`, etc. Each table uses
 * dynamic columns created via ALTER TABLE.
 *
 * This adapter maps a logical entity type (e.g. 'thirdparty') to the physical
 * Dolibarr table name and reads/writes the dynamic columns transparently.
 *
 * A single instance handles ALL entity types — no per-table adapter needed.
 */
class DolibarrExtrafieldsAdapter implements CustomFieldPort
{
    /**
     * Map from clean domain entity types to Dolibarr's table suffixes.
     * Dolibarr tables follow the pattern: `{prefix}{suffix}_extrafields`
     *
     * @var array<string, string>
     */
    private const ENTITY_TABLE_MAP = [
        'thirdparty' => 'societe',
        'contact'    => 'socpeople',
        'invoice'    => 'facture',
        'proposal'   => 'propal',
        'order'      => 'commande',
        'product'    => 'product',
        'project'    => 'projet',
        'event'      => 'actioncomm',
        'user'       => 'user',
    ];

    private string $prefix;

    public function __construct(private PDO $pdo, string $prefix = 'llx_')
    {
        $this->prefix = $prefix ?: 'llx_';
    }

    /**
     * @return array<string, mixed>
     */
    #[\Override]
    public function getFields(string $entityType, int $entityId): array
    {
        $table = $this->resolveTable($entityType);

        $stmt = $this->pdo->prepare(
            'SELECT * FROM ' . $table . ' WHERE fk_object = :id LIMIT 1'
        );
        $stmt->execute(['id' => $entityId]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) {
            return [];
        }

        // Remove Dolibarr's internal columns — only return the actual custom fields
        unset($row['rowid'], $row['fk_object'], $row['tms'], $row['import_key']);

        return $row;
    }

    #[\Override]
    public function setField(string $entityType, int $entityId, string $fieldName, mixed $value): void
    {
        $this->setFields($entityType, $entityId, [$fieldName => $value]);
    }

    /**
     * @param array<string, mixed> $fields
     */
    #[\Override]
    public function setFields(string $entityType, int $entityId, array $fields): void
    {
        if (empty($fields)) {
            return;
        }

        $table = $this->resolveTable($entityType);

        // Check if a row already exists for this entity
        $stmt = $this->pdo->prepare(
            'SELECT COUNT(*) FROM ' . $table . ' WHERE fk_object = :id'
        );
        $stmt->execute(['id' => $entityId]);
        $exists = (int) $stmt->fetchColumn() > 0;

        if ($exists) {
            // UPDATE existing row
            $sets = [];
            $params = ['fk_object' => $entityId];
            foreach ($fields as $fieldName => $value) {
                $safeName = $this->sanitizeColumnName($fieldName);
                $sets[] = $safeName . ' = :f_' . $safeName;
                $params['f_' . $safeName] = $value;
            }

            $sql = sprintf(
                'UPDATE %s SET %s WHERE fk_object = :fk_object',
                $table,
                implode(', ', $sets)
            );

            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($params);
        } else {
            // INSERT new row
            $columns = ['fk_object'];
            $placeholders = [':fk_object'];
            $params = ['fk_object' => $entityId];

            foreach ($fields as $fieldName => $value) {
                $safeName = $this->sanitizeColumnName($fieldName);
                $columns[] = $safeName;
                $placeholders[] = ':f_' . $safeName;
                $params['f_' . $safeName] = $value;
            }

            $sql = sprintf(
                'INSERT INTO %s (%s) VALUES (%s)',
                $table,
                implode(', ', $columns),
                implode(', ', $placeholders)
            );

            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($params);
        }
    }

    #[\Override]
    public function deleteField(string $entityType, int $entityId, string $fieldName): void
    {
        $table = $this->resolveTable($entityType);
        $safeName = $this->sanitizeColumnName($fieldName);

        // In Dolibarr, "deleting" a field value means setting it to NULL
        $sql = sprintf(
            'UPDATE %s SET %s = NULL WHERE fk_object = :id',
            $table,
            $safeName
        );

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $entityId]);
    }

    #[\Override]
    public function deleteAllFields(string $entityType, int $entityId): void
    {
        $table = $this->resolveTable($entityType);

        $stmt = $this->pdo->prepare(
            'DELETE FROM ' . $table . ' WHERE fk_object = :id'
        );
        $stmt->execute(['id' => $entityId]);
    }

    /**
     * Resolve the physical Dolibarr table name for a given entity type.
     *
     * @throws \InvalidArgumentException If the entity type is not mapped.
     */
    private function resolveTable(string $entityType): string
    {
        $entityType = strtolower($entityType);

        if (!isset(self::ENTITY_TABLE_MAP[$entityType])) {
            throw new \InvalidArgumentException(
                sprintf(
                    'Unknown entity type "%s" for extrafields. Known types: %s',
                    $entityType,
                    implode(', ', array_keys(self::ENTITY_TABLE_MAP))
                )
            );
        }

        return $this->prefix . self::ENTITY_TABLE_MAP[$entityType] . '_extrafields';
    }

    /**
     * Sanitize column name to prevent SQL injection in dynamic column names.
     * Only allows alphanumeric characters and underscores.
     */
    private function sanitizeColumnName(string $name): string
    {
        $sanitized = preg_replace('/[^a-zA-Z0-9_]/', '', $name);
        if ($sanitized === '' || $sanitized === null) {
            throw new \InvalidArgumentException('Invalid field name: ' . $name);
        }
        return $sanitized;
    }
}
