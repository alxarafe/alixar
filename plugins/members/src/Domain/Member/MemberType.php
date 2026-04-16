<?php

declare(strict_types=1);

namespace Plugin\Members\Domain\Member;

class MemberType
{
    private function __construct(
        public readonly ?int $id,
        public readonly string $label,
        public readonly float $amount = 0.0,
        public readonly string $duration = '1y',
        public readonly bool $active = true
    ) {
}

    public static function create(string $label, float $amount = 0.0, string $duration = '1y'): self
    {
        return new self(null, $label, $amount, $duration, true);
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            $data['label'],
            (float) ($data['amount'] ?? 0.0),
            $data['duration'] ?? '1y',
            (bool) ($data['active'] ?? true)
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'label' => $this->label,
            'amount' => $this->amount,
            'duration' => $this->duration,
            'active' => $this->active ? 1 : 0,
        ];
    }
}
