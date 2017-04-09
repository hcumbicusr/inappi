<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit62e72ef5f4840f9e7304034c31b38672
{
    public static $prefixLengthsPsr4 = array (
        'j' => 
        array (
            'joshtronic\\' => 11,
        ),
        'a' => 
        array (
            'app\\' => 4,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'joshtronic\\' => 
        array (
            0 => __DIR__ . '/..' . '/joshtronic/php-googleplaces/src',
        ),
        'app\\' => 
        array (
            0 => __DIR__ . '/../..' . '/backend',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit62e72ef5f4840f9e7304034c31b38672::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit62e72ef5f4840f9e7304034c31b38672::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}
