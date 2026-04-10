<?php

namespace App\Application\Codification;

use App\Domain\ThirdParty\ThirdParty;
use App\Domain\ThirdParty\ThirdPartyCodeGeneratorPort;

class NullThirdPartyCodeGenerator implements ThirdPartyCodeGeneratorPort
{
    public function generateCustomerCode(ThirdParty $thirdParty): string
    {
        // TODO: Implement actual generators (Leopard) via Database sequence
        return 'CUST-AUTO-' . time();
    }

    public function generateSupplierCode(ThirdParty $thirdParty): string
    {
        // TODO: Implement actual generators (Elephant) via Database sequence
        return 'SUPP-AUTO-' . time();
    }
}
