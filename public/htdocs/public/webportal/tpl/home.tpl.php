<!-- file home.tpl.php -->
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

global $conf, $langs;

?>

<main class="container">
    <div class="home-links-grid grid">
        <?php
        if (isModEnabled('propal') && getDolGlobalInt('WEBPORTAL_PROPAL_LIST_ACCESS')) : ?>
            <article class="home-links-card --propal-list">
                <div class="home-links-card__icon"></div>
                <?php print '<a class="home-links-card__link" href="' . $context->getControllerUrl('propallist') . '" title="' . $langs->trans('WebPortalPropalListDesc') . '">' . $langs->trans('WebPortalPropalListTitle') . '</a>'; ?>
            </article>
        <?php endif; ?>
        <?php if (isModEnabled('order') && getDolGlobalInt('WEBPORTAL_ORDER_LIST_ACCESS')) : ?>
            <article class="home-links-card --order-list">
                <div class="home-links-card__icon"></div>
                <?php print '<a class="home-links-card__link" href="' . $context->getControllerUrl('orderlist') . '" title="' . $langs->trans('WebPortalOrderListDesc') . '">' . $langs->trans('WebPortalOrderListTitle') . '</a>'; ?>
            </article>
        <?php endif; ?>
        <?php if (isModEnabled('invoice') && getDolGlobalInt('WEBPORTAL_INVOICE_LIST_ACCESS')) : ?>
            <article class="home-links-card --invoice-list">
                <div class="home-links-card__icon"></div>
                <?php print '<a class="home-links-card__link" href="' . $context->getControllerUrl('invoicelist') . '" title="' . $langs->trans('WebPortalInvoiceListDesc') . '">' . $langs->trans('WebPortalInvoiceListTitle') . '</a>'; ?>
            </article>
        <?php endif; ?>
    </div>
</main>
