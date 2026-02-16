<!-- Templates/common/component/card.blade.php -->


<?php
    use Alxarafe\Lib\Functions;

    $title = $title ?? null;
    $image = $image ?? null;
    $footer = $footer ?? null;
    $class = $class ?? 'card';

    $_attributes = Functions::htmlAttributes($attributes ?? []);
?>

<div class="<?php echo e($class); ?>" <?php echo $_attributes; ?>>
    <?php if($image): ?>
        <img src="<?php echo e($image); ?>" class="card-img-top" alt="<?php echo e($title ?? 'Card image'); ?>">
    <?php endif; ?>
    <div class="card-body">
        <?php if($title): ?>
            <h5 class="card-title"><?php echo e($title); ?></h5>
        <?php endif; ?>
        <?php echo e($slot); ?>

    </div>
    <?php if($footer): ?>
        <div class="card-footer">
            <?php echo e($footer); ?>

        </div>
    <?php endif; ?>
</div><?php /**PATH /var/www/html/vendor/alxarafe/alxarafe/templates/component/card.blade.php ENDPATH**/ ?>