-- Copyright (C) 2021 Gauthier VERDOL <gauthier.verdol@atm-consulting.fr>
-- Copyright (C) 2021 Greg Rastklan <greg.rastklan@atm-consulting.fr>
-- Copyright (C) 2021 Jean-Pascal BOUDET <jean-pascal.boudet@atm-consulting.fr>
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see https://www.gnu.org/licenses/.


-- BEGIN MODULEBUILDER INDEXES
ALTER TABLE llx_hrm_job_user
    ADD INDEX idx_hrm_job_user_rowid (rowid);
-- ALTER TABLE llx_hrm_job_user ADD INDEX idx_hrm_job_user_ref (ref);
-- END MODULEBUILDER INDEXES

--ALTER TABLE llx_hrm_job_user ADD UNIQUE INDEX uk_hrm_job_user_fieldxy(fieldx, fieldy);

--ALTER TABLE llx_hrm_job_user ADD CONSTRAINT llx_hrm_job_user_fk_field FOREIGN KEY (fk_field) REFERENCES llx_hrm_myotherobject(rowid);

