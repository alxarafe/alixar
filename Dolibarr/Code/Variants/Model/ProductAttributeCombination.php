<?php

/* Copyright (C) 2024       Rafael San José         <rsanjose@alxarafe.com>
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

namespace Dolibarr\Code\Variants\Model;

use Dolibarr\Code\User\Classes\User;
use Dolibarr\Core\Base\Model;

/**
 * Class ProductAttributeCombination
 * Before if was ProductCombination class
 *
 * @property int $rowid
 * @property int $fk_product_parent
 * @property int $fk_product_child
 * @property float $variation_price
 * @property int|null $variation_price_percentage
 * @property float $variation_weight
 * @property string|null $variation_ref_ext
 * @property int $entity
 */
class ProductAttributeCombination extends Model
{
    public $timestamps = false;

    protected $table = 'product_attribute_combination';

    protected $casts = [
        'fk_product_parent' => 'int',
        'fk_product_child' => 'int',
        'variation_price' => 'float',
        'variation_price_percentage' => 'int',
        'variation_weight' => 'float',
        'entity' => 'int'
    ];

    protected $fillable = [
        'fk_product_parent',
        'fk_product_child',
        'variation_price',
        'variation_price_percentage',
        'variation_weight',
        'variation_ref_ext',
        'entity'
    ];

    public function fetch($rowid)
    {
        return static::firstWhere('rowid', $rowid);
    }

    public function saveCombinationPriceLevels($clean = 1)
    {
        die(__METHOD__ . ' of ' . __CLASS__);
    }

    public function fetchByFkProductChild($productid, $donotloadpricelevel = 0)
    {
        $result = static::firstWhere('fk_product_child', $productid);
        if (empty($donotloadpricelevel) && getDolGlobalString('PRODUIT_MULTIPRICES')) {
            $this->fetchCombinationPriceLevels();
        }
        return $result;
    }

    public function fetchCombinationPriceLevels($fk_price_level = 0, $useCache = true)
    {
        die(__METHOD__ . ' of ' . __CLASS__);
    }

    public function fetchAllByFkProductParent($fk_product_parent, $sort_by_ref = false)
    {
        $entities = getEntity('product');
        if (!is_array($entities)) {
            $entities = [$entities];
        }

        $query = ProductAttributeCombination::where('fk_product_parent', $fk_product_parent)
            ->whereIn('product_attribute_combination.entity', $entities);

        if ($sort_by_ref) {
            $query->leftJoin('product', 'product.rowid', '=', 'product_attribute_combination.fk_product_child')
                ->orderBy('product.ref', 'ASC');
        }

        $results = $query->get();

        $return = [];

        foreach ($results as $result) {
            $tmp = new ProductAttributeCombination();
            $tmp->id = $result->rowid;
            $tmp->fk_product_parent = $result->fk_product_parent;
            $tmp->fk_product_child = $result->fk_product_child;
            $tmp->variation_price = $result->variation_price;
            $tmp->variation_price_percentage = $result->variation_price_percentage;
            $tmp->variation_weight = $result->variation_weight;
            $tmp->variation_ref_ext = $result->variation_ref_ext;

            if (getDolGlobalString('PRODUIT_MULTIPRICES')) {
                $tmp->fetchCombinationPriceLevels();
            }

            $return[] = $tmp;
        }

        return $return;
    }

    public function countNbOfCombinationForFkProductParent($fk_product_parent)
    {
        return static::where('fk_product_parent', $fk_product_parent)
            ->where('entity', getEntity('product'))
            ->count();
    }

    public function create($user)
    {
        die(__METHOD__ . ' of ' . __CLASS__);
    }

    public function update2(User $user)
    {
        die(__METHOD__ . ' of ' . __CLASS__);
    }

    public function delete2(User $user)
    {
        die(__METHOD__ . ' of ' . __CLASS__);
    }

    public function deleteByFkProductParent($user, $fk_product_parent)
    {
        die(__METHOD__ . ' of ' . __CLASS__);
    }

    public function updateProperties(Product $parent, User $user)
    {
        die(__METHOD__ . ' of ' . __CLASS__);
    }

    public function fetchByProductCombination2ValuePairs($prodid, array $features)
    {
        die(__METHOD__ . ' of ' . __CLASS__);
    }

    public function getUniqueAttributesAndValuesByFkProductParent($productid)
    {
        die(__METHOD__ . ' of ' . __CLASS__);
    }

    public function createProductCombination(User $user, Product $product, array $combinations, array $variations, $price_var_percent = false, $forced_pricevar = false, $forced_weightvar = false, $forced_refvar = false, $ref_ext = '')
    {
        die(__METHOD__ . ' of ' . __CLASS__);
    }

    public function copyAll(User $user, $origProductId, Product $destProduct)
    {
        die(__METHOD__ . ' of ' . __CLASS__);
    }

    public function getCombinationLabel($prod_child)
    {
        die(__METHOD__ . ' of ' . __CLASS__);
    }
}
