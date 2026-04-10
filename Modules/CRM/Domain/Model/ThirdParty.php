<?php

declare(strict_types=1);

/*
 * Copyright (C) 2024-2026 Rafael San José <rsanjose@alxarafe.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 */

namespace Modules\CRM\Domain\Model;

use DateTimeImmutable;
use Modules\CRM\Domain\ValueObject\Reference;
use Modules\CRM\Domain\ValueObject\ThirdPartyStatus;
use Modules\CRM\Domain\ValueObject\ThirdPartyType;

/**
 * ThirdParty — Pure domain entity (POJO).
 *
 * Represents a business partner: customer, prospect, or supplier.
 * Maps to Dolibarr table `societe` but contains NO infrastructure dependencies.
 *
 * Business logic previously spread across:
 *   - Modules\Alixar\Model\ThirdParty (Eloquent model)
 *   - Modules\Alixar\Traits\HasWorkflow (state machine)
 *   - Modules\Alixar\Lib\Trait\HasReference (code generation)
 */
class ThirdParty
{
    private ?int $id;
    private string $name;
    private ?string $nameAlias;
    private ThirdPartyType $type;
    private bool $isSupplier;
    private ThirdPartyStatus $status;
    private Reference $customerCode;
    private Reference $supplierCode;

    // Address
    private ?string $address;
    private ?string $zip;
    private ?string $town;
    private ?int $stateId;
    private ?int $countryId;

    // Contact
    private ?string $phone;
    private ?string $phoneMobile;
    private ?string $fax;
    private ?string $email;
    private ?string $url;

    // Fiscal
    private ?string $vatNumber;
    private ?string $siren;
    private ?string $siret;
    private ?string $ape;
    private ?float $capital;

    // Commercial
    private ?float $customerDiscount;
    private ?float $supplierDiscount;
    private ?float $outstandingLimit;
    private ?float $orderMinAmount;

    // Notes
    private ?string $notePrivate;
    private ?string $notePublic;

    // Metadata
    private int $entity;
    private ?DateTimeImmutable $createdAt;
    private ?int $createdBy;

    public function __construct(
        string $name,
        ThirdPartyType $type = ThirdPartyType::None,
        bool $isSupplier = false,
        ?ThirdPartyStatus $status = null,
        ?string $nameAlias = null,
        ?int $id = null,
    ) {
        $this->id = $id;
        $this->name = $name;
        $this->nameAlias = $nameAlias;
        $this->type = $type;
        $this->isSupplier = $isSupplier;
        $this->status = $status ?? ThirdPartyStatus::Active;
        $this->customerCode = Reference::empty();
        $this->supplierCode = Reference::empty();
        $this->entity = 1;
        $this->createdAt = new DateTimeImmutable();

        // Initialize nullable fields
        $this->address = null;
        $this->zip = null;
        $this->town = null;
        $this->stateId = null;
        $this->countryId = null;
        $this->phone = null;
        $this->phoneMobile = null;
        $this->fax = null;
        $this->email = null;
        $this->url = null;
        $this->vatNumber = null;
        $this->siren = null;
        $this->siret = null;
        $this->ape = null;
        $this->capital = null;
        $this->customerDiscount = null;
        $this->supplierDiscount = null;
        $this->outstandingLimit = null;
        $this->orderMinAmount = null;
        $this->notePrivate = null;
        $this->notePublic = null;
        $this->createdBy = null;
    }

    // ── Business Logic (previously in Eloquent model + HasWorkflow) ──

    public function isCustomer(): bool
    {
        return $this->type->isCustomer();
    }

    public function isProspect(): bool
    {
        return $this->type->isProspect();
    }

    public function isSupplier(): bool
    {
        return $this->isSupplier;
    }

    public function isActive(): bool
    {
        return $this->status === ThirdPartyStatus::Active;
    }

    public function activate(): void
    {
        if ($this->status === ThirdPartyStatus::Active) {
            throw new \DomainException('El tercero ya está activo.');
        }
        $this->status = ThirdPartyStatus::Active;
    }

    public function deactivate(): void
    {
        if ($this->status === ThirdPartyStatus::Closed) {
            throw new \DomainException('El tercero ya está cerrado.');
        }
        $this->status = ThirdPartyStatus::Closed;
    }

    public function canTransitionTo(ThirdPartyStatus $target): bool
    {
        return $this->status->canTransitionTo($target);
    }

    public function transitionTo(ThirdPartyStatus $target): void
    {
        if (!$this->canTransitionTo($target)) {
            throw new \DomainException(
                "No se puede transicionar de '{$this->status->label()}' a '{$target->label()}'."
            );
        }
        $this->status = $target;
    }

    // ── Hydration (same pattern as Chascarrillo Post::fromArray) ──

    /**
     * Create from a database row (Dolibarr column names).
     *
     * @param array<string, mixed> $data Row from `societe` table.
     */
    public static function fromArray(array $data): self
    {
        $tp = new self(
            name: $data['nom'] ?? '',
            type: ThirdPartyType::from((int) ($data['client'] ?? 0)),
            isSupplier: (bool) ($data['fournisseur'] ?? false),
            status: ThirdPartyStatus::from((int) ($data['status'] ?? 1)),
            nameAlias: $data['name_alias'] ?? null,
            id: isset($data['rowid']) ? (int) $data['rowid'] : null,
        );

        $tp->customerCode = new Reference($data['code_client'] ?? '');
        $tp->supplierCode = new Reference($data['code_fournisseur'] ?? '');
        $tp->entity = (int) ($data['entity'] ?? 1);

        // Address
        $tp->address = $data['address'] ?? null;
        $tp->zip = $data['zip'] ?? null;
        $tp->town = $data['town'] ?? null;
        $tp->stateId = isset($data['fk_departement']) ? (int) $data['fk_departement'] : null;
        $tp->countryId = isset($data['fk_pays']) ? (int) $data['fk_pays'] : null;

        // Contact
        $tp->phone = $data['phone'] ?? null;
        $tp->phoneMobile = $data['phone_mobile'] ?? null;
        $tp->fax = $data['fax'] ?? null;
        $tp->email = $data['email'] ?? null;
        $tp->url = $data['url'] ?? null;

        // Fiscal
        $tp->vatNumber = $data['tva_intra'] ?? null;
        $tp->siren = $data['siren'] ?? null;
        $tp->siret = $data['siret'] ?? null;
        $tp->ape = $data['ape'] ?? null;
        $tp->capital = isset($data['capital']) ? (float) $data['capital'] : null;

        // Commercial
        $tp->customerDiscount = isset($data['remise_client']) ? (float) $data['remise_client'] : null;
        $tp->supplierDiscount = isset($data['remise_supplier']) ? (float) $data['remise_supplier'] : null;
        $tp->outstandingLimit = isset($data['outstanding_limit']) ? (float) $data['outstanding_limit'] : null;
        $tp->orderMinAmount = isset($data['order_min_amount']) ? (float) $data['order_min_amount'] : null;

        // Notes
        $tp->notePrivate = $data['note_private'] ?? null;
        $tp->notePublic = $data['note_public'] ?? null;

        // Metadata
        if (!empty($data['datec'])) {
            $tp->createdAt = new DateTimeImmutable($data['datec']);
        }
        $tp->createdBy = isset($data['fk_user_creat']) ? (int) $data['fk_user_creat'] : null;

        return $tp;
    }

    /**
     * Serialize to Dolibarr column names for persistence.
     *
     * @return array<string, mixed>
     */
    public function toArray(): array
    {
        return [
            'rowid' => $this->id,
            'nom' => $this->name,
            'name_alias' => $this->nameAlias,
            'client' => $this->type->value,
            'fournisseur' => $this->isSupplier ? 1 : 0,
            'status' => $this->status->value,
            'code_client' => $this->customerCode->value(),
            'code_fournisseur' => $this->supplierCode->value(),
            'entity' => $this->entity,
            'address' => $this->address,
            'zip' => $this->zip,
            'town' => $this->town,
            'fk_departement' => $this->stateId,
            'fk_pays' => $this->countryId,
            'phone' => $this->phone,
            'phone_mobile' => $this->phoneMobile,
            'fax' => $this->fax,
            'email' => $this->email,
            'url' => $this->url,
            'tva_intra' => $this->vatNumber,
            'siren' => $this->siren,
            'siret' => $this->siret,
            'ape' => $this->ape,
            'capital' => $this->capital,
            'remise_client' => $this->customerDiscount,
            'remise_supplier' => $this->supplierDiscount,
            'outstanding_limit' => $this->outstandingLimit,
            'order_min_amount' => $this->orderMinAmount,
            'note_private' => $this->notePrivate,
            'note_public' => $this->notePublic,
            'datec' => $this->createdAt?->format('Y-m-d H:i:s'),
            'fk_user_creat' => $this->createdBy,
        ];
    }

    // ── Getters ──

    public function getId(): ?int { return $this->id; }
    public function getName(): string { return $this->name; }
    public function getNameAlias(): ?string { return $this->nameAlias; }
    public function getType(): ThirdPartyType { return $this->type; }
    public function getStatus(): ThirdPartyStatus { return $this->status; }
    public function getCustomerCode(): Reference { return $this->customerCode; }
    public function getSupplierCode(): Reference { return $this->supplierCode; }
    public function getEntity(): int { return $this->entity; }
    public function getAddress(): ?string { return $this->address; }
    public function getZip(): ?string { return $this->zip; }
    public function getTown(): ?string { return $this->town; }
    public function getStateId(): ?int { return $this->stateId; }
    public function getCountryId(): ?int { return $this->countryId; }
    public function getPhone(): ?string { return $this->phone; }
    public function getPhoneMobile(): ?string { return $this->phoneMobile; }
    public function getFax(): ?string { return $this->fax; }
    public function getEmail(): ?string { return $this->email; }
    public function getUrl(): ?string { return $this->url; }
    public function getVatNumber(): ?string { return $this->vatNumber; }
    public function getCapital(): ?float { return $this->capital; }
    public function getCustomerDiscount(): ?float { return $this->customerDiscount; }
    public function getOutstandingLimit(): ?float { return $this->outstandingLimit; }
    public function getNotePrivate(): ?string { return $this->notePrivate; }
    public function getNotePublic(): ?string { return $this->notePublic; }
    public function getCreatedAt(): ?DateTimeImmutable { return $this->createdAt; }

    // ── Setters ──

    public function setId(int $id): void { $this->id = $id; }
    public function setCustomerCode(Reference $code): void { $this->customerCode = $code; }
    public function setSupplierCode(Reference $code): void { $this->supplierCode = $code; }

    public function updateAddress(?string $address, ?string $zip, ?string $town, ?int $stateId, ?int $countryId): void
    {
        $this->address = $address;
        $this->zip = $zip;
        $this->town = $town;
        $this->stateId = $stateId;
        $this->countryId = $countryId;
    }

    public function updateContact(?string $phone, ?string $phoneMobile, ?string $fax, ?string $email, ?string $url): void
    {
        $this->phone = $phone;
        $this->phoneMobile = $phoneMobile;
        $this->fax = $fax;
        $this->email = $email;
        $this->url = $url;
    }

    public function updateNotes(?string $notePrivate, ?string $notePublic): void
    {
        $this->notePrivate = $notePrivate;
        $this->notePublic = $notePublic;
    }
}
