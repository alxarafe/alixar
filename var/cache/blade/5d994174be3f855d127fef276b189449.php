    <div id="id-right">
        <?php echo $__env->make('partial.user_menu', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        
        <?php echo $__env->make('partial.alerts', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php echo $__env->yieldContent('content'); ?>
    </div>
<?php /**PATH /var/www/html/templates/themes/alxarafe/partial/body_standard.blade.php ENDPATH**/ ?>