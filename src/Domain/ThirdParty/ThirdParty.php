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

namespace App\Domain\ThirdParty;

use DateTimeImmutable;

/**
 * ThirdParty — Pure domain entity (POJO).
 *
 * Represents a business partner: customer, prospect, or supplier.
 * Maps to Dolibarr table `societe` but contains NO infrastructure dependencies.
 */
class ThirdParty
{
    private ?int $id;
    private string $name;
    private ?string $nameAlias;
    private ThirdPartyType $type;
    private bool $isSupplier;
    private ThirdPartyStatus $status;

    // Address
    private ?string $address;
    private ?string $zip;
    private ?string $town;
    private ?int $countryId;

    // Contact
    private ?string $phone;
    private ?string $email;
    private ?string $url;

    // Fiscal
    private ?string $vatNumber;
    private ?float $capital;

    // Commercial
    private ?string $codeClient;
    private ?string $codeFournisseur;

    // Notes
    private ?string $notePrivate;
    private ?string $notePublic;

    // Metadata
    private int $entity;
    private ?DateTimeImmutable $createdAt;

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
        $this->entity = 1;
        $this->createdAt = new DateTimeImmutable();

        // Initialize nullable fields
        $this->address = null;
        $this->zip = null;
        $this->town = null;
        $this->countryId = null;
        $this->phone = null;
        $this->email = null;
        $this->url = null;
        $this->vatNumber = null;
        $this->capital = null;
        $this->codeClient = null;
        $this->codeFournisseur = null;
        $this->notePrivate = null;
        $this->notePublic = null;
    }

    // ── Business Logic ───────────────────────────────────────

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

    // ── Hydration from Dolibarr row ──────────────────────────

    /**
     * @param array<string, mixed> $data Row from `societe` table.
     */
    public static function fromArray(array $data): self
    {
        $tp = new self(
            name: $data['nom'] ?? $data['name'] ?? '',
            type: ThirdPartyType::from((int) ($data['client'] ?? 0)),
            isSupplier: (bool) ($data['fournisseur'] ?? false),
            status: ThirdPartyStatus::from((int) ($data['status'] ?? 1)),
            nameAlias: $data['name_alias'] ?? null,
            id: isset($data['rowid']) ? (int) $data['rowid'] : null,
        );

        $tp->codeClient = $data['code_client'] ?? null;
        $tp->codeFournisseur = $data['code_fournisseur'] ?? null;
        $tp->entity = (int) ($data['entity'] ?? 1);

        $tp->address = $data['address'] ?? null;
        $tp->zip = $data['zip'] ?? null;
        $tp->town = $data['town'] ?? null;
        $tp->countryId = isset($data['fk_pays']) ? (int) $data['fk_pays'] : null;

        $tp->phone = $data['phone'] ?? null;
        $tp->email = $data['email'] ?? null;
        $tp->url = $data['url'] ?? null;

        $tp->vatNumber = $data['tva_intra'] ?? null;
        $tp->capital = isset($data['capital']) ? (float) $data['capital'] : null;

        $tp->notePrivate = $data['note_private'] ?? null;
        $tp->notePublic = $data['note_public'] ?? null;

        if (!empty($data['datec'])) {
            $tp->createdAt = new DateTimeImmutable($data['datec']);
        }

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
            'code_client' => $this->codeClient,
            'code_fournisseur' => $this->codeFournisseur,
            'entity' => $this->entity,
            'address' => $this->address,
            'zip' => $this->zip,
            'town' => $this->town,
            'fk_pays' => $this->countryId,
            'phone' => $this->phone,
            'email' => $this->email,
            'url' => $this->url,
            'tva_intra' => $this->vatNumber,
            'capital' => $this->capital,
            'note_private' => $this->notePrivate,
            'note_public' => $this->notePublic,
            'datec' => $this->createdAt?->format('Y-m-d H:i:s'),
        ];
    }

    /**
     * Serialize to Dolibarr-API-compatible response format.
     * Uses 'id' and 'name' keys as Dolibarr's _cleanObjectDatas does.
     *
     * @return array<string, mixed>
     */
    public function toApiArray(): array
    {
        $data = $this->toArray();
        // Dolibarr API uses 'id' (not 'rowid') and 'name' (not 'nom')
        $data['id'] = $data['rowid'];
        $data['name'] = $data['nom'];
        return $data;
    }

    // ── Getters ──────────────────────────────────────────────

    public function getId(): ?int { return $this->id; }
    public function getName(): string { return $this->name; }
    public function getNameAlias(): ?string { return $this->nameAlias; }
    public function getType(): ThirdPartyType { return $this->type; }
    public function getStatus(): ThirdPartyStatus { return $this->status; }
    public function getEntity(): int { return $this->entity; }
    public function getAddress(): ?string { return $this->address; }
    public function getZip(): ?string { return $this->zip; }
    public function getTown(): ?string { return $this->town; }
    public function getPhone(): ?string { return $this->phone; }
    public function getEmail(): ?string { return $this->email; }

    // ── Setters ──────────────────────────────────────────────

    public function setId(int $id): void { $this->id = $id; }

    public function updateFrom(array $data): void
    {
        if (isset($data['name']) || isset($data['nom'])) {
            $this->name = $data['name'] ?? $data['nom'];
        }
        if (array_key_exists('name_alias', $data)) {
            $this->nameAlias = $data['name_alias'];
        }
        if (isset($data['client'])) {
            $this->type = ThirdPartyType::from((int) $data['client']);
        }
        if (isset($data['fournisseur'])) {
            $this->isSupplier = (bool) $data['fournisseur'];
        }
        if (isset($data['status'])) {
            $this->status = ThirdPartyStatus::from((int) $data['status']);
        }
        if (array_key_exists('address', $data)) { $this->address = $data['address']; }
        if (array_key_exists('zip', $data)) { $this->zip = $data['zip']; }
        if (array_key_exists('town', $data)) { $this->town = $data['town']; }
        if (array_key_exists('phone', $data)) { $this->phone = $data['phone']; }
        if (array_key_exists('email', $data)) { $this->email = $data['email']; }
        if (array_key_exists('url', $data)) { $this->url = $data['url']; }
        if (array_key_exists('note_private', $data)) { $this->notePrivate = $data['note_private']; }
        if (array_key_exists('note_public', $data)) { $this->notePublic = $data['note_public']; }
    }
}
