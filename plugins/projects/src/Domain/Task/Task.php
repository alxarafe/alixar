<?php

declare(strict_types=1);

namespace Plugin\Projects\Domain\Task;

use DateTimeImmutable;
use RuntimeException;

class Task
{
    private ?int $id;
    private string $ref;
    private int $projectId;
    private string $label;
    private ?string $description;
    
    private ?DateTimeImmutable $dateStart;
    private ?DateTimeImmutable $dateEnd;
    
    private int $progress; // 0 to 100
    private int $priority; // 0, 1, 2...
    private float $duration; // stored in seconds typically, but we map it directly
    private ?int $parentId;
    private int $status;

    private DateTimeImmutable $createdAt;
    private ?DateTimeImmutable $updatedAt;

    public function __construct(
        string $ref,
        string $label,
        int $projectId,
        ?int $id = null
    ) {
        $this->ref = $ref;
        $this->label = $label;
        $this->projectId = $projectId;
        $this->id = $id;
        
        $this->description = null;
        $this->dateStart = null;
        $this->dateEnd = null;
        
        $this->progress = 0;
        $this->priority = 0;
        $this->duration = 0;
        $this->parentId = null;
        $this->status = 1;
        
        $this->createdAt = new DateTimeImmutable();
        $this->updatedAt = null;
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
        if (isset($data['ref'])) $this->ref = $data['ref'];
        if (isset($data['label'])) $this->label = $data['label'];
        if (isset($data['projectId'])) $this->projectId = (int)$data['projectId'];
        if (isset($data['description'])) $this->description = $data['description'];
        
        if (isset($data['progress'])) $this->progress = (int)$data['progress'];
        if (isset($data['priority'])) $this->priority = (int)$data['priority'];
        if (isset($data['duration'])) $this->duration = (float)$data['duration'];
        if (isset($data['parentId'])) $this->parentId = (int)$data['parentId'];
        if (isset($data['status'])) $this->status = (int)$data['status'];
        
        if (isset($data['dateStart'])) {
            $this->dateStart = is_numeric($data['dateStart']) ? (new DateTimeImmutable())->setTimestamp((int)$data['dateStart']) : new DateTimeImmutable($data['dateStart']);
        }
        if (isset($data['dateEnd'])) {
            $this->dateEnd = is_numeric($data['dateEnd']) ? (new DateTimeImmutable())->setTimestamp((int)$data['dateEnd']) : new DateTimeImmutable($data['dateEnd']);
        }
        
        if (isset($data['createdAt'])) {
            $this->createdAt = is_numeric($data['createdAt']) ? (new DateTimeImmutable())->setTimestamp((int)$data['createdAt']) : new DateTimeImmutable($data['createdAt']);
        }
        if (isset($data['updatedAt'])) {
            $this->updatedAt = is_numeric($data['updatedAt']) ? (new DateTimeImmutable())->setTimestamp((int)$data['updatedAt']) : new DateTimeImmutable($data['updatedAt']);
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
        if (!isset($data['ref']) || !isset($data['label']) || !isset($data['projectId'])) {
            throw new RuntimeException("Faltan campos obligatorios para hidratar Task (ref, label, projectId).");
        }

        $task = new self(
            ref: $data['ref'],
            label: $data['label'],
            projectId: (int)$data['projectId'],
            id: isset($data['id']) ? (int) $data['id'] : null
        );

        $task->updateFrom($data);

        return $task;
    }

    /**
     * @return array<string, mixed>
     */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'ref' => $this->ref,
            'label' => $this->label,
            'projectId' => $this->projectId,
            'description' => $this->description,
            'dateStart' => $this->dateStart?->format('Y-m-d H:i:s'),
            'dateEnd' => $this->dateEnd?->format('Y-m-d H:i:s'),
            'progress' => $this->progress,
            'priority' => $this->priority,
            'duration' => $this->duration,
            'parentId' => $this->parentId,
            'status' => $this->status,
            'createdAt' => $this->createdAt->format('Y-m-d H:i:s'),
            'updatedAt' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
