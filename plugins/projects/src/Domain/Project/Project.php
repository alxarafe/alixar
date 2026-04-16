<?php

declare(strict_types=1);

namespace Plugin\Projects\Domain\Project;

use DateTimeImmutable;
use RuntimeException;

/**
 * Project — Entidad de Dominio para Proyectos.
 */
class Project
{
    private ?int $id;
    private ?int $thirdPartyId; // fk_soc (A project can be internal, without a thirdparty)
    private string $ref;
    private ?string $refExt;
    private string $title;
    private int $status; // fk_statut
    
    private DateTimeImmutable $createdAt; // datec
    private ?DateTimeImmutable $updatedAt; // tms
    private ?DateTimeImmutable $dateStartEvent; // date_start_event
    private ?DateTimeImmutable $dateEndEvent;   // date_end_event

    public function __construct(
        string $title,
        string $ref = '',
        ?int $id = null,
        ?int $thirdPartyId = null
    ) {
        $this->title = $title;
        $this->ref = $ref;
        $this->id = $id;
        $this->thirdPartyId = $thirdPartyId;
        $this->refExt = null;
        $this->status = 0; 
        
        $this->createdAt = new DateTimeImmutable();
        $this->updatedAt = null;
        $this->dateStartEvent = null;
        $this->dateEndEvent = null;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(int $id): self
    {
        $this->id = $id;
        return $this;
    }

    public function getRef(): string
    {
        return $this->ref;
    }

    /**
     * @param array<string, mixed> $data
     */
    public function updateFrom(array $data): void
    {
        if (isset($data['thirdPartyId'])) $this->thirdPartyId = (empty($data['thirdPartyId']) ? null : (int)$data['thirdPartyId']);
        if (isset($data['ref'])) $this->ref = $data['ref'];
        if (isset($data['refExt'])) $this->refExt = $data['refExt'];
        if (isset($data['title'])) $this->title = $data['title'];
        
        if (isset($data['status'])) $this->status = (int)$data['status'];
        
        if (isset($data['createdAt'])) {
            $this->createdAt = is_numeric($data['createdAt']) ? (new DateTimeImmutable())->setTimestamp((int)$data['createdAt']) : new DateTimeImmutable($data['createdAt']);
        }
        if (isset($data['updatedAt'])) {
            $this->updatedAt = is_numeric($data['updatedAt']) ? (new DateTimeImmutable())->setTimestamp((int)$data['updatedAt']) : new DateTimeImmutable($data['updatedAt']);
        }
        
        if (empty($data['dateStartEvent'])) {
            $this->dateStartEvent = null;
        } else {
            $this->dateStartEvent = is_numeric($data['dateStartEvent']) ? (new DateTimeImmutable())->setTimestamp((int)$data['dateStartEvent']) : new DateTimeImmutable($data['dateStartEvent']);
        }

        if (empty($data['dateEndEvent'])) {
            $this->dateEndEvent = null;
        } else {
            $this->dateEndEvent = is_numeric($data['dateEndEvent']) ? (new DateTimeImmutable())->setTimestamp((int)$data['dateEndEvent']) : new DateTimeImmutable($data['dateEndEvent']);
        }
        
        if ($this->id !== null) {
            $this->updatedAt = new DateTimeImmutable();
        }
    }

    /**
     * @param array<string, mixed> $data
     */
    public static function fromArray(array $data): self
    {
        if (!isset($data['title'])) {
            throw new RuntimeException("Falta campo obligatorio 'title' al hidratar Project.");
        }

        $thirdPartyId = isset($data['thirdPartyId']) ? (int)$data['thirdPartyId'] : (isset($data['socid']) ? (int)$data['socid'] : null);
        if ($thirdPartyId === 0) $thirdPartyId = null;

        $project = new self(
            title: $data['title'],
            ref: $data['ref'] ?? '',
            id: isset($data['id']) ? (int) $data['id'] : null,
            thirdPartyId: $thirdPartyId
        );

        $project->updateFrom($data);

        return $project;
    }

    /**
     * @return array<string, mixed>
     */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'thirdPartyId' => $this->thirdPartyId,
            'ref' => $this->ref ?: ($this->id ? "(PROV{$this->id})" : "(PROV)"),
            'refExt' => $this->refExt,
            'title' => $this->title,
            'status' => $this->status,
            'createdAt' => $this->createdAt->format('Y-m-d H:i:s'),
            'updatedAt' => $this->updatedAt?->format('Y-m-d H:i:s'),
            'dateStartEvent' => $this->dateStartEvent?->format('Y-m-d H:i:s'),
            'dateEndEvent' => $this->dateEndEvent?->format('Y-m-d H:i:s'),
        ];
    }
}
