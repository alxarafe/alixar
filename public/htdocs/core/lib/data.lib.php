<?php

/* Copyright (C) 2000-2007  Rodolphe Quiedeville        <rodolphe@quiedeville.org>
 * Copyright (C) 2003		Jean-Louis Bergamo			<jlb@j1b.org>
 * Copyright (C) 2004-2022	Laurent Destailleur			<eldy@users.sourceforge.net>
 * Copyright (C) 2004		Sebastien Di Cintio			<sdicintio@ressource-toi.org>
 * Copyright (C) 2004		Benoit Mortier				<benoit.mortier@opensides.be>
 * Copyright (C) 2004		Christophe Combelles		<ccomb@free.fr>
 * Copyright (C) 2005-2019	Regis Houssin				<regis.houssin@inodbox.com>
 * Copyright (C) 2008		Raphael Bertrand (Resultic)	<raphael.bertrand@resultic.fr>
 * Copyright (C) 2010-2018	Juanjo Menent				<jmenent@2byte.es>
 * Copyright (C) 2013		Cédric Salvador				<csalvador@gpcsolutions.fr>
 * Copyright (C) 2013-2021	Alexandre Spangaro			<aspangaro@open-dsi.fr>
 * Copyright (C) 2014		Cédric GROSS				<c.gross@kreiz-it.fr>
 * Copyright (C) 2014-2015	Marcos García				<marcosgdf@gmail.com>
 * Copyright (C) 2015		Jean-François Ferry			<jfefe@aternatik.fr>
 * Copyright (C) 2018-2024  Frédéric France             <frederic.france@free.fr>
 * Copyright (C) 2019-2023  Thibault Foucart            <support@ptibogxiv.net>
 * Copyright (C) 2020       Open-Dsi         			<support@open-dsi.fr>
 * Copyright (C) 2021       Gauthier VERDOL         	<gauthier.verdol@atm-consulting.fr>
 * Copyright (C) 2022       Anthony Berton	         	<anthony.berton@bb2a.fr>
 * Copyright (C) 2022       Ferran Marcet           	<fmarcet@2byte.es>
 * Copyright (C) 2022       Charlene Benke           	<charlene@patas-monkey.com>
 * Copyright (C) 2023       Joachim Kueter              <git-jk@bloxera.com>
 * Copyright (C) 2024		MDW							<mdeweerd@users.noreply.github.com>
 * Copyright (C) 2024		Lenin Rivas					<lenin.rivas777@gmail.com>
 * Copyright (C) 2024       Rafael San José             <rsanjose@alxarafe.com>
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
 * or see https://www.gnu.org/
 */

/**
 * TODO: Convert to abstract class with static methods
 */

/**
 * getActionCommEcmList
 *
 * @param ActionComm $object Object ActionComm
 * @return  array<int,stdClass>             Array of documents in index table
 */
function getActionCommEcmList($object)
{
    global $conf, $db;

    $documents = array();

    $sql = 'SELECT ecm.rowid as id, ecm.src_object_type, ecm.src_object_id, ecm.filepath, ecm.filename';
    $sql .= ' FROM ' . MAIN_DB_PREFIX . 'ecm_files ecm';
    $sql .= " WHERE ecm.filepath = 'agenda/" . ((int)$object->id) . "'";
    //$sql.= " ecm.src_object_type = '".$db->escape($object->element)."' AND ecm.src_object_id = ".((int) $object->id); // Old version didn't add object_type during upload
    $sql .= ' ORDER BY ecm.position ASC';

    $resql = $db->query($sql);
    if ($resql) {
        if ($db->num_rows($resql)) {
            while ($obj = $db->fetch_object($resql)) {
                $documents[$obj->id] = $obj;
            }
        }
    }

    return $documents;
}

/**
 * Helper function that combines values of a dolibarr DatePicker (such as Form::selectDate) for year, month, day (and
 * optionally hour, minute, second) fields to return a timestamp.
 *
 * @param string $prefix Prefix used to build the date selector (for instance using Form::selectDate)
 * @param string $hourTime 'getpost' to include hour, minute, second values from the HTTP request, 'XX:YY:ZZ' to set
 *                          hour, minute, second respectively (for instance '23:59:59')
 * @param string $gm Passed to dol_mktime
 * @return int|string  Date as a timestamp, '' or false if error
 */
function GETPOSTDATE($prefix, $hourTime = '', $gm = 'auto')
{
    $m = array();
    if ($hourTime === 'getpost') {
        $hour = GETPOSTINT($prefix . 'hour');
        $minute = GETPOSTINT($prefix . 'minute');
        $second = GETPOSTINT($prefix . 'second');
    } elseif (preg_match('/^(\d\d):(\d\d):(\d\d)$/', $hourTime, $m)) {
        $hour = intval($m[1]);
        $minute = intval($m[2]);
        $second = intval($m[3]);
    } else {
        $hour = $minute = $second = 0;
    }
    // normalize out of range values
    $hour = min($hour, 23);
    $minute = min($minute, 59);
    $second = min($second, 59);
    return dol_mktime($hour, $minute, $second, GETPOSTINT($prefix . 'month'), GETPOSTINT($prefix . 'day'), GETPOSTINT($prefix . 'year'), $gm);
}

/**
 * Helper function that combines values of a dolibarr DatePicker (such as Form::selectDate) for year, month, day (and
 * optionally hour, minute, second) fields to return a a portion of URL reproducing the values from the current HTTP
 * request.
 *
 * @param string $prefix Prefix used to build the date selector (for instance using Form::selectDate)
 * @param   ?int $timestamp If null, the timestamp will be created from request data
 * @param string $hourTime If timestamp is null, will be passed to GETPOSTDATE to construct the timestamp
 * @param string $gm If timestamp is null, will be passed to GETPOSTDATE to construct the timestamp
 * @return  string              Portion of URL with query parameters for the specified date
 */
function buildParamDate($prefix, $timestamp = null, $hourTime = '', $gm = 'auto')
{
    if ($timestamp === null) {
        $timestamp = GETPOSTDATE($prefix, $hourTime, $gm);
    }
    $TParam = array(
        $prefix . 'day' => intval(dol_print_date($timestamp, '%d')),
        $prefix . 'month' => intval(dol_print_date($timestamp, '%m')),
        $prefix . 'year' => intval(dol_print_date($timestamp, '%Y')),
    );
    if ($hourTime === 'getpost' || ($timestamp !== null && dol_print_date($timestamp, '%H:%M:%S') !== '00:00:00')) {
        $TParam = array_merge($TParam, array(
            $prefix . 'hour' => intval(dol_print_date($timestamp, '%H')),
            $prefix . 'minute' => intval(dol_print_date($timestamp, '%M')),
            $prefix . 'second' => intval(dol_print_date($timestamp, '%S'))
        ));
    }

    return '&' . http_build_query($TParam);
}

/**
 * Function to forge a SQL criteria from a Dolibarr filter syntax string.
 * This method is called by forgeSQLFromUniversalSearchCriteria()
 *
 * @param string[] $matches Array of found string by regex search.
 *                                  Example: "t.ref:like:'SO-%'" or "t.date_creation:<:'20160101'" or "t.date_creation:<:'2016-01-01 12:30:00'" or "t.nature:is:NULL"
 * @return string                   Forged criteria. Example: "t.field LIKE 'abc%'"
 */
function dolForgeCriteriaCallback($matches)
{
    global $db;

    //dol_syslog("Convert matches ".$matches[1]);
    if (empty($matches[1])) {
        return '';
    }
    $tmp = explode(':', $matches[1]);
    if (count($tmp) < 3) {
        return '';
    }

    $operand = preg_replace('/[^a-z0-9\._]/i', '', trim($tmp[0]));

    $operator = strtoupper(preg_replace('/[^a-z<>!=]/i', '', trim($tmp[1])));

    $realOperator = [
        'NOTLIKE' => 'NOT LIKE',
        'ISNOT' => 'IS NOT',
        'NOTIN' => 'NOT IN',
        '!=' => '<>',
    ];

    if (array_key_exists($operator, $realOperator)) {
        $operator = $realOperator[$operator];
    }

    $tmpescaped = $tmp[2];

    //print "Case: ".$operator." ".$operand." ".$tmpescaped."\n";

    $regbis = array();

    if ($operator == 'IN' || $operator == 'NOT IN') {   // IN is allowed for list of ID or code only
        //if (!preg_match('/^\(.*\)$/', $tmpescaped)) {
        $tmpescaped2 = '(';
        // Explode and sanitize each element in list
        $tmpelemarray = explode(',', $tmpescaped);
        foreach ($tmpelemarray as $tmpkey => $tmpelem) {
            $reg = array();
            if (preg_match('/^\'(.*)\'$/', $tmpelem, $reg)) {
                $tmpelemarray[$tmpkey] = "'" . $db->escape($db->sanitize($reg[1], 1, 1, 1)) . "'";
            } else {
                $tmpelemarray[$tmpkey] = $db->escape($db->sanitize($tmpelem, 1, 1, 1));
            }
        }
        $tmpescaped2 .= implode(',', $tmpelemarray);
        $tmpescaped2 .= ')';

        $tmpescaped = $tmpescaped2;
    } elseif ($operator == 'LIKE' || $operator == 'NOT LIKE') {
        if (preg_match('/^\'([^\']*)\'$/', $tmpescaped, $regbis)) {
            $tmpescaped = $regbis[1];
        }
        //$tmpescaped = "'".$db->escape($db->escapeforlike($regbis[1]))."'";
        $tmpescaped = "'" . $db->escape($tmpescaped) . "'"; // We do not escape the _ and % so the LIKE will work as expected
    } elseif (preg_match('/^\'(.*)\'$/', $tmpescaped, $regbis)) {
        // TODO Retrieve type of field for $operand field name.
        // So we can complete format. For example we could complete a year with month and day.
        $tmpescaped = "'" . $db->escape($regbis[1]) . "'";
    } else {
        if (strtoupper($tmpescaped) == 'NULL') {
            $tmpescaped = 'NULL';
        } elseif (is_int($tmpescaped)) {
            $tmpescaped = (int)$tmpescaped;
        } else {
            $tmpescaped = (float)$tmpescaped;
        }
    }

    return '(' . $db->escape($operand) . ' ' . strtoupper($operator) . ' ' . $tmpescaped . ')';
}


/**
 * forgeSQLFromUniversalSearchCriteria
 *
 * @param string $filter String with universal search string. Must be '(aaa:bbb:ccc) OR (ddd:eeee:fff) ...' with
 *                                  aaa is a field name (with alias or not) and
 *                                  bbb is one of this operator '=', '<', '>', '<=', '>=', '!=', 'in', 'notin', 'like', 'notlike', 'is', 'isnot'.
 *                                  ccc must not contains ( or )
 *                                  Example: '((client:=:1) OR ((client:>=:2) AND (client:<=:3))) AND (client:!=:8) AND (nom:like:'a%')'
 * @param string $errorstr Error message string
 * @param int<0,1> $noand 1=Do not add the AND before the condition string.
 * @param int<0,1> $nopar 1=Do not add the parenthesis around the final condition string.
 * @param int<0,1> $noerror 1=If search criteria is not valid, does not return an error string but invalidate the SQL
 * @return  string                  Return forged SQL string
 * @see dolSqlDateFilter()
 * @see natural_search()
 */
function forgeSQLFromUniversalSearchCriteria($filter, &$errorstr = '', $noand = 0, $nopar = 0, $noerror = 0)
{
    global $db, $user;

    if ($filter === '') {
        return '';
    }
    if (!preg_match('/^\(.*\)$/', $filter)) {    // If $filter does not start and end with ()
        $filter = '(' . $filter . ')';
    }

    $regexstring = '\(([a-zA-Z0-9_\.]+:[<>!=insotlke]+:[^\(\)]+)\)';    // Must be  (aaa:bbb:...) with aaa is a field name (with alias or not) and bbb is one of this operator '=', '<', '>', '<=', '>=', '!=', 'in', 'notin', 'like', 'notlike', 'is', 'isnot'
    $firstandlastparenthesis = 0;

    if (!dolCheckFilters($filter, $errorstr, $firstandlastparenthesis)) {
        if ($noerror) {
            return '1 = 2';
        } else {
            return 'Filter syntax error - ' . $errorstr;      // Bad balance of parenthesis, we return an error message or force a SQL not found
        }
    }

    // Test the filter syntax
    $t = preg_replace_callback('/' . $regexstring . '/i', 'dolForgeDummyCriteriaCallback', $filter);
    $t = str_replace(array('and', 'or', 'AND', 'OR', ' '), '', $t);     // Remove the only strings allowed between each () criteria
    // If the string result contains something else than '()', the syntax was wrong

    if (preg_match('/[^\(\)]/', $t)) {
        $tmperrorstr = 'Bad syntax of the search string';
        $errorstr = 'Bad syntax of the search string: ' . $filter;
        if ($noerror) {
            return '1 = 2';
        } else {
            return 'Filter error - ' . $tmperrorstr;      // Bad syntax of the search string, we return an error message or force a SQL not found
        }
    }

    $ret = ($noand ? "" : " AND ") . ($nopar ? "" : '(') . preg_replace_callback('/' . $regexstring . '/i', 'dolForgeCriteriaCallback', $filter) . ($nopar ? "" : ')');

    if (is_object($db)) {
        $ret = str_replace('__NOW__', $db->idate(dol_now()), $ret);
    }
    if (is_object($user)) {
        $ret = str_replace('__USER_ID__', (string)$user->id, $ret);
    }

    return $ret;
}

/**
 * Explode an universal search string with AND parts.
 * This is used to output the search criteria in an UFS (Universal Filter Syntax) input component.
 *
 * @param string $sqlfilters Universal SQL filter string. Must have been trimmed before.
 * @return  string[]                            Array of AND
 */
function dolForgeExplodeAnd($sqlfilters)
{
    $arrayofandtags = array();
    $nbofchars = dol_strlen($sqlfilters);

    $error = '';
    $parenthesislevel = 0;
    $result = dolCheckFilters($sqlfilters, $error, $parenthesislevel);
    if (!$result) {
        return array();
    }
    if ($parenthesislevel >= 1) {
        $sqlfilters = preg_replace('/^\(/', '', preg_replace('/\)$/', '', $sqlfilters));
    }

    $i = 0;
    $s = '';
    $countparenthesis = 0;
    while ($i < $nbofchars) {
        $char = dol_substr($sqlfilters, $i, 1);

        if ($char == '(') {
            $countparenthesis++;
        } elseif ($char == ')') {
            $countparenthesis--;
        }

        if ($countparenthesis == 0) {
            $char2 = dol_substr($sqlfilters, $i + 1, 1);
            $char3 = dol_substr($sqlfilters, $i + 2, 1);
            if ($char == 'A' && $char2 == 'N' && $char3 == 'D') {
                // We found a AND
                $s = trim($s);
                if (!preg_match('/^\(.*\)$/', $s)) {
                    $s = '(' . $s . ')';
                }
                $arrayofandtags[] = $s;
                $s = '';
                $i += 2;
            } else {
                $s .= $char;
            }
        } else {
            $s .= $char;
        }
        $i++;
    }
    if ($s) {
        $s = trim($s);
        if (!preg_match('/^\(.*\)$/', $s)) {
            $s = '(' . $s . ')';
        }
        $arrayofandtags[] = $s;
    }

    return $arrayofandtags;
}

/**
 * Return if a $sqlfilters parameter has a valid balance of parenthesis
 *
 * @param string $sqlfilters Universal SQL filter string. Must have been trimmed before.
 * @param string $error Returned error message
 * @param int $parenthesislevel Returned level of global parenthesis that we can remove/simplify, 0 if error or we can't simplify.
 * @return  boolean                             True if valid, False if not valid ($error returned parameter is filled with the reason in such a case)
 * @see forgeSQLFromUniversalSearchCriteria()
 */
function dolCheckFilters($sqlfilters, &$error = '', &$parenthesislevel = 0)
{
    //$regexstring='\(([^:\'\(\)]+:[^:\'\(\)]+:[^:\(\)]+)\)';
    //$tmp=preg_replace_all('/'.$regexstring.'/', '', $sqlfilters);
    $tmp = $sqlfilters;

    $nb = dol_strlen($tmp);
    $counter = 0;
    $parenthesislevel = 0;

    $error = '';

    $i = 0;
    while ($i < $nb) {
        $char = dol_substr($tmp, $i, 1);

        if ($char == '(') {
            if ($i == $parenthesislevel && $parenthesislevel == $counter) {
                // We open a parenthesis and it is the first char
                $parenthesislevel++;
            }
            $counter++;
        } elseif ($char == ')') {
            $nbcharremaining = ($nb - $i - 1);
            if ($nbcharremaining >= $counter) {
                $parenthesislevel = min($parenthesislevel, $counter - 1);
            }
            if ($parenthesislevel > $counter && $nbcharremaining >= $counter) {
                $parenthesislevel = $counter;
            }
            $counter--;
        }

        if ($counter < 0) {
            $error = "Wrong balance of parenthesis in sqlfilters=" . $sqlfilters;
            $parenthesislevel = 0;
            dol_syslog($error, LOG_WARNING);
            return false;
        }

        $i++;
    }

    if ($counter > 0) {
        $error = "Wrong balance of parenthesis in sqlfilters=" . $sqlfilters;
        $parenthesislevel = 0;
        dol_syslog($error, LOG_WARNING);
        return false;
    }

    return true;
}

/**
 * Function to forge a SQL criteria from a Dolibarr filter syntax string.
 * This method is called by forgeSQLFromUniversalSearchCriteria()
 *
 * @param string[] $matches Array of found string by regex search. Example: "t.ref:like:'SO-%'" or "t.date_creation:<:'20160101'" or "t.nature:is:NULL"
 * @return string                  Forged criteria. Example: "" or "()"
 */
function dolForgeDummyCriteriaCallback($matches)
{
    //dol_syslog("Convert matches ".$matches[1]);
    if (empty($matches[1])) {
        return '';
    }
    $tmp = explode(':', $matches[1]);
    if (count($tmp) < 3) {
        return '';
    }

    return '()';    // An empty criteria
}

/**
 * Decode an encode string. The string can be encoded in json format (recommended) or with serialize (avoid this)
 *
 * @param string $stringtodecode String to decode (json or serialize coded)
 * @return  mixed                       The decoded object.
 */
function jsonOrUnserialize($stringtodecode)
{
    $result = json_decode($stringtodecode);
    if ($result === null) {
        $result = unserialize($stringtodecode);
    }

    return $result;
}
