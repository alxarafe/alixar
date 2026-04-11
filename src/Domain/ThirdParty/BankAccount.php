<?php

declare(strict_types=1);

namespace App\Domain\ThirdParty;

use App\Domain\ThirdParty\ThirdPartyId; 

// Assuming this exists or using int

class BankAccount
{
    public function __construct(
        private int $thirdPartyId,
        private ?string $bank = null,
        private ?string $bankCode = null,
        private ?string $deskCode = null,
        private ?string $number = null,
        private ?string $ribKey = null,
        private ?string $bic = null,
        private ?string $iban = null,
        private ?string $ownerName = null,
        private ?string $ownerAddress = null,
        private ?string $label = null,
        private bool $isDefault = false,
        private ?int $id = null,
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

    public function getThirdPartyId(): int
    {
        return $this->thirdPartyId;
    }

    public function setThirdPartyId(int $thirdPartyId): void
    {
        $this->thirdPartyId = $thirdPartyId;
    }

    public function updateFrom(array $data): void
    {
        if (isset($data['bank'])) $this->bank = $data['bank'];
        if (isset($data['bankCode'])) $this->bankCode = $data['bankCode'];
        if (isset($data['deskCode'])) $this->deskCode = $data['deskCode'];
        if (isset($data['number'])) $this->number = $data['number'];
        if (isset($data['ribKey'])) $this->ribKey = $data['ribKey'];
        if (isset($data['bic'])) $this->bic = $data['bic'];
        if (isset($data['iban'])) $this->iban = $data['iban'];
        if (isset($data['ownerName'])) $this->ownerName = $data['ownerName'];
        if (isset($data['ownerAddress'])) $this->ownerAddress = $data['ownerAddress'];
        if (isset($data['label'])) $this->label = $data['label'];
        if (isset($data['isDefault'])) $this->isDefault = (bool) $data['isDefault'];
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'thirdPartyId' => $this->thirdPartyId,
            'bank' => $this->bank,
            'bankCode' => $this->bankCode,
            'deskCode' => $this->deskCode,
            'number' => $this->number,
            'ribKey' => $this->ribKey,
            'bic' => $this->bic,
            'iban' => $this->iban,
            'ownerName' => $this->ownerName,
            'ownerAddress' => $this->ownerAddress,
            'label' => $this->label,
            'isDefault' => $this->isDefault ? 1 : 0,
        ];
    }
}
