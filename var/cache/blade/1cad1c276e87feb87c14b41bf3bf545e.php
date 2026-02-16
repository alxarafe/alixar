<!-- Templates/common/form/select.blade.php -->
<div class="mb-3">
    <?php if(!empty($label)): ?>
        <label for="<?php echo $id = str_replace(['[',']','.'], '_', $name); ?>" class="form-label"><?php echo $label; ?></label>
    <?php else: ?>
        <?php $id = str_replace(['[',']','.'], '_', $name); ?>
    <?php endif; ?>
    
    <?php
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

        <?php if($hasActions): ?> <div style="flex: 1 1 auto; width: 1%; min-width: 0;"> <?php endif; ?>
        <select class="form-select <?php echo e($class ?? ''); ?> <?php if($hasActions): ?> rounded-0 <?php endif; ?>" name="<?php echo $name; ?>" id="<?php echo $id; ?>" 
                <?php if($readonly ?? false): ?> disabled <?php endif; ?> 
                <?php if($required ?? false): ?> required <?php endif; ?>
                style="width: 100%">
            <?php $__currentLoopData = $values; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $option => $text): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <option value="<?php echo $option; ?>" <?php if((string)($value ?? '') === (string)$option): ?> selected <?php endif; ?>><?php echo $text; ?></option>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </select>
        <?php if($hasActions): ?> </div> <?php endif; ?>

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
<?php /**PATH /var/www/html/vendor/alxarafe/alxarafe/templates/form/select.blade.php ENDPATH**/ ?>