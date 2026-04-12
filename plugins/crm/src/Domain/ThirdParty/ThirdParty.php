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

namespace Plugin\Crm\Domain\ThirdParty;

use DateTimeImmutable;

/**
 * ThirdParty — Pure domain entity (POJO).
 *
 * Represents a business partner: customer, prospect, or supplier.
 * Contains NO infrastructure dependencies.
 *
 * @dolibarr-table llx_societe
 * @dolibarr-note  "societe" is French for "company/society". Clean name: "third_parties"
 */
class ThirdParty
{
    /** @dolibarr-column rowid — Dolibarr uses 'rowid' as PK everywhere instead of 'id' */
    private ?int $id;

    /** @dolibarr-column nom — French: "nom" = name */
    private string $name;

    /** @dolibarr-column name_alias — ✅ OK */
    private ?string $nameAlias;

    /** @dolibarr-column client — Overloaded int: 0=none, 1=customer, 2=prospect, 3=both */
    private ThirdPartyType $type;

    /** @dolibarr-column fournisseur — French: "fournisseur" = supplier (stored as 0/1 int) */
    private bool $isSupplier;

    /** @dolibarr-column status — ✅ OK */
    private ThirdPartyStatus $status;

    // Address
    /** @dolibarr-column address — ✅ OK */
    private ?string $address;
    /** @dolibarr-column zip — ✅ OK */
    private ?string $zip;
    /** @dolibarr-column town — ✅ OK (British English) */
    private ?string $town;
    /** @dolibarr-column fk_pays — French: "pays" = country. Clean: country_id */
    private ?int $countryId;

    // Contact
    /** @dolibarr-column phone — ✅ OK (but API uses 'phone_pro' for contacts) */
    private ?string $phone;
    /** @dolibarr-column email — ✅ OK */
    private ?string $email;
    /** @dolibarr-column url — ✅ OK */
    private ?string $url;

    // Fiscal
    /** @dolibarr-column tva_intra — French: "TVA intracommunautaire" = EU VAT number */
    private ?string $vatNumber;
    /** @dolibarr-column siren — Business identity format */
    private ?string $nif;
    /** @dolibarr-column capital — ✅ OK */
    private ?float $capital;

    // Commercial
    /** @dolibarr-column code_client — French: clean would be "customer_code" */
    private ?string $customerCode;
    /** @dolibarr-column code_fournisseur — French: "fournisseur" = supplier. Clean: supplier_code */
    private ?string $supplierCode;

    // Notes
    /** @dolibarr-column note_private — ✅ OK */
    private ?string $notePrivate;
    /** @dolibarr-column note_public — ✅ OK */
    private ?string $notePublic;

    // Metadata
    /** @dolibarr-column entity — Multi-tenant discriminator. ✅ OK */
    private int $entity;
    /** @dolibarr-column datec — Abbreviation of "date création". Clean: created_at */
    private DateTimeImmutable $createdAt;

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
        $this->nif = null;
        $this->capital = null;
        $this->customerCode = null;
        $this->supplierCode = null;
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

    // ── Hydration from Repository ────────────────────────────

    /**
     * @param array<string, mixed> $data Array with clean domain names.
     */
    public static function fromArray(array $data): self
    {
        $tp = new self(
            name: (string) ($data['name'] ?? ''),
            type: ThirdPartyType::from((int) ($data['type'] ?? 0)),
            isSupplier: (bool) ($data['isSupplier'] ?? false),
            status: ThirdPartyStatus::from((int) ($data['status'] ?? 1)),
            nameAlias: isset($data['nameAlias']) ? (string) $data['nameAlias'] : null,
            id: isset($data['id']) ? (int) $data['id'] : null,
        );

        $tp->customerCode = isset($data['customerCode']) ? (string) $data['customerCode'] : null;
        $tp->supplierCode = isset($data['supplierCode']) ? (string) $data['supplierCode'] : null;
        $tp->entity = (int) ($data['entity'] ?? 1);

        $tp->address = isset($data['address']) ? (string) $data['address'] : null;
        $tp->zip = isset($data['zip']) ? (string) $data['zip'] : null;
        $tp->town = isset($data['town']) ? (string) $data['town'] : null;
        $tp->countryId = isset($data['countryId']) ? (int) $data['countryId'] : null;

        $tp->phone = isset($data['phone']) ? (string) $data['phone'] : null;
        $tp->email = isset($data['email']) ? (string) $data['email'] : null;
        $tp->url = isset($data['url']) ? (string) $data['url'] : null;

        $tp->vatNumber = isset($data['vatNumber']) ? (string) $data['vatNumber'] : null;
        $tp->nif = isset($data['nif']) ? (string) $data['nif'] : null;
        $tp->capital = isset($data['capital']) ? (float) $data['capital'] : null;

        $tp->notePrivate = isset($data['notePrivate']) ? (string) $data['notePrivate'] : null;
        $tp->notePublic = isset($data['notePublic']) ? (string) $data['notePublic'] : null;

        if (!empty($data['createdAt'])) {
            $tp->createdAt = $data['createdAt'] instanceof DateTimeImmutable
                ? $data['createdAt']
                : new DateTimeImmutable((string) $data['createdAt']);
        }

        return $tp;
    }

    /**
     * Serialize to clean domain array.
     *
     * @return array<string, mixed>
     */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'nameAlias' => $this->nameAlias,
            'type' => $this->type->value,
            'isSupplier' => $this->isSupplier ? 1 : 0,
            'status' => $this->status->value,
            'customerCode' => $this->customerCode,
            'supplierCode' => $this->supplierCode,
            'entity' => $this->entity,
            'address' => $this->address,
            'zip' => $this->zip,
            'town' => $this->town,
            'countryId' => $this->countryId,
            'phone' => $this->phone,
            'email' => $this->email,
            'url' => $this->url,
            'vatNumber' => $this->vatNumber,
            'nif' => $this->nif,
            'capital' => $this->capital,
            'notePrivate' => $this->notePrivate,
            'notePublic' => $this->notePublic,
            'createdAt' => $this->createdAt->format('Y-m-d H:i:s'),
        ];
    }

    // ── Getters ──────────────────────────────────────────────

    public function getId(): ?int
    {
        return $this->id;
    }
    public function getName(): string
    {
        return $this->name;
    }
    public function getNameAlias(): ?string
    {
        return $this->nameAlias;
    }
    public function getType(): ThirdPartyType
    {
        return $this->type;
    }
    public function getStatus(): ThirdPartyStatus
    {
        return $this->status;
    }
    public function getEntity(): int
    {
        return $this->entity;
    }
    public function getAddress(): ?string
    {
        return $this->address;
    }
    public function getZip(): ?string
    {
        return $this->zip;
    }
    public function getTown(): ?string
    {
        return $this->town;
    }
    public function getPhone(): ?string
    {
        return $this->phone;
    }
    public function getEmail(): ?string
    {
        return $this->email;
    }
    public function getVatNumber(): ?string
    {
        return $this->vatNumber;
    }
    public function getUrl(): ?string
    {
        return $this->url;
    }
    public function getCountryId(): ?int
    {
        return $this->countryId;
    }
    public function getCapital(): ?float
    {
        return $this->capital;
    }
    public function getNotePrivate(): ?string
    {
        return $this->notePrivate;
    }
    public function getNotePublic(): ?string
    {
        return $this->notePublic;
    }

    public function getCustomerCode(): ?string
    {
        return $this->customerCode;
    }
    public function setCustomerCode(string $code): void
    {
        $this->customerCode = $code;
    }
    public function hasCustomerCode(): bool
    {
        return !empty($this->customerCode);
    }

    public function getSupplierCode(): ?string
    {
        return $this->supplierCode;
    }
    public function setSupplierCode(string $code): void
    {
        $this->supplierCode = $code;
    }
    public function hasSupplierCode(): bool
    {
        return !empty($this->supplierCode);
    }

    // ── Setters ──────────────────────────────────────────────

    public function setId(int $id): void
    {
        $this->id = $id;
    }

    /**
     * @param array<string, mixed> $data
     */
    public function updateFrom(array $data): void
    {
        if (array_key_exists('name', $data)) {
            $this->name = (string) $data['name'];
        }
        if (array_key_exists('nameAlias', $data)) {
            $this->nameAlias = $data['nameAlias'] === null ? null : (string) $data['nameAlias'];
        }
        if (isset($data['type'])) {
            $this->type = ThirdPartyType::from((int) $data['type']);
        }
        if (isset($data['isSupplier'])) {
            $this->isSupplier = (bool) $data['isSupplier'];
        }
        if (isset($data['status'])) {
            $this->status = ThirdPartyStatus::from((int) $data['status']);
        }
        if (array_key_exists('address', $data)) {
            $this->address = $data['address'] === null ? null : (string) $data['address'];
        }
        if (array_key_exists('zip', $data)) {
            $this->zip = $data['zip'] === null ? null : (string) $data['zip'];
        }
        if (array_key_exists('town', $data)) {
            $this->town = $data['town'] === null ? null : (string) $data['town'];
        }
        if (array_key_exists('phone', $data)) {
            $this->phone = $data['phone'] === null ? null : (string) $data['phone'];
        }
        if (array_key_exists('email', $data)) {
            $this->email = $data['email'] === null ? null : (string) $data['email'];
        }
        if (array_key_exists('url', $data)) {
            $this->url = $data['url'] === null ? null : (string) $data['url'];
        }
        if (array_key_exists('notePrivate', $data)) {
            $this->notePrivate = $data['notePrivate'] === null ? null : (string) $data['notePrivate'];
        }
        if (array_key_exists('notePublic', $data)) {
            $this->notePublic = $data['notePublic'] === null ? null : (string) $data['notePublic'];
        }
        if (array_key_exists('customerCode', $data)) {
            $this->customerCode = $data['customerCode'] === null ? null : (string) $data['customerCode'];
        }
        if (array_key_exists('supplierCode', $data)) {
            $this->supplierCode = $data['supplierCode'] === null ? null : (string) $data['supplierCode'];
        }
        if (array_key_exists('vatNumber', $data)) {
            $this->vatNumber = $data['vatNumber'] === null ? null : (string) $data['vatNumber'];
        }
        if (array_key_exists('nif', $data)) {
            $this->nif = $data['nif'] === null ? null : (string) $data['nif'];
        }
        if (array_key_exists('capital', $data)) {
            $this->capital = isset($data['capital']) ? (float) $data['capital'] : null;
        }
        if (array_key_exists('countryId', $data)) {
            $this->countryId = isset($data['countryId']) ? (int) $data['countryId'] : null;
        }
    }
}
