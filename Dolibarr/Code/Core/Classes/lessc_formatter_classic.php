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

class lessc_formatter_classic
{
	public $indentChar = "  ";

	public $break = "\n";
	public $open = " {";
	public $close = "}";
	public $selectorSeparator = ", ";
	public $assignSeparator = ":";

	public $openSingle = " { ";
	public $closeSingle = " }";

	public $disableSingle = false;
	public $breakSelectors = false;

	public $compressColors = false;
	public $indentLevel;

	public function __construct()
	{
		$this->indentLevel = 0;
	}

	public function indentStr($n = 0)
	{
		return str_repeat($this->indentChar, max($this->indentLevel + $n, 0));
	}

	public function property($name, $value)
	{
		return $name.$this->assignSeparator.$value.";";
	}

	protected function isEmpty($block)
	{
		if (empty($block->lines)) {
			foreach ($block->children as $child) {
				if (!$this->isEmpty($child)) {
					return false;
				}
			}

			return true;
		}
		return false;
	}

	public function block($block)
	{
		if ($this->isEmpty($block)) {
			return;
		}

		$inner = $pre = $this->indentStr();

		$isSingle = !$this->disableSingle &&
			is_null($block->type) && count($block->lines) == 1;

		if (!empty($block->selectors)) {
			$this->indentLevel++;

			if ($this->breakSelectors) {
				$selectorSeparator = $this->selectorSeparator.$this->break.$pre;
			} else {
				$selectorSeparator = $this->selectorSeparator;
			}

			echo $pre.
				implode($selectorSeparator, $block->selectors);
			if ($isSingle) {
				echo $this->openSingle;
				$inner = "";
			} else {
				echo $this->open.$this->break;
				$inner = $this->indentStr();
			}
		}

		if (!empty($block->lines)) {
			$glue = $this->break.$inner;
			echo $inner.implode($glue, $block->lines);
			if (!$isSingle && !empty($block->children)) {
				echo $this->break;
			}
		}

		foreach ($block->children as $child) {
			$this->block($child);
		}

		if (!empty($block->selectors)) {
			if (!$isSingle && empty($block->children)) {
				echo $this->break;
			}

			if ($isSingle) {
				echo $this->closeSingle.$this->break;
			} else {
				echo $pre.$this->close.$this->break;
			}

			$this->indentLevel--;
		}
	}
}
