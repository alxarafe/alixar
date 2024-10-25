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

abstract class Version
{
    /**
     *  Renvoi une version en chaine depuis une version en tableau
     *
     * @param array $versionarray Tableau de version (vermajeur,vermineur,autre)
     * @return     string                          Chaine version
     * @see Version::compare()
     */
    public static function toString($versionarray)
    {
        $string = '?';
        if (isset($versionarray[0])) {
            $string = $versionarray[0];
        }
        if (isset($versionarray[1])) {
            $string .= '.' . $versionarray[1];
        }
        if (isset($versionarray[2])) {
            $string .= '.' . $versionarray[2];
        }
        return $string;
    }

    /**
     *  Compare 2 versions (stored into 2 arrays).
     *  To check if Dolibarr version is lower than (x,y,z), do "if Version::compare(Version::toArray(), array(x.y.z)) <= 0"
     *  For example: if (Version::compare(Version::toArray(),array(4,0,-5)) >= 0) is true if version is 4.0 alpha or higher.
     *  For example: if (Version::compare(Version::toArray(),array(4,0,0)) >= 0) is true if version is 4.0 final or higher.
     *  For example: if (Version::compare(Version::toArray(),array(4,0,1)) >= 0) is true if version is 4.0.1 or higher.
     *  Alternative way to compare: if ((float) DOL_VERSION >= 4.0) is true if version is 4.0 alpha or higher (works only to compare first and second level)
     *
     * @param array $versionarray1 Array of version (vermajor,verminor,patch)
     * @param array $versionarray2 Array of version (vermajor,verminor,patch)
     * @return     int                             -4,-3,-2,-1 if versionarray1<versionarray2 (value depends on level of difference)
     *                                              0 if same
     *                                              1,2,3,4 if versionarray1>versionarray2 (value depends on level of difference)
     * @see Version::toString()
     */
    public static function compare($versionarray1, $versionarray2)
    {
        $ret = 0;
        $level = 0;
        $count1 = count($versionarray1);
        $count2 = count($versionarray2);
        $maxcount = max($count1, $count2);
        while ($level < $maxcount) {
            $operande1 = isset($versionarray1[$level]) ? $versionarray1[$level] : 0;
            $operande2 = isset($versionarray2[$level]) ? $versionarray2[$level] : 0;
            if (preg_match('/alpha|dev/i', $operande1)) {
                $operande1 = -5;
            }
            if (preg_match('/alpha|dev/i', $operande2)) {
                $operande2 = -5;
            }
            if (preg_match('/beta$/i', $operande1)) {
                $operande1 = -4;
            }
            if (preg_match('/beta$/i', $operande2)) {
                $operande2 = -4;
            }
            if (preg_match('/beta([0-9])+/i', $operande1)) {
                $operande1 = -3;
            }
            if (preg_match('/beta([0-9])+/i', $operande2)) {
                $operande2 = -3;
            }
            if (preg_match('/rc$/i', $operande1)) {
                $operande1 = -2;
            }
            if (preg_match('/rc$/i', $operande2)) {
                $operande2 = -2;
            }
            if (preg_match('/rc([0-9])+/i', $operande1)) {
                $operande1 = -1;
            }
            if (preg_match('/rc([0-9])+/i', $operande2)) {
                $operande2 = -1;
            }
            $level++;
            //print 'level '.$level.' '.$operande1.'-'.$operande2.'<br>';
            if ($operande1 < $operande2) {
                $ret = -$level;
                break;
            }
            if ($operande1 > $operande2) {
                $ret = $level;
                break;
            }
        }
        //print join('.',$versionarray1).'('.count($versionarray1).') / '.join('.',$versionarray2).'('.count($versionarray2).') => '.$ret.'<br>'."\n";
        return $ret;
    }

    /**
     * Returns an array of 3 elements with the PHP_MAJOR_VERSION,
     * PHP_MINOR_VERSION and PHP_RELEASE_VERSION.
     *
     * @return string[]
     * @see Version::compare()
     */
    public static function arrayPhp()
    {
        return explode('.', PHP_VERSION);
    }

    /**
     *  Return version Dolibarr
     *
     * @return     array               Tableau de version (vermajeur,vermineur,autre)
     * @see Version::compare()
     */
    public static function toArray()
    {
        return explode('.', DOL_VERSION);
    }
}
