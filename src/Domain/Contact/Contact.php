<?php

declare(strict_types=1);

namespace App\Domain\Contact;

use DateTimeImmutable;

/**
 * Contact — Persona física asociada (o no) a un Tercero.
 *
 * Relación: Contact N:1 ThirdParty (vía fk_soc).
 * Un contacto puede existir SIN tercero (contacto independiente).
 *
 * @dolibarr-table llx_socpeople
 * @dolibarr-note  "socpeople" = "société people", mezcla franco-inglesa. Clean name: "contacts"
 */
class Contact
{
    /** @dolibarr-column rowid — Dolibarr PK universal */
    private ?int $id;

    /** @dolibarr-column lastname — ✅ OK */
    private string $lastname;

    /** @dolibarr-column firstname — ✅ OK */
    private ?string $firstname;

    /** @dolibarr-column civility — ✅ OK (stored as code: 'MR', 'MME', etc.) */
    private ?string $civility;

    /** @dolibarr-column fk_soc — FK a llx_societe. Clean: third_party_id */
    private ?int $thirdPartyId;

    // Address
    /** @dolibarr-column address — ✅ OK */
    private ?string $address;
    /** @dolibarr-column zip — ✅ OK */
    private ?string $zip;
    /** @dolibarr-column town — ✅ OK */
    private ?string $town;
    /** @dolibarr-column fk_pays — French: "pays" = country. Clean: country_id */
    private ?int $countryId;

    // Contact info
    /** @dolibarr-column phone — DB: "phone", pero API: "phone_pro". Inconsistencia DB↔API */
    private ?string $phone;
    /** @dolibarr-column phone_perso — ✅ OK (teléfono personal) */
    private ?string $phonePerso;
    /** @dolibarr-column phone_mobile — ✅ OK */
    private ?string $phoneMobile;
    /** @dolibarr-column fax — ✅ OK (obsoleto pero mantenido por compat.) */
    private ?string $fax;
    /** @dolibarr-column email — ✅ OK */
    private ?string $email;
    /** @dolibarr-column url — ✅ OK */
    private ?string $url;

    // Job
    /** @dolibarr-column poste — French: "poste" = job position/title. Clean: job_title */
    private ?string $jobTitle;

    // Notes
    /** @dolibarr-column note_private — ✅ OK */
    private ?string $notePrivate;
    /** @dolibarr-column note_public — ✅ OK */
    private ?string $notePublic;

    // Privacy
    /** @dolibarr-column priv — Abbreviation: "privé" = private. Clean: is_private */
    private bool $isPrivate;

    // Metadata
    /** @dolibarr-column entity — Multi-tenant discriminator. ✅ OK */
    private int $entity;
    /** @dolibarr-column datec — Abbreviation: "date création". Clean: created_at */
    private DateTimeImmutable $createdAt;

    public function __construct(
        string $lastname,
        ?string $firstname = null,
        ?int $thirdPartyId = null,
        ?int $id = null,
    ) {
        if (trim($lastname) === '') {
            throw new \InvalidArgumentException('El apellido del contacto es obligatorio.');
        }

        $this->id = $id;
        $this->lastname = $lastname;
        $this->firstname = $firstname;
        $this->thirdPartyId = $thirdPartyId;
        $this->civility = null;
        $this->entity = 1;
        $this->isPrivate = false;
        $this->createdAt = new DateTimeImmutable();

        $this->address = null;
        $this->zip = null;
        $this->town = null;
        $this->countryId = null;
        $this->phone = null;
        $this->phonePerso = null;
        $this->phoneMobile = null;
        $this->fax = null;
        $this->email = null;
        $this->url = null;
        $this->jobTitle = null;
        $this->notePrivate = null;
        $this->notePublic = null;
        $this->createdAt = new DateTimeImmutable();
    }

    // ── Hydration from Repository ────────────────────────────

    /**
     * @param array<string, mixed> $data Array with clean domain names.
     */
    public static function fromArray(array $data): self
    {
        $c = new self(
            lastname: (string) ($data['lastname'] ?? ''),
            firstname: isset($data['firstname']) ? (string) $data['firstname'] : null,
            thirdPartyId: isset($data['thirdPartyId']) && $data['thirdPartyId'] ? (int) $data['thirdPartyId'] : null,
            id: isset($data['id']) ? (int) $data['id'] : null,
        );

        $c->civility = isset($data['civility']) ? (string) $data['civility'] : null;
        $c->entity = (int) ($data['entity'] ?? 1);
        $c->isPrivate = (bool) ($data['isPrivate'] ?? false);

        $c->address = isset($data['address']) ? (string) $data['address'] : null;
        $c->zip = isset($data['zip']) ? (string) $data['zip'] : null;
        $c->town = isset($data['town']) ? (string) $data['town'] : null;
        $c->countryId = isset($data['countryId']) ? (int) $data['countryId'] : null;

        $c->phone = isset($data['phone']) ? (string) $data['phone'] : null;
        $c->phonePerso = isset($data['phonePerso']) ? (string) $data['phonePerso'] : null;
        $c->phoneMobile = isset($data['phoneMobile']) ? (string) $data['phoneMobile'] : null;
        $c->fax = isset($data['fax']) ? (string) $data['fax'] : null;
        $c->email = isset($data['email']) ? (string) $data['email'] : null;
        $c->url = isset($data['url']) ? (string) $data['url'] : null;
        $c->jobTitle = isset($data['jobTitle']) ? (string) $data['jobTitle'] : null;

        $c->notePrivate = isset($data['notePrivate']) ? (string) $data['notePrivate'] : null;
        $c->notePublic = isset($data['notePublic']) ? (string) $data['notePublic'] : null;

        if (!empty($data['createdAt'])) {
            $c->createdAt = $data['createdAt'] instanceof DateTimeImmutable
                ? $data['createdAt']
                : new DateTimeImmutable((string) $data['createdAt']);
        }

        return $c;
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
            'lastname' => $this->lastname,
            'firstname' => $this->firstname,
            'civility' => $this->civility,
            'thirdPartyId' => $this->thirdPartyId,
            'entity' => $this->entity,
            'isPrivate' => $this->isPrivate ? 1 : 0,
            'address' => $this->address,
            'zip' => $this->zip,
            'town' => $this->town,
            'countryId' => $this->countryId,
            'phone' => $this->phone,
            'phonePerso' => $this->phonePerso,
            'phoneMobile' => $this->phoneMobile,
            'fax' => $this->fax,
            'email' => $this->email,
            'url' => $this->url,
            'jobTitle' => $this->jobTitle,
            'notePrivate' => $this->notePrivate,
            'notePublic' => $this->notePublic,
            'createdAt' => $this->createdAt->format('Y-m-d H:i:s'),
        ];
    }

    public function getId(): ?int
    {
        return $this->id;
    }
    public function getLastname(): string
    {
        return $this->lastname;
    }
    public function getFirstname(): ?string
    {
        return $this->firstname;
    }
    public function getThirdPartyId(): ?int
    {
        return $this->thirdPartyId;
    }
    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setId(int $id): void
    {
        $this->id = $id;
    }

    /**
     * @param array<string, mixed> $data
     */
    public function updateFrom(array $data): void
    {
        if (array_key_exists('lastname', $data)) {
            $this->lastname = (string) $data['lastname'];
        }
        if (array_key_exists('firstname', $data)) {
            $this->firstname = $data['firstname'] === null ? null : (string) $data['firstname'];
        }
        if (array_key_exists('civility', $data)) {
            $this->civility = $data['civility'] === null ? null : (string) $data['civility'];
        }
        if (array_key_exists('thirdPartyId', $data)) {
            $this->thirdPartyId = $data['thirdPartyId'] ? (int) $data['thirdPartyId'] : null;
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
        if (array_key_exists('phonePerso', $data)) {
            $this->phonePerso = $data['phonePerso'] === null ? null : (string) $data['phonePerso'];
        }
        if (array_key_exists('phoneMobile', $data)) {
            $this->phoneMobile = $data['phoneMobile'] === null ? null : (string) $data['phoneMobile'];
        }
        if (array_key_exists('email', $data)) {
            $this->email = $data['email'] === null ? null : (string) $data['email'];
        }
        if (array_key_exists('url', $data)) {
            $this->url = $data['url'] === null ? null : (string) $data['url'];
        }
        if (array_key_exists('jobTitle', $data)) {
            $this->jobTitle = $data['jobTitle'] === null ? null : (string) $data['jobTitle'];
        }
        if (array_key_exists('notePrivate', $data)) {
            $this->notePrivate = $data['notePrivate'] === null ? null : (string) $data['notePrivate'];
        }
        if (array_key_exists('notePublic', $data)) {
            $this->notePublic = $data['notePublic'] === null ? null : (string) $data['notePublic'];
        }
        if (array_key_exists('countryId', $data)) {
            $this->countryId = $data['countryId'] ? (int) $data['countryId'] : null;
        }
        if (array_key_exists('isPrivate', $data)) {
            $this->isPrivate = (bool) $data['isPrivate'];
        }
    }
}
