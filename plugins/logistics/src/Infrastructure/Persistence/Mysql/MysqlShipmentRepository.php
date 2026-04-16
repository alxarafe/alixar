<?php

declare(strict_types=1);

namespace Plugin\Logistics\Infrastructure\Persistence\Mysql;

use Plugin\Logistics\Domain\Shipment\Shipment;
use Plugin\Logistics\Domain\Shipment\ShipmentRepository;

class MysqlShipmentRepository implements ShipmentRepository
{
    private string $tableName;

    public function __construct(
        private \PDO $pdo,
        string $prefix = ''
    ) {
        $this->tableName = $prefix . 'shipments';
    }

    public function findById(int $id): ?Shipment
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->tableName} WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch();

        if (!$row) {
            return null;
        }

        return $this->mapRowToEntity($row);
    }

    public function findByRef(string $ref): ?Shipment
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->tableName} WHERE ref = :ref");
        $stmt->execute(['ref' => $ref]);
        $row = $stmt->fetch();

        if (!$row) {
            return null;
        }

        return $this->mapRowToEntity($row);
    }

    public function count(array $criteria = []): int
    {
        $stmt = $this->pdo->query("SELECT COUNT(*) FROM {$this->tableName}");
        return (int) $stmt->fetchColumn();
    }

    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array
    {
        $allowedFields = ['id', 'ref', 'third_party_id', 'status', 'date_creation'];
        if (!in_array($sortField, $allowedFields)) {
            $sortField = 'id';
        }
        $sortOrder = strtoupper($sortOrder) === 'DESC' ? 'DESC' : 'ASC';

        $stmt = $this->pdo->prepare("SELECT * FROM {$this->tableName} ORDER BY {$sortField} {$sortOrder} LIMIT :limit OFFSET :offset");
        $stmt->bindValue(':limit', $limit, \PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, \PDO::PARAM_INT);
        $stmt->execute();

        $results = [];
        while ($row = $stmt->fetch()) {
            $results[] = $this->mapRowToEntity($row);
        }

        return $results;
    }

    public function save(Shipment $shipment): void
    {
        if ($shipment->getId() === null) {
            $this->insert($shipment);
        } else {
            $this->update($shipment);
        }
    }

    public function delete(int $id): void
    {
        $stmt = $this->pdo->prepare("DELETE FROM {$this->tableName} WHERE id = :id");
        $stmt->execute(['id' => $id]);
    }

    private function insert(Shipment $item): void
    {
        $sql = "INSERT INTO {$this->tableName} 
                (ref, ref_ext, third_party_id, status, date_creation, date_delivery, tracking_number, tracking_url, weight, weight_units, size_w, size_h, size_s, size_units, note_private, note_public, project_id, shipping_method_id) 
                VALUES 
                (:ref, :ref_ext, :third_party_id, :status, :date_creation, :date_delivery, :tracking_number, :tracking_url, :weight, :weight_units, :size_w, :size_h, :size_s, :size_units, :note_private, :note_public, :project_id, :shipping_method_id)";

        $stmt = $this->pdo->prepare($sql);
        $params = $this->extractParams($item);
        $stmt->execute($params);

        $item->setId((int)$this->pdo->lastInsertId());
    }

    private function update(Shipment $item): void
    {
        $sql = "UPDATE {$this->tableName} SET 
                ref = :ref, ref_ext = :ref_ext, third_party_id = :third_party_id, status = :status, date_creation = :date_creation, date_delivery = :date_delivery, 
                tracking_number = :tracking_number, tracking_url = :tracking_url, weight = :weight, weight_units = :weight_units, 
                size_w = :size_w, size_h = :size_h, size_s = :size_s, size_units = :size_units,
                note_private = :note_private, note_public = :note_public, project_id = :project_id, shipping_method_id = :shipping_method_id
                WHERE id = :id";

        $stmt = $this->pdo->prepare($sql);
        $params = $this->extractParams($item);
        $params['id'] = $item->getId();
        $stmt->execute($params);
    }

    private function mapRowToEntity(array $row): Shipment
    {
        return Shipment::fromArray([
            'id' => (int) $row['id'],
            'ref' => $row['ref'],
            'refExt' => $row['ref_ext'],
            'thirdPartyId' => (int) $row['third_party_id'],
            'status' => (int) $row['status'],
            'dateCreation' => $row['date_creation'],
            'dateDelivery' => $row['date_delivery'],
            'trackingNumber' => $row['tracking_number'],
            'trackingUrl' => $row['tracking_url'],
            'weight' => isset($row['weight']) ? (int) $row['weight'] : null,
            'weightUnits' => isset($row['weight_units']) ? (int) $row['weight_units'] : null,
            'sizeW' => isset($row['size_w']) ? (int) $row['size_w'] : null,
            'sizeH' => isset($row['size_h']) ? (int) $row['size_h'] : null,
            'sizeS' => isset($row['size_s']) ? (int) $row['size_s'] : null,
            'sizeUnits' => isset($row['size_units']) ? (int) $row['size_units'] : null,
            'notePrivate' => $row['note_private'],
            'notePublic' => $row['note_public'],
            'projectId' => isset($row['project_id']) ? (int) $row['project_id'] : null,
            'shippingMethodId' => isset($row['shipping_method_id']) ? (int) $row['shipping_method_id'] : null,
        ]);
    }

    private function extractParams(Shipment $item): array
    {
        $arr = $item->toArray();
        return [
            'ref' => $arr['ref'] ?? null,
            'ref_ext' => $arr['refExt'] ?? null,
            'third_party_id' => $arr['thirdPartyId'] ?? 0,
            'status' => $arr['status'] ?? 0,
            'date_creation' => $arr['dateCreation'] ?? null,
            'date_delivery' => $arr['dateDelivery'] ?? null,
            'tracking_number' => $arr['trackingNumber'] ?? null,
            'tracking_url' => $arr['trackingUrl'] ?? null,
            'weight' => $arr['weight'] ?? null,
            'weight_units' => $arr['weightUnits'] ?? null,
            'size_w' => $arr['sizeW'] ?? null,
            'size_h' => $arr['sizeH'] ?? null,
            'size_s' => $arr['sizeS'] ?? null,
            'size_units' => $arr['sizeUnits'] ?? null,
            'note_private' => $arr['notePrivate'] ?? null,
            'note_public' => $arr['notePublic'] ?? null,
            'project_id' => $arr['projectId'] ?? null,
            'shipping_method_id' => $arr['shippingMethodId'] ?? null,
        ];
    }
}
