<?php $__env->startSection('content'); ?>
    <?php $__env->startComponent('form.form', ['attributes' => ['id' => 'config-form']]); ?>
        <?php $__env->startComponent('layout.div', ['fluid' => true]); ?>

            <?php $__env->slot('slot'); ?>
                <?php $__env->startComponent('layout.row',[]); ?>
                    <?php $__env->slot('slot'); ?>

                        <?php $__currentLoopData = $me->configFields; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $groupName => $groupFields): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php $__env->startComponent('layout.column', ['class' => count($me->configFields) > 1 ? 'col-md-6' : 'col-12']); ?>
                                <?php $__env->slot('slot'); ?>
                                    <?php $__env->startComponent('component.card', ['title' => $me->_($groupName)]); ?>
                                        <?php $__env->slot('slot'); ?>
                                            <?php $__currentLoopData = $groupFields; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $field): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <?php
                                                    $data = $field->jsonSerialize();
                                                    $data['name'] = 'data[' . $data['field'] . ']'; // Map field to data[...] structure
                                                    
                                                    // Mapping value logic...
                                                    $keys = explode('.', $data['field']);
                                                    $val = $me->data;
                                                    foreach($keys as $k) {
                                                        $val = $val->$k ?? null;
                                                    }
                                                    $data['value'] = $val;
                                                    
                                                    // Flatten options if present (e.g. values for Select)
                                                    if (isset($data['options']) && is_array($data['options'])) {
                                                        $data = array_merge($data, $data['options']);
                                                    }
                                                ?>
                                                <?php echo $__env->make('form.' . $field->getComponent(), $data, \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        <?php $__env->endSlot(); ?>
                                    <?php echo $__env->renderComponent(); ?>
                                <?php $__env->endSlot(); ?>
                            <?php echo $__env->renderComponent(); ?>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php $__env->endSlot(); ?>
                <?php echo $__env->renderComponent(); ?>

                
            <?php $__env->endSlot(); ?>
        <?php echo $__env->renderComponent(); ?>
    <?php echo $__env->renderComponent(); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('header_actions'); ?>
    
    <?php $__env->startComponent('component.button', ['type'=>'submit', 'name'=>'action', 'value'=>'save', 'attributes' => ['form="config-form"']]); ?>
        <?php echo $me->_('save_configuration'); ?>

    <?php echo $__env->renderComponent(); ?>

    <?php if($me->pdo_connection ?? false): ?>
        <?php if(!$me->pdo_db_exists ?? false): ?>
            <?php $__env->startComponent('component.button', ['type'=>'submit', 'name'=>'action', 'value'=>'createDatabase', 'attributes' => ['form="config-form"']]); ?>
                <?php echo $me->_('create_database'); ?>

            <?php echo $__env->renderComponent(); ?>
        <?php else: ?>
            <?php $__env->startComponent('component.button', ['type'=>'submit', 'name'=>'action', 'value'=>'runMigrations', 'attributes' => ['form="config-form"']]); ?>
                <?php echo $me->_('go_migrations'); ?>

            <?php echo $__env->renderComponent(); ?>
        <?php endif; ?>
        <?php $__env->startComponent('component.button', ['type'=>'submit', 'name'=>'action', 'value'=>'regenerate', 'class'=>'warning', 'attributes' => ['form="config-form"']]); ?>
            <?php echo $me->_('regenerate'); ?>

        <?php echo $__env->renderComponent(); ?>
        <?php $__env->startComponent('component.button', ['type'=>'submit', 'name'=>'action', 'value'=>'exit', 'class' => 'danger', 'attributes' => ['form="config-form"']]); ?>
            <?php echo $me->_('exit'); ?>

        <?php echo $__env->renderComponent(); ?>
    <?php endif; ?>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
    <script>
        $(document).ready(function() {
            const $tzSelect = $('select[name="data[main.timezone]"]');
            // If exists and has no value (first option empty)
            if ($tzSelect.length && !$tzSelect.val()) {
                try {
                    const browserTz = Intl.DateTimeFormat().resolvedOptions().timeZone;
                    if (browserTz) {
                        $tzSelect.val(browserTz).trigger('change');
                    }
                } catch(e) {
                    console.error("Timezone detection failed", e);
                }
            }
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('partial.layout.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/vendor/alxarafe/alxarafe/src/Modules/Admin/Templates/page/config.blade.php ENDPATH**/ ?>