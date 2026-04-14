<?php

namespace Plugin\Business\Application\Codification;

use Plugin\Business\Domain\ThirdParty\ThirdParty;
use Plugin\Business\Domain\ThirdParty\ThirdPartyCodeGeneratorPort;

class NullThirdPartyCodeGenerator implements ThirdPartyCodeGeneratorPort
{
    #[\Override]
    public function generateCustomerCode(ThirdParty $thirdParty): string
    {
        // TODO: Implement actual generators (Leopard) via Database sequence
        return 'CUST-AUTO-' . time();
    }

    #[\Override]
    public function generateSupplierCode(ThirdParty $thirdParty): string
    {
        // TODO: Implement actual generators (Elephant) via Database sequence
        return 'SUPP-AUTO-' . time();
    }
}
