<?php

namespace Modules\Alixar\Lib;

use Modules\Alixar\Model\RightsDef;
use Modules\Alixar\Model\UserRights;
use Modules\Alixar\Model\UserGroupRights;
use Modules\Alixar\Model\UserGroupUser;

/**
 * Trait HasDolibarrPermissions
 * Implements permission checking following Dolibarr logic.
 * 
 * @property int|string $admin
 * @property int|string $rowid
 */
trait HasDolibarrPermissions
{
    /**
     * Cache for permissions to avoid redundant queries.
     */
    protected array $permissionCache = [];

    /**
     * Checks if the user has a specific permission.
     * 
     * @param string $module Module name (e.g., 'societe', 'facture')
     * @param string $perms Primary permission key
     * @param string|null $subperm Secondary permission key
     * @return bool
     */
    public function hasPermission(string $module, string $perms, ?string $subperm = null): bool
    {
        // 1. Admin always has all permissions
        if ($this->admin == 1) {
            return true;
        }

        $cacheKey = "{$module}.{$perms}" . ($subperm ? ".{$subperm}" : "");
        if (isset($this->permissionCache[$cacheKey])) {
            return $this->permissionCache[$cacheKey];
        }

        // 2. Resolve internal Dolibarr permission ID
        $query = RightsDef::where('module', $module)->where('perms', $perms);
        if ($subperm !== null) {
            $query->where('subperms', $subperm);
        } else {
            $query->whereNull('subperms');
        }

        $def = $query->first();

        if (!$def) {
            return false;
        }

        $permId = $def->id;

        // 3. Check direct user rights
        $hasDirect = UserRights::where('fk_user', $this->rowid)
            ->where('fk_id', $permId)
            ->exists();

        if ($hasDirect) {
            return $this->permissionCache[$cacheKey] = true;
        }

        // 4. Check group rights
        $groupIds = UserGroupUser::where('fk_user', $this->rowid)->pluck('fk_usergroup');

        if ($groupIds->isNotEmpty()) {
            $hasGroup = UserGroupRights::whereIn('fk_usergroup', $groupIds)
                ->where('fk_id', $permId)
                ->exists();

            if ($hasGroup) {
                return $this->permissionCache[$cacheKey] = true;
            }
        }

        return $this->permissionCache[$cacheKey] = false;
    }
}
