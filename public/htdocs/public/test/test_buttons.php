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

use Alxarafe\Lib\Functions;

Functions::defineIfNotDefined('NOREQUIRESOC', 1);   // No company needed
Functions::defineIfNotDefined('NOCSRFCHECK', 1);  // Do not check anti CSRF attack test
Functions::defineIfNotDefined('NOTOKENRENEWAL', 1);  // Disables token renewal
Functions::defineIfNotDefined('NOLOGIN', 1);  // File must be accessed by logon page so without login
Functions::defineIfNotDefined('NOREQUIREHTML', 1); // If we don't need to load the html.form.class.php
Functions::defineIfNotDefined('NOREQUIREAJAX', 1); // Do not load ajax.lib.php library
Functions::defineIfNotDefined('NOSESSION', 1);   // On CLI mode, no need to use web sessions
Functions::defineIfNotDefined('NOREQUIREMENU', 1);  // If there is no need to load and show top and left menu

session_cache_limiter('public');

require_once constant('DOL_DOCUMENT_ROOT') . '/main.inc.php';
require_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/functions.lib.php';

// Security
if ($dolibarr_main_prod) {
    accessforbidden();
}


/*
 * View
 */

ViewMain::llxHeader('', 'Documentation and examples for theme');
?>
    <main role="main">
        <h1 class="bd-title" id="content">Button for action</h1>
        <p class="bd-lead">Documentation and examples for buttons.</p>

        <h2 id="example01">Example of simple usage</h2>

        <p>Buttons for user allowed to click.</p>

        <div class="bd-example">
            <?php
            $n = 1;
            $label = 'My action label used for accessibility visually for impaired people';
            $html = '<span class="fa fa-clone" ></span> My default action';
            $actionType = 'default';
            $n++;
            $id = 'mybuttonid' . $n;
            $url = '#' . $id;
            $userRight = 1;
            $params = array();

            print dolGetButtonAction($label, $html, $actionType, $url, $id, $userRight);


            $html = '<span class="fa fa-clone" ></span> My delete action';
            $actionType = 'delete';
            $n++;
            $id = 'mybuttonid' . $n;
            $url = $_SERVER['PHP_SELF'] . '?token=' . newToken() . '#' . $id;
            print dolGetButtonAction($label, $html, $actionType, $url, $id, $userRight);


            $html = '<span class="fa fa-clone" ></span> My danger action';
            $actionType = 'danger';
            $n++;
            $id = 'mybuttonid' . $n;
            $url = $_SERVER['PHP_SELF'] . '?token=' . newToken() . '#' . $id;
            print dolGetButtonAction($label, $html, $actionType, $url, $id, $userRight);

            ?>
        </div>

        <p>Buttons for user <strong>NOT</strong> allowed to click.</p>

        <div class="bd-example">
            <?php
            $label = 'My action label used for accessibility visually for impaired people';
            $html = '<span class="fa fa-clone" ></span> My default action';
            $actionType = 'default';
            $n++;
            $id = 'mybuttonid' . $n;
            $url = '#' . $id;
            $userRight = 0;

            print dolGetButtonAction($label, $html, $actionType, $url, $id, $userRight);


            $html = '<span class="fa fa-clone" ></span> My delete action';
            $actionType = 'delete';
            $n++;
            $id = 'mybuttonid' . $n;
            $url = $_SERVER['PHP_SELF'] . '?token=' . newToken() . '#' . $id;
            print dolGetButtonAction($label, $html, $actionType, $url, $id, $userRight);


            $html = '<span class="fa fa-clone" ></span> My danger action';
            $actionType = 'danger';
            $n++;
            $id = 'mybuttonid' . $n;
            $url = $_SERVER['PHP_SELF'] . '?token=' . newToken() . '#' . $id;
            print dolGetButtonAction($label, $html, $actionType, $url, $id, $userRight);

            ?>
        </div>


        <h2 id="example01">Example of confirm dialog</h2>

        <p>Buttons for user allowed to click.</p>

        <div class="bd-example">
            <?php
            $label = 'My action label used for accessibility visually for impaired people';
            $html = '<span class="fa fa-clone" ></span> My default action';
            $actionType = 'default';
            $n++;
            $id = 'mybuttonid' . $n;
            $url = '#' . $id;
            $userRight = 1;
            $params = array(
                'confirm' => true
            );

            print dolGetButtonAction($label, $html, $actionType, $url, $id, $userRight, $params);


            $html = '<span class="fa fa-clone" ></span> My delete action';
            $actionType = 'delete';
            $n++;
            $id = 'mybuttonid' . $n;
            $url = $_SERVER['PHP_SELF'] . '?token=' . newToken() . '#' . $id;

            $params = array(
                'confirm' => array(
                    'url' => 'your confirm action url',
                    'title' => 'Your title to display',
                    'action-btn-label' => 'Your confirm label',
                    'cancel-btn-label' => 'Your cancel label',
                    'content' => 'Content to display  with <strong>HTML</strong> compatible <ul><li>test 01</li><li>test 02</li><li>test 03</li></ul>'
                )
            );

            print dolGetButtonAction($label, $html, $actionType, $url, $id, $userRight, $params);

            ?>
        </div>

        <p>Buttons for user <strong>NOT</strong> allowed to click.</p>

        <div class="bd-example">
            <?php
            $label = 'My action label used for accessibility visually for impaired people';
            $html = '<span class="fa fa-clone" ></span> My default action';
            $actionType = 'default';
            $n++;
            $id = 'mybuttonid' . $n;
            $url = '#' . $id;
            $userRight = 0;
            $params = array(
                'confirm' => true
            );

            print dolGetButtonAction($label, $html, $actionType, $url, $id, $userRight, $params);


            $html = '<span class="fa fa-clone" ></span> My delete action';
            $actionType = 'delete';
            $n++;
            $id = 'mybuttonid' . $n;
            $url = $_SERVER['PHP_SELF'] . '?token=' . newToken() . '#' . $id;

            $params = array(
                'confirm' => array(
                    'url' => 'your confirm action url',
                    'title' => 'Your title to display',
                    'action-btn-label' => 'Your confirm label',
                    'cancel-btn-label' => 'Your cancel label',
                    'content' => 'Content to display  with <strong>HTML</strong> compatible <ul><li>test 01</li><li>test 02</li><li>test 03</li></ul>'
                )
            );

            print dolGetButtonAction($label, $html, $actionType, $url, $id, $userRight, $params);

            ?>
        </div>


    </main>

<?php ViewMain::llxFooter();
