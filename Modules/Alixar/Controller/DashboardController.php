<?php

namespace Modules\Alixar\Controller;

use Alxarafe\Base\Controller\Controller;

class DashboardController extends Controller
{
    public function doIndex(): bool
    {
        $this->addVariable('title', 'Alixar ERP - Dashboard');
        $this->setDefaultTemplate('page/home');
        return true;
    }
}
