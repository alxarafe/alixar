<?php

declare(strict_types=1);

namespace Plugin\Trading\Infrastructure\Persistence\Mysql;

use Plugin\Trading\Domain\Proposal\Proposal;
use Plugin\Trading\Domain\Proposal\ProposalRepository;
use Core\Infrastructure\DolibarrMappingTrait;
use PDO;

class MysqlProposalRepository implements ProposalRepository
{
    use DolibarrMappingTrait;

    private string $table;

    private const COLUMN_MAP = [
        'id' => 'id',
        'thirdPartyId' => 'fk_soc',
        'ref' => 'ref',
        'refClient' => 'ref_client',
        'refExt' => 'ref_ext',
        'notePrivate' => 'note_private',
        'notePublic' => 'note_public',
        'totalHt' => 'total_ht',
        'totalTva' => 'total_tva',
        'totalTtc' => 'total_ttc',
        'status' => 'fk_statut',
        'createdAt' => 'datec',
        'updatedAt' => 'tms',
    ];

    public function __construct(private PDO $pdo, string $prefix = 'llx_')
    {
        $this->table = $prefix . 'propal';
    }

    /**
     * @return array<Proposal>
     */
    #[\Override]
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array
    {
        $allowedSortFields = array_values(self::COLUMN_MAP);
        if (!in_array($sortField, $allowedSortFields, true)) {
            $sortField = 'id';
        }

        $sortOrder = strtoupper($sortOrder) === 'DESC' ? 'DESC' : 'ASC';

        $sql = sprintf('SELECT * FROM %s ORDER BY %s %s LIMIT %d OFFSET %d', $this->table, $sortField, $sortOrder, $limit, $offset);
        $stmt = $this->pdo->query($sql);
        
        if (!$stmt) return [];
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

        $proposals = [];
        foreach ($rows as $row) {
            $proposals[] = Proposal::fromArray($this->mapToClean($row, self::COLUMN_MAP));
        }

        return $proposals;
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
    public function findById(int $id): ?Proposal
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE id = :id');
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) return null;

        return Proposal::fromArray($this->mapToClean($row, self::COLUMN_MAP));
    }

    #[\Override]
    public function findByRef(string $ref): ?Proposal
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE ref = :ref');
        $stmt->execute(['ref' => $ref]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) return null;

        return Proposal::fromArray($this->mapToClean($row, self::COLUMN_MAP));
    }

    #[\Override]
    public function save(Proposal $proposal): void
    {
        $dbData = $this->mapToDolibarr($proposal->toArray(), self::COLUMN_MAP);
        unset($dbData['tms']);

        if ($proposal->getId() === null) {
            unset($dbData['id']);
            $dbData['entity'] = 1;

            // Si la ref es (PROV), usamos una temporal única para evitar UK_propal_ref (ref, entity)
            if (($dbData['ref'] ?? '') === '(PROV)') {
                $dbData['ref'] = '(PROV' . bin2hex(random_bytes(4)) . ')';
            }

            $columns = array_keys($dbData);
            $placeholders = array_map(fn($c) => ':' . $c, $columns);

            $sql = sprintf('INSERT INTO %s (%s) VALUES (%s)', $this->table, implode(', ', $columns), implode(', ', $placeholders));
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($dbData);
            
            $proposal->setId((int) $this->pdo->lastInsertId());

            // Actualizar a la definitiva (PROV{ID}) si era provisional
            if (str_starts_with($dbData['ref'], '(PROV')) {
                $finalProvRef = '(PROV' . $proposal->getId() . ')';
                $this->pdo->prepare("UPDATE {$this->table} SET ref = ? WHERE id = ?")
                    ->execute([$finalProvRef, $proposal->getId()]);
            }
        } else {
            $id = $dbData['id'];
            unset($dbData['id']);
            unset($dbData['datec']);

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

    // --- Lines (propaldet) ---
    #[\Override]
    public function getLines(int $proposalId): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table}det WHERE fk_propal = :id");
        $stmt->execute(['id' => $proposalId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    #[\Override]
    public function addLine(int $proposalId, array $data): void
    {
        $data['fk_propal'] = $proposalId;
        
        // Compute minimal defaults to insert safely into dolibarr schema
        if (!isset($data['qty'])) $data['qty'] = 1;
        if (!isset($data['tva_tx'])) $data['tva_tx'] = 0;
        
        $columns = array_keys($data);
        $placeholders = array_map(fn($c) => ':' . $c, $columns);
        $sql = sprintf("INSERT INTO {$this->table}det (%s) VALUES (%s)", implode(', ', $columns), implode(', ', $placeholders));
        
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($data);
    }

    #[\Override]
    public function updateLine(int $proposalId, int $lineId, array $data): void
    {
        unset($data['id']);
        unset($data['fk_propal']);

        $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($data));
        $sql = sprintf("UPDATE {$this->table}det SET %s WHERE id = :lineId AND fk_propal = :propId", implode(', ', $sets));
        
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['lineId' => $lineId, 'propId' => $proposalId] + $data);
    }

    #[\Override]
    public function deleteLine(int $proposalId, int $lineId): void
    {
        $stmt = $this->pdo->prepare("DELETE FROM {$this->table}det WHERE id = :lineId AND fk_propal = :propId");
        $stmt->execute(['lineId' => $lineId, 'propId' => $proposalId]);
    }

    // --- Contacts ---
    #[\Override]
    public function getContacts(int $proposalId, string $type = ''): array
    {
        $sql = "SELECT * FROM llx_element_contact WHERE element_id = :id AND fk_c_type_contact IN (SELECT rowid FROM llx_c_type_contact WHERE element = 'propal')";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $proposalId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    #[\Override]
    public function addContact(int $proposalId, int $contactId, string $type): void
    {
        $stmt = $this->pdo->prepare("INSERT INTO llx_element_contact (element_id, fk_socpeople, fk_c_type_contact) VALUES (:id, :contact, (SELECT rowid FROM llx_c_type_contact WHERE element='propal' AND source='external' LIMIT 1))");
        $stmt->execute(['id' => $proposalId, 'contact' => $contactId]);
    }

    #[\Override]
    public function deleteContact(int $proposalId, int $contactId, string $type): void
    {
        $stmt = $this->pdo->prepare("DELETE FROM llx_element_contact WHERE element_id = :id AND fk_socpeople = :contact");
        $stmt->execute(['id' => $proposalId, 'contact' => $contactId]);
    }
}
