<?php

/* Copyright (C) 2023       Laurent Destailleur         <eldy@users.sourceforge.net>
 * Copyright (C) 2024		MDW							<mdeweerd@users.noreply.github.com>
 * Copyright (C) 2024       Rafael San José             <rsanjose@alxarafe.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

namespace Dolibarr\Tools;

use Alxarafe\Tools\DebugBarCollector\PhpCollector;
use DebugBar\DebugBar;
use Dolibarr\Tools\DebugBarCollector\DolHooksCollector;
use Dolibarr\Tools\DebugBarCollector\DolibarrCollector;
use Dolibarr\Tools\DebugBarCollector\DolLogsCollector;
use Dolibarr\Tools\DebugBarCollector\DolMemoryCollector;
use Dolibarr\Tools\DebugBarCollector\DolQueryCollector;
use Dolibarr\Tools\DebugBarCollector\DolRequestDataCollector;
use Dolibarr\Tools\DebugBarCollector\DolTimeDataCollector;

/**
 *  \file       htdocs/debugbar/class/DebugBar.php
 *  \brief      Class for debugbar
 *  \ingroup    debugbar
 */

/**
 * DolibarrDebugBar class
 *
 * @see http://phpdebugbar.com/docs/base-collectors.html#base-collectors
 */
class Debug extends DebugBar
{
    /**
     * Constructor
     *
     */
    public function __construct()
    {
        //$this->addCollector(new PhpInfoCollector());
        //$this->addCollector(new DolMessagesCollector());
        $this->addCollector(new DolRequestDataCollector());
        //$this->addCollector(new DolConfigCollector());      // Disabled for security purpose
        $this->addCollector(new DolTimeDataCollector());
        $this->addCollector(new PhpCollector());
        $this->addCollector(new DolMemoryCollector());
        //$this->addCollector(new DolExceptionsCollector());
        $this->addCollector(new DolQueryCollector());
        $this->addCollector(new DolibarrCollector());
        $this->addCollector(new DolHooksCollector());
        if (isModEnabled('syslog')) {
            $this->addCollector(new DolLogsCollector());
        }
    }

    /**
     * Returns a JavascriptRenderer for this instance
     *
     * @param string $baseUrl Base url
     * @param string $basePath Base path
     * @return \DebugBar\JavascriptRenderer      String content
     */
    public function getJavascriptRenderer($baseUrl = null, $basePath = null)
    {
        if ($baseUrl === null) {
            $baseUrl = constant('DOL_URL_ROOT') . '/templates/src/DebugBar/Resources';
        }
        $renderer = parent::getJavascriptRenderer($baseUrl, $basePath);
        $renderer->disableVendor('jquery');         // We already have jquery loaded globally by the main.inc.php
        $renderer->disableVendor('fontawesome');    // We already have fontawesome loaded globally by the main.inc.php
        $renderer->disableVendor('highlightjs');    // We don't need this
        $renderer->setEnableJqueryNoConflict(false);    // We don't need no conflict

        return $renderer;
    }

    /**
     * Returns a JavascriptRenderer for this instance
     *
     * @return \DebugBar\JavascriptRenderer      String content
     * @deprecated Use getJavascriptRenderer
     */
    public function getRenderer()
    {
        return $this->getJavascriptRenderer();
    }
}