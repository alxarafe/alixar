<?php

/**
 * Returns the class name of the object without the namespace
 *
 * @param object $object
 * @return string
 */
function get_only_class(object $object): string
{
    $array_object = explode('\\', get_class($object));
    if (empty($array_object)) {
        return '';
    }
    return end($array_object);
}