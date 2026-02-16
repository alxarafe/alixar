<div class="form-check">
    <input type="hidden" name="<?php echo $name; ?>" value="0">
    <input class="form-check-input" type="checkbox" name="<?php echo $name; ?>" value="1" id="<?php echo $name; ?>" <?php if($value): ?> checked <?php endif; ?>>
    <label class="form-check-label" for="<?php echo $name; ?>">
        <?php echo $label; ?>

    </label>
</div>
<?php /**PATH /var/www/html/vendor/alxarafe/alxarafe/templates/form/boolean.blade.php ENDPATH**/ ?>