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

namespace Dolibarr\Lib;

use Exception;

abstract class Filters
{
    /**
     * Remove EMoji from email content
     *
     * @param string $text String to sanitize
     * @param int $allowedemoji Mode to allow emoji
     * @return  string                  Sanitized string
     */
    public static function removeEmoji($text, $allowedemoji = 1)
    {
        // $allowedemoji can be
        // 0=no emoji, 1=exclude the main known emojis (default), 2=keep only the main known (not implemented), 3=accept all
        // Note that to accept emoji in database, you must use utf8mb4, utf8mb3 is not enough.

        if ($allowedemoji == 0) {
            // For a large removal:
            $text = preg_replace('/[\x{2600}-\x{FFFF}]/u', '', $text);
            $text = preg_replace('/[\x{10000}-\x{10FFFF}]/u', '', $text);
        }

        // Delete emoji chars with a regex
        // See https://www.unicode.org/emoji/charts/full-emoji-list.html
        if ($allowedemoji == 1) {
            $arrayofcommonemoji = static::getEmojis();

            foreach ($arrayofcommonemoji as $key => $valarray) {
                $text = preg_replace('/[\x{' . $valarray[0] . '}-\x{' . $valarray[1] . '}]/u', '', $text);
            }
        }

        if ($allowedemoji == 2) {
            // TODO Not yet implemented
        }

        return $text;
    }

    /**
     * Return array of Emojis for miscellaneous use.
     *
     * @return  array<string,array<string>>         Array of Emojis in hexadecimal
     */
    private static function getEmojis()
    {
        $arrayofcommonemoji = array(
            'misc' => array('2600', '26FF'),        // Miscellaneous Symbols
            'ding' => array('2700', '27BF'),        // Dingbats
            '????' => array('9989', '9989'),        // Variation Selectors
            'vars' => array('FE00', 'FE0F'),        // Variation Selectors
            'pict' => array('1F300', '1F5FF'),      // Miscellaneous Symbols and Pictographs
            'emot' => array('1F600', '1F64F'),      // Emoticons
            'tran' => array('1F680', '1F6FF'),      // Transport and Map Symbols
            'flag' => array('1F1E0', '1F1FF'),      // Flags (note: may be 1F1E6 instead of 1F1E0)
            'supp' => array('1F900', '1F9FF'),      // Supplemental Symbols and Pictographs
        );

        return $arrayofcommonemoji;
    }

    /**
     * Return true if security check on parameters are OK, false otherwise.
     *
     * @param string|array<string,string> $var Variable name
     * @param int<0,2> $type 1=GET, 0=POST, 2=PHP_SELF
     * @param int<0,1> $stopcode 0=No stop code, 1=Stop code (default) if injection found
     * @return      boolean                     True if there is no injection.
     */
    public static function analyseVarsForSqlAndScriptsInjection(&$var, $type, $stopcode = 1)
    {
        if (!is_array($var)) {
            return (static::testSqlAndScriptInject($var, $type) <= 0);
        }

        foreach ($var as $key => $value) {  // Warning, $key may also be used for attacks
            // Exclude check for some variable keys
            if ($type === 0 && defined('NOSCANPOSTFORINJECTION') && is_array(constant('NOSCANPOSTFORINJECTION')) && in_array($key, constant('NOSCANPOSTFORINJECTION'))) {
                continue;
            }

            if (static::analyseVarsForSqlAndScriptsInjection($key, $type, $stopcode) && static::analyseVarsForSqlAndScriptsInjection($value, $type, $stopcode)) {
                //$var[$key] = $value;  // This is useless
            } else {
                http_response_code(403);

                // Get remote IP: PS: We do not use getRemoteIP(), function is not yet loaded and we need a value that can't be spoofed
                $ip = (empty($_SERVER['REMOTE_ADDR']) ? 'unknown' : $_SERVER['REMOTE_ADDR']);

                if ($stopcode) {
                    $errormessage = 'Access refused to ' . htmlentities($ip, ENT_COMPAT, 'UTF-8') . ' by SQL or Script injection protection in main.inc.php:analyseVarsForSqlAndScriptsInjection type=' . htmlentities((string)$type, ENT_COMPAT, 'UTF-8');
                    //$errormessage .= ' paramkey='.htmlentities($key, ENT_COMPAT, 'UTF-8');    // Disabled to avoid text injection

                    $errormessage2 = 'page=' . htmlentities((empty($_SERVER["REQUEST_URI"]) ? '' : $_SERVER["REQUEST_URI"]), ENT_COMPAT, 'UTF-8');
                    $errormessage2 .= ' paramtype=' . htmlentities((string)$type, ENT_COMPAT, 'UTF-8');
                    $errormessage2 .= ' paramkey=' . htmlentities($key, ENT_COMPAT, 'UTF-8');
                    $errormessage2 .= ' paramvalue=' . htmlentities($value, ENT_COMPAT, 'UTF-8');

                    print $errormessage;
                    print "<br>\n";
                    print 'Try to go back, fix data of your form and resubmit it. You can contact also your technical support.';

                    print "\n" . '<!--' . "\n";
                    print $errormessage2;
                    print "\n" . '-->';

                    // Add entry into the PHP server error log
                    if (function_exists('error_log')) {
                        error_log($errormessage . ' ' . substr($errormessage2, 2000));
                    }

                    // Note: No addition into security audit table is done because we don't want to execute code in such a case.
                    // Detection of too many such requests can be done with a fail2ban rule on 403 error code or into the PHP server error log.


                    if (class_exists('PHPUnit\Framework\TestSuite')) {
                        $message = $errormessage . ' ' . substr($errormessage2, 2000);
                        throw new Exception("Security injection exception: $message");
                    }
                    exit;
                } else {
                    return false;
                }
            }
        }
        return true;
    }

    /**
     * Security: WAF layer for SQL Injection and XSS Injection (scripts) protection (Filters on GET, POST, PHP_SELF).
     * Warning: Such a protection can't be enough. It is not reliable as it will always be possible to bypass this. Good protection can
     * only be guaranteed by escaping data during output.
     *
     * @param string $val Brute value found into $_GET, $_POST or PHP_SELF
     * @param string $type 0=POST, 1=GET, 2=PHP_SELF, 3=GET without sql reserved keywords (the less tolerant test)
     * @return      int                     >0 if there is an injection, 0 if none
     */
    public static function testSqlAndScriptInject($val, $type)
    {
        // Decode string first because a lot of things are obfuscated by encoding or multiple encoding.
        // So <svg o&#110;load='console.log(&quot;123&quot;)' become <svg onload='console.log(&quot;123&quot;)'
        // So "&colon;&apos;" become ":'" (due to ENT_HTML5)
        // So "&Tab;&NewLine;" become ""
        // So "&lpar;&rpar;" become "()"

        // Loop to decode until no more things to decode.
        //print "before decoding $val\n";
        do {
            $oldval = $val;
            $val = html_entity_decode($val, ENT_QUOTES | ENT_HTML5);    // Decode '&colon;', '&apos;', '&Tab;', '&NewLine', ...
            // Sometimes we have entities without the ; at end so html_entity_decode does not work but entities is still interpreted by browser.
            $val = preg_replace_callback(
                '/&#(x?[0-9][0-9a-f]+;?)/i',
                /**
                 * @param string[] $m
                 * @return string
                 */
                static function ($m) {
                    // Decode '&#110;', ...
                    return Filters::realCharForNumericEntities($m);
                },
                $val
            );

            // We clean html comments because some hacks try to obfuscate evil strings by inserting HTML comments. Example: on<!-- -->error=alert(1)
            $val = preg_replace('/<!--[^>]*-->/', '', $val);
            $val = preg_replace('/[\r\n\t]/', '', $val);
        } while ($oldval != $val);
        //print "type = ".$type." after decoding: ".$val."\n";

        $inj = 0;

        // We check string because some hacks try to obfuscate evil strings by inserting non printable chars. Example: 'java(ascci09)scr(ascii00)ipt' is processed like 'javascript' (whatever is place of evil ascii char)
        // We should use dol_string_nounprintableascii but function is not yet loaded/available
        // Example of valid UTF8 chars:
        // utf8=utf8mb3:    '\x09', '\x0A', '\x0D', '\x7E'
        // utf8=utf8mb3:    '\xE0\xA0\x80'
        // utf8mb4:         '\xF0\x9D\x84\x9E'   (but this may be refused by the database insert if pagecode is utf8=utf8mb3)
        $newval = preg_replace('/[\x00-\x08\x0B-\x0C\x0E-\x1F\x7F]/u', '', $val); // /u operator makes UTF8 valid characters being ignored so are not included into the replace

        // Note that $newval may also be completely empty '' when non valid UTF8 are found.
        if ($newval != $val) {
            // If $val has changed after removing non valid UTF8 chars, it means we have an evil string.
            $inj += 1;
        }
        //print 'inj='.$inj.'-type='.$type.'-val='.$val.'-newval='.$newval."\n";

        // For SQL Injection (only GET are used to scan for such injection strings)
        if ($type == 1 || $type == 3) {
            // Note the \s+ is replaced into \s* because some spaces may have been modified in previous loop
            $inj += preg_match('/delete\s*from/i', $val);
            $inj += preg_match('/create\s*table/i', $val);
            $inj += preg_match('/insert\s*into/i', $val);
            $inj += preg_match('/select\s*from/i', $val);
            $inj += preg_match('/into\s*(outfile|dumpfile)/i', $val);
            $inj += preg_match('/user\s*\(/i', $val); // avoid to use function user() or mysql_user() that return current database login
            $inj += preg_match('/information_schema/i', $val); // avoid to use request that read information_schema database
            $inj += preg_match('/<svg/i', $val); // <svg can be allowed in POST
            $inj += preg_match('/update[^&=\w].*set.+=/i', $val);   // the [^&=\w] test is to avoid error when request is like action=update&...set... or &updatemodule=...set...
            $inj += preg_match('/union.+select/i', $val);
        }
        if ($type == 3) {
            // Note the \s+ is replaced into \s* because some spaces may have been modified in previous loop
            $inj += preg_match('/select|update|delete|truncate|replace|group\s*by|concat|count|from|union/i', $val);
        }
        if ($type != 2) {   // Not common key strings, so we can check them both on GET and POST
            $inj += preg_match('/updatexml\(/i', $val);
            $inj += preg_match('/(\.\.%2f)+/i', $val);
            $inj += preg_match('/\s@@/', $val);
        }
        // For XSS Injection done by closing textarea to execute content into a textarea field
        $inj += preg_match('/<\/textarea/i', $val);
        // For XSS Injection done by adding javascript with script
        // This is all cases a browser consider text is javascript:
        // When it found '<script', 'javascript:', '<style', 'onload\s=' on body tag, '="&' on a tag size with old browsers
        // All examples on page: http://ha.ckers.org/xss.html#XSScalc
        // More on https://www.owasp.org/index.php/XSS_Filter_Evasion_Cheat_Sheet
        $inj += preg_match('/<audio/i', $val);
        $inj += preg_match('/<embed/i', $val);
        $inj += preg_match('/<iframe/i', $val);
        $inj += preg_match('/<object/i', $val);
        $inj += preg_match('/<script/i', $val);
        $inj += preg_match('/Set\.constructor/i', $val); // ECMA script 6
        if (!defined('NOSTYLECHECK')) {
            $inj += preg_match('/<style/i', $val);
        }
        $inj += preg_match('/base\s+href/si', $val);
        $inj += preg_match('/=data:/si', $val);
        // List of dom events is on https://www.w3schools.com/jsref/dom_obj_event.asp and https://developer.mozilla.org/en-US/docs/Web/Events
        $inj += preg_match('/on(mouse|drag|key|load|touch|pointer|select|transition)[a-z]*\s*=/i', $val); // onmousexxx can be set on img or any html tag like <img title='...' onmouseover=alert(1)>
        $inj += preg_match('/on(abort|after|animation|auxclick|before|blur|cancel|canplay|canplaythrough|change|click|close|contextmenu|cuechange|copy|cut)[a-z]*\s*=/i', $val);
        $inj += preg_match('/on(dblclick|drop|durationchange|emptied|end|ended|error|focus|focusin|focusout|formdata|gotpointercapture|hashchange|input|invalid)[a-z]*\s*=/i', $val);
        $inj += preg_match('/on(lostpointercapture|offline|online|pagehide|pageshow)[a-z]*\s*=/i', $val);
        $inj += preg_match('/on(paste|pause|play|playing|progress|ratechange|reset|resize|scroll|search|seeked|seeking|show|stalled|start|submit|suspend)[a-z]*\s*=/i', $val);
        $inj += preg_match('/on(timeupdate|toggle|unload|volumechange|waiting|wheel)[a-z]*\s*=/i', $val);
        // More not into the previous list

        $inj += preg_match('/on(repeat|begin|finish|beforeinput)[a-z]*\s*=/i', $val);

        // We refuse html into html because some hacks try to obfuscate evil strings by inserting HTML into HTML. Example: <img on<a>error=alert(1) to bypass test on onerror
        $tmpval = preg_replace('/<[^<]+>/', '', $val);
        // List of dom events is on https://www.w3schools.com/jsref/dom_obj_event.asp and https://developer.mozilla.org/en-US/docs/Web/Events
        $inj += preg_match('/on(mouse|drag|key|load|touch|pointer|select|transition)[a-z]*\s*=/i', $tmpval); // onmousexxx can be set on img or any html tag like <img title='...' onmouseover=alert(1)>
        $inj += preg_match('/on(abort|after|animation|auxclick|before|blur|cancel|canplay|canplaythrough|change|click|close|contextmenu|cuechange|copy|cut)[a-z]*\s*=/i', $tmpval);
        $inj += preg_match('/on(dblclick|drop|durationchange|emptied|end|ended|error|focus|focusin|focusout|formdata|gotpointercapture|hashchange|input|invalid)[a-z]*\s*=/i', $tmpval);
        $inj += preg_match('/on(lostpointercapture|offline|online|pagehide|pageshow)[a-z]*\s*=/i', $tmpval);
        $inj += preg_match('/on(paste|pause|play|playing|progress|ratechange|reset|resize|scroll|search|seeked|seeking|show|stalled|start|submit|suspend)[a-z]*\s*=/i', $tmpval);
        $inj += preg_match('/on(timeupdate|toggle|unload|volumechange|waiting|wheel)[a-z]*\s*=/i', $tmpval);
        // More not into the previous list
        $inj += preg_match('/on(repeat|begin|finish|beforeinput)[a-z]*\s*=/i', $tmpval);

        //$inj += preg_match('/on[A-Z][a-z]+\*=/', $val);   // To lock event handlers onAbort(), ...
        $inj += preg_match('/&#58;|&#0000058|&#x3A/i', $val); // refused string ':' encoded (no reason to have it encoded) to lock 'javascript:...'
        $inj += preg_match('/j\s*a\s*v\s*a\s*s\s*c\s*r\s*i\s*p\s*t\s*:/i', $val);
        $inj += preg_match('/vbscript\s*:/i', $val);
        // For XSS Injection done by adding javascript closing html tags like with onmousemove, etc... (closing a src or href tag with not cleaned param)
        if ($type == 1 || $type == 3) {
            $val = str_replace('enclosure="', 'enclosure=X', $val); // We accept enclosure=" for the export/import module
            $inj += preg_match('/"/i', $val); // We refused " in GET parameters value.
        }
        if ($type == 2) {
            $inj += preg_match('/[:;"\'<>\?\(\){}\$%]/', $val); // PHP_SELF is a file system (or url path without parameters). It can contains spaces.
        }

        return $inj;
    }

    /**
     * Return the real char for a numeric entities.
     * WARNING: This function is required by testSqlAndScriptInject() and the GETPOST 'restricthtml'. Regex calling must be similar.
     *
     * @param array<int,string> $matches Array with a decimal numeric entity into key 0, value without the &# into the key 1
     * @return  string                                  New value
     */
    public static function realCharForNumericEntities($matches)
    {
        $newstringnumentity = preg_replace('/;$/', '', $matches[1]);
        //print  ' $newstringnumentity='.$newstringnumentity;

        if (preg_match('/^x/i', $newstringnumentity)) {     // if numeric is hexadecimal
            $newstringnumentity = hexdec(preg_replace('/^x/i', '', $newstringnumentity));
        } else {
            $newstringnumentity = (int)$newstringnumentity;
        }

        // The numeric values we don't want as entities because they encode ascii char, and why using html entities on ascii except for haking ?
        if (($newstringnumentity >= 65 && $newstringnumentity <= 90) || ($newstringnumentity >= 97 && $newstringnumentity <= 122)) {
            return chr((int)$newstringnumentity);
        }

        // The numeric values we want in UTF8 instead of entities because it is emoji
        $arrayofemojis = static::getEmojis();
        foreach ($arrayofemojis as $valarray) {
            if ($newstringnumentity >= hexdec($valarray[0]) && $newstringnumentity <= hexdec($valarray[1])) {
                // This is a known emoji
                return html_entity_decode($matches[0], ENT_COMPAT | ENT_HTML5, 'UTF-8');
            }
        }

        return '&#' . $matches[1]; // Value will be unchanged because regex was /&#(  )/
    }
}