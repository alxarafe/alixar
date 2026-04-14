<?php

declare(strict_types=1);

namespace Plugin\Hr\Domain\ExpenseReport;

use Core\Domain\CustomField\HasCustomFields;
use JsonSerializable;

/**
 * Domain entity for an Expense Report.
 * 
 * @dolibarr-table llx_expensereport
 */
class ExpenseReport implements JsonSerializable
{
    use HasCustomFields;

    public function __construct(
        private int $userId,
        private ?int $id = null,
        private ?string $ref = null,
        private ?int $status = 0,
        private ?string $dateCreation = null,
        private ?string $dateStart = null,
        private ?string $dateEnd = null,
        private ?string $notePrivate = null,
        private ?string $notePublic = null,
        private ?float $amountTotal = 0.0,
        private ?float $amountToPay = 0.0,
        private ?int $projectId = null,
        private ?int $fkUserAuthor = null,
        private ?int $fkUserValidator = null,
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

    public function getUserId(): int
    {
        return $this->userId;
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'ref' => $this->ref,
            'userId' => $this->userId,
            'status' => $this->status,
            'dateCreation' => $this->dateCreation,
            'dateStart' => $this->dateStart,
            'dateEnd' => $this->dateEnd,
            'notePrivate' => $this->notePrivate,
            'notePublic' => $this->notePublic,
            'amountTotal' => $this->amountTotal,
            'amountToPay' => $this->amountToPay,
            'projectId' => $this->projectId,
            'fkUserAuthor' => $this->fkUserAuthor,
            'fkUserValidator' => $this->fkUserValidator,
        ];
    }

    public static function fromArray(array $data): self
    {
        return new self(
            userId: (int) ($data['userId'] ?? 0),
            id: isset($data['id']) ? (int) $data['id'] : null,
            ref: $data['ref'] ?? null,
            status: isset($data['status']) ? (int) $data['status'] : null,
            dateCreation: $data['dateCreation'] ?? null,
            dateStart: $data['dateStart'] ?? null,
            dateEnd: $data['dateEnd'] ?? null,
            notePrivate: $data['notePrivate'] ?? null,
            notePublic: $data['notePublic'] ?? null,
            amountTotal: isset($data['amountTotal']) ? (float) $data['amountTotal'] : 0.0,
            amountToPay: isset($data['amountToPay']) ? (float) $data['amountToPay'] : 0.0,
            projectId: isset($data['projectId']) ? (int) $data['projectId'] : null,
            fkUserAuthor: isset($data['fkUserAuthor']) ? (int) $data['fkUserAuthor'] : null,
            fkUserValidator: isset($data['fkUserValidator']) ? (int) $data['fkUserValidator'] : null,
        );
    }

    public function jsonSerialize(): array
    {
        return $this->toArray();
    }
}
