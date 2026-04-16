<?php

declare(strict_types=1);

namespace Plugin\Finance\Domain\Accountancy;

class AccountingAccount
{
    private function __construct(
        public readonly ?int $id,
        public readonly string $code,
        public readonly string $label,
        public readonly ?int $parentId = null,
        public readonly string $type = 'asset',
        public readonly bool $active = true
    ) {
}

    public static function create(
        string $code,
        string $label,
        ?int $parentId = null,
        string $type = 'asset'
    ): self {
        return new self(null, $code, $label, $parentId, $type, true);
    }

    public static function fromArray(array $data): self
    {
        return new self(
            $data['id'] ? (int) $data['id'] : null,
            $data['code'],
            $data['label'],
            isset($data['parent_id']) ? (int) $data['parent_id'] : null,
            $data['type'] ?? 'asset',
            (bool) ($data['active'] ?? true)
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'code' => $this->code,
            'label' => $this->label,
            'parent_id' => $this->parentId,
            'type' => $this->type,
            'active' => $this->active ? 1 : 0,
        ];
    }
}
