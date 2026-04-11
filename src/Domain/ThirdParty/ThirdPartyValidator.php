<?php

namespace App\Domain\ThirdParty;

use App\Application\Configuration\ConfigurationPort;
use App\Domain\Exception\DomainValidationException;

class ThirdPartyValidator
{
    public function __construct(
        private ThirdPartyRepository $repository,
        private ConfigurationPort $config,
        private ThirdPartyCodeGeneratorPort $codeGenerator
    ) {
    }

    /**
     * Validates a ThirdParty entity against constraints mapped from societe.class.php verify().
     * Mutates missing auto-generated codes if requested format is 'auto'.
     *
     * @throws DomainValidationException
     */
    public function validate(ThirdParty $thirdParty): void
    {
        $errors = [];

        // 1. Mandatory Name
        $name = trim($thirdParty->getName());
        if (empty($name)) {
            $errors['name'] = 'ErrorBadThirdPartyName';
        }

        // 2. Email Mandatory check
        if ($this->config->getBool('SOCIETE_EMAIL_MANDATORY') && empty($thirdParty->getEmail())) {
            $errors['email'] = 'ErrorEmailRequired';
        }

        // 3. Email Uniqueness check
        if (!empty($thirdParty->getEmail()) && $this->config->getBool('SOCIETE_EMAIL_UNIQUE')) {
            $existing = $this->repository->findByEmail($thirdParty->getEmail());
            // If another third party exists with the same email
            if ($existing && $existing->getId() !== $thirdParty->getId()) {
                $errors['email'] = 'ErrorEmailAlreadyExists';
            }
        }

        // 4. VAT Uniqueness check (skip if not applicable or if type is generic prospect)
        if (!empty($thirdParty->getVatNumber()) && $this->config->getBool('SOCIETE_VAT_INTRA_UNIQUE')) {
            // Note: In Dolibarr, Generic prospects might bypass some rules, keeping it simple for now.
            $existing = $this->repository->findByVatNumber($thirdParty->getVatNumber());
            if ($existing && $existing->getId() !== $thirdParty->getId()) {
                $errors['tva_intra'] = 'ErrorVATNumberAlreadyExists';
            }
        }

        if (!empty($errors)) {
            throw new DomainValidationException($errors, 'Validation failed for ThirdParty');
        }

        // Auto-generation mutation
        // In Dolibarr, if customer code == 'auto', we generate it here during create/verify.
        if ($thirdParty->hasCustomerCode() && strtolower((string)$thirdParty->getCustomerCode()) === 'auto') {
            $thirdParty->setCustomerCode($this->codeGenerator->generateCustomerCode($thirdParty));
        }

        if ($thirdParty->hasSupplierCode() && strtolower((string)$thirdParty->getSupplierCode()) === 'auto') {
            $thirdParty->setSupplierCode($this->codeGenerator->generateSupplierCode($thirdParty));
        }
    }
}
