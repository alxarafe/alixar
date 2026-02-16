<?php $__env->startSection('content'); ?>
    <?php $__env->startComponent('form.form', []); ?>
        <?php $__env->startComponent('component.card', ['name' => 'panel1']); ?>
            <?php $__env->slot('slot'); ?>
                <?php echo $__env->make('form.input', ['type' => 'text', 'name' => 'username', 'label' => $me->_('login_name')], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                <?php echo $__env->make('form.input', ['type' => 'password', 'name' => 'password', 'label' => $me->_('login_password')], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <?php $__env->endSlot(); ?>
        <?php echo $__env->renderComponent(); ?>
        <?php $__env->startComponent('component.button', ['type'=>'submit', 'name'=>'action', 'value'=>'login', 'slot'=>$me->_('login_button')]); ?>
            Login
        <?php echo $__env->renderComponent(); ?>
    <?php echo $__env->renderComponent(); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
    <!-- Prueba de script -->
<?php $__env->stopPush(); ?>

<?php echo $__env->make('partial.layout.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/vendor/alxarafe/alxarafe/src/Modules/Admin/Templates/page/login.blade.php ENDPATH**/ ?>