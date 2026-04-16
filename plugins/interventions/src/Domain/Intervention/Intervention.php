<?php

declare(strict_types=1);

namespace Plugin\Interventions\Domain\Intervention;

use Core\Domain\CustomField\HasCustomFields;
use JsonSerializable;

/**
 * @dolibarr-table llx_fichinter
 */
class Intervention implements JsonSerializable
{
    use HasCustomFields;

    public function __construct(
        private int $thirdPartyId,
        private ?int $id = null,
        private ?string $ref = null,
        private ?string $refExt = null,
        private ?int $status = 0,
        private ?string $title = null,
        private ?string $dateCreation = null,
        private ?string $dateValid = null,
        private ?string $dateStart = null,
        private ?string $dateEnd = null,
        private ?string $description = null,
        private ?string $notePrivate = null,
        private ?string $notePublic = null,
        private ?int $projectId = null,
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
            'title' => $this->title,
            'dateCreation' => $this->dateCreation,
            'dateValid' => $this->dateValid,
            'dateStart' => $this->dateStart,
            'dateEnd' => $this->dateEnd,
            'description' => $this->description,
            'notePrivate' => $this->notePrivate,
            'notePublic' => $this->notePublic,
            'projectId' => $this->projectId,
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
            title: $data['title'] ?? null,
            dateCreation: $data['dateCreation'] ?? null,
            dateValid: $data['dateValid'] ?? null,
            dateStart: $data['dateStart'] ?? null,
            dateEnd: $data['dateEnd'] ?? null,
            description: $data['description'] ?? null,
            notePrivate: $data['notePrivate'] ?? null,
            notePublic: $data['notePublic'] ?? null,
            projectId: isset($data['projectId']) ? (int) $data['projectId'] : null,
        );
    }

    public function jsonSerialize(): array
    {
        return $this->toArray();
    }
}
