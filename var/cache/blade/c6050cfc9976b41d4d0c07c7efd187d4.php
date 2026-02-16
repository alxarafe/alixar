<!-- Templates/common/form/input.blade.php -->
<?php
    use Alxarafe\Lib\Functions;
    $_attributes = Functions::htmlAttributes($attributes ?? []);
    
    // Extract actions from options if passed (though check if they are passed as variables)
    // In blade include, they come as $actions if set in viewData.
    $hasActions = !empty($actions);
    $leftActions = []; 
    $rightActions = [];
    if($hasActions) {
        foreach($actions as $act) {
            if(($act['position'] ?? 'left') === 'right') $rightActions[] = $act;
            else $leftActions[] = $act;
        }
    }
?>

<div class="mb-3">
    <?php if(!empty($label)): ?>
        <label for="<?php echo $name; ?>" class="form-label"><?php echo $label; ?></label>
    <?php endif; ?>
    
    <?php if($hasActions): ?> <div class="input-group"> <?php endif; ?>

        <?php $__currentLoopData = $leftActions; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $action): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <button class="btn <?php echo e($action['class'] ?? 'btn-outline-secondary'); ?>" 
                    type="button" 
                    onclick="<?php echo $action['onclick']; ?>" 
                    title="<?php echo e($action['title'] ?? ''); ?>" 
                    <?php if(!empty($action['title'])): ?> data-bs-toggle="tooltip" <?php endif; ?>>
                <i class="<?php echo e($action['icon']); ?>"></i>
            </button>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

        <input type="<?php echo $type ?? 'text'; ?>" name="<?php echo $name; ?>" class="form-control" id="<?php echo $name; ?>"
               placeholder="<?php echo $label ?? ''; ?>" value="<?php echo $value ?? ''; ?>" <?php echo $_attributes; ?>>

        <?php $__currentLoopData = $rightActions; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $action): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <button class="btn <?php echo e($action['class'] ?? 'btn-outline-secondary'); ?>" 
                    type="button" 
                    onclick="<?php echo $action['onclick']; ?>" 
                    title="<?php echo e($action['title'] ?? ''); ?>" 
                    <?php if(!empty($action['title'])): ?> data-bs-toggle="tooltip" <?php endif; ?>>
                <i class="<?php echo e($action['icon']); ?>"></i>
            </button>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

    <?php if($hasActions): ?> </div> <?php endif; ?>

    <?php if(!empty($help)): ?>
        <div class="form-text"><?php echo e($help); ?></div>
    <?php endif; ?>
</div>
<?php /**PATH /var/www/html/vendor/alxarafe/alxarafe/templates/form/input.blade.php ENDPATH**/ ?>