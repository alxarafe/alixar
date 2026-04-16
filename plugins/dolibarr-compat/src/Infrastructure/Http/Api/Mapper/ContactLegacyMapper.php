<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Http\Api\Mapper;

class ContactLegacyMapper extends AbstractLegacyMapper
{
    public function __construct()
    {
        // Legacy "Dolibarr" names -> "Alixar Native" domain property names
        $this->mapping = [
            'id' => 'id',
            'socid' => 'thirdPartyId',
            'lastname' => 'lastname',
            'firstname' => 'firstname',
            'civility' => 'civility',
            'address' => 'address',
            'zip' => 'zip',
            'town' => 'town',
            'fk_pays' => 'countryId',
            'phone_pro' => 'phone',
            'phone_perso' => 'phonePerso',
            'phone_mobile' => 'phoneMobile',
            'email' => 'email',
            'url' => 'url',
            'poste' => 'jobTitle',
            'note_private' => 'notePrivate',
            'note_public' => 'notePublic',
            'priv' => 'isPrivate',
        ];
    }

    public function toLegacy(mixed $nativePayload): array
    {
        $legacy = parent::toLegacy($nativePayload);
        $legacy['priv'] = !empty($legacy['priv']) ? 1 : 0;
        $legacy['statut'] = "1";
        return $legacy;
    }
}
