<?php

declare(strict_types=1);

namespace Core\Domain\Webhook;

class Webhook
{
    private function __construct(
        public readonly ?int $id,
        public readonly string $url,
        public readonly string $events,
        public readonly string $method = 'POST',
        public readonly string $status = 'active',
        public readonly ?\DateTimeImmutable $createdAt = null,
        public readonly ?\DateTimeImmutable $updatedAt = null
    ) {
}

    public static function create(string $url, string $events, string $method = 'POST', string $status = 'active'): self
    {
        return new self(null, $url, $events, $method, $status);
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            $data['url'],
            $data['events'],
            $data['method'] ?? 'POST',
            $data['status'] ?? 'active',
            isset($data['created_at']) ? new \DateTimeImmutable($data['created_at']) : null,
            isset($data['updated_at']) ? new \DateTimeImmutable($data['updated_at']) : null
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'url' => $this->url,
            'events' => $this->events,
            'method' => $this->method,
            'status' => $this->status,
            'created_at' => $this->createdAt?->format('Y-m-d H:i:s'),
            'updated_at' => $this->updatedAt?->format('Y-m-d H:i:s'),
        ];
    }
}
