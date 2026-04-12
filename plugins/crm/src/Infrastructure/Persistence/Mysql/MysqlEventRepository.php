<?php

declare(strict_types=1);

namespace Plugin\Crm\Infrastructure\Persistence\Mysql;

use Plugin\Crm\Domain\Event\Event;
use Plugin\Crm\Domain\Event\EventRepository;
use Core\Infrastructure\DolibarrMappingTrait;
use PDO;

class MysqlEventRepository implements EventRepository
{
    use DolibarrMappingTrait;

    private string $table;

    // Dolibarr's 'llx_actioncomm' database schema
    private const COLUMN_MAP = [
        'id' => 'id',
        'ref' => 'ref',
        'title' => 'label',
        'typeCode' => 'code',
        'dateStart' => 'datep',
        'dateEnd' => 'datep2',
        'percentage' => 'percent',
        'note' => 'note',
        'thirdPartyId' => 'fk_soc',
        'contactId' => 'fk_contact',
        'projectId' => 'fk_project',
        'assignedUserId' => 'fk_user_action',
        'authorUserId' => 'fk_user_author',
        'createdAt' => 'datec',
        'updatedAt' => 'tms',
    ];

    public function __construct(private PDO $pdo, string $prefix = 'llx_')
    {
        $this->table = $prefix . 'actioncomm';
    }

    /**
     * @return array<Event>
     */
    #[\Override]
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'datep', string $sortOrder = 'DESC'): array
    {
        $allowedSortFields = array_values(self::COLUMN_MAP);
        if (!in_array($sortField, $allowedSortFields, true)) {
            $sortField = 'datep';
        }

        $sortOrder = strtoupper($sortOrder) === 'ASC' ? 'ASC' : 'DESC';

        $sql = sprintf('SELECT * FROM %s ORDER BY %s %s LIMIT %d OFFSET %d', $this->table, $sortField, $sortOrder, $limit, $offset);
        $stmt = $this->pdo->query($sql);
        
        if (!$stmt) return [];
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

        $events = [];
        foreach ($rows as $row) {
            $events[] = Event::fromArray($this->mapToClean($row, self::COLUMN_MAP));
        }

        return $events;
    }

    /**
     * @param array<string, mixed> $criteria
     */
    #[\Override]
    public function count(array $criteria = []): int
    {
        $stmt = $this->pdo->query('SELECT COUNT(*) FROM ' . $this->table);
        if (!$stmt) return 0;
        return (int) $stmt->fetchColumn();
    }

    #[\Override]
    public function findById(int $id): ?Event
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE id = :id');
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) return null;

        return Event::fromArray($this->mapToClean($row, self::COLUMN_MAP));
    }

    #[\Override]
    public function save(Event $event): void
    {
        $dbData = $this->mapToDolibarr($event->toArray(), self::COLUMN_MAP);
        unset($dbData['tms']); // Auto-managed by Dolibarr's ON UPDATE CURRENT_TIMESTAMP

        if ($event->getId() === null) {
            unset($dbData['id']);
            
            // Mandatory Dolibarr Defaults for actioncomm
            if (!isset($dbData['entity'])) $dbData['entity'] = 1;
            if (!isset($dbData['fk_parent'])) $dbData['fk_parent'] = 0;
            if (!isset($dbData['datec'])) $dbData['datec'] = date('Y-m-d H:i:s');
            if (empty($dbData['percent'])) $dbData['percent'] = 0;
            if (empty($dbData['fk_user_author'])) $dbData['fk_user_author'] = 1; // Fallback to superadmin if missing
            
            // Fix required fields
            if (empty($dbData['ref'])) $dbData['ref'] = 'AC' . date('YmdHis'); // Auto-ref if not provided
            if (empty($dbData['label'])) $dbData['label'] = 'New Event';

            $columns = array_keys($dbData);
            $placeholders = array_map(fn($c) => ':' . $c, $columns);

            $sql = sprintf('INSERT INTO %s (%s) VALUES (%s)', $this->table, implode(', ', $columns), implode(', ', $placeholders));
            
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($dbData);
            
            $event->setId((int) $this->pdo->lastInsertId());
        } else {
            $id = $dbData['id'];
            unset($dbData['id']);
            unset($dbData['datec']); // Immutable

            // Optional: update fk_user_mod if we supported the user ID injection
            
            $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($dbData));

            $sql = sprintf('UPDATE %s SET %s WHERE id = :id', $this->table, implode(', ', $sets));
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['id' => $id] + $dbData);
        }
    }

    #[\Override]
    public function delete(int $id): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM ' . $this->table . ' WHERE id = :id');
        $stmt->execute(['id' => $id]);
    }
}
