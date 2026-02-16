<!-- Templates/common/component/button.blade.php -->


<?php
    $type = $type ?? 'button';
    $class = $class ?? 'primary';
    $slot = $slot ?? $value ?? 'Button';
    if (isset($spacing)) {
        $class .= ' ' . $spacing;
    }

    $_type = "type={$type}";
    $_class = "class=\"btn btn-{$class}\"";

    $_name = isset($name) ? "name=\"{$name}\"" : '';
    $_value = isset($value) ? "value=\"{$value}\"" : '';

    $_attributes = is_array($attributes ?? null) ? implode(' ', $attributes) : '';
?>

<button <?php echo $_type; ?> <?php echo $_class; ?> <?php echo $_name; ?> <?php echo $_value; ?> <?php echo $_attributes; ?>>
    <?php echo $slot; ?>

</button><?php /**PATH /var/www/html/vendor/alxarafe/alxarafe/templates/component/button.blade.php ENDPATH**/ ?>