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
 * or see https://www.gnu.org/
 */

/**
 * lessphp v0.8.0
 * http://leafo.net/lessphp
 *
 * LESS CSS compiler, adapted from http://lesscss.org
 *
 * Copyright 2013, Leaf Corcoran <leafot@gmail.com>
 * Licensed under MIT or GPLv3, see LICENSE
 */

namespace Dolibarr\Code\Core\Classes;

// phpcs:disable
/**
 * The LESS compiler and parser.
 *
 * Converting LESS to CSS is a three stage process. The incoming file is parsed
 * by `lessc_parser` into a syntax tree, then it is compiled into another tree
 * representing the CSS structure by `lessc`. The CSS tree is fed into a
 * formatter, like `lessc_formatter` which then outputs CSS as a string.
 *
 * During the first compile, all values are *reduced*, which means that their
 * types are brought to the lowest form before being dump as strings. This
 * handles math equations, variable dereferences, and the like.
 *
 * The `parse` function of `lessc` is the entry point.
 *
 * In summary:
 *
 * The `lessc` class creates an instance of the parser, feeds it LESS code,
 * then transforms the resulting tree to a CSS tree. This class also holds the
 * evaluation context, such as all available mixins and variables at any given
 * time.
 *
 * The `lessc_parser` class is only concerned with parsing its input.
 *
 * The `lessc_formatter` takes a CSS tree, and dumps it to a formatted string,
 * handling things like indentation.
 */

// responsible for taking a string of LESS code and converting it into a
// syntax tree
class lessc_parser
{
	protected static $nextBlockId = 0; // used to uniquely identify blocks

	protected static $precedence = array(
		'=<' => 0,
		'>=' => 0,
		'=' => 0,
		'<' => 0,
		'>' => 0,

		'+' => 1,
		'-' => 1,
		'*' => 2,
		'/' => 2,
		'%' => 2,
	);

	protected static $whitePattern;
	protected static $commentMulti;

	protected static $commentSingle = "//";
	protected static $commentMultiLeft = "/*";
	protected static $commentMultiRight = "*/";

	// regex string to match any of the operators
	protected static $operatorString;

	// these properties will supress division unless it's inside parenthases
	protected static $supressDivisionProps =
		array('/border-radius$/i', '/^font$/i');

	protected $blockDirectives = array("font-face", "keyframes", "page", "-moz-document", "viewport", "-moz-viewport", "-o-viewport", "-ms-viewport");
	protected $lineDirectives = array("charset");

	/**
	 * if we are in parens we can be more liberal with whitespace around
	 * operators because it must evaluate to a single value and thus is less
	 * ambiguous.
	 *
	 * Consider:
	 *     property1: 10 -5; // is two numbers, 10 and -5
	 *     property2: (10 -5); // should evaluate to 5
	 */
	protected $inParens = false;

	// caches preg escaped literals
	protected static $literalCache = array();

	public $env;
	public $buffer;
	public $count;
	public $line;
	public $eatWhiteDefault;
	public $lessc;
	public $sourceName;
	public $writeComments;
	public $seenComments;
	public $currentProperty;
	public $inExp;


	public function __construct($lessc, $sourceName = null)
	{
		$this->eatWhiteDefault = true;
		// reference to less needed for vPrefix, mPrefix, and parentSelector
		$this->lessc = $lessc;

		$this->sourceName = $sourceName; // name used for error messages

		$this->writeComments = false;

		if (!self::$operatorString) {
			self::$operatorString =
				'('.implode('|', array_map(
					array('lessc', 'preg_quote'),
					array_keys(self::$precedence)
				)).')';

			$commentSingle = Lessc::preg_quote(self::$commentSingle);
			$commentMultiLeft = Lessc::preg_quote(self::$commentMultiLeft);
			$commentMultiRight = Lessc::preg_quote(self::$commentMultiRight);

			self::$commentMulti = $commentMultiLeft.'.*?'.$commentMultiRight;
			self::$whitePattern = '/'.$commentSingle.'[^\n]*\s*|('.self::$commentMulti.')\s*|\s+/Ais';
		}
	}

	/**
	 * Parse a string
	 *
	 * @param       string  $buffer         String to parse
	 * @throws exception
	 * @return NULL|stdclass
	 */
	public function parse($buffer)
	{
		$this->count = 0;
		$this->line = 1;

		$this->env = null; // block stack
		$this->buffer = $this->writeComments ? $buffer : $this->removeComments($buffer);
		$this->pushSpecialBlock("root");
		$this->eatWhiteDefault = true;
		$this->seenComments = array();

		// trim whitespace on head
		// if (preg_match('/^\s+/', $this->buffer, $m)) {
		//  $this->line += substr_count($m[0], "\n");
		//  $this->buffer = ltrim($this->buffer);
		// }
		$this->whitespace();

		// parse the entire file
		while (false !== $this->parseChunk());

		if ($this->count != strlen($this->buffer)) {
			$this->throwError('parse error count '.$this->count.' != len buffer '.strlen($this->buffer));

		}

		// TODO report where the block was opened
		if (!property_exists($this->env, 'parent') || !is_null($this->env->parent)) {
			throw new exception('parse error: unclosed block');
		}

		return $this->env;
	}

	/**
	 * Parse a single chunk off the head of the buffer and append it to the
	 * current parse environment.
	 * Returns false when the buffer is empty, or when there is an error.
	 *
	 * This function is called repeatedly until the entire document is
	 * parsed.
	 *
	 * This parser is most similar to a recursive descent parser. Single
	 * functions represent discrete grammatical rules for the language, and
	 * they are able to capture the text that represents those rules.
	 *
	 * Consider the function Lessc::keyword(). (all parse functions are
	 * structured the same)
	 *
	 * The function takes a single reference argument. When calling the
	 * function it will attempt to match a keyword on the head of the buffer.
	 * If it is successful, it will place the keyword in the referenced
	 * argument, advance the position in the buffer, and return true. If it
	 * fails then it won't advance the buffer and it will return false.
	 *
	 * All of these parse functions are powered by Lessc::match(), which behaves
	 * the same way, but takes a literal regular expression. Sometimes it is
	 * more convenient to use match instead of creating a new function.
	 *
	 * Because of the format of the functions, to parse an entire string of
	 * grammatical rules, you can chain them together using &&.
	 *
	 * But, if some of the rules in the chain succeed before one fails, then
	 * the buffer position will be left at an invalid state. In order to
	 * avoid this, Lessc::seek() is used to remember and set buffer positions.
	 *
	 * Before parsing a chain, use $s = $this->seek() to remember the current
	 * position into $s. Then if a chain fails, use $this->seek($s) to
	 * go back where we started.
	 */
	protected function parseChunk()
	{
		if (empty($this->buffer)) {
			return false;
		}
		$s = $this->seek();

		if ($this->whitespace()) {
			return true;
		}

		$key = null;
		$value = null;
		$mediaQueries = null;
		$dirName = null;
		$dirValue = null;
		$importValue = null;
		$guards = null;
		$tag = null;
		$args = null;
		$isVararg = null;
		$argv = null;
		$suffix = null;
		$var = null;
		$tags = null;

		// setting a property
		if ($this->keyword($key) && $this->assign() &&
			$this->propertyValue($value, $key) && $this->end()
		) {
			$this->append(array('assign', $key, $value), $s);
			return true;
		} else {
			$this->seek($s);
		}


		// look for special css blocks
		if ($this->literal('@', false)) {
			$this->count--;

			// media
			if ($this->literal('@media')) {
				if ($this->mediaQueryList($mediaQueries)
					&& $this->literal('{')
				) {
					$media = $this->pushSpecialBlock("media");
					$media->queries = is_null($mediaQueries) ? array() : $mediaQueries;
					return true;
				} else {
					$this->seek($s);
					return false;
				}
			}

			if ($this->literal("@", false) && $this->keyword($dirName)) {
				if ($this->isDirective($dirName, $this->blockDirectives)) {
					if ($this->openString("{", $dirValue, null, array(";")) &&
						$this->literal("{")
					) {
						$dir = $this->pushSpecialBlock("directive");
						$dir->name = $dirName;
						if (isset($dirValue)) {
							$dir->value = $dirValue;
						}
						return true;
					}
				} elseif ($this->isDirective($dirName, $this->lineDirectives)) {
					if ($this->propertyValue($dirValue) && $this->end()) {
						$this->append(array("directive", $dirName, $dirValue));
						return true;
					}
				}
			}

			$this->seek($s);
		}

		// setting a variable
		if ($this->variable($var) && $this->assign() &&
			$this->propertyValue($value) && $this->end()
		) {
			$this->append(array('assign', $var, $value), $s);
			return true;
		} else {
			$this->seek($s);
		}

		if ($this->import($importValue)) {
			$this->append($importValue, $s);
			return true;
		}

		// opening parametric mixin
		if ($this->tag($tag, true) && $this->argumentDef($args, $isVararg) &&
			$this->guards($guards) &&
			$this->literal('{')
		) {
			$block = $this->pushBlock($this->fixTags(array($tag)));
			$block->args = $args;
			$block->isVararg = $isVararg;
			if (!empty($guards)) {
				$block->guards = $guards;
			}
			return true;
		} else {
			$this->seek($s);
		}

		// opening a simple block
		if ($this->tags($tags) && $this->literal('{', false)) {
			$tags = $this->fixTags($tags);
			$this->pushBlock($tags);
			return true;
		} else {
			$this->seek($s);
		}

		// closing a block
		if ($this->literal('}', false)) {
			try {
				$block = $this->pop();
			} catch (exception $e) {
				$this->seek($s);
				$this->throwError($e->getMessage());
			}

			$hidden = false;
			if (is_null($block->type)) {
				$hidden = true;
				if (!isset($block->args)) {
					foreach ($block->tags as $tag) {
						if (!is_string($tag) || $tag[0] != $this->lessc->mPrefix) {
							$hidden = false;
							break;
						}
					}
				}

				foreach ($block->tags as $tag) {
					if (is_string($tag)) {
						$this->env->children[$tag][] = $block;
					}
				}
			}

			if (!$hidden) {
				$this->append(array('block', $block), $s);
			}

			// this is done here so comments aren't bundled into he block that
			// was just closed
			$this->whitespace();
			return true;
		}

		// mixin
		if ($this->mixinTags($tags) &&
			$this->argumentDef($argv, $isVararg) &&
			$this->keyword($suffix)  && $this->end()
		) {
			$tags = $this->fixTags($tags);
			$this->append(array('mixin', $tags, $argv, $suffix), $s);
			return true;
		} else {
			$this->seek($s);
		}

		// spare ;
		if ($this->literal(';')) {
			return true;
		}

		return false; // got nothing, throw error
	}

	protected function isDirective($dirname, $directives)
	{
		// TODO: cache pattern in parser
		$pattern = implode(
			"|",
			array_map(array("lessc", "preg_quote"), $directives)
		);
		$pattern = '/^(-[a-z-]+-)?('.$pattern.')$/i';

		return preg_match($pattern, $dirname);
	}

	protected function fixTags($tags)
	{
		// move @ tags out of variable namespace
		foreach ($tags as &$tag) {
			if ($tag[0] == $this->lessc->vPrefix) {
				$tag[0] = $this->lessc->mPrefix;
			}
		}
		return $tags;
	}

	// a list of expressions
	protected function expressionList(&$exps)
	{
		$exp = null;

		$values = array();

		while ($this->expression($exp)) {
			$values[] = $exp;
		}

		if (count($values) == 0) {
			return false;
		}

		$exps = Lessc::compressList($values, ' ');
		return true;
	}

	/**
	 * Attempt to consume an expression.
	 * @link http://en.wikipedia.org/wiki/Operator-precedence_parser#Pseudo-code
	 */
	protected function expression(&$out)
	{
		$lhs = null;
		$rhs = null;

		if ($this->value($lhs)) {
			$out = $this->expHelper($lhs, 0);

			// look for / shorthand
			if (!empty($this->env->supressedDivision)) {
				unset($this->env->supressedDivision);
				$s = $this->seek();
				if ($this->literal("/") && $this->value($rhs)) {
					$out = array("list", "",
						array($out, array("keyword", "/"), $rhs));
				} else {
					$this->seek($s);
				}
			}

			return true;
		}
		return false;
	}

	/**
	 * recursively parse infix equation with $lhs at precedence $minP
	 */
	protected function expHelper($lhs, $minP)
	{
		$next = null;
		$rhs = null;

		$this->inExp = true;
		$ss = $this->seek();

		while (true) {
			$whiteBefore = isset($this->buffer[$this->count - 1]) &&
				ctype_space($this->buffer[$this->count - 1]);

			// If there is whitespace before the operator, then we require
			// whitespace after the operator for it to be an expression
			$needWhite = $whiteBefore && !$this->inParens;

			$m = array();
			if ($this->match(self::$operatorString.($needWhite ? '\s' : ''), $m) && self::$precedence[$m[1]] >= $minP) {
				if (!$this->inParens && isset($this->env->currentProperty) && $m[1] == "/" && empty($this->env->supressedDivision)) {
					foreach (self::$supressDivisionProps as $pattern) {
						if (preg_match($pattern, $this->env->currentProperty)) {
							$this->env->supressedDivision = true;
							break 2;
						}
					}
				}


				$whiteAfter = isset($this->buffer[$this->count - 1]) &&
					ctype_space($this->buffer[$this->count - 1]);

				if (!$this->value($rhs)) {
					break;
				}

				// peek for next operator to see what to do with rhs
				if ($this->peek(self::$operatorString, $next) && self::$precedence[$next[1]] > self::$precedence[$m[1]]) {
					$rhs = $this->expHelper($rhs, self::$precedence[$next[1]]);
				}

				$lhs = array('expression', $m[1], $lhs, $rhs, $whiteBefore, $whiteAfter);
				$ss = $this->seek();

				continue;
			}

			break;
		}

		$this->seek($ss);

		return $lhs;
	}

	// consume a list of values for a property
	public function propertyValue(&$value, $keyName = null)
	{
		$v = null;
		$values = array();

		if ($keyName !== null) {
			$this->env->currentProperty = $keyName;
		}

		$s = null;
		while ($this->expressionList($v)) {
			$values[] = $v;
			$s = $this->seek();
			if (!$this->literal(',')) {
				break;
			}
		}

		if ($s) {
			$this->seek($s);
		}

		if ($keyName !== null) {
			unset($this->env->currentProperty);
		}

		if (count($values) == 0) {
			return false;
		}

		$value = Lessc::compressList($values, ', ');
		return true;
	}

	protected function parenValue(&$out)
	{
		$exp = null;

		$s = $this->seek();

		// speed shortcut
		if (isset($this->buffer[$this->count]) && $this->buffer[$this->count] != "(") {
			return false;
		}

		$inParens = $this->inParens;
		if ($this->literal("(") &&
			($this->inParens = true) && $this->expression($exp) &&
			$this->literal(")")
		) {
			$out = $exp;
			$this->inParens = $inParens;
			return true;
		} else {
			$this->inParens = $inParens;
			$this->seek($s);
		}

		return false;
	}

	// a single value
	protected function value(&$value)
	{
		$inner = null;
		$word = null;
		$str = null;
		$var = null;

		$s = $this->seek();

		// speed shortcut
		if (isset($this->buffer[$this->count]) && $this->buffer[$this->count] == "-") {
			// negation
			if ($this->literal("-", false) &&
				(($this->variable($inner) && $inner = array("variable", $inner)) ||
				$this->unit($inner) ||
				$this->parenValue($inner))
			) {
				$value = array("unary", "-", $inner);
				return true;
			} else {
				$this->seek($s);
			}
		}

		if ($this->parenValue($value)) {
			return true;
		}
		if ($this->unit($value)) {
			return true;
		}
		if ($this->color($value)) {
			return true;
		}
		if ($this->func($value)) {
			return true;
		}
		if ($this->string($value)) {
			return true;
		}

		if ($this->keyword($word)) {
			$value = array('keyword', $word);
			return true;
		}

		// try a variable
		if ($this->variable($var)) {
			$value = array('variable', $var);
			return true;
		}

		// unquote string (should this work on any type?
		if ($this->literal("~") && $this->string($str)) {
			$value = array("escape", $str);
			return true;
		} else {
			$this->seek($s);
		}

		// css hack: \0
		$m = array();
		if ($this->literal('\\') && $this->match('([0-9]+)', $m)) {
			$value = array('keyword', '\\'.$m[1]);
			return true;
		} else {
			$this->seek($s);
		}

		return false;
	}

	// an import statement
	protected function import(&$out, $value = '')
	{
		if (!$this->literal('@import')) {
			return false;
		}

		// @import "something.css" media;
		// @import url("something.css") media;
		// @import url(something.css) media;

		if ($this->propertyValue($value)) {
			$out = array("import", $value);
			return true;
		}

		return false;
	}

	protected function mediaQueryList(&$out)
	{
		$list = null;

		if ($this->genericList($list, "mediaQuery", ",", false)) {
			$out = $list[2];
			return true;
		}
		return false;
	}

	protected function mediaQuery(&$out)
	{
		$mediaType = null;

		$s = $this->seek();

		$expressions = null;
		$parts = array();

		if ((($this->literal("only") && ($only = true)) || ($this->literal("not") && ($not = true))) && $this->keyword($mediaType)) {
			$prop = array("mediaType");
			if (isset($only)) {
				$prop[] = "only";
			}
			if (isset($not)) {
				$prop[] = "not";
			}
			$prop[] = $mediaType;
			$parts[] = $prop;
		} else {
			$this->seek($s);
		}


		if (!empty($mediaType) && !$this->literal("and")) {
			// ~
		} else {
			$this->genericList($expressions, "mediaExpression", "and", false);
			if (is_array($expressions)) {
				$parts = array_merge($parts, $expressions[2]);
			}
		}

		if (count($parts) == 0) {
			$this->seek($s);
			return false;
		}

		$out = $parts;
		return true;
	}

	protected function mediaExpression(&$out)
	{
		$feature = null;
		$variable = null;

		$s = $this->seek();
		$value = null;
		if ($this->literal("(") &&
			$this->keyword($feature) &&
			($this->literal(":") && $this->expression($value)) &&
			$this->literal(")")
		) {
			$out = array("mediaExp", $feature);
			if ($value) {
				$out[] = $value;
			}
			return true;
		} elseif ($this->variable($variable)) {
			$out = array('variable', $variable);
			return true;
		}

		$this->seek($s);
		return false;
	}

	// an unbounded string stopped by $end
	protected function openString($end, &$out, $nestingOpen = null, $rejectStrs = null)
	{
		$str = null;
		$inter = null;

		$oldWhite = $this->eatWhiteDefault;
		$this->eatWhiteDefault = false;

		$stop = array("'", '"', "@{", $end);
		$stop = array_map(array("lessc", "preg_quote"), $stop);
		// $stop[] = self::$commentMulti;

		if (!is_null($rejectStrs)) {
			$stop = array_merge($stop, $rejectStrs);
		}

		$patt = '(.*?)('.implode("|", $stop).')';

		$nestingLevel = 0;

		$content = array();
		$m = array();
		while ($this->match($patt, $m, false)) {
			if (!empty($m[1])) {
				$content[] = $m[1];
				if ($nestingOpen) {
					$nestingLevel += substr_count($m[1], $nestingOpen);
				}
			}

			$tok = $m[2];

			$this->count -= strlen($tok);
			if ($tok == $end) {
				if ($nestingLevel == 0) {
					break;
				} else {
					$nestingLevel--;
				}
			}

			if (($tok == "'" || $tok == '"') && $this->string($str)) {
				$content[] = $str;
				continue;
			}

			if ($tok == "@{" && $this->interpolation($inter)) {
				$content[] = $inter;
				continue;
			}

			if (!empty($rejectStrs) && in_array($tok, $rejectStrs)) {
				break;
			}

			$content[] = $tok;
			$this->count += strlen($tok);
		}

		$this->eatWhiteDefault = $oldWhite;

		if (count($content) == 0) {
			return false;
		}

		// trim the end
		if (is_string(end($content))) {
			$content[count($content) - 1] = rtrim(end($content));
		}

		$out = array("string", "", $content);
		return true;
	}

	protected function string(&$out)
	{
		$inter = null;

		$s = $this->seek();
		if ($this->literal('"', false)) {
			$delim = '"';
		} elseif ($this->literal("'", false)) {
			$delim = "'";
		} else {
			return false;
		}

		$content = array();

		// look for either ending delim , escape, or string interpolation
		$patt = '([^\n]*?)(@\{|\\\\|'.
			Lessc::preg_quote($delim).')';

		$oldWhite = $this->eatWhiteDefault;
		$this->eatWhiteDefault = false;

		$m = array();
		while ($this->match($patt, $m, false)) {
			$content[] = $m[1];
			if ($m[2] == "@{") {
				$this->count -= strlen($m[2]);
				if ($this->interpolation($inter)) {
					$content[] = $inter;
				} else {
					$this->count += strlen($m[2]);
					$content[] = "@{"; // ignore it
				}
			} elseif ($m[2] == '\\') {
				$content[] = $m[2];
				if ($this->literal($delim, false)) {
					$content[] = $delim;
				}
			} else {
				$this->count -= strlen($delim);
				break; // delim
			}
		}

		$this->eatWhiteDefault = $oldWhite;

		if ($this->literal($delim)) {
			$out = array("string", $delim, $content);
			return true;
		}

		$this->seek($s);
		return false;
	}

	protected function interpolation(&$out)
	{
		$interp = array();

		$oldWhite = $this->eatWhiteDefault;
		$this->eatWhiteDefault = true;

		$s = $this->seek();
		if ($this->literal("@{") &&
			$this->openString("}", $interp, null, array("'", '"', ";")) &&
			$this->literal("}", false)
		) {
			$out = array("interpolate", $interp);
			$this->eatWhiteDefault = $oldWhite;
			if ($this->eatWhiteDefault) {
				$this->whitespace();
			}
			return true;
		}

		$this->eatWhiteDefault = $oldWhite;
		$this->seek($s);
		return false;
	}

	protected function unit(&$unit)
	{
		$m = array();

		// speed shortcut
		if (isset($this->buffer[$this->count])) {
			$char = $this->buffer[$this->count];
			if (!ctype_digit($char) && $char != ".") {
				return false;
			}
		}

		if ($this->match('([0-9]+(?:\.[0-9]*)?|\.[0-9]+)([%a-zA-Z]+)?', $m)) {
			$unit = array("number", $m[1], empty($m[2]) ? "" : $m[2]);
			return true;
		}
		return false;
	}

	// a # color
	protected function color(&$out)
	{
		$m = array();

		if ($this->match('(#(?:[0-9a-f]{8}|[0-9a-f]{6}|[0-9a-f]{3}))', $m)) {
			if (strlen($m[1]) > 7) {
				$out = array("string", "", array($m[1]));
			} else {
				$out = array("raw_color", $m[1]);
			}
			return true;
		}

		return false;
	}

	// consume an argument definition list surrounded by ()
	// each argument is a variable name with optional value
	// or at the end a ... or a variable named followed by ...
	// arguments are separated by , unless a ; is in the list, then ; is the
	// delimiter.
	protected function argumentDef(&$args, &$isVararg)
	{
		$value = array();
		$rhs = null;

		$s = $this->seek();
		if (!$this->literal('(')) {
			return false;
		}

		$values = array();
		$delim = ",";
		$method = "expressionList";

		$isVararg = false;
		while (true) {
			if ($this->literal("...")) {
				$isVararg = true;
				break;
			}

			if ($this->$method($value)) {
				if ($value[0] == "variable") {
					$arg = array("arg", $value[1]);
					$ss = $this->seek();

					if ($this->assign() && $this->$method($rhs)) {
						$arg[] = $rhs;
					} else {
						$this->seek($ss);
						if ($this->literal("...")) {
							$arg[0] = "rest";
							$isVararg = true;
						}
					}

					$values[] = $arg;
					if ($isVararg) {
						break;
					}
					continue;
				} else {
					$values[] = array("lit", $value);
				}
			}


			if (!$this->literal($delim)) {
				if ($delim == "," && $this->literal(";")) {
					// found new delim, convert existing args
					$delim = ";";
					$method = "propertyValue";

					// transform arg list
					if (isset($values[1])) { // 2 items
						$newList = array();
						foreach ($values as $i => $arg) {
							switch ($arg[0]) {
								case "arg":
									if ($i) {
										$this->throwError("Cannot mix ; and , as delimiter types");
									}
									$newList[] = $arg[2];
									break;
								case "lit":
									$newList[] = $arg[1];
									break;
								case "rest":
									$this->throwError("Unexpected rest before semicolon");
							}
						}

						$newList = array("list", ", ", $newList);

						switch ($values[0][0]) {
							case "arg":
								$newArg = array("arg", $values[0][1], $newList);
								break;
							case "lit":
								$newArg = array("lit", $newList);
								break;
						}

					} elseif ($values) { // 1 item
						$newArg = $values[0];
					}

					if ($newArg) {
						$values = array($newArg);
					}
				} else {
					break;
				}
			}
		}

		if (!$this->literal(')')) {
			$this->seek($s);
			return false;
		}

		$args = $values;

		return true;
	}

	// consume a list of tags
	// this accepts a hanging delimiter
	protected function tags(&$tags, $simple = false, $delim = ',')
	{
		$tt = array();

		$tags = array();
		while ($this->tag($tt, $simple)) {
			$tags[] = $tt;
			if (!$this->literal($delim)) {
				break;
			}
		}
		if (count($tags) == 0) {
			return false;
		}

		return true;
	}

	// list of tags of specifying mixin path
	// optionally separated by > (lazy, accepts extra >)
	protected function mixinTags(&$tags)
	{
		$tt = array();

		$tags = array();
		while ($this->tag($tt, true)) {
			$tags[] = $tt;
			$this->literal(">");
		}

		if (!$tags) {
			return false;
		}

		return true;
	}

	// a bracketed value (contained within in a tag definition)
	protected function tagBracket(&$parts, &$hasExpression)
	{
		$str = null;
		$inter = null;
		$word = null;

		// speed shortcut
		if (isset($this->buffer[$this->count]) && $this->buffer[$this->count] != "[") {
			return false;
		}

		$s = $this->seek();

		$hasInterpolation = false;

		if ($this->literal("[", false)) {
			$attrParts = array("[");
			// keyword, string, operator
			while (true) {
				if ($this->literal("]", false)) {
					$this->count--;
					break; // get out early
				}

				$m = array();
				if ($this->match('\s+', $m)) {
					$attrParts[] = " ";
					continue;
				}
				if ($this->string($str)) {
					// escape parent selector, (yuck)
					foreach ($str[2] as &$chunk) {
						$chunk = str_replace($this->lessc->parentSelector, "$&$", $chunk);
					}

					$attrParts[] = $str;
					$hasInterpolation = true;
					continue;
				}

				if ($this->keyword($word)) {
					$attrParts[] = $word;
					continue;
				}

				if ($this->interpolation($inter)) {
					$attrParts[] = $inter;
					$hasInterpolation = true;
					continue;
				}

				// operator, handles attr namespace too
				if ($this->match('[|-~\$\*\^=]+', $m)) {
					$attrParts[] = $m[0];
					continue;
				}

				break;
			}

			if ($this->literal("]", false)) {
				$attrParts[] = "]";
				foreach ($attrParts as $part) {
					$parts[] = $part;
				}
				$hasExpression = $hasExpression || $hasInterpolation;
				return true;
			}
			$this->seek($s);
		}

		$this->seek($s);
		return false;
	}

	// a space separated list of selectors
	protected function tag(&$tag, $simple = false)
	{
		$interp = null;
		$unit = null;

		if ($simple) {
			$chars = '^@,:;{}\][>\(\) "\'';
		} else {
			$chars = '^@,;{}["\'';
		}
		$s = $this->seek();

		$hasExpression = false;
		$parts = array();
		while ($this->tagBracket($parts, $hasExpression));

		$oldWhite = $this->eatWhiteDefault;
		$this->eatWhiteDefault = false;

		while (true) {
			$m = array();
			if ($this->match('(['.$chars.'0-9]['.$chars.']*)', $m)) {
				$parts[] = $m[1];
				if ($simple) {
					break;
				}

				while ($this->tagBracket($parts, $hasExpression));
				continue;
			}

			if (isset($this->buffer[$this->count]) && $this->buffer[$this->count] == "@") {
				if ($this->interpolation($interp)) {
					$hasExpression = true;
					$interp[2] = true; // don't unescape
					$parts[] = $interp;
					continue;
				}

				if ($this->literal("@")) {
					$parts[] = "@";
					continue;
				}
			}

			if ($this->unit($unit)) { // for keyframes
				$parts[] = $unit[1];
				$parts[] = $unit[2];
				continue;
			}

			break;
		}

		$this->eatWhiteDefault = $oldWhite;
		if (!$parts) {
			$this->seek($s);
			return false;
		}

		if ($hasExpression) {
			$tag = array("exp", array("string", "", $parts));
		} else {
			$tag = trim(implode($parts));
		}

		$this->whitespace();
		return true;
	}

	// a css function
	protected function func(&$func)
	{
		$s = $this->seek();

		$m = array();
		$value = array();
		$string = array();
		$name = null;

		if ($this->match('(%|[\w\-_][\w\-_:\.]+|[\w_])', $m) && $this->literal('(')) {
			$fname = $m[1];

			$sPreArgs = $this->seek();

			$args = array();
			while (true) {
				$ss = $this->seek();
				// this ugly nonsense is for ie filter properties
				if ($this->keyword($name) && $this->literal('=') && $this->expressionList($value)) {
					$args[] = array("string", "", array($name, "=", $value));
				} else {
					$this->seek($ss);
					if ($this->expressionList($value)) {
						$args[] = $value;
					}
				}

				if (!$this->literal(',')) {
					break;
				}
			}
			$args = array('list', ',', $args);

			if ($this->literal(')')) {
				$func = array('function', $fname, $args);
				return true;
			} elseif ($fname == 'url') {
				// couldn't parse and in url? treat as string
				$this->seek($sPreArgs);
				if ($this->openString(")", $string) && $this->literal(")")) {
					$func = array('function', $fname, $string);
					return true;
				}
			}
		}

		$this->seek($s);
		return false;
	}

	// consume a less variable
	protected function variable(&$name)
	{
		$sub = null;
		$name = null;

		$s = $this->seek();
		if ($this->literal($this->lessc->vPrefix, false) &&
			($this->variable($sub) || $this->keyword($name))
		) {
			if (!empty($sub)) {
				$name = array('variable', $sub);
			} else {
				$name = $this->lessc->vPrefix.$name;
			}
			return true;
		}

		$name = null;
		$this->seek($s);
		return false;
	}

	/**
	 * Consume an assignment operator
	 * Can optionally take a name that will be set to the current property name
	 */
	protected function assign($name = null)
	{
		if ($name) {
			$this->currentProperty = $name;
		}
		return $this->literal(':') || $this->literal('=');
	}

	// consume a keyword
	protected function keyword(&$word)
	{
		$m = array();
		if ($this->match('([\w_\-\*!"][\w\-_"]*)', $m)) {
			$word = $m[1];
			return true;
		}
		return false;
	}

	// consume an end of statement delimiter
	protected function end()
	{
		if ($this->literal(';', false)) {
			return true;
		} elseif ($this->count == strlen($this->buffer) || $this->buffer[$this->count] == '}') {
			// if there is end of file or a closing block next then we don't need a ;
			return true;
		}
		return false;
	}

	protected function guards(&$guards)
	{
		$g = null;

		$s = $this->seek();

		if (!$this->literal("when")) {
			$this->seek($s);
			return false;
		}

		$guards = array();

		while ($this->guardGroup($g)) {
			$guards[] = $g;
			if (!$this->literal(",")) {
				break;
			}
		}

		if (count($guards) == 0) {
			$guards = null;
			$this->seek($s);
			return false;
		}

		return true;
	}

	// a bunch of guards that are and'd together
	// TODO rename to guardGroup
	protected function guardGroup(&$guardGroup)
	{
		$guard = null;

		$s = $this->seek();
		$guardGroup = array();
		while ($this->guard($guard)) {
			$guardGroup[] = $guard;
			if (!$this->literal("and")) {
				break;
			}
		}

		if (count($guardGroup) == 0) {
			$guardGroup = null;
			$this->seek($s);
			return false;
		}

		return true;
	}

	protected function guard(&$guard)
	{
		$exp = null;

		$s = $this->seek();
		$negate = $this->literal("not");

		if ($this->literal("(") && $this->expression($exp) && $this->literal(")")) {
			$guard = $exp;
			if ($negate) {
				$guard = array("negate", $guard);
			}
			return true;
		}

		$this->seek($s);
		return false;
	}

	/* raw parsing functions */

	protected function literal($what, $eatWhitespace = null)
	{
		if ($eatWhitespace === null) {
			$eatWhitespace = $this->eatWhiteDefault;
		}

		// shortcut on single letter
		if (!isset($what[1]) && isset($this->buffer[$this->count])) {
			if ($this->buffer[$this->count] == $what) {
				if (!$eatWhitespace) {
					$this->count++;
					return true;
				}
			// goes below...
			} else {
				return false;
			}
		}

		if (!isset(self::$literalCache[$what])) {
			self::$literalCache[$what] = Lessc::preg_quote($what);
		}

		$m = array();
		return $this->match(self::$literalCache[$what], $m, $eatWhitespace);
	}

	protected function genericList(&$out, $parseItem, $delim = "", $flatten = true)
	{
		$value = null;

		$s = $this->seek();
		$items = array();
		while ($this->$parseItem($value)) {
			$items[] = $value;
			if ($delim) {
				if (!$this->literal($delim)) {
					break;
				}
			}
		}

		if (count($items) == 0) {
			$this->seek($s);
			return false;
		}

		if ($flatten && count($items) == 1) {
			$out = $items[0];
		} else {
			$out = array("list", $delim, $items);
		}

		return true;
	}


	// advance counter to next occurrence of $what
	// $until - don't include $what in advance
	// $allowNewline, if string, will be used as valid char set
	protected function to($what, &$out, $until = false, $allowNewline = false)
	{
		if (is_string($allowNewline)) {
			$validChars = $allowNewline;
		} else {
			$validChars = $allowNewline ? "." : "[^\n]";
		}
		$m = array();
		if (!$this->match('('.$validChars.'*?)'.Lessc::preg_quote($what), $m, !$until)) {
			return false;
		}
		if ($until) {
			$this->count -= strlen($what); // give back $what
		}
		$out = $m[1];
		return true;
	}

	// try to match something on head of buffer
	protected function match($regex, &$out, $eatWhitespace = null)
	{
		if ($eatWhitespace === null) {
			$eatWhitespace = $this->eatWhiteDefault;
		}

		$r = '/'.$regex.($eatWhitespace && !$this->writeComments ? '\s*' : '').'/Ais';
		if (preg_match($r, $this->buffer, $out, 0, $this->count)) {
			$this->count += strlen($out[0]);
			if ($eatWhitespace && $this->writeComments) {
				$this->whitespace();
			}
			return true;
		}
		return false;
	}

	// match some whitespace
	protected function whitespace()
	{
		if ($this->writeComments) {
			$gotWhite = false;
			$m = array();
			while (preg_match(self::$whitePattern, $this->buffer, $m, 0, $this->count)) {
				if (isset($m[1]) && empty($this->seenComments[$this->count])) {
					$this->append(array("comment", $m[1]));
					$this->seenComments[$this->count] = true;
				}
				$this->count += strlen($m[0]);
				$gotWhite = true;
			}
			return $gotWhite;
		} else {
			$this->match("", $m);
			return strlen($m[0]) > 0;
		}
	}

	// match something without consuming it
	protected function peek($regex, &$out = null, $from = null)
	{
		if (is_null($from)) {
			$from = $this->count;
		}
		$r = '/'.$regex.'/Ais';
		$result = preg_match($r, $this->buffer, $out, 0, $from);

		return $result;
	}

	// seek to a spot in the buffer or return where we are on no argument
	protected function seek($where = null)
	{
		if ($where === null) {
			return $this->count;
		} else {
			$this->count = $where;
		}
		return true;
	}

	/* misc functions */

	public function throwError($msg = "parse error", $count = null)
	{
		$count = is_null($count) ? $this->count : $count;

		$line = $this->line +
			substr_count(substr($this->buffer, 0, $count), "\n");

		if (!empty($this->sourceName)) {
			$loc = "$this->sourceName on line $line";
		} else {
			$loc = "line: $line";
		}

		// TODO this depends on $this->count
		$m = array();
		if ($this->peek("(.*?)(\n|$)", $m, $count)) {
			throw new exception("$msg: failed at `$m[1]` $loc");
		} else {
			throw new exception("$msg: $loc");
		}
	}

	protected function pushBlock($selectors = null, $type = null)
	{
		$b = new stdclass();
		$b->parent = $this->env;

		$b->type = $type;
		$b->id = self::$nextBlockId++;

		$b->isVararg = false; // TODO: kill me from here
		$b->tags = $selectors;

		$b->props = array();
		$b->children = array();

		$this->env = $b;
		return $b;
	}

	// push a block that doesn't multiply tags
	protected function pushSpecialBlock($type)
	{
		return $this->pushBlock(null, $type);
	}

	// append a property to the current block
	protected function append($prop, $pos = null)
	{
		if ($pos !== null) {
			$prop[-1] = $pos;
		}
		$this->env->props[] = $prop;
	}

	// pop something off the stack
	protected function pop()
	{
		$old = $this->env;
		$this->env = $this->env->parent;
		return $old;
	}

	// remove comments from $text
	// todo: make it work for all functions, not just url
	protected function removeComments($text)
	{
		$look = array(
			'url(', '//', '/*', '"', "'"
		);

		$out = '';
		$min = null;
		while (true) {
			// find the next item
			foreach ($look as $token) {
				$pos = strpos($text, $token);
				if ($pos !== false) {
					if (!isset($min) || $pos < $min[1]) {
						$min = array($token, $pos);
					}
				}
			}

			if (is_null($min)) {
				break;
			}

			$count = $min[1];
			$skip = 0;
			$newlines = 0;
			switch ($min[0]) {
				case 'url(':
					$m = array();
					if (preg_match('/url\(.*?\)/', $text, $m, 0, $count)) {
						$count += strlen($m[0]) - strlen($min[0]);
					}
					break;
				case '"':
				case "'":
					$m = array();
					if (preg_match('/'.$min[0].'.*?(?<!\\\\)'.$min[0].'/', $text, $m, 0, $count)) {
						$count += strlen($m[0]) - 1;
					}
					break;
				case '//':
					$skip = strpos($text, "\n", $count);
					if ($skip === false) {
						$skip = strlen($text) - $count;
					} else {
						$skip -= $count;
					}
					break;
				case '/*':
					$m = array();
					if (preg_match('/\/\*.*?\*\//s', $text, $m, 0, $count)) {
						$skip = strlen($m[0]);
						$newlines = substr_count($m[0], "\n");
					}
					break;
			}

			if ($skip == 0) {
				$count += strlen($min[0]);
			}

			$out .= substr($text, 0, $count).str_repeat("\n", $newlines);
			$text = substr($text, $count + $skip);

			$min = null;
		}

		return $out.$text;
	}
}
