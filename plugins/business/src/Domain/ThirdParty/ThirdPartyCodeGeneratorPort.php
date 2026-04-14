<?php

namespace Plugin\Business\Domain\ThirdParty;

interface ThirdPartyCodeGeneratorPort
{
    /**
     * Generate the customer code based on active strategies (e.g., Leopard).
     */
    public function generateCustomerCode(ThirdParty $thirdParty): string;

    /**
     * Generate the supplier code based on active strategies (e.g., Elephant).
     */
    public function generateSupplierCode(ThirdParty $thirdParty): string;
}
