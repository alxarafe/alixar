<?php

namespace Plugin\Crm\Application\Codification;

use Plugin\Crm\Domain\ThirdParty\ThirdParty;
use Plugin\Crm\Domain\ThirdParty\ThirdPartyCodeGeneratorPort;

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
