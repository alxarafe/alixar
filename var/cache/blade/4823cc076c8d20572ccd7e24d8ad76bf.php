<!-- Templates/common/form/form.blade.php -->


<?php
    use Alxarafe\Lib\Functions;

    $method = $method ?? 'POST';
    $action = $action ?? '#';
    $class = $class ?? 'form';

    $_attributes = Functions::htmlAttributes($attributes ?? []);
?>

<form method="<?php echo e(strtoupper($method)); ?>" action="<?php echo e($action); ?>" class="<?php echo e($class); ?>" <?php echo $_attributes; ?>>
    <?php echo e($slot); ?>

</form>
<?php /**PATH /var/www/html/vendor/alxarafe/alxarafe/templates/form/form.blade.php ENDPATH**/ ?>