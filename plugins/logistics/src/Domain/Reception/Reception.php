<?php

declare(strict_types=1);

namespace Plugin\Logistics\Domain\Reception;

use Core\Domain\CustomField\HasCustomFields;
use JsonSerializable;

/**
 * Domain entity for a Reception.
 * 
 * @dolibarr-table llx_reception
 */
class Reception implements JsonSerializable
{
    use HasCustomFields;

    public function __construct(
        private int $thirdPartyId,
        private ?int $id = null,
        private ?string $ref = null,
        private ?string $refExt = null,
        private ?int $status = 0,
        private ?string $dateCreation = null,
        private ?string $dateDelivery = null,
        private ?string $trackingNumber = null,
        private ?string $trackingUrl = null,
        private ?int $weight = null,
        private ?int $weightUnits = null,
        private ?int $sizeW = null,
        private ?int $sizeH = null,
        private ?int $sizeS = null,
        private ?int $sizeUnits = null,
        private ?string $notePrivate = null,
        private ?string $notePublic = null,
        private ?int $projectId = null,
        private ?int $shippingMethodId = null,
    ) {
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(int $id): void
    {
        $this->id = $id;
    }

    public function getRef(): ?string
    {
        return $this->ref;
    }

    public function getThirdPartyId(): int
    {
        return $this->thirdPartyId;
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'ref' => $this->ref,
            'refExt' => $this->refExt,
            'thirdPartyId' => $this->thirdPartyId,
            'status' => $this->status,
            'dateCreation' => $this->dateCreation,
            'dateDelivery' => $this->dateDelivery,
            'trackingNumber' => $this->trackingNumber,
            'trackingUrl' => $this->trackingUrl,
            'weight' => $this->weight,
            'weightUnits' => $this->weightUnits,
            'sizeW' => $this->sizeW,
            'sizeH' => $this->sizeH,
            'sizeS' => $this->sizeS,
            'sizeUnits' => $this->sizeUnits,
            'notePrivate' => $this->notePrivate,
            'notePublic' => $this->notePublic,
            'projectId' => $this->projectId,
            'shippingMethodId' => $this->shippingMethodId,
        ];
    }

    public static function fromArray(array $data): self
    {
        return new self(
            thirdPartyId: (int) ($data['thirdPartyId'] ?? 0),
            id: isset($data['id']) ? (int) $data['id'] : null,
            ref: $data['ref'] ?? null,
            refExt: $data['refExt'] ?? null,
            status: isset($data['status']) ? (int) $data['status'] : null,
            dateCreation: $data['dateCreation'] ?? null,
            dateDelivery: $data['dateDelivery'] ?? null,
            trackingNumber: $data['trackingNumber'] ?? null,
            trackingUrl: $data['trackingUrl'] ?? null,
            weight: isset($data['weight']) ? (int) $data['weight'] : null,
            weightUnits: isset($data['weightUnits']) ? (int) $data['weightUnits'] : null,
            sizeW: isset($data['sizeW']) ? (int) $data['sizeW'] : null,
            sizeH: isset($data['sizeH']) ? (int) $data['sizeH'] : null,
            sizeS: isset($data['sizeS']) ? (int) $data['sizeS'] : null,
            sizeUnits: isset($data['sizeUnits']) ? (int) $data['sizeUnits'] : null,
            notePrivate: $data['notePrivate'] ?? null,
            notePublic: $data['notePublic'] ?? null,
            projectId: isset($data['projectId']) ? (int) $data['projectId'] : null,
            shippingMethodId: isset($data['shippingMethodId']) ? (int) $data['shippingMethodId'] : null,
        );
    }

    public function jsonSerialize(): array
    {
        return $this->toArray();
    }
}
