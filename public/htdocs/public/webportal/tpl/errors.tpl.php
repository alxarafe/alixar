<!-- file errors.tpl.php -->
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

print '
	<div class="modal fade" id="webportal_errors" tabindex="-1" role="dialog" aria-labelledby="webportal_errors_title" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="model-header bg-danger">
					<button type="button" class="close p-1" data-dismiss="modal" aria-hidden="true">&times;</button>
					<div class="d-flex justify-content-center">
						<span class="display-1 text-white">Ooops</span>
					</div>
				</div>

				<div class="modal-body m-0 py-4">
					';

foreach ($context->errors as $err) {
    print '<blockquote class="blockquote m-0">' . $err . '</blockquote>';
}

print '
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">$(function(){ $("#webportal_errors").modal(); });</script>
';


$context->clearErrors();
