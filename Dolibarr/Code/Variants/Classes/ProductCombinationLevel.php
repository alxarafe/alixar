<?php

/* Copyright (C) 2016       Marcos García               <marcosgdf@gmail.com>
 * Copyright (C) 2018		Juanjo Menent			    <jmenent@2byte.es>
 * Copyright (C) 2022   	Open-Dsi				    <support@open-dsi.fr>
 * Copyright (C) 2024		MDW						    <mdeweerd@users.noreply.github.com>
 * Copyright (C) 2024       Frédéric France             <frederic.france@free.fr>
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
 */

namespace Dolibarr\Code\Variants\Classes;

use DoliDB;

/**
 *  \file       htdocs/variants/class/ProductCombination.class.php
 *  \ingroup    variants
 *  \brief      File of the ProductCombination class
 */

/**
 * Class ProductCombinationLevel
 * Used to represent a product combination Level
 */
class ProductCombinationLevel
{
    /**
     * Database handler
     * @var DoliDB
     */
    public $db;

    /**
     * @var string Name of table without prefix where object is stored
     */
    public $table_element = 'product_attribute_combination_price_level';

    /**
     * Rowid of combination
     * @var int
     */
    public $id;

    /**
     * Rowid of parent product combination
     * @var int
     */
    public $fk_product_attribute_combination;

    /**
     * Combination price level
     * @var int
     */
    public $fk_price_level;

    /**
     * Price variation
     * @var float
     */
    public $variation_price;

    /**
     * Is the price variation a relative variation?
     * @var bool
     */
    public $variation_price_percentage = false;

    /**
     * @var string error
     */
    public $error;

    /**
     * @var string[] array of errors
     */
    public $errors = array();

    /**
     * Constructor
     *
     * @param DoliDB $db Database handler
     */
    public function __construct(DoliDB $db)
    {
        $this->db = $db;
    }

    /**
     * Retrieves a combination level by its rowid
     *
     * @param int $rowid Row id
     * @return int Return integer <0 KO, >0 OK
     */
    public function fetch($rowid)
    {
        $sql = "SELECT rowid, fk_product_attribute_combination, fk_price_level, variation_price, variation_price_percentage";
        $sql .= " FROM " . MAIN_DB_PREFIX . $this->table_element;
        $sql .= " WHERE rowid = " . (int) $rowid;

        $resql = $this->db->query($sql);
        if ($resql) {
            $obj = $this->db->fetch_object($resql);
            if ($obj) {
                return $this->fetchFormObj($obj);
            }
        }

        return -1;
    }


    /**
     * Retrieves combination price levels
     *
     * @param   int     $fk_product_attribute_combination       Id of product combination
     * @param   int     $fk_price_level                         The price level to fetch, use 0 for all
     * @return  mixed                                           self[] | -1 on KO
     */
    public function fetchAll($fk_product_attribute_combination, $fk_price_level = 0)
    {
        $result = array();

        $sql = "SELECT rowid, fk_product_attribute_combination, fk_price_level, variation_price, variation_price_percentage";
        $sql .= " FROM " . MAIN_DB_PREFIX . $this->table_element;
        $sql .= " WHERE fk_product_attribute_combination = " . intval($fk_product_attribute_combination);
        if (!empty($fk_price_level)) {
            $sql .= ' AND fk_price_level = ' . intval($fk_price_level);
        }

        $res = $this->db->query($sql);
        if ($res) {
            if ($this->db->num_rows($res) > 0) {
                while ($obj = $this->db->fetch_object($res)) {
                    $productCombinationLevel = new ProductCombinationLevel($this->db);
                    $productCombinationLevel->fetchFormObj($obj);
                    $result[$obj->fk_price_level] = $productCombinationLevel;
                }
            }
        } else {
            return -1;
        }

        return $result;
    }

    /**
     * Assign vars form an stdclass like sql obj
     *
     * @param   Object  $obj        Object resultset
     * @return  int                 Return integer <0 KO, >0 OK
     */
    public function fetchFormObj($obj)
    {
        if (!$obj) {
            return -1;
        }

        $this->id = $obj->rowid;
        $this->fk_product_attribute_combination = (int) $obj->fk_product_attribute_combination;
        $this->fk_price_level = intval($obj->fk_price_level);
        $this->variation_price = (float) $obj->variation_price;
        $this->variation_price_percentage = (bool) $obj->variation_price_percentage;

        return 1;
    }


    /**
     * Save a price impact of a product combination for a price level
     *
     * @return int      Return integer <0 KO, >0 OK
     */
    public function save()
    {
        if (($this->id > 0 && empty($this->fk_product_attribute_combination)) || empty($this->fk_price_level)) {
            return -1;
        }

        // Check if level exist in DB before add
        if ($this->fk_product_attribute_combination > 0 && empty($this->id)) {
            $sql = "SELECT rowid id";
            $sql .= " FROM " . MAIN_DB_PREFIX . $this->table_element;
            $sql .= " WHERE fk_product_attribute_combination = " . (int) $this->fk_product_attribute_combination;
            $sql .= ' AND fk_price_level = ' . ((int) $this->fk_price_level);

            $resql = $this->db->query($sql);
            if ($resql) {
                $obj = $this->db->fetch_object($resql);
                if ($obj) {
                    $this->id = $obj->id;
                }
            }
        }

        // Update
        if (!empty($this->id)) {
            $sql = 'UPDATE ' . MAIN_DB_PREFIX . $this->table_element;
            $sql .= ' SET variation_price = ' . (float) $this->variation_price . ' , variation_price_percentage = ' . intval($this->variation_price_percentage);
            $sql .= ' WHERE rowid = ' . ((int) $this->id);

            $res = $this->db->query($sql);
            if ($res > 0) {
                return $this->id;
            } else {
                $this->error = $this->db->error();
                $this->errors[] = $this->error;
                return -1;
            }
        } else {
            // Add
            $sql = "INSERT INTO " . MAIN_DB_PREFIX . $this->table_element . " (";
            $sql .= "fk_product_attribute_combination, fk_price_level, variation_price, variation_price_percentage";
            $sql .= ") VALUES (";
            $sql .= (int) $this->fk_product_attribute_combination;
            $sql .= ", " . intval($this->fk_price_level);
            $sql .= ", " . (float) $this->variation_price;
            $sql .= ", " . intval($this->variation_price_percentage);
            $sql .= ")";

            $res = $this->db->query($sql);
            if ($res) {
                $this->id = $this->db->last_insert_id(MAIN_DB_PREFIX . $this->table_element);
            } else {
                $this->error = $this->db->error();
                $this->errors[] = $this->error;
                return -1;
            }
        }

        return $this->id;
    }


    /**
     * delete
     *
     * @return int Return integer <0 KO, >0 OK
     */
    public function delete()
    {
        $sql = "DELETE FROM " . MAIN_DB_PREFIX . $this->table_element . " WHERE rowid = " . (int) $this->id;
        $res = $this->db->query($sql);

        return $res ? 1 : -1;
    }


    /**
     * delete all for a combination
     *
     * @param   int     $fk_product_attribute_combination   Id of combination
     * @return  int                                         Return integer <0 KO, >0 OK
     */
    public function deleteAllForCombination($fk_product_attribute_combination)
    {
        $sql = "DELETE FROM " . MAIN_DB_PREFIX . $this->table_element . " WHERE fk_product_attribute_combination = " . (int) $fk_product_attribute_combination;
        $res = $this->db->query($sql);

        return $res ? 1 : -1;
    }


    /**
     * Clean not needed price levels for a combination
     *
     * @param   int     $fk_product_attribute_combination   Id of combination
     * @return  int                                         Return integer <0 KO, >0 OK
     */
    public function clean($fk_product_attribute_combination)
    {
        global $conf;

        $sql = "DELETE FROM " . MAIN_DB_PREFIX . $this->table_element;
        $sql .= " WHERE fk_product_attribute_combination = " . (int) $fk_product_attribute_combination;
        $sql .= " AND fk_price_level > " . (int) getDolGlobalString('PRODUIT_MULTIPRICES_LIMIT');
        $res = $this->db->query($sql);

        return $res ? 1 : -1;
    }


    /**
     * Create new Product Combination Price level from Parent
     *
     * @param DoliDB                $db                     Database handler
     * @param ProductCombination    $productCombination     Product combination
     * @param int                   $fkPriceLevel           Price level
     * @return ProductCombinationLevel
     */
    public static function createFromParent(DoliDB $db, ProductCombination $productCombination, $fkPriceLevel)
    {
        $productCombinationLevel = new self($db);
        $productCombinationLevel->fk_price_level = $fkPriceLevel;
        $productCombinationLevel->fk_product_attribute_combination = $productCombination->id;
        $productCombinationLevel->variation_price = $productCombination->variation_price;
        $productCombinationLevel->variation_price_percentage = (bool) $productCombination->variation_price_percentage;

        return $productCombinationLevel;
    }
}
