<?php

declare(strict_types=1);

namespace Core\Domain\Menu;

/**
 * Entidad/DTO para representar un nodo de menú genérico,
 * independiente de si la fuente original fue una base de datos, un XML o un JSON.
 */
class MenuNode
{
    public function __construct(
        public readonly string $id,
        public readonly string $label,
        public readonly string $icon,
        public readonly string $route,
        public readonly int $position = 0,
        /** @var MenuNode[] */
        public array $children = []
    ) {
}

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'label' => $this->label,
            'icon' => $this->icon,
            'route' => $this->route,
            'position' => $this->position,
            'children' => array_map(fn($child) => $child->toArray(), $this->children),
        ];
    }
}
