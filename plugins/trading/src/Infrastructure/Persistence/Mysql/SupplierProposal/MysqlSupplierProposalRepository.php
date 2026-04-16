<?php

declare(strict_types=1);

namespace Plugin\Trading\Infrastructure\Persistence\Mysql\SupplierProposal;

use Plugin\Trading\Domain\SupplierProposal\SupplierProposal;
use Plugin\Trading\Domain\SupplierProposal\SupplierProposalLine;
use Plugin\Trading\Domain\SupplierProposal\SupplierProposalRepository;
use PDO;

class MysqlSupplierProposalRepository implements SupplierProposalRepository
{
    public function __construct(private PDO $pdo)
    {
}

    public function save(SupplierProposal $proposal): int
    {
        $this->pdo->beginTransaction();

        try {
            if ($proposal->id) {
                $stmt = $this->pdo->prepare("
                    UPDATE supplier_proposals 
                    SET ref = :ref, third_party_id = :third_party_id, date_proposal = :date_proposal, 
                        date_validity = :date_validity, status = :status, note_public = :note_public, 
                        note_private = :note_private, total_ht = :total_ht, total_vat = :total_vat, 
                        total_ttc = :total_ttc
                    WHERE id = :id
                ");
            } else {
                $stmt = $this->pdo->prepare("
                    INSERT INTO supplier_proposals (ref, third_party_id, date_proposal, date_validity, status, note_public, note_private, total_ht, total_vat, total_ttc)
                    VALUES (:ref, :third_party_id, :date_proposal, :date_validity, :status, :note_public, :note_private, :total_ht, :total_vat, :total_ttc)
                ");
            }

            $data = $proposal->toArray();
            unset($data['created_at'], $data['updated_at']);

            $stmt->execute($data);
            $id = $proposal->id ?? (int) $this->pdo->lastInsertId();

            // Handle Lines
            $this->pdo->prepare("DELETE FROM supplier_proposal_lines WHERE proposal_id = ?")->execute([$id]);
            $lineStmt = $this->pdo->prepare("
                INSERT INTO supplier_proposal_lines (proposal_id, product_id, description, qty, subprice, vat_rate, total_ht, total_vat, total_ttc)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
            ");

            foreach ($proposal->lines as $line) {
                $lineData = $line->toArray();
                $lineStmt->execute([
                    $id, $lineData['product_id'], $lineData['description'], $lineData['qty'], 
                    $lineData['subprice'], $lineData['vat_rate'], $lineData['total_ht'], 
                    $lineData['total_vat'], $lineData['total_ttc']
                ]);
            }

            $this->pdo->commit();
            return $id;
        } catch (\Exception $e) {
            $this->pdo->rollBack();
            throw $e;
        }
    }

    public function findById(int $id): ?SupplierProposal
    {
        $stmt = $this->pdo->prepare("SELECT * FROM supplier_proposals WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();

        if (!$data) return null;

        $stmtLines = $this->pdo->prepare("SELECT * FROM supplier_proposal_lines WHERE proposal_id = :id");
        $stmtLines->execute(['id' => $id]);
        $lines = [];
        foreach ($stmtLines->fetchAll() as $lineData) {
            $lines[] = SupplierProposalLine::fromArray($lineData);
        }

        $data['lines'] = $lines;
        return SupplierProposal::fromArray($data);
    }

    public function findAll(int $limit = 100, int $offset = 0): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM supplier_proposals LIMIT :limit OFFSET :offset");
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();

        $results = [];
        foreach ($stmt->fetchAll() as $data) {
            $results[] = SupplierProposal::fromArray($data);
        }

        return $results;
    }

    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM supplier_proposals WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
