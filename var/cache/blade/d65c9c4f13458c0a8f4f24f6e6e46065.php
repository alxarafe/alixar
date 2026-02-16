<!-- Templates/common/layout/container.blade.php -->


<?php
    use Alxarafe\Lib\Functions;

    $_class = $class ?? 'container';
    $_attributes = Functions::htmlAttributes($attributes ?? []);

    $_id = '';
    if (isset($id)) {
        $_id = "id=\"$id\"";
    }

?>

<div <?php echo e($_id); ?> class="<?php echo e($_class); ?>" <?php echo $_attributes; ?>>
    <?php echo e($slot); ?>

</div><?php /**PATH /var/www/html/vendor/alxarafe/alxarafe/templates/layout/div.blade.php ENDPATH**/ ?>