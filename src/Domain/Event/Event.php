<?php

declare(strict_types=1);

namespace App\Domain\Event;

class Event
{
    /**
     * @param array<string, mixed> $payload
     */
    public static function fromArray(array $payload): self
    {
        return new self(
            id: isset($payload['id']) ? (int) $payload['id'] : null,
            ref: $payload['ref'] ?? '',
            title: $payload['title'] ?? '',
            typeCode: $payload['typeCode'] ?? 'AC_OTH',
            dateStart: $payload['dateStart'] ?? null,
            dateEnd: $payload['dateEnd'] ?? null,
            percentage: isset($payload['percentage']) ? (int) $payload['percentage'] : 0,
            note: $payload['note'] ?? null,
            thirdPartyId: isset($payload['thirdPartyId']) ? (int) $payload['thirdPartyId'] : null,
            contactId: isset($payload['contactId']) ? (int) $payload['contactId'] : null,
            projectId: isset($payload['projectId']) ? (int) $payload['projectId'] : null,
            assignedUserId: isset($payload['assignedUserId']) ? (int) $payload['assignedUserId'] : null,
            authorUserId: isset($payload['authorUserId']) ? (int) $payload['authorUserId'] : null,
            createdAt: $payload['createdAt'] ?? null,
            updatedAt: $payload['updatedAt'] ?? null
        );
    }

    public function __construct(
        private ?int $id = null,
        private string $ref = '',
        private string $title = '',
        private string $typeCode = 'AC_OTH',
        private ?string $dateStart = null,
        private ?string $dateEnd = null,
        private int $percentage = 0,
        private ?string $note = null,
        private ?int $thirdPartyId = null,
        private ?int $contactId = null,
        private ?int $projectId = null,
        private ?int $assignedUserId = null,
        private ?int $authorUserId = null,
        private ?string $createdAt = null,
        private ?string $updatedAt = null
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

    /**
     * @param array<string, mixed> $payload
     */
    public function updateFrom(array $payload): void
    {
        if (isset($payload['ref'])) $this->ref = $payload['ref'];
        if (isset($payload['title'])) $this->title = $payload['title'];
        if (isset($payload['typeCode'])) $this->typeCode = $payload['typeCode'];
        if (isset($payload['dateStart'])) $this->dateStart = $payload['dateStart'];
        if (isset($payload['dateEnd'])) $this->dateEnd = $payload['dateEnd'];
        if (isset($payload['percentage'])) $this->percentage = (int) $payload['percentage'];
        if (isset($payload['note'])) $this->note = $payload['note'];
        if (array_key_exists('thirdPartyId', $payload)) $this->thirdPartyId = $payload['thirdPartyId'] !== null ? (int) $payload['thirdPartyId'] : null;
        if (array_key_exists('contactId', $payload)) $this->contactId = $payload['contactId'] !== null ? (int) $payload['contactId'] : null;
        if (array_key_exists('projectId', $payload)) $this->projectId = $payload['projectId'] !== null ? (int) $payload['projectId'] : null;
        if (array_key_exists('assignedUserId', $payload)) $this->assignedUserId = $payload['assignedUserId'] !== null ? (int) $payload['assignedUserId'] : null;
        if (array_key_exists('authorUserId', $payload)) $this->authorUserId = $payload['authorUserId'] !== null ? (int) $payload['authorUserId'] : null;
    }

    /**
     * @return array<string, mixed>
     */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'ref' => $this->ref,
            'title' => $this->title,
            'typeCode' => $this->typeCode,
            'dateStart' => $this->dateStart,
            'dateEnd' => $this->dateEnd,
            'percentage' => $this->percentage,
            'note' => $this->note,
            'thirdPartyId' => $this->thirdPartyId,
            'contactId' => $this->contactId,
            'projectId' => $this->projectId,
            'assignedUserId' => $this->assignedUserId,
            'authorUserId' => $this->authorUserId,
            'createdAt' => $this->createdAt,
            'updatedAt' => $this->updatedAt
        ];
    }
}
