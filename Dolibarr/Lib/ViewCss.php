<?php

/* Copyright (C) 2024       Rafael San José         <rsanjose@alxarafe.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

namespace Dolibarr\Lib;

abstract class ViewCss
{
    /**
     *  Show HTTP header.
     *
     * @return void
     */
    public static function topHttpHead()
    {
        // global $db, $conf, $hookmanager;

        header('Content-Type: text/css');

        /*

        // Security options

        // X-Content-Type-Options
        header("X-Content-Type-Options: nosniff"); // With the nosniff option, if the server says the content is text/html, the browser will render it as text/html (note that most browsers now force this option to on)

        // X-Frame-Options
        if (!defined('XFRAMEOPTIONS_ALLOWALL')) {
            header("X-Frame-Options: SAMEORIGIN"); // By default, frames allowed only if on same domain (stop some XSS attacks)
        } else {
            header("X-Frame-Options: ALLOWALL");
        }

        if (getDolGlobalString('MAIN_SECURITY_FORCE_ACCESS_CONTROL_ALLOW_ORIGIN')) {
            $tmpurl = constant('DOL_MAIN_URL_ROOT');
            $tmpurl = preg_replace('/^(https?:\/\/[^\/]+)\/.*$/', '\1', $tmpurl);
            header('Access-Control-Allow-Origin: ' . $tmpurl);
            header('Vary: Origin');
        }

        // X-XSS-Protection
        //header("X-XSS-Protection: 1");            // XSS filtering protection of some browsers (note: use of Content-Security-Policy is more efficient). Disabled as deprecated.

        // Content-Security-Policy-Report-Only
        if (!defined('MAIN_SECURITY_FORCECSPRO')) {
            // If CSP not forced from the page

            // A default security policy that keep usage of js external component like ckeditor, stripe, google, working
            // For example: to restrict to only local resources, except for css (cloudflare+google), and js (transifex + google tags) and object/iframe (youtube)
            // default-src 'self'; style-src: https://cdnjs.cloudflare.com https://fonts.googleapis.com; script-src: https://cdn.transifex.com https://www.googletagmanager.com; object-src https://youtube.com; frame-src https://youtube.com; img-src: *;
            // For example, to restrict everything to itself except img that can be on other servers:
            // default-src 'self'; img-src *;
            // Pre-existing site that uses too much js code to fix but wants to ensure resources are loaded only over https and disable plugins:
            // default-src https: 'unsafe-inline' 'unsafe-eval'; object-src 'none'
            //
            // $contentsecuritypolicy = "frame-ancestors 'self'; img-src * data:; font-src *; default-src 'self' 'unsafe-inline' 'unsafe-eval' *.paypal.com *.stripe.com *.google.com *.googleapis.com *.google-analytics.com *.googletagmanager.com;";
            // $contentsecuritypolicy = "frame-ancestors 'self'; img-src * data:; font-src *; default-src *; script-src 'self' 'unsafe-inline' *.paypal.com *.stripe.com *.google.com *.googleapis.com *.google-analytics.com *.googletagmanager.com; style-src 'self' 'unsafe-inline'; connect-src 'self';";
            $contentsecuritypolicy = getDolGlobalString('MAIN_SECURITY_FORCECSPRO');

            if (!is_object($hookmanager)) {
                $hookmanager = new HookManager($db);
            }
            $hookmanager->initHooks(array("main"));

            $parameters = array('contentsecuritypolicy' => $contentsecuritypolicy, 'mode' => 'reportonly');
            $result = $hookmanager->executeHooks('setContentSecurityPolicy', $parameters); // Note that $action and $object may have been modified by some hooks
            if ($result > 0) {
                $contentsecuritypolicy = $hookmanager->resPrint; // Replace CSP
            } else {
                $contentsecuritypolicy .= $hookmanager->resPrint; // Concat CSP
            }

            if (!empty($contentsecuritypolicy)) {
                header("Content-Security-Policy-Report-Only: " . $contentsecuritypolicy);
            }
        } else {
            header("Content-Security-Policy: " . constant('MAIN_SECURITY_FORCECSPRO'));
        }

        // Content-Security-Policy
        if (!defined('MAIN_SECURITY_FORCECSP')) {
            // If CSP not forced from the page

            // A default security policy that keep usage of js external component like ckeditor, stripe, google, working
            // For example: to restrict to only local resources, except for css (cloudflare+google), and js (transifex + google tags) and object/iframe (youtube)
            // default-src 'self'; style-src: https://cdnjs.cloudflare.com https://fonts.googleapis.com; script-src: https://cdn.transifex.com https://www.googletagmanager.com; object-src https://youtube.com; frame-src https://youtube.com; img-src: *;
            // For example, to restrict everything to itself except img that can be on other servers:
            // default-src 'self'; img-src *;
            // Pre-existing site that uses too much js code to fix but wants to ensure resources are loaded only over https and disable plugins:
            // default-src https: 'unsafe-inline' 'unsafe-eval'; object-src 'none'
            //
            // $contentsecuritypolicy = "frame-ancestors 'self'; img-src * data:; font-src *; default-src 'self' 'unsafe-inline' 'unsafe-eval' *.paypal.com *.stripe.com *.google.com *.googleapis.com *.google-analytics.com *.googletagmanager.com;";
            // $contentsecuritypolicy = "frame-ancestors 'self'; img-src * data:; font-src *; default-src *; script-src 'self' 'unsafe-inline' *.paypal.com *.stripe.com *.google.com *.googleapis.com *.google-analytics.com *.googletagmanager.com; style-src 'self' 'unsafe-inline'; connect-src 'self';";
            $contentsecuritypolicy = getDolGlobalString('MAIN_SECURITY_FORCECSP');

            if (!is_object($hookmanager)) {
                $hookmanager = new HookManager($db);
            }
            $hookmanager->initHooks(array("main"));

            $parameters = array('contentsecuritypolicy' => $contentsecuritypolicy, 'mode' => 'active');
            $result = $hookmanager->executeHooks('setContentSecurityPolicy', $parameters); // Note that $action and $object may have been modified by some hooks
            if ($result > 0) {
                $contentsecuritypolicy = $hookmanager->resPrint; // Replace CSP
            } else {
                $contentsecuritypolicy .= $hookmanager->resPrint; // Concat CSP
            }

            if (!empty($contentsecuritypolicy)) {
                header("Content-Security-Policy: " . $contentsecuritypolicy);
            }
        } else {
            header("Content-Security-Policy: " . constant('MAIN_SECURITY_FORCECSP'));
        }

        // Referrer-Policy
        // Say if we must provide the referrer when we jump onto another web page.
        // Default browser are 'strict-origin-when-cross-origin' (only domain is sent on other domain switching), we want more so we use 'same-origin' so browser doesn't send any referrer at all when going into another web site domain.
        // Note that we do not use 'strict-origin' as this breaks feature to restore filters when clicking on "back to page" link on some cases.
        if (!defined('MAIN_SECURITY_FORCERP')) {
            $referrerpolicy = getDolGlobalString('MAIN_SECURITY_FORCERP', "same-origin");

            header("Referrer-Policy: " . $referrerpolicy);
        }

        */

        // No need to add this token in header, we use instead the one into the forms.
        //header("anti-csrf-token: ".newToken());
    }
}