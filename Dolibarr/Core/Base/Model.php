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

namespace Dolibarr\Core\Base;

use Illuminate\Database\Eloquent\Model as EloquentModel;

/**
 * This class implements an Eloquent Model
 *
 * This class is only needed for compatibility with Dolibarr.
 *
 * @package DoliCore\Base
 */
abstract class Model extends EloquentModel
{
    /**
     * Name of the field containing the record creation date, by default 'created_at'.
     */
    public const CREATED_AT = 'date_creat';

    /**
     * Name of the field that contains the date of the last update of the record, by default 'updated_at'.
     */
    public const UPDATED_AT = 'tms';

    /**
     * Primary key name, default is 'id'.
     *
     * @var string
     */
    protected $primaryKey = 'rowid';

    /**
     * Encrypt sensitive data in database
     * Warning: This function includes the escape and add the SQL simple quotes on strings.
     *
     * @param string $fieldorvalue Field name or value to encrypt
     * @param int $withQuotes Return string including the SQL simple quotes. This param must always be 1 (Value 0 is bugged and deprecated).
     * @return  string                  XXX(field) or XXX('value') or field or 'value'
     */
    public static function encrypt($fieldorvalue, $withQuotes = 1)
    {
        global $conf;

        // Type of encryption (2: AES (recommended), 1: DES , 0: no encryption)
        $cryptType = (!empty($conf->db->dolibarr_main_db_encryption) ? $conf->db->dolibarr_main_db_encryption : 0);

        //Encryption key
        $cryptKey = (!empty($conf->db->dolibarr_main_db_cryptkey) ? $conf->db->dolibarr_main_db_cryptkey : '');

        $escapedstringwithquotes = ($withQuotes ? "'" : "") . $fieldorvalue . ($withQuotes ? "'" : "");

        if ($cryptType && !empty($cryptKey)) {
            if ($cryptType == 2) {
                $escapedstringwithquotes = "AES_ENCRYPT(" . $escapedstringwithquotes . ", '" . $cryptKey . "')";
            } elseif ($cryptType == 1) {
                $escapedstringwithquotes = "DES_ENCRYPT(" . $escapedstringwithquotes . ", '" . $cryptKey . "')";
            }
        }

        return $escapedstringwithquotes;
    }

    /**
     *  Decrypt sensitive data in database
     *
     * @param string $value Value to decrypt
     * @return string                  Decrypted value if used
     */
    public static function decrypt($value)
    {
        global $conf;

        // Type of encryption (2: AES (recommended), 1: DES , 0: no encryption)
        $cryptType = (!empty($conf->db->dolibarr_main_db_encryption) ? $conf->db->dolibarr_main_db_encryption : 0);

        //Encryption key
        $cryptKey = (!empty($conf->db->dolibarr_main_db_cryptkey) ? $conf->db->dolibarr_main_db_cryptkey : '');

        $return = $value;

        if ($cryptType && !empty($cryptKey)) {
            if ($cryptType == 2) {
                $return = 'AES_DECRYPT(' . $value . ',\'' . $cryptKey . '\')';
            } elseif ($cryptType == 1) {
                $return = 'DES_DECRYPT(' . $value . ',\'' . $cryptKey . '\')';
            }
        }

        return $return;
    }
}
