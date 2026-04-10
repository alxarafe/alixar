<?php

declare(strict_types=1);

namespace App\Domain\Contact;

use DateTimeImmutable;

/**
 * Contact — Persona física asociada (o no) a un Tercero.
 *
 * Tabla Dolibarr: `socpeople`.
 * Relación: Contact N:1 ThirdParty (vía fk_soc).
 * Un contacto puede existir SIN tercero (contacto independiente).
 */
class Contact
{
    private ?int $id;
    private string $lastname;
    private ?string $firstname;
    private ?string $civility;
    private ?int $thirdPartyId;  // fk_soc

    // Address
    private ?string $address;
    private ?string $zip;
    private ?string $town;
    private ?int $countryId;

    // Contact info
    private ?string $phone;
    private ?string $phonePerso;
    private ?string $phoneMobile;
    private ?string $fax;
    private ?string $email;
    private ?string $url;

    // Job
    private ?string $poste; // Cargo / puesto

    // Notes
    private ?string $notePrivate;
    private ?string $notePublic;

    // Privacy
    private bool $priv;

    // Metadata
    private int $entity;
    private ?DateTimeImmutable $createdAt;

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
        $this->priv = false;
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
        $this->poste = null;
        $this->notePrivate = null;
        $this->notePublic = null;
    }

    /**
     * @param array<string, mixed> $data Row from `socpeople` table.
     */
    public static function fromArray(array $data): self
    {
        $c = new self(
            lastname: $data['lastname'] ?? '',
            firstname: $data['firstname'] ?? null,
            thirdPartyId: isset($data['fk_soc']) && $data['fk_soc'] ? (int) $data['fk_soc'] : null,
            id: isset($data['id']) ? (int) $data['id'] : (isset($data['rowid']) ? (int) $data['rowid'] : null),
        );

        $c->civility = $data['civility'] ?? null;
        $c->entity = (int) ($data['entity'] ?? 1);
        $c->priv = (bool) ($data['priv'] ?? false);

        $c->address = $data['address'] ?? null;
        $c->zip = $data['zip'] ?? null;
        $c->town = $data['town'] ?? null;
        $c->countryId = isset($data['fk_pays']) ? (int) $data['fk_pays'] : null;

        $c->phone = $data['phone'] ?? null;
        $c->phonePerso = $data['phone_perso'] ?? null;
        $c->phoneMobile = $data['phone_mobile'] ?? null;
        $c->fax = $data['fax'] ?? null;
        $c->email = $data['email'] ?? null;
        $c->url = $data['url'] ?? null;
        $c->poste = $data['poste'] ?? null;

        $c->notePrivate = $data['note_private'] ?? null;
        $c->notePublic = $data['note_public'] ?? null;

        if (!empty($data['datec'])) {
            $c->createdAt = new DateTimeImmutable($data['datec']);
        }

        return $c;
    }

    /**
     * @return array<string, mixed>
     */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'lastname' => $this->lastname,
            'firstname' => $this->firstname,
            'civility' => $this->civility,
            'fk_soc' => $this->thirdPartyId,
            'entity' => $this->entity,
            'priv' => $this->priv ? 1 : 0,
            'address' => $this->address,
            'zip' => $this->zip,
            'town' => $this->town,
            'fk_pays' => $this->countryId,
            'phone' => $this->phone,
            'phone_perso' => $this->phonePerso,
            'phone_mobile' => $this->phoneMobile,
            'fax' => $this->fax,
            'email' => $this->email,
            'url' => $this->url,
            'poste' => $this->poste,
            'note_private' => $this->notePrivate,
            'note_public' => $this->notePublic,
            'datec' => $this->createdAt?->format('Y-m-d H:i:s'),
        ];
    }

    /**
     * Dolibarr-API-compatible response format.
     * @return array<string, mixed>
     */
    public function toApiArray(): array
    {
        return $this->toArray();
    }

    public function getId(): ?int { return $this->id; }
    public function getLastname(): string { return $this->lastname; }
    public function getFirstname(): ?string { return $this->firstname; }
    public function getThirdPartyId(): ?int { return $this->thirdPartyId; }
    public function getEmail(): ?string { return $this->email; }

    public function setId(int $id): void { $this->id = $id; }

    public function updateFrom(array $data): void
    {
        if (isset($data['lastname'])) { $this->lastname = $data['lastname']; }
        if (array_key_exists('firstname', $data)) { $this->firstname = $data['firstname']; }
        if (array_key_exists('civility', $data)) { $this->civility = $data['civility']; }
        if (array_key_exists('fk_soc', $data)) { $this->thirdPartyId = $data['fk_soc'] ? (int) $data['fk_soc'] : null; }
        if (array_key_exists('address', $data)) { $this->address = $data['address']; }
        if (array_key_exists('zip', $data)) { $this->zip = $data['zip']; }
        if (array_key_exists('town', $data)) { $this->town = $data['town']; }
        if (array_key_exists('phone', $data)) { $this->phone = $data['phone']; }
        if (array_key_exists('phone_perso', $data)) { $this->phonePerso = $data['phone_perso']; }
        if (array_key_exists('phone_mobile', $data)) { $this->phoneMobile = $data['phone_mobile']; }
        if (array_key_exists('email', $data)) { $this->email = $data['email']; }
        if (array_key_exists('url', $data)) { $this->url = $data['url']; }
        if (array_key_exists('poste', $data)) { $this->poste = $data['poste']; }
        if (array_key_exists('note_private', $data)) { $this->notePrivate = $data['note_private']; }
        if (array_key_exists('note_public', $data)) { $this->notePublic = $data['note_public']; }
    }
}
