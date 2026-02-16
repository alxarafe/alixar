<!-- Templates/common/layout/column.blade.php -->


<?php
    use Alxarafe\Lib\Functions;

    $size = $size ?? 'col';
    $class = trim(($class ?? '') . ' ' . $size);

    $_attributes = Functions::htmlAttributes($attributes ?? []);
?>

<div class="<?php echo e($class); ?>" <?php echo $_attributes; ?>>
    <?php echo e($slot); ?>

</div><?php /**PATH /var/www/html/vendor/alxarafe/alxarafe/templates/layout/column.blade.php ENDPATH**/ ?>