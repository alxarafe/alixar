<?php

/* Copyright (C) 2023       Laurent Destailleur         <eldy@users.sourceforge.net>
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

use DebugBar\DataCollector\MemoryCollector;

/**
 *  \file       htdocs/debugbar/class/DataCollector/DolMemoryCollector.php
 *  \brief      Class for debugbar collection
 *  \ingroup    debugbar
 */

/**
 * DolMemoryCollector class
 */
class DolMemoryCollector extends MemoryCollector
{
    /**
     *  Return value of indicator
     *
     * @return array       Array
     */
    public function collect()
    {
        global $conf;

        $this->updatePeakUsage();
        return array(
            'peak_usage' => $this->peakUsage,
            //'peak_usage_str' => $this->getDataFormatter()->formatBytes($this->peakUsage, 2)
            'peak_usage_str' => (empty($conf->dol_optimize_smallscreen) ? dol_print_size($this->peakUsage, 0) : dol_print_size($this->peakUsage, 1))
        );
    }

    /**
     *  Return widget settings
     *
     * @return array   Array
     */
    public function getWidgets()
    {
        global $langs;

        $langs->load("other");

        return array(
            "memory" => array(
                "icon" => "cogs",
                "tooltip" => $langs->transnoentities('MemoryUsage'),
                "map" => "memory.peak_usage_str",
                "default" => "'0B'"
            )
        );
    }
}
