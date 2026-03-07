<?php

namespace Modules\Alixar\Lib\Trait;

use Illuminate\Database\Capsule\Manager as DB;

/**
 * Trait HasReference
 * Handles automatic reference generation for models based on masks.
 * 
 * @property string|null $referenceField
 * @property string|null $referenceMask
 * @property array|null $referenceConfig
 */
trait HasReference
{
    /**
     * Boot the trait.
     */
    protected static function bootHasReference()
    {
        static::creating(function ($model) {
            $model->generateReferences();
        });
    }

    /**
     * Generate references for configured fields.
     */
    public function generateReferences()
    {
        // 1. Single configuration (legacy/simple)
        if (isset($this->referenceField) && isset($this->referenceMask)) {
            if (empty($this->getAttribute($this->referenceField))) {
                $this->setAttribute($this->referenceField, $this->resolveMask($this->referenceMask, $this->referenceField));
            }
        }

        // 2. Multiple configuration (modern/complex)
        if (isset($this->referenceConfig) && is_array($this->referenceConfig)) {
            foreach ($this->referenceConfig as $field => $mask) {
                if (empty($this->getAttribute($field))) {
                    $this->setAttribute($field, $this->resolveMask($mask, $field));
                }
            }
        }
    }

    /**
     * Resolve a mask into a real reference.
     * Supported tags: {yy}, {mm}, {dd}, {0000}
     * 
     * @param string $mask
     * @param string $field
     * @return string
     */
    protected function resolveMask(string $mask, string $field): string
    {
        $now = new \DateTime();

        // 1. Resolve Date Tags
        $res = str_replace(
            ['{yyyy}', '{yy}', '{mm}', '{dd}'],
            [$now->format('Y'), $now->format('y'), $now->format('m'), $now->format('d')],
            $mask
        );

        // 2. Resolve Sequence Tag (e.g. {0000})
        if (preg_match('/\{0+\}/', $res, $matches)) {
            $tag = $matches[0];
            $length = strlen($tag) - 2;

            // Get last number from database for this prefix
            $prefix = explode($tag, $res)[0];

            $lastRef = DB::table($this->getTable())
                ->where($field, 'like', $prefix . '%')
                ->orderBy($field, 'desc')
                ->value($field);

            $lastNum = 0;
            if ($lastRef) {
                $lastNum = (int)substr($lastRef, strlen($prefix), $length);
            }

            $newNum = str_pad((string)($lastNum + 1), $length, '0', STR_PAD_LEFT);
            $res = str_replace($tag, $newNum, $res);
        }

        return $res;
    }
}
