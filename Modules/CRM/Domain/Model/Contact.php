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

/**
 * Contact — Pure domain entity (POJO).
 *
 * Represents a contact person associated with a ThirdParty.
 * Maps to Dolibarr table `socpeople` but contains NO infrastructure dependencies.
 */
class Contact
{
    private ?int $id;
    private ?int $thirdPartyId;
    private string $lastname;
    private ?string $firstname;
    private ?string $civility;
    private ?string $position;

    // Contact info
    private ?string $phone;
    private ?string $phonePersonal;
    private ?string $phoneMobile;
    private ?string $fax;
    private ?string $email;
    private ?string $url;

    // Address
    private ?string $address;
    private ?string $zip;
    private ?string $town;
    private ?int $stateId;
    private ?int $countryId;

    // Notes
    private ?string $notePrivate;
    private ?string $notePublic;

    // Metadata
    private int $entity;
    private int $status;
    private ?DateTimeImmutable $createdAt;

    public function __construct(
        string $lastname,
        ?string $firstname = null,
        ?int $thirdPartyId = null,
        ?int $id = null,
    ) {
        $this->id = $id;
        $this->lastname = $lastname;
        $this->firstname = $firstname;
        $this->thirdPartyId = $thirdPartyId;
        $this->civility = null;
        $this->position = null;
        $this->phone = null;
        $this->phonePersonal = null;
        $this->phoneMobile = null;
        $this->fax = null;
        $this->email = null;
        $this->url = null;
        $this->address = null;
        $this->zip = null;
        $this->town = null;
        $this->stateId = null;
        $this->countryId = null;
        $this->notePrivate = null;
        $this->notePublic = null;
        $this->entity = 1;
        $this->status = 1;
        $this->createdAt = new DateTimeImmutable();
    }

    // ── Business Logic ──

    public function getFullName(): string
    {
        return trim(($this->firstname ?? '') . ' ' . $this->lastname);
    }

    public function belongsToThirdParty(): bool
    {
        return $this->thirdPartyId !== null && $this->thirdPartyId > 0;
    }

    // ── Hydration ──

    /**
     * @param array<string, mixed> $data Row from `socpeople` table.
     */
    public static function fromArray(array $data): self
    {
        $contact = new self(
            lastname: $data['lastname'] ?? '',
            firstname: $data['firstname'] ?? null,
            thirdPartyId: isset($data['fk_soc']) ? (int) $data['fk_soc'] : null,
            id: isset($data['rowid']) ? (int) $data['rowid'] : null,
        );

        $contact->civility = $data['civility'] ?? null;
        $contact->position = $data['poste'] ?? null;
        $contact->phone = $data['phone'] ?? null;
        $contact->phonePersonal = $data['phone_perso'] ?? null;
        $contact->phoneMobile = $data['phone_mobile'] ?? null;
        $contact->fax = $data['fax'] ?? null;
        $contact->email = $data['email'] ?? null;
        $contact->url = $data['url'] ?? null;
        $contact->address = $data['address'] ?? null;
        $contact->zip = $data['zip'] ?? null;
        $contact->town = $data['town'] ?? null;
        $contact->stateId = isset($data['fk_departement']) ? (int) $data['fk_departement'] : null;
        $contact->countryId = isset($data['fk_pays']) ? (int) $data['fk_pays'] : null;
        $contact->notePrivate = $data['note_private'] ?? null;
        $contact->notePublic = $data['note_public'] ?? null;
        $contact->entity = (int) ($data['entity'] ?? 1);
        $contact->status = (int) ($data['statut'] ?? 1);

        if (!empty($data['datec'])) {
            $contact->createdAt = new DateTimeImmutable($data['datec']);
        }

        return $contact;
    }

    /**
     * @return array<string, mixed> Dolibarr column names.
     */
    public function toArray(): array
    {
        return [
            'rowid' => $this->id,
            'fk_soc' => $this->thirdPartyId,
            'lastname' => $this->lastname,
            'firstname' => $this->firstname,
            'civility' => $this->civility,
            'poste' => $this->position,
            'phone' => $this->phone,
            'phone_perso' => $this->phonePersonal,
            'phone_mobile' => $this->phoneMobile,
            'fax' => $this->fax,
            'email' => $this->email,
            'url' => $this->url,
            'address' => $this->address,
            'zip' => $this->zip,
            'town' => $this->town,
            'fk_departement' => $this->stateId,
            'fk_pays' => $this->countryId,
            'note_private' => $this->notePrivate,
            'note_public' => $this->notePublic,
            'entity' => $this->entity,
            'statut' => $this->status,
            'datec' => $this->createdAt?->format('Y-m-d H:i:s'),
        ];
    }

    // ── Getters ──

    public function getId(): ?int { return $this->id; }
    public function getThirdPartyId(): ?int { return $this->thirdPartyId; }
    public function getLastname(): string { return $this->lastname; }
    public function getFirstname(): ?string { return $this->firstname; }
    public function getCivility(): ?string { return $this->civility; }
    public function getPosition(): ?string { return $this->position; }
    public function getPhone(): ?string { return $this->phone; }
    public function getEmail(): ?string { return $this->email; }
    public function getTown(): ?string { return $this->town; }

    // ── Setters ──

    public function setId(int $id): void { $this->id = $id; }
}
