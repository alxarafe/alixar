-- ===================================================================
-- Copyright (C) 2015 Laurent Destailleur	<eldy@users.sourceforge.net>
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see <https://www.gnu.org/licenses/>.
--
-- ===================================================================

ALTER TABLE llx_cronjob
    ADD INDEX idx_cronjob_status (status);
ALTER TABLE llx_cronjob
    ADD INDEX idx_cronjob_datelastrun (datelastrun);
ALTER TABLE llx_cronjob
    ADD INDEX idx_cronjob_datenextrun (datenextrun);
ALTER TABLE llx_cronjob
    ADD INDEX idx_cronjob_datestart (datestart);
ALTER TABLE llx_cronjob
    ADD INDEX idx_cronjob_dateend (dateend);

ALTER TABLE llx_cronjob
    ADD UNIQUE INDEX uk_cronjob (label, entity);
