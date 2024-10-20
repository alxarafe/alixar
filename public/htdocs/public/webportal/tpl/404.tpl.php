<!-- file 404.tpl.php -->
<?php

/* Copyright (C) 2024       Rafael San José             <rsanjose@alxarafe.com>
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

// Protection to avoid direct call of template
if (empty($context) || !is_object($context)) {
    print "Error, template page can't be called as URL";
    exit(1);
}

global $langs;
?>
<section id="services">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading"><?php print $langs->trans('WebPortalError404'); ?></h2>
                <hr class="my-4">
            </div>
        </div>
    </div>
    <div class="container">
        <p class="text-center"><?php print $langs->trans('WebPortalErrorPageNotExist'); ?></p>
    </div>
</section>
