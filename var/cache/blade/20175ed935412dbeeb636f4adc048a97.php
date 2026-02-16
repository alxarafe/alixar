<!-- Templates/common/layout/row.blade.php -->


<?php
    use Alxarafe\Lib\Functions;

    $class = $class ?? 'row';

    $_attributes = Functions::htmlAttributes($attributes ?? []);
?>

<div class="<?php echo e($class); ?>" <?php echo $_attributes; ?>>
    <?php echo e($slot); ?>

</div><?php /**PATH /var/www/html/vendor/alxarafe/alxarafe/templates/layout/row.blade.php ENDPATH**/ ?>