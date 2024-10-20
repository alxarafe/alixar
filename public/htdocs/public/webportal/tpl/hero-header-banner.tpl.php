<!-- file hero-header-banner.tpl.php -->
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
?>
<section class="hero-header" <?php print !empty($context->theme->bannerUseDarkTheme) ? ' data-theme="dark" ' : '' ?> >
    <div class="container">
        <h1 class="hero-header__title"><?php print $context->title; ?></h1>
        <div class="hero-header__desc"><?php print $context->desc; ?></div>
    </div>
</section>
