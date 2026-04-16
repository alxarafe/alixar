<?php

declare(strict_types=1);

namespace Plugin\Crm\Infrastructure\Persistence\Mysql\Ticket;

use Plugin\Crm\Domain\Ticket\Ticket;
use Plugin\Crm\Domain\Ticket\TicketRepository;
use PDO;

class MysqlTicketRepository implements TicketRepository
{
    public function __construct(private PDO $pdo)
    {
}

    public function save(Ticket $ticket): int
    {
        if ($ticket->id) {
            $stmt = $this->pdo->prepare("
                UPDATE tickets 
                SET ref = :ref, track_id = :track_id, third_party_id = :third_party_id, 
                    contact_id = :contact_id, subject = :subject, description = :description, 
                    type = :type, severity = :severity, status = :status, 
                    date_opened = :date_opened, date_closed = :date_closed
                WHERE id = :id
            ");
        } else {
            $stmt = $this->pdo->prepare("
                INSERT INTO tickets (ref, track_id, third_party_id, contact_id, subject, description, type, severity, status, date_opened, date_closed)
                VALUES (:ref, :track_id, :third_party_id, :contact_id, :subject, :description, :type, :severity, :status, :date_opened, :date_closed)
            ");
        }

        $data = $ticket->toArray();
        unset($data['created_at'], $data['updated_at']);

        $stmt->execute($data);

        return $ticket->id ?? (int) $this->pdo->lastInsertId();
    }

    public function findById(int $id): ?Ticket
    {
        $stmt = $this->pdo->prepare("SELECT * FROM tickets WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();

        return $data ? Ticket::fromArray($data) : null;
    }

    public function findAll(int $limit = 100, int $offset = 0): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM tickets LIMIT :limit OFFSET :offset");
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();

        $results = [];
        foreach ($stmt->fetchAll() as $data) {
            $results[] = Ticket::fromArray($data);
        }

        return $results;
    }

    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM tickets WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
