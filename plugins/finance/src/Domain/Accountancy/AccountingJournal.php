<?php

declare(strict_types=1);

namespace Plugin\Finance\Domain\Accountancy;

class AccountingJournal
{
    private function __construct(
        public readonly ?int $id,
        public readonly string $code,
        public readonly string $label,
        public readonly string $type = 'general',
        public readonly bool $active = true
    ) {
}

    public static function create(
        string $code,
        string $label,
        string $type = 'general'
    ): self {
        return new self(null, $code, $label, $type, true);
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            $data['code'],
            $data['label'],
            $data['type'] ?? 'general',
            (bool) ($data['active'] ?? true)
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'code' => $this->code,
            'label' => $this->label,
            'type' => $this->type,
            'active' => $this->active ? 1 : 0,
        ];
    }
}
