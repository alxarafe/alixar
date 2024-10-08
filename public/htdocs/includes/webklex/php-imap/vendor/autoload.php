<?php

// autoload.php @generated by Composer

/*
if (PHP_VERSION_ID < 50600) {
    echo 'Composer 2.3.0 dropped support for autoloading on PHP <5.6 and you are running '.PHP_VERSION.', please upgrade PHP or use Composer 2.2 LTS via "composer self-update --2.2". Aborting.'.PHP_EOL;
    exit(1);
}

require_once __DIR__ . '/composer/autoload_real.php';

return ComposerAutoloaderInit4da13270269c89a28e472e1f7324e6d1::getLoader();
*/


// Add class/method of PHP8 for compatibility with older versions of PHP
require_once(__DIR__ . '/symfony/polyfill-php80/bootstrap.php');

//'0e6d7bf4a5811bfa5cf40c5ccd6fae6a' => $vendorDir . '/symfony/polyfill-mbstring/bootstrap.php',
//'a4a119a56e50fbb293281d9a48007e0e' => $vendorDir . '/symfony/polyfill-php80/bootstrap.php',
//'60799491728b879e74601d83e38b2cad' => $vendorDir . '/illuminate/collections/helpers.php',
//'320cde22f66dd4f5d3fd621d3e88b98f' => $vendorDir . '/symfony/polyfill-ctype/bootstrap.php',
//'6e3fae29631ef280660b3cdad06f25a8' => $vendorDir . '/symfony/deprecation-contracts/function.php',
require_once(__DIR__ . '/illuminate/collections/helpers.php');


spl_autoload_register(function ($class_name) {
    // Enable this to detect what we need for require_once
    //var_dump($class_name);


    $preg_match = preg_match('/^Symfony\\\Polyfill\\\Php80\\\/', $class_name);
    if (1 === $preg_match) {
        $class_name = preg_replace('/\\\/', '/', $class_name);
        $class_name = preg_replace('/^Symfony\\/Polyfill\\/Php80\\//', '', $class_name);
        require_once __DIR__ . '/symfony/polyfill-php80/' . $class_name . '.php';
    }

    $preg_match = preg_match('/^Webklex\\\PHPIMAP\\\/', $class_name);
    if (1 === $preg_match) {
        $class_name = preg_replace('/\\\/', '/', $class_name);
        $class_name = preg_replace('/^Webklex\\/PHPIMAP\\//', '', $class_name);
        require_once __DIR__ . '/../src/' . $class_name . '.php';
    }

    $preg_match = preg_match('/^Illuminate\\\Support\\\/', $class_name);
    if (1 === $preg_match) {
        $class_name = preg_replace('/\\\/', '/', $class_name);
        $class_name = preg_replace('/^Illuminate\\/Support\\//', '', $class_name);
        $listofdir = array(0 => __DIR__ . '/illuminate/macroable',
            1 => __DIR__ . '/illuminate/collections',
            2 => __DIR__ . '/illuminate/support',
            3 => __DIR__ . '/illuminate/contracts'
        );
        foreach ($listofdir as $dir) {
            if (file_exists($dir . '/' . $class_name . '.php')) {
                require_once $dir . '/' . $class_name . '.php';
                break;
            }
        }
    }

    $preg_match = preg_match('/^Illuminate\\\Contracts\\\/', $class_name);
    if (1 === $preg_match) {
        $class_name = preg_replace('/\\\/', '/', $class_name);
        $class_name = preg_replace('/^Illuminate\\/Contracts\\//', '', $class_name);
        $listofdir = array(
            0 => __DIR__ . '/illuminate/contracts'
        );
        foreach ($listofdir as $dir) {
            if (file_exists($dir . '/' . $class_name . '.php')) {
                require_once $dir . '/' . $class_name . '.php';
                break;
            }
        }
    }

    $preg_match = preg_match('/^Carbon\\\/', $class_name);
    if (1 === $preg_match) {
        $class_name = preg_replace('/\\\/', '/', $class_name);
        $class_name = preg_replace('/^Carbon\\//', '', $class_name);
        $listofdir = array(
            0 => __DIR__ . '/nesbot/carbon/src/Carbon'
        );
        foreach ($listofdir as $dir) {
            if (file_exists($dir . '/' . $class_name . '.php')) {
                require_once $dir . '/' . $class_name . '.php';
                break;
            }
        }
    }

});
