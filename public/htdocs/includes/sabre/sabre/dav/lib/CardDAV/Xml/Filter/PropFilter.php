<?php

declare(strict_types=1);

namespace Sabre\CardDAV\Xml\Filter;

use Sabre\CardDAV\Plugin;
use Sabre\DAV\Exception\BadRequest;
use Sabre\Xml\Reader;
use Sabre\Xml\XmlDeserializable;

/**
 * PropFilter parser.
 *
 * This class parses the {urn:ietf:params:xml:ns:carddav}prop-filter XML
 * element, as defined in:
 *
 * http://tools.ietf.org/html/rfc6352#section-10.5.1
 *
 * The result will be spit out as an array.
 *
 * @copyright Copyright (C) fruux GmbH (https://fruux.com/)
 * @author Evert Pot (http://evertpot.com/)
 * @license http://sabre.io/license/ Modified BSD License
 */
class PropFilter implements XmlDeserializable
{
    /**
     * The deserialize method is called during xml parsing.
     *
     * This method is called statically, this is because in theory this method
     * may be used as a type of constructor, or factory method.
     *
     * Often you want to return an instance of the current class, but you are
     * free to return other data as well.
     *
     * You are responsible for advancing the reader to the next element. Not
     * doing anything will result in a never-ending loop.
     *
     * If you just want to skip parsing for this element altogether, you can
     * just call $reader->next();
     *
     * $reader->parseInnerTree() will parse the entire sub-tree, and advance to
     * the next element.
     *
     * @return mixed
     */
    public static function xmlDeserialize(Reader $reader)
    {
        $result = [
            'name' => null,
            'test' => 'anyof',
            'is-not-defined' => false,
            'param-filters' => [],
            'text-matches' => [],
        ];

        $att = $reader->parseAttributes();
        $result['name'] = $att['name'];

        if (isset($att['test']) && 'allof' === $att['test']) {
            $result['test'] = 'allof';
        }

        $elems = $reader->parseInnerTree();

        if (is_array($elems)) {
            foreach ($elems as $elem) {
                switch ($elem['name']) {
                    case '{' . Plugin::NS_CARDDAV . '}param-filter':
                        $result['param-filters'][] = $elem['value'];
                        break;
                    case '{' . Plugin::NS_CARDDAV . '}is-not-defined':
                        $result['is-not-defined'] = true;
                        break;
                    case '{' . Plugin::NS_CARDDAV . '}text-match':
                        $matchType = isset($elem['attributes']['match-type']) ? $elem['attributes']['match-type'] : 'contains';

                        if (!in_array($matchType, ['contains', 'equals', 'starts-with', 'ends-with'])) {
                            throw new BadRequest('Unknown match-type: ' . $matchType);
                        }
                        $result['text-matches'][] = [
                            'negate-condition' => isset($elem['attributes']['negate-condition']) && 'yes' === $elem['attributes']['negate-condition'],
                            'collation' => isset($elem['attributes']['collation']) ? $elem['attributes']['collation'] : 'i;unicode-casemap',
                            'value' => $elem['value'],
                            'match-type' => $matchType,
                        ];
                        break;
                }
            }
        }

        return $result;
    }
}
