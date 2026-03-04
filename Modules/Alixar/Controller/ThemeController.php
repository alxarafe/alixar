<?php

namespace Modules\Alixar\Controller;

use Alxarafe\Base\Controller\GenericPublicController;
use Alxarafe\Lib\Functions;

class ThemeController extends GenericPublicController
{
    /**
     * @return string
     */
    #[\Override]
    public static function getModuleName(): string
    {
        return 'Alixar';
    }

    /**
     * @return string
     */
    #[\Override]
    public static function getControllerName(): string
    {
        return 'Theme';
    }

    /**
     * Action to switch the active theme.
     * Uses session/cookie for persistence during testing.
     *
     * @return bool
     */
    public function doSwitch(): bool
    {
        $theme = $_GET['id'] ?? 'alxarafe';

        // Save in session for immediate persistence
        $_SESSION['alx_theme_test'] = $theme;

        // If the user is logged in, save preference to the database (if model supports it)
        if (\Alxarafe\Lib\Auth::isLogged()) {
            try {
                $user = \Alxarafe\Lib\Auth::$user;
                if (isset($user->theme)) {
                    $user->theme = $theme;
                    $user->save();
                }
            } catch (\Throwable $e) {
                // Ignore if user model doesn't have theme field yet
            }
        }

        // Set cookie as well for redundancy
        setcookie('alx_theme', $theme, time() + (86400 * 30), '/');

        // Redirection logic
        $referer = $_SERVER['HTTP_REFERER'] ?? constant('BASE_URL');
        if (str_contains($referer, 'action=switch')) {
            $referer = constant('BASE_URL');
        }

        session_write_close();
        Functions::httpRedirect($referer);

        return true;
    }
}
